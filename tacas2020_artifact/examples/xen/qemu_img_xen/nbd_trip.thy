theory nbd_trip
  imports
    "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes nbd_wr_sync_0x17779_retval\<^sub>v fprintf_chk_0x17830_retval\<^sub>v errno_location_0x17835_retval\<^sub>v nbd_wr_sync_0x1788c_retval\<^sub>v bdrv_write_0x178cc_retval\<^sub>v nbd_send_reply_isra_0_0x178ef_retval\<^sub>v fprintf_chk_0x17968_retval\<^sub>v fprintf_chk_0x179a0_retval\<^sub>v errno_location_0x179a5_retval\<^sub>v errno_location_0x179b8_retval\<^sub>v bdrv_read_0x179e8_retval\<^sub>v nbd_send_reply_isra_0_0x17a0b_retval\<^sub>v nbd_wr_sync_0x17a2d_retval\<^sub>v fprintf_chk_0x17ab9_retval\<^sub>v errno_location_0x17abe_retval\<^sub>v stack_chk_fail_0x17b33_retval\<^sub>v errno_location_addr fprintf_chk_addr stack_chk_fail_addr bdrv_read_addr bdrv_write_addr nbd_send_reply_isra_0_addr nbd_wr_sync_addr :: \<open>64 word\<close>
    and errno_location_acode fprintf_chk_acode stack_chk_fail_acode bdrv_read_acode bdrv_write_acode nbd_send_reply_isra_0_acode nbd_wr_sync_acode :: ACode
  assumes fetch:
    "fetch 0x17730 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0x17732 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r15)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x17735 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x17737 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r14)) (Storage (Reg (General SixtyFour r8))), 3)"
    "fetch 0x1773a \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x1773c \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x1773e \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0x17741 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x17746 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x17747 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x1774a \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 28)), 5)"
    "fetch 0x1774f \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x17750 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbx)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0x17752 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x17754 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 88)), 4)"
    "fetch 0x17758 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rsp)))) (Storage (Reg (General ThirtyTwo r9))), 4)"
    "fetch 0x1775c \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 32)))), 5)"
    "fetch 0x17761 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r13)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 144))))), 8)"
    "fetch 0x17769 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x17772 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 72)))) (Storage (Reg (General SixtyFour rax))), 5)"
    "fetch 0x17777 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x17779 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''nbd_wr_sync'')), 5)"
    "fetch 0x1777e \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 28)), 4)"
    "fetch 0x17782 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 96974)), 6)"
    "fetch 0x17788 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 32))))), 4)"
    "fetch 0x1778c \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r8)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 56))))), 5)"
    "fetch 0x17791 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 36))))), 4)"
    "fetch 0x17795 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 40))))), 5)"
    "fetch 0x1779a \<equiv> (Unary (IS_80486 Bswap) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1779c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r9)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 48))))), 5)"
    "fetch 0x177a1 \<equiv> (Unary (IS_80486 Bswap) (Storage (Reg (General ThirtyTwo r8))), 3)"
    "fetch 0x177a4 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 627086611)), 5)"
    "fetch 0x177a9 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 97006)), 6)"
    "fetch 0x177af \<equiv> (Binary (IS_8088 Cmp) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 152)))) (Storage (Reg (General ThirtyTwo r8))), 8)"
    "fetch 0x177b7 \<equiv> (Unary (IS_8088 Jb) (Immediate SixtyFour (ImmVal 96520)), 6)"
    "fetch 0x177bd \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r10)) (Storage (Reg (General ThirtyTwo r8))), 3)"
    "fetch 0x177c0 \<equiv> (Unary (IS_80486 Bswap) (Storage (Reg (General SixtyFour r9))), 3)"
    "fetch 0x177c3 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour r10))), 3)"
    "fetch 0x177c6 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour r9))), 3)"
    "fetch 0x177c9 \<equiv> (Unary (IS_8088 Jb) (Immediate SixtyFour (ImmVal 97080)), 6)"
    "fetch 0x177cf \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x177d2 \<equiv> (Unary (IS_8088 Ja) (Immediate SixtyFour (ImmVal 96568)), 6)"
    "fetch 0x177d8 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x177da \<equiv> (Unary (IS_80486 Bswap) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0x177dd \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0x177e0 \<equiv> (Unary (IS_80486 Bswap) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x177e2 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 1)), 3)"
    "fetch 0x177e5 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 96368)), 6)"
    "fetch 0x177eb \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x177ed \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 96720)), 6)"
    "fetch 0x177f3 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 2)), 3)"
    "fetch 0x177f6 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 96696)), 6)"
    "fetch 0x177fc \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x17800 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r9)) (Immediate SixtyFour (ImmVal 655)), 6)"
    "fetch 0x17806 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 41163)))), 7)"
    "fetch 0x1780d \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rax))), 1)"
    "fetch 0x1780e \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 40270)))), 7)"
    "fetch 0x17815 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 41044)))), 7)"
    "fetch 0x1781c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 76509))))), 7)"
    "fetch 0x17823 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x17828 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1782a \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r12)) (Immediate SixtyFour (ImmVal 4294967295)), 6)"
    "fetch 0x17830 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__fprintf_chk'')), 5)"
    "fetch 0x17835 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__errno_location'')), 5)"
    "fetch 0x1783a \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax)))) (Immediate SixtyFour (ImmVal 22)), 6)"
    "fetch 0x17840 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rax))), 1)"
    "fetch 0x17841 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rdx))), 1)"
    "fetch 0x17842 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 72))))), 5)"
    "fetch 0x17847 \<equiv> (Binary (IS_8088 Xor) (Reg (General SixtyFour rbx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x17850 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x17853 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 97075)), 6)"
    "fetch 0x17859 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 88)), 4)"
    "fetch 0x1785d \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1785e \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1785f \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x17861 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x17863 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x17865 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r15))), 2)"
    "fetch 0x17867 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x17868 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 8)"
    "fetch 0x17870 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r10))), 3)"
    "fetch 0x17873 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x17878 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x1787b \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x1787d \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 28)))) (Storage (Reg (General ThirtyTwo r8))), 5)"
    "fetch 0x17882 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 16)))) (Storage (Reg (General SixtyFour r9))), 5)"
    "fetch 0x17887 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8)))) (Storage (Reg (General SixtyFour r10))), 5)"
    "fetch 0x1788c \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''nbd_wr_sync'')), 5)"
    "fetch 0x17891 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r10)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8))))), 5)"
    "fetch 0x17896 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r9)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 16))))), 5)"
    "fetch 0x1789b \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r8)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 28))))), 5)"
    "fetch 0x178a0 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour r10)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x178a3 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 96880)), 6)"
    "fetch 0x178a9 \<equiv> (Binary (IS_8088 Cmp) (Memory Eight (A_SizeDirective 8 (A_FromReg (General SixtyFour rsp)))) (Immediate SixtyFour (ImmVal 0)), 4)"
    "fetch 0x178ad \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8)))) (Storage (Reg (General SixtyFour r10))), 5)"
    "fetch 0x178b2 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 96864)), 6)"
    "fetch 0x178b8 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour r12)) (A_Mult 1 (A_FromReg (General SixtyFour r9)))))), 4)"
    "fetch 0x178bc \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo r8))), 3)"
    "fetch 0x178bf \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x178c2 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r15))), 3)"
    "fetch 0x178c5 \<equiv> (Binary (IS_8088 Shr) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 9)), 3)"
    "fetch 0x178c8 \<equiv> (Binary (IS_8088 Shr) (Reg (General SixtyFour rsi)) (Immediate SixtyFour (ImmVal 9)), 4)"
    "fetch 0x178cc \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_write'')), 5)"
    "fetch 0x178d1 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r10)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8))))), 5)"
    "fetch 0x178d6 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 4294967295)), 3)"
    "fetch 0x178d9 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x178dc \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 97043)), 6)"
    "fetch 0x178e2 \<equiv> (Binary (IS_8088 Add) (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour r14)))) (Storage (Reg (General SixtyFour r10))), 3)"
    "fetch 0x178e5 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0x178e7 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x178ea \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x178ec \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x178ef \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''nbd_send_reply.isra.0'')), 5)"
    "fetch 0x178f4 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 4294967295)), 3)"
    "fetch 0x178f7 \<equiv> (Unary (IS_80386 Sete) (Storage (Reg (General Eight r12))), 4)"
    "fetch 0x178fb \<equiv> (Unary (IS_8088 Neg) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x178fe \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 96322)), 5)"
    "fetch 0x17903 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 5)"
    "fetch 0x17908 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 152))))), 7)"
    "fetch 0x1790f \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r9)) (Immediate SixtyFour (ImmVal 569)), 6)"
    "fetch 0x17915 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 40007)))), 7)"
    "fetch 0x1791c \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 40405)))), 7)"
    "fetch 0x17923 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rax))), 1)"
    "fetch 0x17924 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r8))), 2)"
    "fetch 0x17926 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 40875)))), 7)"
    "fetch 0x1792d \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 96284)), 5)"
    "fetch 0x17932 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 6)"
    "fetch 0x17938 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x1793a \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 76223))))), 7)"
    "fetch 0x17941 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x17946 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x17948 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x17949 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 39955)))), 7)"
    "fetch 0x17950 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 40481)))), 7)"
    "fetch 0x17957 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r8))), 2)"
    "fetch 0x17959 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 40824)))), 7)"
    "fetch 0x17960 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r9))), 2)"
    "fetch 0x17962 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r9)) (Immediate SixtyFour (ImmVal 584)), 6)"
    "fetch 0x17968 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__fprintf_chk'')), 5)"
    "fetch 0x1796d \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 32)), 4)"
    "fetch 0x17971 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r9)) (Immediate SixtyFour (ImmVal 585)), 6)"
    "fetch 0x17977 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 40794)))), 7)"
    "fetch 0x1797e \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 39902)))), 7)"
    "fetch 0x17985 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 40492)))), 7)"
    "fetch 0x1798c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 76141))))), 7)"
    "fetch 0x17993 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x17998 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x1799a \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r12)) (Immediate SixtyFour (ImmVal 4294967295)), 6)"
    "fetch 0x179a0 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__fprintf_chk'')), 5)"
    "fetch 0x179a5 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__errno_location'')), 5)"
    "fetch 0x179aa \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax)))) (Immediate SixtyFour (ImmVal 22)), 6)"
    "fetch 0x179b0 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 96322)), 5)"
    "fetch 0x179b5 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax))))), 3)"
    "fetch 0x179b8 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__errno_location'')), 5)"
    "fetch 0x179bd \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r12)) (Immediate SixtyFour (ImmVal 1)), 6)"
    "fetch 0x179c3 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax)))) (Immediate SixtyFour (ImmVal 0)), 6)"
    "fetch 0x179c9 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 96322)), 5)"
    "fetch 0x179ce \<equiv> (Binary (IS_8088 Xchg) (Reg (General Sixteen rax)) (Storage (Reg (General Sixteen rax))), 2)"
    "fetch 0x179d0 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour r12)) (A_Mult 1 (A_FromReg (General SixtyFour r9)))))), 4)"
    "fetch 0x179d4 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo r8))), 3)"
    "fetch 0x179d7 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x179da \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r15))), 3)"
    "fetch 0x179dd \<equiv> (Binary (IS_8088 Shr) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 9)), 3)"
    "fetch 0x179e0 \<equiv> (Binary (IS_8088 Shr) (Reg (General SixtyFour rsi)) (Immediate SixtyFour (ImmVal 9)), 4)"
    "fetch 0x179e4 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rsp)))) (Storage (Reg (General SixtyFour r10))), 4)"
    "fetch 0x179e8 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_read'')), 5)"
    "fetch 0x179ed \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r10)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rsp))))), 4)"
    "fetch 0x179f1 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 4294967295)), 3)"
    "fetch 0x179f4 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x179f7 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 96912)), 6)"
    "fetch 0x179fd \<equiv> (Binary (IS_8088 Add) (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour r14)))) (Storage (Reg (General SixtyFour r10))), 3)"
    "fetch 0x17a00 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x17a03 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rsi)) (Storage (Reg (General ThirtyTwo rsi))), 2)"
    "fetch 0x17a05 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x17a07 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rsp)))) (Storage (Reg (General SixtyFour r10))), 4)"
    "fetch 0x17a0b \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''nbd_send_reply.isra.0'')), 5)"
    "fetch 0x17a10 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo rax))), 3)"
    "fetch 0x17a13 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 4294967295)), 3)"
    "fetch 0x17a16 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 96322)), 6)"
    "fetch 0x17a1c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r10)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rsp))))), 4)"
    "fetch 0x17a20 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo rcx))), 2)"
    "fetch 0x17a22 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x17a25 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo rbx))), 2)"
    "fetch 0x17a27 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo r12)) (Storage (Reg (General ThirtyTwo r12))), 3)"
    "fetch 0x17a2a \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r10))), 3)"
    "fetch 0x17a2d \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''nbd_wr_sync'')), 5)"
    "fetch 0x17a32 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r10)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_FromReg (General SixtyFour rsp))))), 4)"
    "fetch 0x17a36 \<equiv> (Binary (IS_8088 Cmp) (Reg (General SixtyFour r10)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x17a39 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 96322)), 6)"
    "fetch 0x17a3f \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r9)) (Immediate SixtyFour (ImmVal 615)), 6)"
    "fetch 0x17a45 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 40588)))), 7)"
    "fetch 0x17a4c \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 39696)))), 7)"
    "fetch 0x17a53 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 39750)))), 7)"
    "fetch 0x17a5a \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 96652)), 5)"
    "fetch 0x17a5f \<equiv> (Nullary (IS_8088 Nop), 1)"
    "fetch 0x17a60 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x17a65 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 96487)), 5)"
    "fetch 0x17a6a \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 6)"
    "fetch 0x17a70 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r9)) (Immediate SixtyFour (ImmVal 626)), 6)"
    "fetch 0x17a76 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 40539)))), 7)"
    "fetch 0x17a7d \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 39647)))), 7)"
    "fetch 0x17a84 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 40333)))), 7)"
    "fetch 0x17a8b \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 96652)), 5)"
    "fetch 0x17a90 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r9)) (Immediate SixtyFour (ImmVal 601)), 6)"
    "fetch 0x17a96 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 40507)))), 7)"
    "fetch 0x17a9d \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 39615)))), 7)"
    "fetch 0x17aa4 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 40261)))), 7)"
    "fetch 0x17aab \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 75854))))), 7)"
    "fetch 0x17ab2 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x17ab7 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x17ab9 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__fprintf_chk'')), 5)"
    "fetch 0x17abe \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__errno_location'')), 5)"
    "fetch 0x17ac3 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_FromReg (General SixtyFour rax)))) (Immediate SixtyFour (ImmVal 22)), 6)"
    "fetch 0x17ac9 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 96322)), 5)"
    "fetch 0x17ace \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r9)) (Immediate SixtyFour (ImmVal 467)), 6)"
    "fetch 0x17ad4 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 40421)))), 7)"
    "fetch 0x17adb \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 39553)))), 7)"
    "fetch 0x17ae2 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 39579)))), 7)"
    "fetch 0x17ae9 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 96652)), 5)"
    "fetch 0x17aee \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x17af2 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r9)) (Immediate SixtyFour (ImmVal 491)), 6)"
    "fetch 0x17af8 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 40385)))), 7)"
    "fetch 0x17aff \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rax))), 1)"
    "fetch 0x17b00 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 39516)))), 7)"
    "fetch 0x17b07 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 39874)))), 7)"
    "fetch 0x17b0e \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 96284)), 5)"
    "fetch 0x17b13 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r9)) (Immediate SixtyFour (ImmVal 639)), 6)"
    "fetch 0x17b19 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 40376)))), 7)"
    "fetch 0x17b20 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 39484)))), 7)"
    "fetch 0x17b27 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 40218)))), 7)"
    "fetch 0x17b2e \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 96939)), 5)"
    "fetch 0x17b33 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__stack_chk_fail'')), 5)"
    "fetch 0x17b38 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r9)) (Immediate SixtyFour (ImmVal 576)), 6)"
    "fetch 0x17b3e \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 40339)))), 7)"
    "fetch 0x17b45 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 39447)))), 7)"
    "fetch 0x17b4c \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 39901)))), 7)"
    "fetch 0x17b53 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 96652)), 5)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and errno_location\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__errno_location'') = errno_location_addr\<close>
    and fprintf_chk\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__fprintf_chk'') = fprintf_chk_addr\<close>
    and stack_chk_fail\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__stack_chk_fail'') = stack_chk_fail_addr\<close>
    and bdrv_read\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''bdrv_read'') = bdrv_read_addr\<close>
    and bdrv_write\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''bdrv_write'') = bdrv_write_addr\<close>
    and nbd_send_reply_isra_0\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''nbd_send_reply.isra.0'') = nbd_send_reply_isra_0_addr\<close>
    and nbd_wr_sync\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''nbd_wr_sync'') = nbd_wr_sync_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>nbd_wr_sync_0x17779_retval \<equiv> nbd_wr_sync_0x17779_retval\<^sub>v\<close>
definition \<open>fprintf_chk_0x17830_retval \<equiv> fprintf_chk_0x17830_retval\<^sub>v\<close>
definition \<open>errno_location_0x17835_retval \<equiv> errno_location_0x17835_retval\<^sub>v\<close>
definition \<open>nbd_wr_sync_0x1788c_retval \<equiv> nbd_wr_sync_0x1788c_retval\<^sub>v\<close>
definition \<open>bdrv_write_0x178cc_retval \<equiv> bdrv_write_0x178cc_retval\<^sub>v\<close>
definition \<open>nbd_send_reply_isra_0_0x178ef_retval \<equiv> nbd_send_reply_isra_0_0x178ef_retval\<^sub>v\<close>
definition \<open>fprintf_chk_0x17968_retval \<equiv> fprintf_chk_0x17968_retval\<^sub>v\<close>
definition \<open>fprintf_chk_0x179a0_retval \<equiv> fprintf_chk_0x179a0_retval\<^sub>v\<close>
definition \<open>errno_location_0x179a5_retval \<equiv> errno_location_0x179a5_retval\<^sub>v\<close>
definition \<open>errno_location_0x179b8_retval \<equiv> errno_location_0x179b8_retval\<^sub>v\<close>
definition \<open>bdrv_read_0x179e8_retval \<equiv> bdrv_read_0x179e8_retval\<^sub>v\<close>
definition \<open>nbd_send_reply_isra_0_0x17a0b_retval \<equiv> nbd_send_reply_isra_0_0x17a0b_retval\<^sub>v\<close>
definition \<open>nbd_wr_sync_0x17a2d_retval \<equiv> nbd_wr_sync_0x17a2d_retval\<^sub>v\<close>
definition \<open>fprintf_chk_0x17ab9_retval \<equiv> fprintf_chk_0x17ab9_retval\<^sub>v\<close>
definition \<open>errno_location_0x17abe_retval \<equiv> errno_location_0x17abe_retval\<^sub>v\<close>
definition \<open>stack_chk_fail_0x17b33_retval \<equiv> stack_chk_fail_0x17b33_retval\<^sub>v\<close>

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

locale "nbd_trip" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R15\<^sub>0\<^sub>v R14\<^sub>0\<^sub>v R13\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v R10\<^sub>0\<^sub>v R9\<^sub>0\<^sub>v R8\<^sub>0\<^sub>v FS\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
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
definition \<open>FS\<^sub>0 \<equiv> FS\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x17730_0 :: state_pred where
  \<open>P_0x17730_0 \<sigma> \<equiv> RIP \<sigma> = 0x17730 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R15 \<sigma> = R15\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x17730_0_def[Ps]

definition P_0x17730_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17730_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x88), 4)
  }\<close>

definition P_0x17730_0_regions :: state_pred where
  \<open>P_0x17730_0_regions \<sigma> \<equiv> \<exists>regions. P_0x17730_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17779_0 :: state_pred where
  \<open>Q_0x17779_0 \<sigma> \<equiv> RIP \<sigma> = 0x17779 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = 0x1c \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word))\<close>
declare Q_0x17779_0_def[Qs]

schematic_goal nbd_trip_0_21_0x17730_0x17777_0[blocks]:
  assumes \<open>(P_0x17730_0 && P_0x17730_0_regions) \<sigma>\<close>
  shows \<open>exec_block 21 0x17777 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17779_0 ?\<sigma> \<and> block_usage P_0x17730_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17730_0_def P_0x17730_0_regions_def post: Q_0x17779_0_def regionset: P_0x17730_0_regions_set_def)

definition P_0x17779_1 :: state_pred where
  \<open>P_0x17779_1 \<sigma> \<equiv> RIP \<sigma> = 0x17779 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = 0x1c \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word))\<close>
declare P_0x17779_1_def[Ps]

definition P_0x17779_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17779_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x17779_1_regions :: state_pred where
  \<open>P_0x17779_1_regions \<sigma> \<equiv> \<exists>regions. P_0x17779_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_nbd_wr_sync_addr_0x17779_1 :: state_pred where
  \<open>Q_nbd_wr_sync_addr_0x17779_1 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x90) \<and> RIP \<sigma> = nbd_wr_sync_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = 0x1c \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e\<close>
declare Q_nbd_wr_sync_addr_0x17779_1_def[Qs]

schematic_goal nbd_trip_0_1_0x17779_0x17779_1[blocks]:
  assumes \<open>(P_0x17779_1 && P_0x17779_1_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x17779 (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_nbd_wr_sync_addr_0x17779_1 ?\<sigma> \<and> block_usage P_0x17779_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17779_1_def P_0x17779_1_regions_def post: Q_nbd_wr_sync_addr_0x17779_1_def regionset: P_0x17779_1_regions_set_def)

definition P_0x1777e_2 :: state_pred where
  \<open>P_0x1777e_2 \<sigma> \<equiv> RIP \<sigma> = 0x1777e \<and> RAX \<sigma> = nbd_wr_sync_0x17779_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = 0x1c \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e\<close>
declare P_0x1777e_2_def[Ps]

definition P_0x1777e_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1777e_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x1777e_2_regions :: state_pred where
  \<open>P_0x1777e_2_regions \<sigma> \<equiv> \<exists>regions. P_0x1777e_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17782_2 :: state_pred where
  \<open>Q_0x17782_2 \<sigma> \<equiv> RIP \<sigma> = 0x17782 \<and> RAX \<sigma> = nbd_wr_sync_0x17779_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = 0x1c \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e\<close>
declare Q_0x17782_2_def[Qs]

schematic_goal nbd_trip_0_1_0x1777e_0x1777e_2[blocks]:
  assumes \<open>(P_0x1777e_2 && P_0x1777e_2_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1777e 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17782_2 ?\<sigma> \<and> block_usage P_0x1777e_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1777e_2_def P_0x1777e_2_regions_def post: Q_0x17782_2_def regionset: P_0x1777e_2_regions_set_def)

definition P_0x17782_true_3 :: state_pred where
  \<open>P_0x17782_true_3 \<sigma> \<equiv> RIP \<sigma> = 0x17782 \<and> RAX \<sigma> = nbd_wr_sync_0x17779_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = 0x1c \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e\<close>
declare P_0x17782_true_3_def[Ps]

definition P_0x17782_true_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17782_true_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x17782_true_3_regions :: state_pred where
  \<open>P_0x17782_true_3_regions \<sigma> \<equiv> \<exists>regions. P_0x17782_true_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1798c_3 :: state_pred where
  \<open>Q_0x1798c_3 \<sigma> \<equiv> RIP \<sigma> = 0x1798c \<and> RAX \<sigma> = nbd_wr_sync_0x17779_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x21584 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = 0x1d3 \<and> R8 \<sigma> = 0x218c0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e\<close>
declare Q_0x1798c_3_def[Qs]

schematic_goal nbd_trip_0_6_0x17782_0x17ae9_3[blocks]:
  assumes \<open>(P_0x17782_true_3 && P_0x17782_true_3_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 6 0x17ae9 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1798c_3 ?\<sigma> \<and> block_usage P_0x17782_true_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17782_true_3_def P_0x17782_true_3_regions_def post: Q_0x1798c_3_def regionset: P_0x17782_true_3_regions_set_def)

definition P_0x1798c_4 :: state_pred where
  \<open>P_0x1798c_4 \<sigma> \<equiv> RIP \<sigma> = 0x1798c \<and> RAX \<sigma> = nbd_wr_sync_0x17779_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x21584 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = 0x1d3 \<and> R8 \<sigma> = 0x218c0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e\<close>
declare P_0x1798c_4_def[Ps]

definition P_0x1798c_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1798c_4_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x1798c_4_regions :: state_pred where
  \<open>P_0x1798c_4_regions \<sigma> \<equiv> \<exists>regions. P_0x1798c_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x179a0_4 :: state_pred where
  \<open>Q_0x179a0_4 \<sigma> \<equiv> RIP \<sigma> = 0x179a0 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x21584 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = 0x1d3 \<and> R8 \<sigma> = 0x218c0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e\<close>
declare Q_0x179a0_4_def[Qs]

schematic_goal nbd_trip_0_4_0x1798c_0x1799a_4[blocks]:
  assumes \<open>(P_0x1798c_4 && P_0x1798c_4_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x1799a 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x179a0_4 ?\<sigma> \<and> block_usage P_0x1798c_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1798c_4_def P_0x1798c_4_regions_def post: Q_0x179a0_4_def regionset: P_0x1798c_4_regions_set_def)

definition P_0x179a0_5 :: state_pred where
  \<open>P_0x179a0_5 \<sigma> \<equiv> RIP \<sigma> = 0x179a0 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x21584 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = 0x1d3 \<and> R8 \<sigma> = 0x218c0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e\<close>
declare P_0x179a0_5_def[Ps]

definition P_0x179a0_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x179a0_5_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x179a0_5_regions :: state_pred where
  \<open>P_0x179a0_5_regions \<sigma> \<equiv> \<exists>regions. P_0x179a0_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_fprintf_chk_addr_0x179a0_5 :: state_pred where
  \<open>Q_fprintf_chk_addr_0x179a0_5 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x90) \<and> RIP \<sigma> = fprintf_chk_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x21584 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = 0x1d3 \<and> R8 \<sigma> = 0x218c0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x179a5\<close>
declare Q_fprintf_chk_addr_0x179a0_5_def[Qs]

schematic_goal nbd_trip_0_1_0x179a0_0x179a0_5[blocks]:
  assumes \<open>(P_0x179a0_5 && P_0x179a0_5_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x179a0 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_fprintf_chk_addr_0x179a0_5 ?\<sigma> \<and> block_usage P_0x179a0_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x179a0_5_def P_0x179a0_5_regions_def post: Q_fprintf_chk_addr_0x179a0_5_def regionset: P_0x179a0_5_regions_set_def)

definition P_0x179a5_6 :: state_pred where
  \<open>P_0x179a5_6 \<sigma> \<equiv> RIP \<sigma> = 0x179a5 \<and> RAX \<sigma> = fprintf_chk_0x179a0_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x21584 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = 0x1d3 \<and> R8 \<sigma> = 0x218c0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x179a5\<close>
declare P_0x179a5_6_def[Ps]

definition P_0x179a5_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x179a5_6_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x179a5_6_regions :: state_pred where
  \<open>P_0x179a5_6_regions \<sigma> \<equiv> \<exists>regions. P_0x179a5_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_errno_location_addr_0x179a5_6 :: state_pred where
  \<open>Q_errno_location_addr_0x179a5_6 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x90) \<and> RIP \<sigma> = errno_location_addr \<and> RAX \<sigma> = fprintf_chk_0x179a0_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x21584 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = 0x1d3 \<and> R8 \<sigma> = 0x218c0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x179aa\<close>
declare Q_errno_location_addr_0x179a5_6_def[Qs]

schematic_goal nbd_trip_0_1_0x179a5_0x179a5_6[blocks]:
  assumes \<open>(P_0x179a5_6 && P_0x179a5_6_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x179a5 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_errno_location_addr_0x179a5_6 ?\<sigma> \<and> block_usage P_0x179a5_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x179a5_6_def P_0x179a5_6_regions_def post: Q_errno_location_addr_0x179a5_6_def regionset: P_0x179a5_6_regions_set_def)

definition P_0x179aa_7 :: state_pred where
  \<open>P_0x179aa_7 \<sigma> \<equiv> RIP \<sigma> = 0x179aa \<and> RAX \<sigma> = errno_location_0x179a5_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x21584 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = 0x1d3 \<and> R8 \<sigma> = 0x218c0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x179aa\<close>
declare P_0x179aa_7_def[Ps]

definition P_0x179aa_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x179aa_7_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x90), 8),
    (13, errno_location_0x179a5_retval, 4)
  }\<close>

definition P_0x179aa_7_regions :: state_pred where
  \<open>P_0x179aa_7_regions \<sigma> \<equiv> \<exists>regions. P_0x179aa_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17842_7 :: state_pred where
  \<open>Q_0x17842_7 \<sigma> \<equiv> RIP \<sigma> = 0x17842 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x17842_7_def[Qs]

schematic_goal nbd_trip_0_2_0x179aa_0x179b0_7[blocks]:
  assumes \<open>(P_0x179aa_7 && P_0x179aa_7_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x179b0 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17842_7 ?\<sigma> \<and> block_usage P_0x179aa_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x179aa_7_def P_0x179aa_7_regions_def post: Q_0x17842_7_def regionset: P_0x179aa_7_regions_set_def)

definition P_0x17782_false_8 :: state_pred where
  \<open>P_0x17782_false_8 \<sigma> \<equiv> RIP \<sigma> = 0x17782 \<and> RAX \<sigma> = nbd_wr_sync_0x17779_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = 0x1c \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e\<close>
declare P_0x17782_false_8_def[Ps]

definition P_0x17782_false_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17782_false_8_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x17782_false_8_regions :: state_pred where
  \<open>P_0x17782_false_8_regions \<sigma> \<equiv> \<exists>regions. P_0x17782_false_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x177a9_8 :: state_pred where
  \<open>Q_0x177a9_8 \<sigma> \<equiv> RIP \<sigma> = 0x177a9 \<and> RAX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)::32 word))::32 word)))) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e\<close>
declare Q_0x177a9_8_def[Qs]

schematic_goal nbd_trip_0_9_0x17782_0x177a4_8[blocks]:
  assumes \<open>(P_0x17782_false_8 && P_0x17782_false_8_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 9 0x177a4 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x177a9_8 ?\<sigma> \<and> block_usage P_0x17782_false_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17782_false_8_def P_0x17782_false_8_regions_def post: Q_0x177a9_8_def regionset: P_0x17782_false_8_regions_set_def)

definition P_0x177a9_true_9 :: state_pred where
  \<open>P_0x177a9_true_9 \<sigma> \<equiv> RIP \<sigma> = 0x177a9 \<and> RAX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)::32 word))::32 word)))) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e\<close>
declare P_0x177a9_true_9_def[Ps]

definition P_0x177a9_true_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x177a9_true_9_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (11, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (14, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x90), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x98), 8)
  }\<close>

definition P_0x177a9_true_9_regions :: state_pred where
  \<open>P_0x177a9_true_9_regions \<sigma> \<equiv> \<exists>regions. P_0x177a9_true_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1781c_9 :: state_pred where
  \<open>Q_0x1781c_9 \<sigma> \<equiv> RIP \<sigma> = 0x1781c \<and> RAX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)::32 word))::32 word)))) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x216d0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x98) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = 0x1eb \<and> R8 \<sigma> = 0x218c0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)::32 word))::32 word))))\<close>
declare Q_0x1781c_9_def[Qs]

schematic_goal nbd_trip_0_8_0x177a9_0x17b0e_9[blocks]:
  assumes \<open>(P_0x177a9_true_9 && P_0x177a9_true_9_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 8 0x17b0e 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1781c_9 ?\<sigma> \<and> block_usage P_0x177a9_true_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x177a9_true_9_def P_0x177a9_true_9_regions_def post: Q_0x1781c_9_def regionset: P_0x177a9_true_9_regions_set_def)

definition P_0x1781c_10 :: state_pred where
  \<open>P_0x1781c_10 \<sigma> \<equiv> RIP \<sigma> = 0x1781c \<and> RAX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)::32 word))::32 word)))) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x216d0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x98) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = 0x1eb \<and> R8 \<sigma> = 0x218c0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)::32 word))::32 word))))\<close>
declare P_0x1781c_10_def[Ps]

definition P_0x1781c_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1781c_10_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x90), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x98), 8)
  }\<close>

definition P_0x1781c_10_regions :: state_pred where
  \<open>P_0x1781c_10_regions \<sigma> \<equiv> \<exists>regions. P_0x1781c_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17830_10 :: state_pred where
  \<open>Q_0x17830_10 \<sigma> \<equiv> RIP \<sigma> = 0x17830 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x216d0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x98) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = 0x1eb \<and> R8 \<sigma> = 0x218c0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)::32 word))::32 word))))\<close>
declare Q_0x17830_10_def[Qs]

schematic_goal nbd_trip_0_4_0x1781c_0x1782a_10[blocks]:
  assumes \<open>(P_0x1781c_10 && P_0x1781c_10_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x1782a 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17830_10 ?\<sigma> \<and> block_usage P_0x1781c_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1781c_10_def P_0x1781c_10_regions_def post: Q_0x17830_10_def regionset: P_0x1781c_10_regions_set_def)

definition P_0x17830_11 :: state_pred where
  \<open>P_0x17830_11 \<sigma> \<equiv> RIP \<sigma> = 0x17830 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x216d0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x98) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = 0x1eb \<and> R8 \<sigma> = 0x218c0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)::32 word))::32 word))))\<close>
declare P_0x17830_11_def[Ps]

definition P_0x17830_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17830_11_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x90), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x98), 8),
    (19, ((RSP\<^sub>0::64 word) - 0xa0), 8)
  }\<close>

definition P_0x17830_11_regions :: state_pred where
  \<open>P_0x17830_11_regions \<sigma> \<equiv> \<exists>regions. P_0x17830_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_fprintf_chk_addr_0x17830_11 :: state_pred where
  \<open>Q_fprintf_chk_addr_0x17830_11 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa0) \<and> RIP \<sigma> = fprintf_chk_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x216d0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = 0x1eb \<and> R8 \<sigma> = 0x218c0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = 0x17835\<close>
declare Q_fprintf_chk_addr_0x17830_11_def[Qs]

schematic_goal nbd_trip_0_1_0x17830_0x17830_11[blocks]:
  assumes \<open>(P_0x17830_11 && P_0x17830_11_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x17830 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_fprintf_chk_addr_0x17830_11 ?\<sigma> \<and> block_usage P_0x17830_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17830_11_def P_0x17830_11_regions_def post: Q_fprintf_chk_addr_0x17830_11_def regionset: P_0x17830_11_regions_set_def)

definition P_0x17835_12 :: state_pred where
  \<open>P_0x17835_12 \<sigma> \<equiv> RIP \<sigma> = 0x17835 \<and> RAX \<sigma> = fprintf_chk_0x17830_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x216d0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x98) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = 0x1eb \<and> R8 \<sigma> = 0x218c0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = 0x17835\<close>
declare P_0x17835_12_def[Ps]

definition P_0x17835_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17835_12_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x90), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x98), 8),
    (19, ((RSP\<^sub>0::64 word) - 0xa0), 8)
  }\<close>

definition P_0x17835_12_regions :: state_pred where
  \<open>P_0x17835_12_regions \<sigma> \<equiv> \<exists>regions. P_0x17835_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_errno_location_addr_0x17835_12 :: state_pred where
  \<open>Q_errno_location_addr_0x17835_12 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa0) \<and> RIP \<sigma> = errno_location_addr \<and> RAX \<sigma> = fprintf_chk_0x17830_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x216d0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = 0x1eb \<and> R8 \<sigma> = 0x218c0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = 0x1783a\<close>
declare Q_errno_location_addr_0x17835_12_def[Qs]

schematic_goal nbd_trip_0_1_0x17835_0x17835_12[blocks]:
  assumes \<open>(P_0x17835_12 && P_0x17835_12_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x17835 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_errno_location_addr_0x17835_12 ?\<sigma> \<and> block_usage P_0x17835_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17835_12_def P_0x17835_12_regions_def post: Q_errno_location_addr_0x17835_12_def regionset: P_0x17835_12_regions_set_def)

definition P_0x1783a_13 :: state_pred where
  \<open>P_0x1783a_13 \<sigma> \<equiv> RIP \<sigma> = 0x1783a \<and> RAX \<sigma> = errno_location_0x17835_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x216d0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x98) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = 0x1eb \<and> R8 \<sigma> = 0x218c0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = 0x1783a\<close>
declare P_0x1783a_13_def[Ps]

definition P_0x1783a_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1783a_13_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x90), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x98), 8),
    (19, ((RSP\<^sub>0::64 word) - 0xa0), 8),
    (20, errno_location_0x17835_retval, 4)
  }\<close>

definition P_0x1783a_13_regions :: state_pred where
  \<open>P_0x1783a_13_regions \<sigma> \<equiv> \<exists>regions. P_0x1783a_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17842_13 :: state_pred where
  \<open>Q_0x17842_13 \<sigma> \<equiv> RIP \<sigma> = 0x17842 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x17842_13_def[Qs]

schematic_goal nbd_trip_0_3_0x1783a_0x17841_13[blocks]:
  assumes \<open>(P_0x1783a_13 && P_0x1783a_13_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x17841 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17842_13 ?\<sigma> \<and> block_usage P_0x1783a_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1783a_13_def P_0x1783a_13_regions_def post: Q_0x17842_13_def regionset: P_0x1783a_13_regions_set_def)

definition P_0x177a9_false_14 :: state_pred where
  \<open>P_0x177a9_false_14 \<sigma> \<equiv> RIP \<sigma> = 0x177a9 \<and> RAX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)::32 word))::32 word)))) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e\<close>
declare P_0x177a9_false_14_def[Ps]

definition P_0x177a9_false_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x177a9_false_14_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x177a9_false_14_regions :: state_pred where
  \<open>P_0x177a9_false_14_regions \<sigma> \<equiv> \<exists>regions. P_0x177a9_false_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x177b7_14 :: state_pred where
  \<open>Q_0x177b7_14 \<sigma> \<equiv> RIP \<sigma> = 0x177b7 \<and> RAX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)::32 word))::32 word)))) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e\<close>
declare Q_0x177b7_14_def[Qs]

schematic_goal nbd_trip_0_2_0x177a9_0x177af_14[blocks]:
  assumes \<open>(P_0x177a9_false_14 && P_0x177a9_false_14_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x177af 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x177b7_14 ?\<sigma> \<and> block_usage P_0x177a9_false_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x177a9_false_14_def P_0x177a9_false_14_regions_def post: Q_0x177b7_14_def regionset: P_0x177a9_false_14_regions_set_def)

definition P_0x177b7_true_15 :: state_pred where
  \<open>P_0x177b7_true_15 \<sigma> \<equiv> RIP \<sigma> = 0x177b7 \<and> RAX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)::32 word))::32 word)))) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e\<close>
declare P_0x177b7_true_15_def[Ps]

definition P_0x177b7_true_15_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x177b7_true_15_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x90), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x98), 8)
  }\<close>

definition P_0x177b7_true_15_regions :: state_pred where
  \<open>P_0x177b7_true_15_regions \<sigma> \<equiv> \<exists>regions. P_0x177b7_true_15_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1781c_15 :: state_pred where
  \<open>Q_0x1781c_15 \<sigma> \<equiv> RIP \<sigma> = 0x1781c \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x216f8 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x98) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = 0x239 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word))))\<close>
declare Q_0x1781c_15_def[Qs]

schematic_goal nbd_trip_0_9_0x177b7_0x1792d_15[blocks]:
  assumes \<open>(P_0x177b7_true_15 && P_0x177b7_true_15_regions && CF) \<sigma>\<close>
  shows \<open>exec_block 9 0x1792d 15 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1781c_15 ?\<sigma> \<and> block_usage P_0x177b7_true_15_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x177b7_true_15_def P_0x177b7_true_15_regions_def post: Q_0x1781c_15_def regionset: P_0x177b7_true_15_regions_set_def)

definition P_0x1781c_16 :: state_pred where
  \<open>P_0x1781c_16 \<sigma> \<equiv> RIP \<sigma> = 0x1781c \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x216f8 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x98) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = 0x239 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word))))\<close>
declare P_0x1781c_16_def[Ps]

definition P_0x1781c_16_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1781c_16_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x90), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x98), 8)
  }\<close>

definition P_0x1781c_16_regions :: state_pred where
  \<open>P_0x1781c_16_regions \<sigma> \<equiv> \<exists>regions. P_0x1781c_16_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17830_16 :: state_pred where
  \<open>Q_0x17830_16 \<sigma> \<equiv> RIP \<sigma> = 0x17830 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x216f8 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x98) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = 0x239 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word))))\<close>
declare Q_0x17830_16_def[Qs]

schematic_goal nbd_trip_0_4_0x1781c_0x1782a_16[blocks]:
  assumes \<open>(P_0x1781c_16 && P_0x1781c_16_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x1782a 16 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17830_16 ?\<sigma> \<and> block_usage P_0x1781c_16_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1781c_16_def P_0x1781c_16_regions_def post: Q_0x17830_16_def regionset: P_0x1781c_16_regions_set_def)

definition P_0x17830_17 :: state_pred where
  \<open>P_0x17830_17 \<sigma> \<equiv> RIP \<sigma> = 0x17830 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x216f8 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x98) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = 0x239 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word))))\<close>
declare P_0x17830_17_def[Ps]

definition P_0x17830_17_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17830_17_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x90), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x98), 8),
    (20, ((RSP\<^sub>0::64 word) - 0xa0), 8)
  }\<close>

definition P_0x17830_17_regions :: state_pred where
  \<open>P_0x17830_17_regions \<sigma> \<equiv> \<exists>regions. P_0x17830_17_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_fprintf_chk_addr_0x17830_17 :: state_pred where
  \<open>Q_fprintf_chk_addr_0x17830_17 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa0) \<and> RIP \<sigma> = fprintf_chk_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x216f8 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = 0x239 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = 0x17835\<close>
declare Q_fprintf_chk_addr_0x17830_17_def[Qs]

schematic_goal nbd_trip_0_1_0x17830_0x17830_17[blocks]:
  assumes \<open>(P_0x17830_17 && P_0x17830_17_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x17830 17 \<sigma> \<triangleq> ?\<sigma> \<and> Q_fprintf_chk_addr_0x17830_17 ?\<sigma> \<and> block_usage P_0x17830_17_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17830_17_def P_0x17830_17_regions_def post: Q_fprintf_chk_addr_0x17830_17_def regionset: P_0x17830_17_regions_set_def)

definition P_0x17835_18 :: state_pred where
  \<open>P_0x17835_18 \<sigma> \<equiv> RIP \<sigma> = 0x17835 \<and> RAX \<sigma> = fprintf_chk_0x17830_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x216f8 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x98) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = 0x239 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = 0x17835\<close>
declare P_0x17835_18_def[Ps]

definition P_0x17835_18_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17835_18_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x90), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x98), 8),
    (20, ((RSP\<^sub>0::64 word) - 0xa0), 8)
  }\<close>

definition P_0x17835_18_regions :: state_pred where
  \<open>P_0x17835_18_regions \<sigma> \<equiv> \<exists>regions. P_0x17835_18_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_errno_location_addr_0x17835_18 :: state_pred where
  \<open>Q_errno_location_addr_0x17835_18 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa0) \<and> RIP \<sigma> = errno_location_addr \<and> RAX \<sigma> = fprintf_chk_0x17830_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x216f8 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = 0x239 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = 0x1783a\<close>
declare Q_errno_location_addr_0x17835_18_def[Qs]

schematic_goal nbd_trip_0_1_0x17835_0x17835_18[blocks]:
  assumes \<open>(P_0x17835_18 && P_0x17835_18_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x17835 18 \<sigma> \<triangleq> ?\<sigma> \<and> Q_errno_location_addr_0x17835_18 ?\<sigma> \<and> block_usage P_0x17835_18_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17835_18_def P_0x17835_18_regions_def post: Q_errno_location_addr_0x17835_18_def regionset: P_0x17835_18_regions_set_def)

definition P_0x1783a_19 :: state_pred where
  \<open>P_0x1783a_19 \<sigma> \<equiv> RIP \<sigma> = 0x1783a \<and> RAX \<sigma> = errno_location_0x17835_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x216f8 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x98) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = 0x239 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = 0x1783a\<close>
declare P_0x1783a_19_def[Ps]

definition P_0x1783a_19_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1783a_19_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x90), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x98), 8),
    (20, ((RSP\<^sub>0::64 word) - 0xa0), 8),
    (21, errno_location_0x17835_retval, 4)
  }\<close>

definition P_0x1783a_19_regions :: state_pred where
  \<open>P_0x1783a_19_regions \<sigma> \<equiv> \<exists>regions. P_0x1783a_19_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17842_19 :: state_pred where
  \<open>Q_0x17842_19 \<sigma> \<equiv> RIP \<sigma> = 0x17842 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x17842_19_def[Qs]

schematic_goal nbd_trip_0_3_0x1783a_0x17841_19[blocks]:
  assumes \<open>(P_0x1783a_19 && P_0x1783a_19_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x17841 19 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17842_19 ?\<sigma> \<and> block_usage P_0x1783a_19_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1783a_19_def P_0x1783a_19_regions_def post: Q_0x17842_19_def regionset: P_0x1783a_19_regions_set_def)

definition P_0x177b7_false_20 :: state_pred where
  \<open>P_0x177b7_false_20 \<sigma> \<equiv> RIP \<sigma> = 0x177b7 \<and> RAX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)::32 word))::32 word)))) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = R10\<^sub>0 \<and> R9 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e\<close>
declare P_0x177b7_false_20_def[Ps]

definition P_0x177b7_false_20_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x177b7_false_20_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x177b7_false_20_regions :: state_pred where
  \<open>P_0x177b7_false_20_regions \<sigma> \<equiv> \<exists>regions. P_0x177b7_false_20_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x177c9_20 :: state_pred where
  \<open>Q_0x177c9_20 \<sigma> \<equiv> RIP \<sigma> = 0x177c9 \<and> RAX \<sigma> = ((ucast (((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))::32 word))::64 word) + ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word)))::64 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e\<close>
declare Q_0x177c9_20_def[Qs]

schematic_goal nbd_trip_0_5_0x177b7_0x177c6_20[blocks]:
  assumes \<open>(P_0x177b7_false_20 && P_0x177b7_false_20_regions && ! CF) \<sigma>\<close>
  shows \<open>exec_block 5 0x177c6 20 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x177c9_20 ?\<sigma> \<and> block_usage P_0x177b7_false_20_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x177b7_false_20_def P_0x177b7_false_20_regions_def post: Q_0x177c9_20_def regionset: P_0x177b7_false_20_regions_set_def)

definition P_0x177c9_true_21 :: state_pred where
  \<open>P_0x177c9_true_21 \<sigma> \<equiv> RIP \<sigma> = 0x177c9 \<and> RAX \<sigma> = ((ucast (((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))::32 word))::64 word) + ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word)))::64 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e\<close>
declare P_0x177c9_true_21_def[Ps]

definition P_0x177c9_true_21_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x177c9_true_21_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x177c9_true_21_regions :: state_pred where
  \<open>P_0x177c9_true_21_regions \<sigma> \<equiv> \<exists>regions. P_0x177c9_true_21_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1798c_21 :: state_pred where
  \<open>Q_0x1798c_21 \<sigma> \<equiv> RIP \<sigma> = 0x1798c \<and> RAX \<sigma> = ((ucast (((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))::32 word))::64 word) + ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word)))::64 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x21730 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x240 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e\<close>
declare Q_0x1798c_21_def[Qs]

schematic_goal nbd_trip_0_6_0x177c9_0x17b53_21[blocks]:
  assumes \<open>(P_0x177c9_true_21 && P_0x177c9_true_21_regions && CF) \<sigma>\<close>
  shows \<open>exec_block 6 0x17b53 21 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1798c_21 ?\<sigma> \<and> block_usage P_0x177c9_true_21_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x177c9_true_21_def P_0x177c9_true_21_regions_def post: Q_0x1798c_21_def regionset: P_0x177c9_true_21_regions_set_def)

definition P_0x1798c_22 :: state_pred where
  \<open>P_0x1798c_22 \<sigma> \<equiv> RIP \<sigma> = 0x1798c \<and> RAX \<sigma> = ((ucast (((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))::32 word))::64 word) + ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word)))::64 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x21730 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x240 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e\<close>
declare P_0x1798c_22_def[Ps]

definition P_0x1798c_22_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1798c_22_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x1798c_22_regions :: state_pred where
  \<open>P_0x1798c_22_regions \<sigma> \<equiv> \<exists>regions. P_0x1798c_22_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x179a0_22 :: state_pred where
  \<open>Q_0x179a0_22 \<sigma> \<equiv> RIP \<sigma> = 0x179a0 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x21730 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x240 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e\<close>
declare Q_0x179a0_22_def[Qs]

schematic_goal nbd_trip_0_4_0x1798c_0x1799a_22[blocks]:
  assumes \<open>(P_0x1798c_22 && P_0x1798c_22_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x1799a 22 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x179a0_22 ?\<sigma> \<and> block_usage P_0x1798c_22_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1798c_22_def P_0x1798c_22_regions_def post: Q_0x179a0_22_def regionset: P_0x1798c_22_regions_set_def)

definition P_0x179a0_23 :: state_pred where
  \<open>P_0x179a0_23 \<sigma> \<equiv> RIP \<sigma> = 0x179a0 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x21730 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x240 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e\<close>
declare P_0x179a0_23_def[Ps]

definition P_0x179a0_23_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x179a0_23_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x179a0_23_regions :: state_pred where
  \<open>P_0x179a0_23_regions \<sigma> \<equiv> \<exists>regions. P_0x179a0_23_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_fprintf_chk_addr_0x179a0_23 :: state_pred where
  \<open>Q_fprintf_chk_addr_0x179a0_23 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x90) \<and> RIP \<sigma> = fprintf_chk_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x21730 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x240 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x179a5\<close>
declare Q_fprintf_chk_addr_0x179a0_23_def[Qs]

schematic_goal nbd_trip_0_1_0x179a0_0x179a0_23[blocks]:
  assumes \<open>(P_0x179a0_23 && P_0x179a0_23_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x179a0 23 \<sigma> \<triangleq> ?\<sigma> \<and> Q_fprintf_chk_addr_0x179a0_23 ?\<sigma> \<and> block_usage P_0x179a0_23_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x179a0_23_def P_0x179a0_23_regions_def post: Q_fprintf_chk_addr_0x179a0_23_def regionset: P_0x179a0_23_regions_set_def)

definition P_0x179a5_24 :: state_pred where
  \<open>P_0x179a5_24 \<sigma> \<equiv> RIP \<sigma> = 0x179a5 \<and> RAX \<sigma> = fprintf_chk_0x179a0_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x21730 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x240 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x179a5\<close>
declare P_0x179a5_24_def[Ps]

definition P_0x179a5_24_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x179a5_24_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x179a5_24_regions :: state_pred where
  \<open>P_0x179a5_24_regions \<sigma> \<equiv> \<exists>regions. P_0x179a5_24_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_errno_location_addr_0x179a5_24 :: state_pred where
  \<open>Q_errno_location_addr_0x179a5_24 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x90) \<and> RIP \<sigma> = errno_location_addr \<and> RAX \<sigma> = fprintf_chk_0x179a0_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x21730 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x240 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x179aa\<close>
declare Q_errno_location_addr_0x179a5_24_def[Qs]

schematic_goal nbd_trip_0_1_0x179a5_0x179a5_24[blocks]:
  assumes \<open>(P_0x179a5_24 && P_0x179a5_24_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x179a5 24 \<sigma> \<triangleq> ?\<sigma> \<and> Q_errno_location_addr_0x179a5_24 ?\<sigma> \<and> block_usage P_0x179a5_24_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x179a5_24_def P_0x179a5_24_regions_def post: Q_errno_location_addr_0x179a5_24_def regionset: P_0x179a5_24_regions_set_def)

definition P_0x179aa_25 :: state_pred where
  \<open>P_0x179aa_25 \<sigma> \<equiv> RIP \<sigma> = 0x179aa \<and> RAX \<sigma> = errno_location_0x179a5_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x21730 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x240 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x179aa\<close>
declare P_0x179aa_25_def[Ps]

definition P_0x179aa_25_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x179aa_25_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x90), 8),
    (19, errno_location_0x179a5_retval, 4)
  }\<close>

definition P_0x179aa_25_regions :: state_pred where
  \<open>P_0x179aa_25_regions \<sigma> \<equiv> \<exists>regions. P_0x179aa_25_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17842_25 :: state_pred where
  \<open>Q_0x17842_25 \<sigma> \<equiv> RIP \<sigma> = 0x17842 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x17842_25_def[Qs]

schematic_goal nbd_trip_0_2_0x179aa_0x179b0_25[blocks]:
  assumes \<open>(P_0x179aa_25 && P_0x179aa_25_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x179b0 25 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17842_25 ?\<sigma> \<and> block_usage P_0x179aa_25_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x179aa_25_def P_0x179aa_25_regions_def post: Q_0x17842_25_def regionset: P_0x179aa_25_regions_set_def)

definition P_0x177c9_false_26 :: state_pred where
  \<open>P_0x177c9_false_26 \<sigma> \<equiv> RIP \<sigma> = 0x177c9 \<and> RAX \<sigma> = ((ucast (((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))::32 word))::64 word) + ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word)))::64 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e\<close>
declare P_0x177c9_false_26_def[Ps]

definition P_0x177c9_false_26_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x177c9_false_26_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x177c9_false_26_regions :: state_pred where
  \<open>P_0x177c9_false_26_regions \<sigma> \<equiv> \<exists>regions. P_0x177c9_false_26_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x177d2_26 :: state_pred where
  \<open>Q_0x177d2_26 \<sigma> \<equiv> RIP \<sigma> = 0x177d2 \<and> RAX \<sigma> = ((ucast (((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))::32 word))::64 word) + ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word)))::64 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e\<close>
declare Q_0x177d2_26_def[Qs]

schematic_goal nbd_trip_0_2_0x177c9_0x177cf_26[blocks]:
  assumes \<open>(P_0x177c9_false_26 && P_0x177c9_false_26_regions && ! CF) \<sigma>\<close>
  shows \<open>exec_block 2 0x177cf 26 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x177d2_26 ?\<sigma> \<and> block_usage P_0x177c9_false_26_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x177c9_false_26_def P_0x177c9_false_26_regions_def post: Q_0x177d2_26_def regionset: P_0x177c9_false_26_regions_set_def)

definition P_0x177d2_true_27 :: state_pred where
  \<open>P_0x177d2_true_27 \<sigma> \<equiv> RIP \<sigma> = 0x177d2 \<and> RAX \<sigma> = ((ucast (((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))::32 word))::64 word) + ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word)))::64 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e\<close>
declare P_0x177d2_true_27_def[Ps]

definition P_0x177d2_true_27_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x177d2_true_27_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x90), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x98), 8),
    (20, ((RSP\<^sub>0::64 word) - 0xa0), 8),
    (21, ((RSP\<^sub>0::64 word) - 0xa8), 8)
  }\<close>

definition P_0x177d2_true_27_regions :: state_pred where
  \<open>P_0x177d2_true_27_regions \<sigma> \<equiv> \<exists>regions. P_0x177d2_true_27_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17968_27 :: state_pred where
  \<open>Q_0x17968_27 \<sigma> \<equiv> RIP \<sigma> = 0x17968 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x21778 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x248 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa8),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word)))\<close>
declare Q_0x17968_27_def[Qs]

schematic_goal nbd_trip_0_12_0x177d2_0x17962_27[blocks]:
  assumes \<open>(P_0x177d2_true_27 && P_0x177d2_true_27_regions && ja) \<sigma>\<close>
  shows \<open>exec_block 12 0x17962 27 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17968_27 ?\<sigma> \<and> block_usage P_0x177d2_true_27_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x177d2_true_27_def P_0x177d2_true_27_regions_def post: Q_0x17968_27_def regionset: P_0x177d2_true_27_regions_set_def)

definition P_0x17968_28 :: state_pred where
  \<open>P_0x17968_28 \<sigma> \<equiv> RIP \<sigma> = 0x17968 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x21778 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x248 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa8),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word)))\<close>
declare P_0x17968_28_def[Ps]

definition P_0x17968_28_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17968_28_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x90), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x98), 8),
    (20, ((RSP\<^sub>0::64 word) - 0xa0), 8),
    (21, ((RSP\<^sub>0::64 word) - 0xa8), 8),
    (22, ((RSP\<^sub>0::64 word) - 0xb0), 8)
  }\<close>

definition P_0x17968_28_regions :: state_pred where
  \<open>P_0x17968_28_regions \<sigma> \<equiv> \<exists>regions. P_0x17968_28_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_fprintf_chk_addr_0x17968_28 :: state_pred where
  \<open>Q_fprintf_chk_addr_0x17968_28 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xb0) \<and> RIP \<sigma> = fprintf_chk_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x21778 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x248 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa8),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = 0x1796d\<close>
declare Q_fprintf_chk_addr_0x17968_28_def[Qs]

schematic_goal nbd_trip_0_1_0x17968_0x17968_28[blocks]:
  assumes \<open>(P_0x17968_28 && P_0x17968_28_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x17968 28 \<sigma> \<triangleq> ?\<sigma> \<and> Q_fprintf_chk_addr_0x17968_28 ?\<sigma> \<and> block_usage P_0x17968_28_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17968_28_def P_0x17968_28_regions_def post: Q_fprintf_chk_addr_0x17968_28_def regionset: P_0x17968_28_regions_set_def)

definition P_0x1796d_29 :: state_pred where
  \<open>P_0x1796d_29 \<sigma> \<equiv> RIP \<sigma> = 0x1796d \<and> RAX \<sigma> = fprintf_chk_0x17968_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x21778 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa8) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x248 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa8),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = 0x1796d\<close>
declare P_0x1796d_29_def[Ps]

definition P_0x1796d_29_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1796d_29_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x90), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x98), 8),
    (20, ((RSP\<^sub>0::64 word) - 0xa0), 8),
    (21, ((RSP\<^sub>0::64 word) - 0xa8), 8),
    (22, ((RSP\<^sub>0::64 word) - 0xb0), 8)
  }\<close>

definition P_0x1796d_29_regions :: state_pred where
  \<open>P_0x1796d_29_regions \<sigma> \<equiv> \<exists>regions. P_0x1796d_29_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1798c_29 :: state_pred where
  \<open>Q_0x1798c_29 \<sigma> \<equiv> RIP \<sigma> = 0x1798c \<and> RAX \<sigma> = fprintf_chk_0x17968_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x217b8 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x249 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa8),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = 0x1796d\<close>
declare Q_0x1798c_29_def[Qs]

schematic_goal nbd_trip_0_5_0x1796d_0x17985_29[blocks]:
  assumes \<open>(P_0x1796d_29 && P_0x1796d_29_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x17985 29 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1798c_29 ?\<sigma> \<and> block_usage P_0x1796d_29_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1796d_29_def P_0x1796d_29_regions_def post: Q_0x1798c_29_def regionset: P_0x1796d_29_regions_set_def)

definition P_0x1798c_30 :: state_pred where
  \<open>P_0x1798c_30 \<sigma> \<equiv> RIP \<sigma> = 0x1798c \<and> RAX \<sigma> = fprintf_chk_0x17968_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x217b8 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x249 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa8),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = 0x1796d\<close>
declare P_0x1798c_30_def[Ps]

definition P_0x1798c_30_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1798c_30_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x90), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x98), 8),
    (20, ((RSP\<^sub>0::64 word) - 0xa0), 8),
    (21, ((RSP\<^sub>0::64 word) - 0xa8), 8),
    (22, ((RSP\<^sub>0::64 word) - 0xb0), 8)
  }\<close>

definition P_0x1798c_30_regions :: state_pred where
  \<open>P_0x1798c_30_regions \<sigma> \<equiv> \<exists>regions. P_0x1798c_30_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x179a0_30 :: state_pred where
  \<open>Q_0x179a0_30 \<sigma> \<equiv> RIP \<sigma> = 0x179a0 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x217b8 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x249 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa8),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = 0x1796d\<close>
declare Q_0x179a0_30_def[Qs]

schematic_goal nbd_trip_0_4_0x1798c_0x1799a_30[blocks]:
  assumes \<open>(P_0x1798c_30 && P_0x1798c_30_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x1799a 30 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x179a0_30 ?\<sigma> \<and> block_usage P_0x1798c_30_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1798c_30_def P_0x1798c_30_regions_def post: Q_0x179a0_30_def regionset: P_0x1798c_30_regions_set_def)

definition P_0x179a0_31 :: state_pred where
  \<open>P_0x179a0_31 \<sigma> \<equiv> RIP \<sigma> = 0x179a0 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x217b8 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x249 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = RCX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa8),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = 0x1796d\<close>
declare P_0x179a0_31_def[Ps]

definition P_0x179a0_31_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x179a0_31_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x90), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x98), 8),
    (20, ((RSP\<^sub>0::64 word) - 0xa0), 8),
    (21, ((RSP\<^sub>0::64 word) - 0xa8), 8),
    (22, ((RSP\<^sub>0::64 word) - 0xb0), 8)
  }\<close>

definition P_0x179a0_31_regions :: state_pred where
  \<open>P_0x179a0_31_regions \<sigma> \<equiv> \<exists>regions. P_0x179a0_31_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_fprintf_chk_addr_0x179a0_31 :: state_pred where
  \<open>Q_fprintf_chk_addr_0x179a0_31 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x90) \<and> RIP \<sigma> = fprintf_chk_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x217b8 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x249 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x179a5 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa8),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = 0x1796d\<close>
declare Q_fprintf_chk_addr_0x179a0_31_def[Qs]

schematic_goal nbd_trip_0_1_0x179a0_0x179a0_31[blocks]:
  assumes \<open>(P_0x179a0_31 && P_0x179a0_31_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x179a0 31 \<sigma> \<triangleq> ?\<sigma> \<and> Q_fprintf_chk_addr_0x179a0_31 ?\<sigma> \<and> block_usage P_0x179a0_31_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x179a0_31_def P_0x179a0_31_regions_def post: Q_fprintf_chk_addr_0x179a0_31_def regionset: P_0x179a0_31_regions_set_def)

definition P_0x179a5_32 :: state_pred where
  \<open>P_0x179a5_32 \<sigma> \<equiv> RIP \<sigma> = 0x179a5 \<and> RAX \<sigma> = fprintf_chk_0x179a0_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x217b8 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x249 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x179a5 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa8),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = 0x1796d\<close>
declare P_0x179a5_32_def[Ps]

definition P_0x179a5_32_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x179a5_32_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x90), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x98), 8),
    (20, ((RSP\<^sub>0::64 word) - 0xa0), 8),
    (21, ((RSP\<^sub>0::64 word) - 0xa8), 8),
    (22, ((RSP\<^sub>0::64 word) - 0xb0), 8)
  }\<close>

definition P_0x179a5_32_regions :: state_pred where
  \<open>P_0x179a5_32_regions \<sigma> \<equiv> \<exists>regions. P_0x179a5_32_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_errno_location_addr_0x179a5_32 :: state_pred where
  \<open>Q_errno_location_addr_0x179a5_32 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x90) \<and> RIP \<sigma> = errno_location_addr \<and> RAX \<sigma> = fprintf_chk_0x179a0_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x217b8 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x249 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x179aa \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa8),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = 0x1796d\<close>
declare Q_errno_location_addr_0x179a5_32_def[Qs]

schematic_goal nbd_trip_0_1_0x179a5_0x179a5_32[blocks]:
  assumes \<open>(P_0x179a5_32 && P_0x179a5_32_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x179a5 32 \<sigma> \<triangleq> ?\<sigma> \<and> Q_errno_location_addr_0x179a5_32 ?\<sigma> \<and> block_usage P_0x179a5_32_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x179a5_32_def P_0x179a5_32_regions_def post: Q_errno_location_addr_0x179a5_32_def regionset: P_0x179a5_32_regions_set_def)

definition P_0x179aa_33 :: state_pred where
  \<open>P_0x179aa_33 \<sigma> \<equiv> RIP \<sigma> = 0x179aa \<and> RAX \<sigma> = errno_location_0x179a5_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x217b8 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x249 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x179aa \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = RDX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa8),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xb0),8]::64 word) = 0x1796d\<close>
declare P_0x179aa_33_def[Ps]

definition P_0x179aa_33_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x179aa_33_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x90), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x98), 8),
    (20, ((RSP\<^sub>0::64 word) - 0xa0), 8),
    (21, ((RSP\<^sub>0::64 word) - 0xa8), 8),
    (22, ((RSP\<^sub>0::64 word) - 0xb0), 8),
    (23, errno_location_0x179a5_retval, 4)
  }\<close>

definition P_0x179aa_33_regions :: state_pred where
  \<open>P_0x179aa_33_regions \<sigma> \<equiv> \<exists>regions. P_0x179aa_33_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17842_33 :: state_pred where
  \<open>Q_0x17842_33 \<sigma> \<equiv> RIP \<sigma> = 0x17842 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x17842_33_def[Qs]

schematic_goal nbd_trip_0_2_0x179aa_0x179b0_33[blocks]:
  assumes \<open>(P_0x179aa_33 && P_0x179aa_33_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x179b0 33 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17842_33 ?\<sigma> \<and> block_usage P_0x179aa_33_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x179aa_33_def P_0x179aa_33_regions_def post: Q_0x17842_33_def regionset: P_0x179aa_33_regions_set_def)

definition P_0x177d2_false_34 :: state_pred where
  \<open>P_0x177d2_false_34 \<sigma> \<equiv> RIP \<sigma> = 0x177d2 \<and> RAX \<sigma> = ((ucast (((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))::32 word))::64 word) + ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word)))::64 word)) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = RDX\<^sub>0 \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e\<close>
declare P_0x177d2_false_34_def[Ps]

definition P_0x177d2_false_34_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x177d2_false_34_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x177d2_false_34_regions :: state_pred where
  \<open>P_0x177d2_false_34_regions \<sigma> \<equiv> \<exists>regions. P_0x177d2_false_34_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x177e5_34 :: state_pred where
  \<open>Q_0x177e5_34 \<sigma> \<equiv> RIP \<sigma> = 0x177e5 \<and> RAX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)::32 word))::32 word)))) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e\<close>
declare Q_0x177e5_34_def[Qs]

schematic_goal nbd_trip_0_6_0x177d2_0x177e2_34[blocks]:
  assumes \<open>(P_0x177d2_false_34 && P_0x177d2_false_34_regions && ! ja) \<sigma>\<close>
  shows \<open>exec_block 6 0x177e2 34 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x177e5_34 ?\<sigma> \<and> block_usage P_0x177d2_false_34_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x177d2_false_34_def P_0x177d2_false_34_regions_def post: Q_0x177e5_34_def regionset: P_0x177d2_false_34_regions_set_def)

definition P_0x177e5_true_35 :: state_pred where
  \<open>P_0x177e5_true_35 \<sigma> \<equiv> RIP \<sigma> = 0x177e5 \<and> RAX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)::32 word))::32 word)))) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e\<close>
declare P_0x177e5_true_35_def[Ps]

definition P_0x177e5_true_35_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x177e5_true_35_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x6c), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (20, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x177e5_true_35_regions :: state_pred where
  \<open>P_0x177e5_true_35_regions \<sigma> \<equiv> \<exists>regions. P_0x177e5_true_35_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1788c_35 :: state_pred where
  \<open>Q_0x1788c_35 \<sigma> \<equiv> RIP \<sigma> = 0x1788c \<and> RAX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)::32 word))::32 word)))) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e\<close>
declare Q_0x1788c_35_def[Qs]

schematic_goal nbd_trip_0_8_0x177e5_0x17887_35[blocks]:
  assumes \<open>(P_0x177e5_true_35 && P_0x177e5_true_35_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 8 0x17887 35 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1788c_35 ?\<sigma> \<and> block_usage P_0x177e5_true_35_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x177e5_true_35_def P_0x177e5_true_35_regions_def post: Q_0x1788c_35_def regionset: P_0x177e5_true_35_regions_set_def)

definition P_0x1788c_36 :: state_pred where
  \<open>P_0x1788c_36 \<sigma> \<equiv> RIP \<sigma> = 0x1788c \<and> RAX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)::32 word))::32 word)))) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e\<close>
declare P_0x1788c_36_def[Ps]

definition P_0x1788c_36_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1788c_36_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x6c), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (20, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x1788c_36_regions :: state_pred where
  \<open>P_0x1788c_36_regions \<sigma> \<equiv> \<exists>regions. P_0x1788c_36_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_nbd_wr_sync_addr_0x1788c_36 :: state_pred where
  \<open>Q_nbd_wr_sync_addr_0x1788c_36 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x90) \<and> RIP \<sigma> = nbd_wr_sync_addr \<and> RAX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)::32 word))::32 word)))) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x17891\<close>
declare Q_nbd_wr_sync_addr_0x1788c_36_def[Qs]

schematic_goal nbd_trip_0_1_0x1788c_0x1788c_36[blocks]:
  assumes \<open>(P_0x1788c_36 && P_0x1788c_36_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1788c 36 \<sigma> \<triangleq> ?\<sigma> \<and> Q_nbd_wr_sync_addr_0x1788c_36 ?\<sigma> \<and> block_usage P_0x1788c_36_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1788c_36_def P_0x1788c_36_regions_def post: Q_nbd_wr_sync_addr_0x1788c_36_def regionset: P_0x1788c_36_regions_set_def)

definition P_0x17891_37 :: state_pred where
  \<open>P_0x17891_37 \<sigma> \<equiv> RIP \<sigma> = 0x17891 \<and> RAX \<sigma> = nbd_wr_sync_0x1788c_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x17891\<close>
declare P_0x17891_37_def[Ps]

definition P_0x17891_37_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17891_37_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x6c), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (20, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x17891_37_regions :: state_pred where
  \<open>P_0x17891_37_regions \<sigma> \<equiv> \<exists>regions. P_0x17891_37_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x178a3_37 :: state_pred where
  \<open>Q_0x178a3_37 \<sigma> \<equiv> RIP \<sigma> = 0x178a3 \<and> RAX \<sigma> = nbd_wr_sync_0x1788c_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x17891\<close>
declare Q_0x178a3_37_def[Qs]

schematic_goal nbd_trip_0_4_0x17891_0x178a0_37[blocks]:
  assumes \<open>(P_0x17891_37 && P_0x17891_37_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x178a0 37 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x178a3_37 ?\<sigma> \<and> block_usage P_0x17891_37_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17891_37_def P_0x17891_37_regions_def post: Q_0x178a3_37_def regionset: P_0x17891_37_regions_set_def)

definition P_0x178a3_true_38 :: state_pred where
  \<open>P_0x178a3_true_38 \<sigma> \<equiv> RIP \<sigma> = 0x178a3 \<and> RAX \<sigma> = nbd_wr_sync_0x1788c_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x17891\<close>
declare P_0x178a3_true_38_def[Ps]

definition P_0x178a3_true_38_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x178a3_true_38_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x6c), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (20, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x178a3_true_38_regions :: state_pred where
  \<open>P_0x178a3_true_38_regions \<sigma> \<equiv> \<exists>regions. P_0x178a3_true_38_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1798c_38 :: state_pred where
  \<open>Q_0x1798c_38 \<sigma> \<equiv> RIP \<sigma> = 0x1798c \<and> RAX \<sigma> = nbd_wr_sync_0x1788c_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x21818 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x272 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x17891\<close>
declare Q_0x1798c_38_def[Qs]

schematic_goal nbd_trip_0_6_0x178a3_0x17a8b_38[blocks]:
  assumes \<open>(P_0x178a3_true_38 && P_0x178a3_true_38_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 6 0x17a8b 38 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1798c_38 ?\<sigma> \<and> block_usage P_0x178a3_true_38_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x178a3_true_38_def P_0x178a3_true_38_regions_def post: Q_0x1798c_38_def regionset: P_0x178a3_true_38_regions_set_def)

definition P_0x1798c_39 :: state_pred where
  \<open>P_0x1798c_39 \<sigma> \<equiv> RIP \<sigma> = 0x1798c \<and> RAX \<sigma> = nbd_wr_sync_0x1788c_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x21818 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x272 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x17891\<close>
declare P_0x1798c_39_def[Ps]

definition P_0x1798c_39_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1798c_39_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x6c), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (21, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x1798c_39_regions :: state_pred where
  \<open>P_0x1798c_39_regions \<sigma> \<equiv> \<exists>regions. P_0x1798c_39_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x179a0_39 :: state_pred where
  \<open>Q_0x179a0_39 \<sigma> \<equiv> RIP \<sigma> = 0x179a0 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x21818 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x272 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x17891\<close>
declare Q_0x179a0_39_def[Qs]

schematic_goal nbd_trip_0_4_0x1798c_0x1799a_39[blocks]:
  assumes \<open>(P_0x1798c_39 && P_0x1798c_39_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x1799a 39 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x179a0_39 ?\<sigma> \<and> block_usage P_0x1798c_39_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1798c_39_def P_0x1798c_39_regions_def post: Q_0x179a0_39_def regionset: P_0x1798c_39_regions_set_def)

definition P_0x179a0_40 :: state_pred where
  \<open>P_0x179a0_40 \<sigma> \<equiv> RIP \<sigma> = 0x179a0 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x21818 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x272 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x17891\<close>
declare P_0x179a0_40_def[Ps]

definition P_0x179a0_40_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x179a0_40_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x6c), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (21, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x179a0_40_regions :: state_pred where
  \<open>P_0x179a0_40_regions \<sigma> \<equiv> \<exists>regions. P_0x179a0_40_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_fprintf_chk_addr_0x179a0_40 :: state_pred where
  \<open>Q_fprintf_chk_addr_0x179a0_40 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x90) \<and> RIP \<sigma> = fprintf_chk_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x21818 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x272 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x179a5\<close>
declare Q_fprintf_chk_addr_0x179a0_40_def[Qs]

schematic_goal nbd_trip_0_1_0x179a0_0x179a0_40[blocks]:
  assumes \<open>(P_0x179a0_40 && P_0x179a0_40_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x179a0 40 \<sigma> \<triangleq> ?\<sigma> \<and> Q_fprintf_chk_addr_0x179a0_40 ?\<sigma> \<and> block_usage P_0x179a0_40_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x179a0_40_def P_0x179a0_40_regions_def post: Q_fprintf_chk_addr_0x179a0_40_def regionset: P_0x179a0_40_regions_set_def)

definition P_0x179a5_41 :: state_pred where
  \<open>P_0x179a5_41 \<sigma> \<equiv> RIP \<sigma> = 0x179a5 \<and> RAX \<sigma> = fprintf_chk_0x179a0_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x21818 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x272 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x179a5\<close>
declare P_0x179a5_41_def[Ps]

definition P_0x179a5_41_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x179a5_41_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x6c), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (21, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x179a5_41_regions :: state_pred where
  \<open>P_0x179a5_41_regions \<sigma> \<equiv> \<exists>regions. P_0x179a5_41_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_errno_location_addr_0x179a5_41 :: state_pred where
  \<open>Q_errno_location_addr_0x179a5_41 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x90) \<and> RIP \<sigma> = errno_location_addr \<and> RAX \<sigma> = fprintf_chk_0x179a0_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x21818 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x272 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x179aa\<close>
declare Q_errno_location_addr_0x179a5_41_def[Qs]

schematic_goal nbd_trip_0_1_0x179a5_0x179a5_41[blocks]:
  assumes \<open>(P_0x179a5_41 && P_0x179a5_41_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x179a5 41 \<sigma> \<triangleq> ?\<sigma> \<and> Q_errno_location_addr_0x179a5_41 ?\<sigma> \<and> block_usage P_0x179a5_41_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x179a5_41_def P_0x179a5_41_regions_def post: Q_errno_location_addr_0x179a5_41_def regionset: P_0x179a5_41_regions_set_def)

definition P_0x179aa_42 :: state_pred where
  \<open>P_0x179aa_42 \<sigma> \<equiv> RIP \<sigma> = 0x179aa \<and> RAX \<sigma> = errno_location_0x179a5_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x21818 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x272 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x179aa\<close>
declare P_0x179aa_42_def[Ps]

definition P_0x179aa_42_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x179aa_42_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x6c), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (21, ((RSP\<^sub>0::64 word) - 0x90), 8),
    (22, errno_location_0x179a5_retval, 4)
  }\<close>

definition P_0x179aa_42_regions :: state_pred where
  \<open>P_0x179aa_42_regions \<sigma> \<equiv> \<exists>regions. P_0x179aa_42_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17842_42 :: state_pred where
  \<open>Q_0x17842_42 \<sigma> \<equiv> RIP \<sigma> = 0x17842 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x17842_42_def[Qs]

schematic_goal nbd_trip_0_2_0x179aa_0x179b0_42[blocks]:
  assumes \<open>(P_0x179aa_42 && P_0x179aa_42_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x179b0 42 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17842_42 ?\<sigma> \<and> block_usage P_0x179aa_42_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x179aa_42_def P_0x179aa_42_regions_def post: Q_0x17842_42_def regionset: P_0x179aa_42_regions_set_def)

definition P_0x178a3_false_43 :: state_pred where
  \<open>P_0x178a3_false_43 \<sigma> \<equiv> RIP \<sigma> = 0x178a3 \<and> RAX \<sigma> = nbd_wr_sync_0x1788c_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x17891\<close>
declare P_0x178a3_false_43_def[Ps]

definition P_0x178a3_false_43_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x178a3_false_43_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x6c), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x88), Suc 0),
    (20, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (21, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x178a3_false_43_regions :: state_pred where
  \<open>P_0x178a3_false_43_regions \<sigma> \<equiv> \<exists>regions. P_0x178a3_false_43_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(19,20)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(19,20), (20,19)}))
\<close>

definition Q_0x178b2_43 :: state_pred where
  \<open>Q_0x178b2_43 \<sigma> \<equiv> RIP \<sigma> = 0x178b2 \<and> RAX \<sigma> = nbd_wr_sync_0x1788c_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x17891\<close>
declare Q_0x178b2_43_def[Qs]

schematic_goal nbd_trip_0_3_0x178a3_0x178ad_43[blocks]:
  assumes \<open>(P_0x178a3_false_43 && P_0x178a3_false_43_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x178ad 43 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x178b2_43 ?\<sigma> \<and> block_usage P_0x178a3_false_43_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x178a3_false_43_def P_0x178a3_false_43_regions_def post: Q_0x178b2_43_def regionset: P_0x178a3_false_43_regions_set_def)

definition P_0x178b2_true_44 :: state_pred where
  \<open>P_0x178b2_true_44 \<sigma> \<equiv> RIP \<sigma> = 0x178b2 \<and> RAX \<sigma> = nbd_wr_sync_0x1788c_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x17891\<close>
declare P_0x178b2_true_44_def[Ps]

definition P_0x178b2_true_44_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x178b2_true_44_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x6c), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x88), Suc 0),
    (20, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (21, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x178b2_true_44_regions :: state_pred where
  \<open>P_0x178b2_true_44_regions \<sigma> \<equiv> \<exists>regions. P_0x178b2_true_44_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(19,20)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(19,20), (20,19)}))
\<close>

definition Q_0x178e7_44 :: state_pred where
  \<open>Q_0x178e7_44 \<sigma> \<equiv> RIP \<sigma> = 0x178e7 \<and> RAX \<sigma> = nbd_wr_sync_0x1788c_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x17891\<close>
declare Q_0x178e7_44_def[Qs]

schematic_goal nbd_trip_0_3_0x178b2_0x17a65_44[blocks]:
  assumes \<open>(P_0x178b2_true_44 && P_0x178b2_true_44_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x17a65 44 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x178e7_44 ?\<sigma> \<and> block_usage P_0x178b2_true_44_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x178b2_true_44_def P_0x178b2_true_44_regions_def post: Q_0x178e7_44_def regionset: P_0x178b2_true_44_regions_set_def)

definition P_0x178e7_45 :: state_pred where
  \<open>P_0x178e7_45 \<sigma> \<equiv> RIP \<sigma> = 0x178e7 \<and> RAX \<sigma> = nbd_wr_sync_0x1788c_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x17891\<close>
declare P_0x178e7_45_def[Ps]

definition P_0x178e7_45_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x178e7_45_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x6c), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x88), Suc 0),
    (20, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (21, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x178e7_45_regions :: state_pred where
  \<open>P_0x178e7_45_regions \<sigma> \<equiv> \<exists>regions. P_0x178e7_45_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(19,20)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(19,20), (20,19)}))
\<close>

definition Q_0x178ef_45 :: state_pred where
  \<open>Q_0x178ef_45 \<sigma> \<equiv> RIP \<sigma> = 0x178ef \<and> RAX \<sigma> = nbd_wr_sync_0x1788c_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0x0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x17891\<close>
declare Q_0x178ef_45_def[Qs]

schematic_goal nbd_trip_0_3_0x178e7_0x178ec_45[blocks]:
  assumes \<open>(P_0x178e7_45 && P_0x178e7_45_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x178ec 45 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x178ef_45 ?\<sigma> \<and> block_usage P_0x178e7_45_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x178e7_45_def P_0x178e7_45_regions_def post: Q_0x178ef_45_def regionset: P_0x178e7_45_regions_set_def)

definition P_0x178ef_46 :: state_pred where
  \<open>P_0x178ef_46 \<sigma> \<equiv> RIP \<sigma> = 0x178ef \<and> RAX \<sigma> = nbd_wr_sync_0x1788c_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0x0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x17891\<close>
declare P_0x178ef_46_def[Ps]

definition P_0x178ef_46_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x178ef_46_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x6c), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x88), Suc 0),
    (20, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (21, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x178ef_46_regions :: state_pred where
  \<open>P_0x178ef_46_regions \<sigma> \<equiv> \<exists>regions. P_0x178ef_46_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(19,20)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(19,20), (20,19)}))
\<close>

definition Q_nbd_send_reply_isra_0_addr_0x178ef_46 :: state_pred where
  \<open>Q_nbd_send_reply_isra_0_addr_0x178ef_46 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x90) \<and> RIP \<sigma> = nbd_send_reply_isra_0_addr \<and> RAX \<sigma> = nbd_wr_sync_0x1788c_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = 0x1 \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0x0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x178f4\<close>
declare Q_nbd_send_reply_isra_0_addr_0x178ef_46_def[Qs]

schematic_goal nbd_trip_0_1_0x178ef_0x178ef_46[blocks]:
  assumes \<open>(P_0x178ef_46 && P_0x178ef_46_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x178ef 46 \<sigma> \<triangleq> ?\<sigma> \<and> Q_nbd_send_reply_isra_0_addr_0x178ef_46 ?\<sigma> \<and> block_usage P_0x178ef_46_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x178ef_46_def P_0x178ef_46_regions_def post: Q_nbd_send_reply_isra_0_addr_0x178ef_46_def regionset: P_0x178ef_46_regions_set_def)

definition P_0x178f4_47 :: state_pred where
  \<open>P_0x178f4_47 \<sigma> \<equiv> RIP \<sigma> = 0x178f4 \<and> RAX \<sigma> = nbd_send_reply_isra_0_0x178ef_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0x0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x178f4\<close>
declare P_0x178f4_47_def[Ps]

definition P_0x178f4_47_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x178f4_47_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x6c), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x88), Suc 0),
    (20, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (21, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x178f4_47_regions :: state_pred where
  \<open>P_0x178f4_47_regions \<sigma> \<equiv> \<exists>regions. P_0x178f4_47_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(19,20)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(19,20), (20,19)}))
\<close>

definition Q_0x17842_47 :: state_pred where
  \<open>Q_0x17842_47 \<sigma> \<equiv> RIP \<sigma> = 0x17842 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x17842_47_def[Qs]

schematic_goal nbd_trip_0_4_0x178f4_0x178fe_47[blocks]:
  assumes \<open>(P_0x178f4_47 && P_0x178f4_47_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x178fe 47 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17842_47 ?\<sigma> \<and> block_usage P_0x178f4_47_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x178f4_47_def P_0x178f4_47_regions_def post: Q_0x17842_47_def regionset: P_0x178f4_47_regions_set_def)

definition P_0x178b2_false_48 :: state_pred where
  \<open>P_0x178b2_false_48 \<sigma> \<equiv> RIP \<sigma> = 0x178b2 \<and> RAX \<sigma> = nbd_wr_sync_0x1788c_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x1 \<and> RDX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x17891\<close>
declare P_0x178b2_false_48_def[Ps]

definition P_0x178b2_false_48_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x178b2_false_48_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x6c), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x88), Suc 0),
    (20, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (21, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x178b2_false_48_regions :: state_pred where
  \<open>P_0x178b2_false_48_regions \<sigma> \<equiv> \<exists>regions. P_0x178b2_false_48_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(19,20)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(19,20), (20,19)}))
\<close>

definition Q_0x178cc_48 :: state_pred where
  \<open>Q_0x178cc_48 \<sigma> \<equiv> RIP \<sigma> = 0x178cc \<and> RAX \<sigma> = nbd_wr_sync_0x1788c_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = ucast (((ucast (((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))::32 word))::32 word) >> 9)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((((RCX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word)))::64 word) * 0x1)::64 word))::64 word))::64 word) >> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x17891\<close>
declare Q_0x178cc_48_def[Qs]

schematic_goal nbd_trip_0_7_0x178b2_0x178c8_48[blocks]:
  assumes \<open>(P_0x178b2_false_48 && P_0x178b2_false_48_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 7 0x178c8 48 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x178cc_48 ?\<sigma> \<and> block_usage P_0x178b2_false_48_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x178b2_false_48_def P_0x178b2_false_48_regions_def post: Q_0x178cc_48_def regionset: P_0x178b2_false_48_regions_set_def)

definition P_0x178cc_49 :: state_pred where
  \<open>P_0x178cc_49 \<sigma> \<equiv> RIP \<sigma> = 0x178cc \<and> RAX \<sigma> = nbd_wr_sync_0x1788c_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = ucast (((ucast (((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))::32 word))::32 word) >> 9)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((((RCX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word)))::64 word) * 0x1)::64 word))::64 word))::64 word) >> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x17891\<close>
declare P_0x178cc_49_def[Ps]

definition P_0x178cc_49_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x178cc_49_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x6c), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x88), Suc 0),
    (20, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (21, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x178cc_49_regions :: state_pred where
  \<open>P_0x178cc_49_regions \<sigma> \<equiv> \<exists>regions. P_0x178cc_49_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(19,20)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(19,20), (20,19)}))
\<close>

definition Q_bdrv_write_addr_0x178cc_49 :: state_pred where
  \<open>Q_bdrv_write_addr_0x178cc_49 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x90) \<and> RIP \<sigma> = bdrv_write_addr \<and> RAX \<sigma> = nbd_wr_sync_0x1788c_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = ucast (((ucast (((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))::32 word))::32 word) >> 9)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((((RCX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word)))::64 word) * 0x1)::64 word))::64 word))::64 word) >> 9) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x178d1\<close>
declare Q_bdrv_write_addr_0x178cc_49_def[Qs]

schematic_goal nbd_trip_0_1_0x178cc_0x178cc_49[blocks]:
  assumes \<open>(P_0x178cc_49 && P_0x178cc_49_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x178cc 49 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_write_addr_0x178cc_49 ?\<sigma> \<and> block_usage P_0x178cc_49_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x178cc_49_def P_0x178cc_49_regions_def post: Q_bdrv_write_addr_0x178cc_49_def regionset: P_0x178cc_49_regions_set_def)

definition P_0x178d1_50 :: state_pred where
  \<open>P_0x178d1_50 \<sigma> \<equiv> RIP \<sigma> = 0x178d1 \<and> RAX \<sigma> = bdrv_write_0x178cc_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = ucast (((ucast (((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))::32 word))::32 word) >> 9)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((((RCX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word)))::64 word) * 0x1)::64 word))::64 word))::64 word) >> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x178d1\<close>
declare P_0x178d1_50_def[Ps]

definition P_0x178d1_50_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x178d1_50_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x6c), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x88), Suc 0),
    (20, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (21, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x178d1_50_regions :: state_pred where
  \<open>P_0x178d1_50_regions \<sigma> \<equiv> \<exists>regions. P_0x178d1_50_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(19,20)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(19,20), (20,19)}))
\<close>

definition Q_0x178dc_50 :: state_pred where
  \<open>Q_0x178dc_50 \<sigma> \<equiv> RIP \<sigma> = 0x178dc \<and> RAX \<sigma> = bdrv_write_0x178cc_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = ucast (((ucast (((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))::32 word))::32 word) >> 9)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((((RCX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word)))::64 word) * 0x1)::64 word))::64 word))::64 word) >> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>bdrv_write_0x178cc_retval::32 word)) \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x178d1\<close>
declare Q_0x178dc_50_def[Qs]

schematic_goal nbd_trip_0_3_0x178d1_0x178d9_50[blocks]:
  assumes \<open>(P_0x178d1_50 && P_0x178d1_50_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x178d9 50 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x178dc_50 ?\<sigma> \<and> block_usage P_0x178d1_50_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x178d1_50_def P_0x178d1_50_regions_def post: Q_0x178dc_50_def regionset: P_0x178d1_50_regions_set_def)

definition P_0x178dc_true_51 :: state_pred where
  \<open>P_0x178dc_true_51 \<sigma> \<equiv> RIP \<sigma> = 0x178dc \<and> RAX \<sigma> = bdrv_write_0x178cc_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = ucast (((ucast (((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))::32 word))::32 word) >> 9)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((((RCX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word)))::64 word) * 0x1)::64 word))::64 word))::64 word) >> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>bdrv_write_0x178cc_retval::32 word)) \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x178d1\<close>
declare P_0x178dc_true_51_def[Ps]

definition P_0x178dc_true_51_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x178dc_true_51_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x6c), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x88), Suc 0),
    (20, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (21, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x178dc_true_51_regions :: state_pred where
  \<open>P_0x178dc_true_51_regions \<sigma> \<equiv> \<exists>regions. P_0x178dc_true_51_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(19,20)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(19,20), (20,19)}))
\<close>

definition Q_0x17aab_51 :: state_pred where
  \<open>Q_0x17aab_51 \<sigma> \<equiv> RIP \<sigma> = 0x17aab \<and> RAX \<sigma> = bdrv_write_0x178cc_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x21848 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((((RCX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word)))::64 word) * 0x1)::64 word))::64 word))::64 word) >> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>bdrv_write_0x178cc_retval::32 word)) \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x27f \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x178d1\<close>
declare Q_0x17aab_51_def[Qs]

schematic_goal nbd_trip_0_6_0x178dc_0x17b2e_51[blocks]:
  assumes \<open>(P_0x178dc_true_51 && P_0x178dc_true_51_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 6 0x17b2e 51 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17aab_51 ?\<sigma> \<and> block_usage P_0x178dc_true_51_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x178dc_true_51_def P_0x178dc_true_51_regions_def post: Q_0x17aab_51_def regionset: P_0x178dc_true_51_regions_set_def)

definition P_0x17aab_52 :: state_pred where
  \<open>P_0x17aab_52 \<sigma> \<equiv> RIP \<sigma> = 0x17aab \<and> RAX \<sigma> = bdrv_write_0x178cc_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x21848 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((((RCX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word)))::64 word) * 0x1)::64 word))::64 word))::64 word) >> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>bdrv_write_0x178cc_retval::32 word)) \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x27f \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x178d1\<close>
declare P_0x17aab_52_def[Ps]

definition P_0x17aab_52_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17aab_52_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x6c), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x88), Suc 0),
    (21, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (22, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x17aab_52_regions :: state_pred where
  \<open>P_0x17aab_52_regions \<sigma> \<equiv> \<exists>regions. P_0x17aab_52_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(20,21)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(20,21), (21,20)}))
\<close>

definition Q_0x17ab9_52 :: state_pred where
  \<open>Q_0x17ab9_52 \<sigma> \<equiv> RIP \<sigma> = 0x17ab9 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x21848 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>bdrv_write_0x178cc_retval::32 word)) \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x27f \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x178d1\<close>
declare Q_0x17ab9_52_def[Qs]

schematic_goal nbd_trip_0_3_0x17aab_0x17ab7_52[blocks]:
  assumes \<open>(P_0x17aab_52 && P_0x17aab_52_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x17ab7 52 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17ab9_52 ?\<sigma> \<and> block_usage P_0x17aab_52_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17aab_52_def P_0x17aab_52_regions_def post: Q_0x17ab9_52_def regionset: P_0x17aab_52_regions_set_def)

definition P_0x17ab9_53 :: state_pred where
  \<open>P_0x17ab9_53 \<sigma> \<equiv> RIP \<sigma> = 0x17ab9 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x21848 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>bdrv_write_0x178cc_retval::32 word)) \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x27f \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x178d1\<close>
declare P_0x17ab9_53_def[Ps]

definition P_0x17ab9_53_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17ab9_53_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x6c), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x88), Suc 0),
    (21, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (22, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x17ab9_53_regions :: state_pred where
  \<open>P_0x17ab9_53_regions \<sigma> \<equiv> \<exists>regions. P_0x17ab9_53_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(20,21)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(20,21), (21,20)}))
\<close>

definition Q_fprintf_chk_addr_0x17ab9_53 :: state_pred where
  \<open>Q_fprintf_chk_addr_0x17ab9_53 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x90) \<and> RIP \<sigma> = fprintf_chk_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x21848 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>bdrv_write_0x178cc_retval::32 word)) \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x27f \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x17abe\<close>
declare Q_fprintf_chk_addr_0x17ab9_53_def[Qs]

schematic_goal nbd_trip_0_1_0x17ab9_0x17ab9_53[blocks]:
  assumes \<open>(P_0x17ab9_53 && P_0x17ab9_53_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x17ab9 53 \<sigma> \<triangleq> ?\<sigma> \<and> Q_fprintf_chk_addr_0x17ab9_53 ?\<sigma> \<and> block_usage P_0x17ab9_53_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17ab9_53_def P_0x17ab9_53_regions_def post: Q_fprintf_chk_addr_0x17ab9_53_def regionset: P_0x17ab9_53_regions_set_def)

definition P_0x17abe_54 :: state_pred where
  \<open>P_0x17abe_54 \<sigma> \<equiv> RIP \<sigma> = 0x17abe \<and> RAX \<sigma> = fprintf_chk_0x17ab9_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x21848 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>bdrv_write_0x178cc_retval::32 word)) \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x27f \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x17abe\<close>
declare P_0x17abe_54_def[Ps]

definition P_0x17abe_54_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17abe_54_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x6c), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x88), Suc 0),
    (21, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (22, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x17abe_54_regions :: state_pred where
  \<open>P_0x17abe_54_regions \<sigma> \<equiv> \<exists>regions. P_0x17abe_54_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(20,21)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(20,21), (21,20)}))
\<close>

definition Q_errno_location_addr_0x17abe_54 :: state_pred where
  \<open>Q_errno_location_addr_0x17abe_54 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x90) \<and> RIP \<sigma> = errno_location_addr \<and> RAX \<sigma> = fprintf_chk_0x17ab9_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x21848 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>bdrv_write_0x178cc_retval::32 word)) \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x27f \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x17ac3\<close>
declare Q_errno_location_addr_0x17abe_54_def[Qs]

schematic_goal nbd_trip_0_1_0x17abe_0x17abe_54[blocks]:
  assumes \<open>(P_0x17abe_54 && P_0x17abe_54_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x17abe 54 \<sigma> \<triangleq> ?\<sigma> \<and> Q_errno_location_addr_0x17abe_54 ?\<sigma> \<and> block_usage P_0x17abe_54_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17abe_54_def P_0x17abe_54_regions_def post: Q_errno_location_addr_0x17abe_54_def regionset: P_0x17abe_54_regions_set_def)

definition P_0x17ac3_55 :: state_pred where
  \<open>P_0x17ac3_55 \<sigma> \<equiv> RIP \<sigma> = 0x17ac3 \<and> RAX \<sigma> = errno_location_0x17abe_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x21848 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>bdrv_write_0x178cc_retval::32 word)) \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x27f \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x17ac3\<close>
declare P_0x17ac3_55_def[Ps]

definition P_0x17ac3_55_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17ac3_55_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x6c), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x88), Suc 0),
    (21, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (22, ((RSP\<^sub>0::64 word) - 0x90), 8),
    (23, errno_location_0x17abe_retval, 4)
  }\<close>

definition P_0x17ac3_55_regions :: state_pred where
  \<open>P_0x17ac3_55_regions \<sigma> \<equiv> \<exists>regions. P_0x17ac3_55_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(20,21)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(20,21), (21,20)}))
\<close>

definition Q_0x17842_55 :: state_pred where
  \<open>Q_0x17842_55 \<sigma> \<equiv> RIP \<sigma> = 0x17842 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x17842_55_def[Qs]

schematic_goal nbd_trip_0_2_0x17ac3_0x17ac9_55[blocks]:
  assumes \<open>(P_0x17ac3_55 && P_0x17ac3_55_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x17ac9 55 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17842_55 ?\<sigma> \<and> block_usage P_0x17ac3_55_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17ac3_55_def P_0x17ac3_55_regions_def post: Q_0x17842_55_def regionset: P_0x17ac3_55_regions_set_def)

definition P_0x178dc_false_56 :: state_pred where
  \<open>P_0x178dc_false_56 \<sigma> \<equiv> RIP \<sigma> = 0x178dc \<and> RAX \<sigma> = bdrv_write_0x178cc_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = ucast (((ucast (((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))::32 word))::32 word) >> 9)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((((RCX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word)))::64 word) * 0x1)::64 word))::64 word))::64 word) >> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>bdrv_write_0x178cc_retval::32 word)) \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x178d1\<close>
declare P_0x178dc_false_56_def[Ps]

definition P_0x178dc_false_56_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x178dc_false_56_regions_set \<sigma> \<equiv> {
    (0, R8\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x6c), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (20, ((RSP\<^sub>0::64 word) - 0x88), Suc 0),
    (21, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (22, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x178dc_false_56_regions :: state_pred where
  \<open>P_0x178dc_false_56_regions \<sigma> \<equiv> \<exists>regions. P_0x178dc_false_56_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(20,21)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(20,21), (21,20)}))
\<close>

definition Q_0x178e7_56 :: state_pred where
  \<open>Q_0x178e7_56 \<sigma> \<equiv> RIP \<sigma> = 0x178e7 \<and> RAX \<sigma> = bdrv_write_0x178cc_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = ucast (((ucast (((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))::32 word))::32 word) >> 9)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>bdrv_write_0x178cc_retval::32 word)) \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x178d1\<close>
declare Q_0x178e7_56_def[Qs]

schematic_goal nbd_trip_0_3_0x178dc_0x178e5_56[blocks]:
  assumes \<open>(P_0x178dc_false_56 && P_0x178dc_false_56_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x178e5 56 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x178e7_56 ?\<sigma> \<and> block_usage P_0x178dc_false_56_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x178dc_false_56_def P_0x178dc_false_56_regions_def post: Q_0x178e7_56_def regionset: P_0x178dc_false_56_regions_set_def)

definition P_0x178e7_57 :: state_pred where
  \<open>P_0x178e7_57 \<sigma> \<equiv> RIP \<sigma> = 0x178e7 \<and> RAX \<sigma> = bdrv_write_0x178cc_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = ucast (((ucast (((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))::32 word))::32 word) >> 9)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>bdrv_write_0x178cc_retval::32 word)) \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x178d1\<close>
declare P_0x178e7_57_def[Ps]

definition P_0x178e7_57_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x178e7_57_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x6c), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x88), Suc 0),
    (20, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (21, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x178e7_57_regions :: state_pred where
  \<open>P_0x178e7_57_regions \<sigma> \<equiv> \<exists>regions. P_0x178e7_57_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(19,20)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(19,20), (20,19)}))
\<close>

definition Q_0x178ef_57 :: state_pred where
  \<open>Q_0x178ef_57 \<sigma> \<equiv> RIP \<sigma> = 0x178ef \<and> RAX \<sigma> = bdrv_write_0x178cc_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = ucast (((ucast (((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))::32 word))::32 word) >> 9)) \<and> RDX \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0x0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x178d1\<close>
declare Q_0x178ef_57_def[Qs]

schematic_goal nbd_trip_0_3_0x178e7_0x178ec_57[blocks]:
  assumes \<open>(P_0x178e7_57 && P_0x178e7_57_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x178ec 57 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x178ef_57 ?\<sigma> \<and> block_usage P_0x178e7_57_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x178e7_57_def P_0x178e7_57_regions_def post: Q_0x178ef_57_def regionset: P_0x178e7_57_regions_set_def)

definition P_0x178ef_58 :: state_pred where
  \<open>P_0x178ef_58 \<sigma> \<equiv> RIP \<sigma> = 0x178ef \<and> RAX \<sigma> = bdrv_write_0x178cc_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = ucast (((ucast (((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))::32 word))::32 word) >> 9)) \<and> RDX \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0x0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x178d1\<close>
declare P_0x178ef_58_def[Ps]

definition P_0x178ef_58_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x178ef_58_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x6c), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x88), Suc 0),
    (20, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (21, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x178ef_58_regions :: state_pred where
  \<open>P_0x178ef_58_regions \<sigma> \<equiv> \<exists>regions. P_0x178ef_58_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(19,20)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(19,20), (20,19)}))
\<close>

definition Q_nbd_send_reply_isra_0_addr_0x178ef_58 :: state_pred where
  \<open>Q_nbd_send_reply_isra_0_addr_0x178ef_58 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x90) \<and> RIP \<sigma> = nbd_send_reply_isra_0_addr \<and> RAX \<sigma> = bdrv_write_0x178cc_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = ucast (((ucast (((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))::32 word))::32 word) >> 9)) \<and> RDX \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = 0x0 \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0x0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x178f4\<close>
declare Q_nbd_send_reply_isra_0_addr_0x178ef_58_def[Qs]

schematic_goal nbd_trip_0_1_0x178ef_0x178ef_58[blocks]:
  assumes \<open>(P_0x178ef_58 && P_0x178ef_58_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x178ef 58 \<sigma> \<triangleq> ?\<sigma> \<and> Q_nbd_send_reply_isra_0_addr_0x178ef_58 ?\<sigma> \<and> block_usage P_0x178ef_58_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x178ef_58_def P_0x178ef_58_regions_def post: Q_nbd_send_reply_isra_0_addr_0x178ef_58_def regionset: P_0x178ef_58_regions_set_def)

definition P_0x178f4_59 :: state_pred where
  \<open>P_0x178f4_59 \<sigma> \<equiv> RIP \<sigma> = 0x178f4 \<and> RAX \<sigma> = nbd_send_reply_isra_0_0x178ef_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = ucast (((ucast (((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))::32 word))::32 word) >> 9)) \<and> RDX \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0x0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x6c),4]::32 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x78),8]::64 word) = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x80),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x178f4\<close>
declare P_0x178f4_59_def[Ps]

definition P_0x178f4_59_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x178f4_59_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x6c), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x78), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x80), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x88), Suc 0),
    (20, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (21, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x178f4_59_regions :: state_pred where
  \<open>P_0x178f4_59_regions \<sigma> \<equiv> \<exists>regions. P_0x178f4_59_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(19,20)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(19,20), (20,19)}))
\<close>

definition Q_0x17842_59 :: state_pred where
  \<open>Q_0x17842_59 \<sigma> \<equiv> RIP \<sigma> = 0x17842 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x17842_59_def[Qs]

schematic_goal nbd_trip_0_4_0x178f4_0x178fe_59[blocks]:
  assumes \<open>(P_0x178f4_59 && P_0x178f4_59_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x178fe 59 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17842_59 ?\<sigma> \<and> block_usage P_0x178f4_59_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x178f4_59_def P_0x178f4_59_regions_def post: Q_0x17842_59_def regionset: P_0x178f4_59_regions_set_def)

definition P_0x177e5_false_60 :: state_pred where
  \<open>P_0x177e5_false_60 \<sigma> \<equiv> RIP \<sigma> = 0x177e5 \<and> RAX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)::32 word))::32 word)))) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e\<close>
declare P_0x177e5_false_60_def[Ps]

definition P_0x177e5_false_60_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x177e5_false_60_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x177e5_false_60_regions :: state_pred where
  \<open>P_0x177e5_false_60_regions \<sigma> \<equiv> \<exists>regions. P_0x177e5_false_60_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x177ed_60 :: state_pred where
  \<open>Q_0x177ed_60 \<sigma> \<equiv> RIP \<sigma> = 0x177ed \<and> RAX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)::32 word))::32 word)))) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e\<close>
declare Q_0x177ed_60_def[Qs]

schematic_goal nbd_trip_0_2_0x177e5_0x177eb_60[blocks]:
  assumes \<open>(P_0x177e5_false_60 && P_0x177e5_false_60_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x177eb 60 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x177ed_60 ?\<sigma> \<and> block_usage P_0x177e5_false_60_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x177e5_false_60_def P_0x177e5_false_60_regions_def post: Q_0x177ed_60_def regionset: P_0x177e5_false_60_regions_set_def)

definition P_0x177ed_true_61 :: state_pred where
  \<open>P_0x177ed_true_61 \<sigma> \<equiv> RIP \<sigma> = 0x177ed \<and> RAX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)::32 word))::32 word)))) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e\<close>
declare P_0x177ed_true_61_def[Ps]

definition P_0x177ed_true_61_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x177ed_true_61_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x88), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x177ed_true_61_regions :: state_pred where
  \<open>P_0x177ed_true_61_regions \<sigma> \<equiv> \<exists>regions. P_0x177ed_true_61_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {(16,17)}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {(16,17), (17,16)}))
\<close>

definition Q_0x179e8_61 :: state_pred where
  \<open>Q_0x179e8_61 \<sigma> \<equiv> RIP \<sigma> = 0x179e8 \<and> RAX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)::32 word))::32 word)))) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = ucast (((ucast (((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))::32 word))::32 word) >> 9)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((((RCX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word)))::64 word) * 0x1)::64 word))::64 word))::64 word) >> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e\<close>
declare Q_0x179e8_61_def[Qs]

schematic_goal nbd_trip_0_8_0x177ed_0x179e4_61[blocks]:
  assumes \<open>(P_0x177ed_true_61 && P_0x177ed_true_61_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 8 0x179e4 61 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x179e8_61 ?\<sigma> \<and> block_usage P_0x177ed_true_61_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x177ed_true_61_def P_0x177ed_true_61_regions_def post: Q_0x179e8_61_def regionset: P_0x177ed_true_61_regions_set_def)

definition P_0x179e8_62 :: state_pred where
  \<open>P_0x179e8_62 \<sigma> \<equiv> RIP \<sigma> = 0x179e8 \<and> RAX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)::32 word))::32 word)))) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = ucast (((ucast (((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))::32 word))::32 word) >> 9)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((((RCX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word)))::64 word) * 0x1)::64 word))::64 word))::64 word) >> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e\<close>
declare P_0x179e8_62_def[Ps]

definition P_0x179e8_62_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x179e8_62_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x88), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x179e8_62_regions :: state_pred where
  \<open>P_0x179e8_62_regions \<sigma> \<equiv> \<exists>regions. P_0x179e8_62_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_read_addr_0x179e8_62 :: state_pred where
  \<open>Q_bdrv_read_addr_0x179e8_62 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x90) \<and> RIP \<sigma> = bdrv_read_addr \<and> RAX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)::32 word))::32 word)))) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = ucast (((ucast (((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))::32 word))::32 word) >> 9)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((((RCX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word)))::64 word) * 0x1)::64 word))::64 word))::64 word) >> 9) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x179ed\<close>
declare Q_bdrv_read_addr_0x179e8_62_def[Qs]

schematic_goal nbd_trip_0_1_0x179e8_0x179e8_62[blocks]:
  assumes \<open>(P_0x179e8_62 && P_0x179e8_62_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x179e8 62 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_read_addr_0x179e8_62 ?\<sigma> \<and> block_usage P_0x179e8_62_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x179e8_62_def P_0x179e8_62_regions_def post: Q_bdrv_read_addr_0x179e8_62_def regionset: P_0x179e8_62_regions_set_def)

definition P_0x179ed_63 :: state_pred where
  \<open>P_0x179ed_63 \<sigma> \<equiv> RIP \<sigma> = 0x179ed \<and> RAX \<sigma> = bdrv_read_0x179e8_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = ucast (((ucast (((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))::32 word))::32 word) >> 9)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((((RCX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word)))::64 word) * 0x1)::64 word))::64 word))::64 word) >> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x179ed\<close>
declare P_0x179ed_63_def[Ps]

definition P_0x179ed_63_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x179ed_63_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x88), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x179ed_63_regions :: state_pred where
  \<open>P_0x179ed_63_regions \<sigma> \<equiv> \<exists>regions. P_0x179ed_63_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x179f7_63 :: state_pred where
  \<open>Q_0x179f7_63 \<sigma> \<equiv> RIP \<sigma> = 0x179f7 \<and> RAX \<sigma> = bdrv_read_0x179e8_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = ucast (((ucast (((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))::32 word))::32 word) >> 9)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((((RCX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word)))::64 word) * 0x1)::64 word))::64 word))::64 word) >> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>bdrv_read_0x179e8_retval::32 word)) \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x179ed\<close>
declare Q_0x179f7_63_def[Qs]

schematic_goal nbd_trip_0_3_0x179ed_0x179f4_63[blocks]:
  assumes \<open>(P_0x179ed_63 && P_0x179ed_63_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x179f4 63 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x179f7_63 ?\<sigma> \<and> block_usage P_0x179ed_63_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x179ed_63_def P_0x179ed_63_regions_def post: Q_0x179f7_63_def regionset: P_0x179ed_63_regions_set_def)

definition P_0x179f7_true_64 :: state_pred where
  \<open>P_0x179f7_true_64 \<sigma> \<equiv> RIP \<sigma> = 0x179f7 \<and> RAX \<sigma> = bdrv_read_0x179e8_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = ucast (((ucast (((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))::32 word))::32 word) >> 9)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((((RCX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word)))::64 word) * 0x1)::64 word))::64 word))::64 word) >> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>bdrv_read_0x179e8_retval::32 word)) \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x179ed\<close>
declare P_0x179f7_true_64_def[Ps]

definition P_0x179f7_true_64_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x179f7_true_64_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x88), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x179f7_true_64_regions :: state_pred where
  \<open>P_0x179f7_true_64_regions \<sigma> \<equiv> \<exists>regions. P_0x179f7_true_64_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17aab_64 :: state_pred where
  \<open>Q_0x17aab_64 \<sigma> \<equiv> RIP \<sigma> = 0x17aab \<and> RAX \<sigma> = bdrv_read_0x179e8_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x217f0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((((RCX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word)))::64 word) * 0x1)::64 word))::64 word))::64 word) >> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>bdrv_read_0x179e8_retval::32 word)) \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x259 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x179ed\<close>
declare Q_0x17aab_64_def[Qs]

schematic_goal nbd_trip_0_5_0x179f7_0x17aa4_64[blocks]:
  assumes \<open>(P_0x179f7_true_64 && P_0x179f7_true_64_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 5 0x17aa4 64 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17aab_64 ?\<sigma> \<and> block_usage P_0x179f7_true_64_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x179f7_true_64_def P_0x179f7_true_64_regions_def post: Q_0x17aab_64_def regionset: P_0x179f7_true_64_regions_set_def)

definition P_0x17aab_65 :: state_pred where
  \<open>P_0x17aab_65 \<sigma> \<equiv> RIP \<sigma> = 0x17aab \<and> RAX \<sigma> = bdrv_read_0x179e8_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x217f0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((((RCX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word)))::64 word) * 0x1)::64 word))::64 word))::64 word) >> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>bdrv_read_0x179e8_retval::32 word)) \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x259 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x179ed\<close>
declare P_0x17aab_65_def[Ps]

definition P_0x17aab_65_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17aab_65_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x88), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x17aab_65_regions :: state_pred where
  \<open>P_0x17aab_65_regions \<sigma> \<equiv> \<exists>regions. P_0x17aab_65_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17ab9_65 :: state_pred where
  \<open>Q_0x17ab9_65 \<sigma> \<equiv> RIP \<sigma> = 0x17ab9 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x217f0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>bdrv_read_0x179e8_retval::32 word)) \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x259 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x179ed\<close>
declare Q_0x17ab9_65_def[Qs]

schematic_goal nbd_trip_0_3_0x17aab_0x17ab7_65[blocks]:
  assumes \<open>(P_0x17aab_65 && P_0x17aab_65_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x17ab7 65 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17ab9_65 ?\<sigma> \<and> block_usage P_0x17aab_65_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17aab_65_def P_0x17aab_65_regions_def post: Q_0x17ab9_65_def regionset: P_0x17aab_65_regions_set_def)

definition P_0x17ab9_66 :: state_pred where
  \<open>P_0x17ab9_66 \<sigma> \<equiv> RIP \<sigma> = 0x17ab9 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x217f0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>bdrv_read_0x179e8_retval::32 word)) \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x259 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x179ed\<close>
declare P_0x17ab9_66_def[Ps]

definition P_0x17ab9_66_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17ab9_66_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x88), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x17ab9_66_regions :: state_pred where
  \<open>P_0x17ab9_66_regions \<sigma> \<equiv> \<exists>regions. P_0x17ab9_66_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_fprintf_chk_addr_0x17ab9_66 :: state_pred where
  \<open>Q_fprintf_chk_addr_0x17ab9_66 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x90) \<and> RIP \<sigma> = fprintf_chk_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x217f0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>bdrv_read_0x179e8_retval::32 word)) \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x259 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x17abe\<close>
declare Q_fprintf_chk_addr_0x17ab9_66_def[Qs]

schematic_goal nbd_trip_0_1_0x17ab9_0x17ab9_66[blocks]:
  assumes \<open>(P_0x17ab9_66 && P_0x17ab9_66_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x17ab9 66 \<sigma> \<triangleq> ?\<sigma> \<and> Q_fprintf_chk_addr_0x17ab9_66 ?\<sigma> \<and> block_usage P_0x17ab9_66_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17ab9_66_def P_0x17ab9_66_regions_def post: Q_fprintf_chk_addr_0x17ab9_66_def regionset: P_0x17ab9_66_regions_set_def)

definition P_0x17abe_67 :: state_pred where
  \<open>P_0x17abe_67 \<sigma> \<equiv> RIP \<sigma> = 0x17abe \<and> RAX \<sigma> = fprintf_chk_0x17ab9_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x217f0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>bdrv_read_0x179e8_retval::32 word)) \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x259 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x17abe\<close>
declare P_0x17abe_67_def[Ps]

definition P_0x17abe_67_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17abe_67_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x88), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x17abe_67_regions :: state_pred where
  \<open>P_0x17abe_67_regions \<sigma> \<equiv> \<exists>regions. P_0x17abe_67_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_errno_location_addr_0x17abe_67 :: state_pred where
  \<open>Q_errno_location_addr_0x17abe_67 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x90) \<and> RIP \<sigma> = errno_location_addr \<and> RAX \<sigma> = fprintf_chk_0x17ab9_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x217f0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>bdrv_read_0x179e8_retval::32 word)) \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x259 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x17ac3\<close>
declare Q_errno_location_addr_0x17abe_67_def[Qs]

schematic_goal nbd_trip_0_1_0x17abe_0x17abe_67[blocks]:
  assumes \<open>(P_0x17abe_67 && P_0x17abe_67_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x17abe 67 \<sigma> \<triangleq> ?\<sigma> \<and> Q_errno_location_addr_0x17abe_67 ?\<sigma> \<and> block_usage P_0x17abe_67_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17abe_67_def P_0x17abe_67_regions_def post: Q_errno_location_addr_0x17abe_67_def regionset: P_0x17abe_67_regions_set_def)

definition P_0x17ac3_68 :: state_pred where
  \<open>P_0x17ac3_68 \<sigma> \<equiv> RIP \<sigma> = 0x17ac3 \<and> RAX \<sigma> = errno_location_0x17abe_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x217f0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>bdrv_read_0x179e8_retval::32 word)) \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x259 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x17ac3\<close>
declare P_0x17ac3_68_def[Ps]

definition P_0x17ac3_68_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17ac3_68_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x88), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x90), 8),
    (19, errno_location_0x17abe_retval, 4)
  }\<close>

definition P_0x17ac3_68_regions :: state_pred where
  \<open>P_0x17ac3_68_regions \<sigma> \<equiv> \<exists>regions. P_0x17ac3_68_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17842_68 :: state_pred where
  \<open>Q_0x17842_68 \<sigma> \<equiv> RIP \<sigma> = 0x17842 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x17842_68_def[Qs]

schematic_goal nbd_trip_0_2_0x17ac3_0x17ac9_68[blocks]:
  assumes \<open>(P_0x17ac3_68 && P_0x17ac3_68_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x17ac9 68 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17842_68 ?\<sigma> \<and> block_usage P_0x17ac3_68_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17ac3_68_def P_0x17ac3_68_regions_def post: Q_0x17842_68_def regionset: P_0x17ac3_68_regions_set_def)

definition P_0x179f7_false_69 :: state_pred where
  \<open>P_0x179f7_false_69 \<sigma> \<equiv> RIP \<sigma> = 0x179f7 \<and> RAX \<sigma> = bdrv_read_0x179e8_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = ucast (((ucast (((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))::32 word))::32 word) >> 9)) \<and> RDX \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = ((ucast ((((RCX\<^sub>0::64 word) + (\<langle>63,0\<rangle>(((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word)))::64 word) * 0x1)::64 word))::64 word))::64 word) >> 9) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>bdrv_read_0x179e8_retval::32 word)) \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x179ed\<close>
declare P_0x179f7_false_69_def[Ps]

definition P_0x179f7_false_69_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x179f7_false_69_regions_set \<sigma> \<equiv> {
    (0, R8\<^sub>0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x88), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x179f7_false_69_regions :: state_pred where
  \<open>P_0x179f7_false_69_regions \<sigma> \<equiv> \<exists>regions. P_0x179f7_false_69_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17a0b_69 :: state_pred where
  \<open>Q_0x17a0b_69 \<sigma> \<equiv> RIP \<sigma> = 0x17a0b \<and> RAX \<sigma> = bdrv_read_0x179e8_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = ucast (((ucast (((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))::32 word))::32 word) >> 9)) \<and> RDX \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>bdrv_read_0x179e8_retval::32 word)) \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x179ed\<close>
declare Q_0x17a0b_69_def[Qs]

schematic_goal nbd_trip_0_6_0x179f7_0x17a07_69[blocks]:
  assumes \<open>(P_0x179f7_false_69 && P_0x179f7_false_69_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 6 0x17a07 69 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17a0b_69 ?\<sigma> \<and> block_usage P_0x179f7_false_69_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x179f7_false_69_def P_0x179f7_false_69_regions_def post: Q_0x17a0b_69_def regionset: P_0x179f7_false_69_regions_set_def)

definition P_0x17a0b_70 :: state_pred where
  \<open>P_0x17a0b_70 \<sigma> \<equiv> RIP \<sigma> = 0x17a0b \<and> RAX \<sigma> = bdrv_read_0x179e8_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = ucast (((ucast (((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))::32 word))::32 word) >> 9)) \<and> RDX \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>bdrv_read_0x179e8_retval::32 word)) \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x179ed\<close>
declare P_0x17a0b_70_def[Ps]

definition P_0x17a0b_70_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17a0b_70_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x88), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x17a0b_70_regions :: state_pred where
  \<open>P_0x17a0b_70_regions \<sigma> \<equiv> \<exists>regions. P_0x17a0b_70_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_nbd_send_reply_isra_0_addr_0x17a0b_70 :: state_pred where
  \<open>Q_nbd_send_reply_isra_0_addr_0x17a0b_70 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x90) \<and> RIP \<sigma> = nbd_send_reply_isra_0_addr \<and> RAX \<sigma> = bdrv_read_0x179e8_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = ucast (((ucast (((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))::32 word))::32 word) >> 9)) \<and> RDX \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = 0x0 \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>bdrv_read_0x179e8_retval::32 word)) \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x17a10\<close>
declare Q_nbd_send_reply_isra_0_addr_0x17a0b_70_def[Qs]

schematic_goal nbd_trip_0_1_0x17a0b_0x17a0b_70[blocks]:
  assumes \<open>(P_0x17a0b_70 && P_0x17a0b_70_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x17a0b 70 \<sigma> \<triangleq> ?\<sigma> \<and> Q_nbd_send_reply_isra_0_addr_0x17a0b_70 ?\<sigma> \<and> block_usage P_0x17a0b_70_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17a0b_70_def P_0x17a0b_70_regions_def post: Q_nbd_send_reply_isra_0_addr_0x17a0b_70_def regionset: P_0x17a0b_70_regions_set_def)

definition P_0x17a10_71 :: state_pred where
  \<open>P_0x17a10_71 \<sigma> \<equiv> RIP \<sigma> = 0x17a10 \<and> RAX \<sigma> = nbd_send_reply_isra_0_0x17a0b_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = ucast (((ucast (((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))::32 word))::32 word) >> 9)) \<and> RDX \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>bdrv_read_0x179e8_retval::32 word)) \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x17a10\<close>
declare P_0x17a10_71_def[Ps]

definition P_0x17a10_71_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17a10_71_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x88), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x17a10_71_regions :: state_pred where
  \<open>P_0x17a10_71_regions \<sigma> \<equiv> \<exists>regions. P_0x17a10_71_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17a16_71 :: state_pred where
  \<open>Q_0x17a16_71 \<sigma> \<equiv> RIP \<sigma> = 0x17a16 \<and> RAX \<sigma> = nbd_send_reply_isra_0_0x17a0b_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = ucast (((ucast (((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))::32 word))::32 word) >> 9)) \<and> RDX \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>nbd_send_reply_isra_0_0x17a0b_retval::32 word)) \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x17a10\<close>
declare Q_0x17a16_71_def[Qs]

schematic_goal nbd_trip_0_2_0x17a10_0x17a13_71[blocks]:
  assumes \<open>(P_0x17a10_71 && P_0x17a10_71_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x17a13 71 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17a16_71 ?\<sigma> \<and> block_usage P_0x17a10_71_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17a10_71_def P_0x17a10_71_regions_def post: Q_0x17a16_71_def regionset: P_0x17a10_71_regions_set_def)

definition P_0x17a16_true_72 :: state_pred where
  \<open>P_0x17a16_true_72 \<sigma> \<equiv> RIP \<sigma> = 0x17a16 \<and> RAX \<sigma> = nbd_send_reply_isra_0_0x17a0b_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = ucast (((ucast (((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))::32 word))::32 word) >> 9)) \<and> RDX \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>nbd_send_reply_isra_0_0x17a0b_retval::32 word)) \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x17a10\<close>
declare P_0x17a16_true_72_def[Ps]

definition P_0x17a16_true_72_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17a16_true_72_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x88), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x17a16_true_72_regions :: state_pred where
  \<open>P_0x17a16_true_72_regions \<sigma> \<equiv> \<exists>regions. P_0x17a16_true_72_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17842_72 :: state_pred where
  \<open>Q_0x17842_72 \<sigma> \<equiv> RIP \<sigma> = 0x17842 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x17842_72_def[Qs]

schematic_goal nbd_trip_0_1_0x17a16_0x17a16_72[blocks]:
  assumes \<open>(P_0x17a16_true_72 && P_0x17a16_true_72_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x17a16 72 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17842_72 ?\<sigma> \<and> block_usage P_0x17a16_true_72_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17a16_true_72_def P_0x17a16_true_72_regions_def post: Q_0x17842_72_def regionset: P_0x17a16_true_72_regions_set_def)

definition P_0x17a16_false_73 :: state_pred where
  \<open>P_0x17a16_false_73 \<sigma> \<equiv> RIP \<sigma> = 0x17a16 \<and> RAX \<sigma> = nbd_send_reply_isra_0_0x17a0b_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = ucast (((ucast (((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))::32 word))::32 word) >> 9)) \<and> RDX \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = ucast ((\<langle>31,0\<rangle>nbd_send_reply_isra_0_0x17a0b_retval::32 word)) \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x17a10\<close>
declare P_0x17a16_false_73_def[Ps]

definition P_0x17a16_false_73_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17a16_false_73_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x88), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x17a16_false_73_regions :: state_pred where
  \<open>P_0x17a16_false_73_regions \<sigma> \<equiv> \<exists>regions. P_0x17a16_false_73_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17a2d_73 :: state_pred where
  \<open>Q_0x17a2d_73 \<sigma> \<equiv> RIP \<sigma> = 0x17a2d \<and> RAX \<sigma> = nbd_send_reply_isra_0_0x17a0b_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0x0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x17a10\<close>
declare Q_0x17a2d_73_def[Qs]

schematic_goal nbd_trip_0_7_0x17a16_0x17a2a_73[blocks]:
  assumes \<open>(P_0x17a16_false_73 && P_0x17a16_false_73_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 7 0x17a2a 73 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17a2d_73 ?\<sigma> \<and> block_usage P_0x17a16_false_73_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17a16_false_73_def P_0x17a16_false_73_regions_def post: Q_0x17a2d_73_def regionset: P_0x17a16_false_73_regions_set_def)

definition P_0x17a2d_74 :: state_pred where
  \<open>P_0x17a2d_74 \<sigma> \<equiv> RIP \<sigma> = 0x17a2d \<and> RAX \<sigma> = nbd_send_reply_isra_0_0x17a0b_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0x0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x17a10\<close>
declare P_0x17a2d_74_def[Ps]

definition P_0x17a2d_74_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17a2d_74_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x88), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x17a2d_74_regions :: state_pred where
  \<open>P_0x17a2d_74_regions \<sigma> \<equiv> \<exists>regions. P_0x17a2d_74_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_nbd_wr_sync_addr_0x17a2d_74 :: state_pred where
  \<open>Q_nbd_wr_sync_addr_0x17a2d_74 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x90) \<and> RIP \<sigma> = nbd_wr_sync_addr \<and> RAX \<sigma> = nbd_send_reply_isra_0_0x17a0b_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0x0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x17a32\<close>
declare Q_nbd_wr_sync_addr_0x17a2d_74_def[Qs]

schematic_goal nbd_trip_0_1_0x17a2d_0x17a2d_74[blocks]:
  assumes \<open>(P_0x17a2d_74 && P_0x17a2d_74_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x17a2d 74 \<sigma> \<triangleq> ?\<sigma> \<and> Q_nbd_wr_sync_addr_0x17a2d_74 ?\<sigma> \<and> block_usage P_0x17a2d_74_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17a2d_74_def P_0x17a2d_74_regions_def post: Q_nbd_wr_sync_addr_0x17a2d_74_def regionset: P_0x17a2d_74_regions_set_def)

definition P_0x17a32_75 :: state_pred where
  \<open>P_0x17a32_75 \<sigma> \<equiv> RIP \<sigma> = 0x17a32 \<and> RAX \<sigma> = nbd_wr_sync_0x17a2d_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0x0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x17a32\<close>
declare P_0x17a32_75_def[Ps]

definition P_0x17a32_75_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17a32_75_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x88), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x17a32_75_regions :: state_pred where
  \<open>P_0x17a32_75_regions \<sigma> \<equiv> \<exists>regions. P_0x17a32_75_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17a39_75 :: state_pred where
  \<open>Q_0x17a39_75 \<sigma> \<equiv> RIP \<sigma> = 0x17a39 \<and> RAX \<sigma> = nbd_wr_sync_0x17a2d_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0x0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x17a32\<close>
declare Q_0x17a39_75_def[Qs]

schematic_goal nbd_trip_0_2_0x17a32_0x17a36_75[blocks]:
  assumes \<open>(P_0x17a32_75 && P_0x17a32_75_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x17a36 75 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17a39_75 ?\<sigma> \<and> block_usage P_0x17a32_75_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17a32_75_def P_0x17a32_75_regions_def post: Q_0x17a39_75_def regionset: P_0x17a32_75_regions_set_def)

definition P_0x17a39_true_76 :: state_pred where
  \<open>P_0x17a39_true_76 \<sigma> \<equiv> RIP \<sigma> = 0x17a39 \<and> RAX \<sigma> = nbd_wr_sync_0x17a2d_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0x0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x17a32\<close>
declare P_0x17a39_true_76_def[Ps]

definition P_0x17a39_true_76_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17a39_true_76_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x88), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x17a39_true_76_regions :: state_pred where
  \<open>P_0x17a39_true_76_regions \<sigma> \<equiv> \<exists>regions. P_0x17a39_true_76_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17842_76 :: state_pred where
  \<open>Q_0x17842_76 \<sigma> \<equiv> RIP \<sigma> = 0x17842 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x17842_76_def[Qs]

schematic_goal nbd_trip_0_1_0x17a39_0x17a39_76[blocks]:
  assumes \<open>(P_0x17a39_true_76 && P_0x17a39_true_76_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x17a39 76 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17842_76 ?\<sigma> \<and> block_usage P_0x17a39_true_76_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17a39_true_76_def P_0x17a39_true_76_regions_def post: Q_0x17842_76_def regionset: P_0x17a39_true_76_regions_set_def)

definition P_0x17a39_false_77 :: state_pred where
  \<open>P_0x17a39_false_77 \<sigma> \<equiv> RIP \<sigma> = 0x17a39 \<and> RAX \<sigma> = nbd_wr_sync_0x17a2d_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0x0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x17a32\<close>
declare P_0x17a39_false_77_def[Ps]

definition P_0x17a39_false_77_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17a39_false_77_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x88), 8),
    (17, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x17a39_false_77_regions :: state_pred where
  \<open>P_0x17a39_false_77_regions \<sigma> \<equiv> \<exists>regions. P_0x17a39_false_77_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1798c_77 :: state_pred where
  \<open>Q_0x1798c_77 \<sigma> \<equiv> RIP \<sigma> = 0x1798c \<and> RAX \<sigma> = nbd_wr_sync_0x17a2d_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x215a0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0x0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x267 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x17a32\<close>
declare Q_0x1798c_77_def[Qs]

schematic_goal nbd_trip_0_6_0x17a39_0x17a5a_77[blocks]:
  assumes \<open>(P_0x17a39_false_77 && P_0x17a39_false_77_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 6 0x17a5a 77 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1798c_77 ?\<sigma> \<and> block_usage P_0x17a39_false_77_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17a39_false_77_def P_0x17a39_false_77_regions_def post: Q_0x1798c_77_def regionset: P_0x17a39_false_77_regions_set_def)

definition P_0x1798c_78 :: state_pred where
  \<open>P_0x1798c_78 \<sigma> \<equiv> RIP \<sigma> = 0x1798c \<and> RAX \<sigma> = nbd_wr_sync_0x17a2d_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x215a0 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0x0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x267 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x17a32\<close>
declare P_0x1798c_78_def[Ps]

definition P_0x1798c_78_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1798c_78_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x88), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x1798c_78_regions :: state_pred where
  \<open>P_0x1798c_78_regions \<sigma> \<equiv> \<exists>regions. P_0x1798c_78_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x179a0_78 :: state_pred where
  \<open>Q_0x179a0_78 \<sigma> \<equiv> RIP \<sigma> = 0x179a0 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x215a0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x267 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x17a32\<close>
declare Q_0x179a0_78_def[Qs]

schematic_goal nbd_trip_0_4_0x1798c_0x1799a_78[blocks]:
  assumes \<open>(P_0x1798c_78 && P_0x1798c_78_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x1799a 78 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x179a0_78 ?\<sigma> \<and> block_usage P_0x1798c_78_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1798c_78_def P_0x1798c_78_regions_def post: Q_0x179a0_78_def regionset: P_0x1798c_78_regions_set_def)

definition P_0x179a0_79 :: state_pred where
  \<open>P_0x179a0_79 \<sigma> \<equiv> RIP \<sigma> = 0x179a0 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x215a0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x267 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x17a32\<close>
declare P_0x179a0_79_def[Ps]

definition P_0x179a0_79_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x179a0_79_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x88), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x179a0_79_regions :: state_pred where
  \<open>P_0x179a0_79_regions \<sigma> \<equiv> \<exists>regions. P_0x179a0_79_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_fprintf_chk_addr_0x179a0_79 :: state_pred where
  \<open>Q_fprintf_chk_addr_0x179a0_79 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x90) \<and> RIP \<sigma> = fprintf_chk_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x215a0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x267 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x179a5\<close>
declare Q_fprintf_chk_addr_0x179a0_79_def[Qs]

schematic_goal nbd_trip_0_1_0x179a0_0x179a0_79[blocks]:
  assumes \<open>(P_0x179a0_79 && P_0x179a0_79_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x179a0 79 \<sigma> \<triangleq> ?\<sigma> \<and> Q_fprintf_chk_addr_0x179a0_79 ?\<sigma> \<and> block_usage P_0x179a0_79_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x179a0_79_def P_0x179a0_79_regions_def post: Q_fprintf_chk_addr_0x179a0_79_def regionset: P_0x179a0_79_regions_set_def)

definition P_0x179a5_80 :: state_pred where
  \<open>P_0x179a5_80 \<sigma> \<equiv> RIP \<sigma> = 0x179a5 \<and> RAX \<sigma> = fprintf_chk_0x179a0_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x215a0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x267 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x179a5\<close>
declare P_0x179a5_80_def[Ps]

definition P_0x179a5_80_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x179a5_80_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x88), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x179a5_80_regions :: state_pred where
  \<open>P_0x179a5_80_regions \<sigma> \<equiv> \<exists>regions. P_0x179a5_80_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_errno_location_addr_0x179a5_80 :: state_pred where
  \<open>Q_errno_location_addr_0x179a5_80 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x90) \<and> RIP \<sigma> = errno_location_addr \<and> RAX \<sigma> = fprintf_chk_0x179a0_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x215a0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x267 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x179aa\<close>
declare Q_errno_location_addr_0x179a5_80_def[Qs]

schematic_goal nbd_trip_0_1_0x179a5_0x179a5_80[blocks]:
  assumes \<open>(P_0x179a5_80 && P_0x179a5_80_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x179a5 80 \<sigma> \<triangleq> ?\<sigma> \<and> Q_errno_location_addr_0x179a5_80 ?\<sigma> \<and> block_usage P_0x179a5_80_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x179a5_80_def P_0x179a5_80_regions_def post: Q_errno_location_addr_0x179a5_80_def regionset: P_0x179a5_80_regions_set_def)

definition P_0x179aa_81 :: state_pred where
  \<open>P_0x179aa_81 \<sigma> \<equiv> RIP \<sigma> = 0x179aa \<and> RAX \<sigma> = errno_location_0x179a5_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x215a0 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x267 \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x179aa\<close>
declare P_0x179aa_81_def[Ps]

definition P_0x179aa_81_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x179aa_81_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x88), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x90), 8),
    (19, errno_location_0x179a5_retval, 4)
  }\<close>

definition P_0x179aa_81_regions :: state_pred where
  \<open>P_0x179aa_81_regions \<sigma> \<equiv> \<exists>regions. P_0x179aa_81_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17842_81 :: state_pred where
  \<open>Q_0x17842_81 \<sigma> \<equiv> RIP \<sigma> = 0x17842 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x17842_81_def[Qs]

schematic_goal nbd_trip_0_2_0x179aa_0x179b0_81[blocks]:
  assumes \<open>(P_0x179aa_81 && P_0x179aa_81_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x179b0 81 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17842_81 ?\<sigma> \<and> block_usage P_0x179aa_81_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x179aa_81_def P_0x179aa_81_regions_def post: Q_0x17842_81_def regionset: P_0x179aa_81_regions_set_def)

definition P_0x177ed_false_82 :: state_pred where
  \<open>P_0x177ed_false_82 \<sigma> \<equiv> RIP \<sigma> = 0x177ed \<and> RAX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)::32 word))::32 word)))) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e\<close>
declare P_0x177ed_false_82_def[Ps]

definition P_0x177ed_false_82_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x177ed_false_82_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x177ed_false_82_regions :: state_pred where
  \<open>P_0x177ed_false_82_regions \<sigma> \<equiv> \<exists>regions. P_0x177ed_false_82_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x177f6_82 :: state_pred where
  \<open>Q_0x177f6_82 \<sigma> \<equiv> RIP \<sigma> = 0x177f6 \<and> RAX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)::32 word))::32 word)))) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e\<close>
declare Q_0x177f6_82_def[Qs]

schematic_goal nbd_trip_0_2_0x177ed_0x177f3_82[blocks]:
  assumes \<open>(P_0x177ed_false_82 && P_0x177ed_false_82_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x177f3 82 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x177f6_82 ?\<sigma> \<and> block_usage P_0x177ed_false_82_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x177ed_false_82_def P_0x177ed_false_82_regions_def post: Q_0x177f6_82_def regionset: P_0x177ed_false_82_regions_set_def)

definition P_0x177f6_true_83 :: state_pred where
  \<open>P_0x177f6_true_83 \<sigma> \<equiv> RIP \<sigma> = 0x177f6 \<and> RAX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)::32 word))::32 word)))) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e\<close>
declare P_0x177f6_true_83_def[Ps]

definition P_0x177f6_true_83_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x177f6_true_83_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x177f6_true_83_regions :: state_pred where
  \<open>P_0x177f6_true_83_regions \<sigma> \<equiv> \<exists>regions. P_0x177f6_true_83_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x179b8_83 :: state_pred where
  \<open>Q_0x179b8_83 \<sigma> \<equiv> RIP \<sigma> = 0x179b8 \<and> RAX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)::32 word))::32 word)))) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e\<close>
declare Q_0x179b8_83_def[Qs]

schematic_goal nbd_trip_0_1_0x177f6_0x177f6_83[blocks]:
  assumes \<open>(P_0x177f6_true_83 && P_0x177f6_true_83_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x177f6 83 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x179b8_83 ?\<sigma> \<and> block_usage P_0x177f6_true_83_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x177f6_true_83_def P_0x177f6_true_83_regions_def post: Q_0x179b8_83_def regionset: P_0x177f6_true_83_regions_set_def)

definition P_0x179b8_84 :: state_pred where
  \<open>P_0x179b8_84 \<sigma> \<equiv> RIP \<sigma> = 0x179b8 \<and> RAX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)::32 word))::32 word)))) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e\<close>
declare P_0x179b8_84_def[Ps]

definition P_0x179b8_84_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x179b8_84_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x179b8_84_regions :: state_pred where
  \<open>P_0x179b8_84_regions \<sigma> \<equiv> \<exists>regions. P_0x179b8_84_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_errno_location_addr_0x179b8_84 :: state_pred where
  \<open>Q_errno_location_addr_0x179b8_84 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x90) \<and> RIP \<sigma> = errno_location_addr \<and> RAX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)::32 word))::32 word)))) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x179bd\<close>
declare Q_errno_location_addr_0x179b8_84_def[Qs]

schematic_goal nbd_trip_0_1_0x179b8_0x179b8_84[blocks]:
  assumes \<open>(P_0x179b8_84 && P_0x179b8_84_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x179b8 84 \<sigma> \<triangleq> ?\<sigma> \<and> Q_errno_location_addr_0x179b8_84 ?\<sigma> \<and> block_usage P_0x179b8_84_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x179b8_84_def P_0x179b8_84_regions_def post: Q_errno_location_addr_0x179b8_84_def regionset: P_0x179b8_84_regions_set_def)

definition P_0x179bd_85 :: state_pred where
  \<open>P_0x179bd_85 \<sigma> \<equiv> RIP \<sigma> = 0x179bd \<and> RAX \<sigma> = errno_location_0x179b8_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x179bd\<close>
declare P_0x179bd_85_def[Ps]

definition P_0x179bd_85_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x179bd_85_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x90), 8),
    (18, errno_location_0x179b8_retval, 4)
  }\<close>

definition P_0x179bd_85_regions :: state_pred where
  \<open>P_0x179bd_85_regions \<sigma> \<equiv> \<exists>regions. P_0x179bd_85_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17842_85 :: state_pred where
  \<open>Q_0x17842_85 \<sigma> \<equiv> RIP \<sigma> = 0x17842 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x17842_85_def[Qs]

schematic_goal nbd_trip_0_3_0x179bd_0x179c9_85[blocks]:
  assumes \<open>(P_0x179bd_85 && P_0x179bd_85_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x179c9 85 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17842_85 ?\<sigma> \<and> block_usage P_0x179bd_85_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x179bd_85_def P_0x179bd_85_regions_def post: Q_0x17842_85_def regionset: P_0x179bd_85_regions_set_def)

definition P_0x177f6_false_86 :: state_pred where
  \<open>P_0x177f6_false_86 \<sigma> \<equiv> RIP \<sigma> = 0x177f6 \<and> RAX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)::32 word))::32 word)))) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word)::64 word))::64 word))) \<and> R8 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e\<close>
declare P_0x177f6_false_86_def[Ps]

definition P_0x177f6_false_86_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x177f6_false_86_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (12, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (15, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x90), 8),
    (18, ((RSP\<^sub>0::64 word) - 0x98), 8)
  }\<close>

definition P_0x177f6_false_86_regions :: state_pred where
  \<open>P_0x177f6_false_86_regions \<sigma> \<equiv> \<exists>regions. P_0x177f6_false_86_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1781c_86 :: state_pred where
  \<open>Q_0x1781c_86 \<sigma> \<equiv> RIP \<sigma> = 0x1781c \<and> RAX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)::32 word))::32 word)))) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x21870 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x98) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x28f \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)::32 word))::32 word))))\<close>
declare Q_0x1781c_86_def[Qs]

schematic_goal nbd_trip_0_7_0x177f6_0x17815_86[blocks]:
  assumes \<open>(P_0x177f6_false_86 && P_0x177f6_false_86_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 7 0x17815 86 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1781c_86 ?\<sigma> \<and> block_usage P_0x177f6_false_86_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x177f6_false_86_def P_0x177f6_false_86_regions_def post: Q_0x1781c_86_def regionset: P_0x177f6_false_86_regions_set_def)

definition P_0x1781c_87 :: state_pred where
  \<open>P_0x1781c_87 \<sigma> \<equiv> RIP \<sigma> = 0x1781c \<and> RAX \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)::32 word))::32 word)))) \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x21870 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x68) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x98) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = RCX\<^sub>0 \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x28f \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)::32 word))::32 word))))\<close>
declare P_0x1781c_87_def[Ps]

definition P_0x1781c_87_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1781c_87_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x90), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x98), 8)
  }\<close>

definition P_0x1781c_87_regions :: state_pred where
  \<open>P_0x1781c_87_regions \<sigma> \<equiv> \<exists>regions. P_0x1781c_87_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17830_87 :: state_pred where
  \<open>Q_0x17830_87 \<sigma> \<equiv> RIP \<sigma> = 0x17830 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x21870 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x98) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x28f \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)::32 word))::32 word))))\<close>
declare Q_0x17830_87_def[Qs]

schematic_goal nbd_trip_0_4_0x1781c_0x1782a_87[blocks]:
  assumes \<open>(P_0x1781c_87 && P_0x1781c_87_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x1782a 87 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17830_87 ?\<sigma> \<and> block_usage P_0x1781c_87_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1781c_87_def P_0x1781c_87_regions_def post: Q_0x17830_87_def regionset: P_0x1781c_87_regions_set_def)

definition P_0x17830_88 :: state_pred where
  \<open>P_0x17830_88 \<sigma> \<equiv> RIP \<sigma> = 0x17830 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x21870 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x98) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x28f \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)::32 word))::32 word))))\<close>
declare P_0x17830_88_def[Ps]

definition P_0x17830_88_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17830_88_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x90), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x98), 8),
    (20, ((RSP\<^sub>0::64 word) - 0xa0), 8)
  }\<close>

definition P_0x17830_88_regions :: state_pred where
  \<open>P_0x17830_88_regions \<sigma> \<equiv> \<exists>regions. P_0x17830_88_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_fprintf_chk_addr_0x17830_88 :: state_pred where
  \<open>Q_fprintf_chk_addr_0x17830_88 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa0) \<and> RIP \<sigma> = fprintf_chk_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x21870 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x28f \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = 0x17835\<close>
declare Q_fprintf_chk_addr_0x17830_88_def[Qs]

schematic_goal nbd_trip_0_1_0x17830_0x17830_88[blocks]:
  assumes \<open>(P_0x17830_88 && P_0x17830_88_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x17830 88 \<sigma> \<triangleq> ?\<sigma> \<and> Q_fprintf_chk_addr_0x17830_88 ?\<sigma> \<and> block_usage P_0x17830_88_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17830_88_def P_0x17830_88_regions_def post: Q_fprintf_chk_addr_0x17830_88_def regionset: P_0x17830_88_regions_set_def)

definition P_0x17835_89 :: state_pred where
  \<open>P_0x17835_89 \<sigma> \<equiv> RIP \<sigma> = 0x17835 \<and> RAX \<sigma> = fprintf_chk_0x17830_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x21870 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x98) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x28f \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = 0x17835\<close>
declare P_0x17835_89_def[Ps]

definition P_0x17835_89_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17835_89_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x90), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x98), 8),
    (20, ((RSP\<^sub>0::64 word) - 0xa0), 8)
  }\<close>

definition P_0x17835_89_regions :: state_pred where
  \<open>P_0x17835_89_regions \<sigma> \<equiv> \<exists>regions. P_0x17835_89_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_errno_location_addr_0x17835_89 :: state_pred where
  \<open>Q_errno_location_addr_0x17835_89 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa0) \<and> RIP \<sigma> = errno_location_addr \<and> RAX \<sigma> = fprintf_chk_0x17830_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x21870 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x28f \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = 0x1783a\<close>
declare Q_errno_location_addr_0x17835_89_def[Qs]

schematic_goal nbd_trip_0_1_0x17835_0x17835_89[blocks]:
  assumes \<open>(P_0x17835_89 && P_0x17835_89_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x17835 89 \<sigma> \<triangleq> ?\<sigma> \<and> Q_errno_location_addr_0x17835_89 ?\<sigma> \<and> block_usage P_0x17835_89_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17835_89_def P_0x17835_89_regions_def post: Q_errno_location_addr_0x17835_89_def regionset: P_0x17835_89_regions_set_def)

definition P_0x1783a_90 :: state_pred where
  \<open>P_0x1783a_90 \<sigma> \<equiv> RIP \<sigma> = 0x1783a \<and> RAX \<sigma> = errno_location_0x17835_retval \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RCX \<sigma> = 0x21563 \<and> RDX \<sigma> = 0x21870 \<and> RDI \<sigma> = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> RSI \<sigma> = 0x1 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x98) \<and> RBP \<sigma> = (bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word)::64 word))::64 word))) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> R12 \<sigma> = 0xffffffff \<and> R10 \<sigma> = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)::32 word))::32 word)))) \<and> R9 \<sigma> = 0x28f \<and> R8 \<sigma> = 0x218d8 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a300,8]::64 word) = (\<sigma> \<turnstile> *[0x2a300,8]::64 word) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x10),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x50),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x58),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x68),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x88),4]::32 word) = ucast ((\<langle>31,0\<rangle>R9\<^sub>0::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x90),8]::64 word) = 0x1777e \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x98),8]::64 word) = ucast ((bswap ((ucast (((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x64),4]::32 word)::32 word))::32 word)))) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa0),8]::64 word) = 0x1783a\<close>
declare P_0x1783a_90_def[Ps]

definition P_0x1783a_90_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1783a_90_regions_set \<sigma> \<equiv> {
    (0, 0x2a300, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) + 0x10), 4),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x50), 4),
    (13, ((RSP\<^sub>0::64 word) - 0x58), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x60), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x64), 4),
    (16, ((RSP\<^sub>0::64 word) - 0x68), 4),
    (17, ((RSP\<^sub>0::64 word) - 0x88), 4),
    (18, ((RSP\<^sub>0::64 word) - 0x90), 8),
    (19, ((RSP\<^sub>0::64 word) - 0x98), 8),
    (20, ((RSP\<^sub>0::64 word) - 0xa0), 8),
    (21, errno_location_0x17835_retval, 4)
  }\<close>

definition P_0x1783a_90_regions :: state_pred where
  \<open>P_0x1783a_90_regions \<sigma> \<equiv> \<exists>regions. P_0x1783a_90_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17842_90 :: state_pred where
  \<open>Q_0x17842_90 \<sigma> \<equiv> RIP \<sigma> = 0x17842 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x17842_90_def[Qs]

schematic_goal nbd_trip_0_3_0x1783a_0x17841_90[blocks]:
  assumes \<open>(P_0x1783a_90 && P_0x1783a_90_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x17841 90 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17842_90 ?\<sigma> \<and> block_usage P_0x1783a_90_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1783a_90_def P_0x1783a_90_regions_def post: Q_0x17842_90_def regionset: P_0x1783a_90_regions_set_def)

definition P_0x17842_91 :: state_pred where
  \<open>P_0x17842_91 \<sigma> \<equiv> RIP \<sigma> = 0x17842 \<and> RBX \<sigma> = ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word)) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x17842_91_def[Ps]

definition P_0x17842_91_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17842_91_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x17842_91_regions :: state_pred where
  \<open>P_0x17842_91_regions \<sigma> \<equiv> \<exists>regions. P_0x17842_91_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17853_91 :: state_pred where
  \<open>Q_0x17853_91 \<sigma> \<equiv> RIP \<sigma> = 0x17853 \<and> RAX \<sigma> = ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word)) \<and> RBX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x17853_91_def[Qs]

schematic_goal nbd_trip_0_3_0x17842_0x17850_91[blocks]:
  assumes \<open>(P_0x17842_91 && P_0x17842_91_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x17850 91 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17853_91 ?\<sigma> \<and> block_usage P_0x17842_91_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17842_91_def P_0x17842_91_regions_def post: Q_0x17853_91_def regionset: P_0x17842_91_regions_set_def)

definition P_0x17853_true_92 :: state_pred where
  \<open>P_0x17853_true_92 \<sigma> \<equiv> RIP \<sigma> = 0x17853 \<and> RAX \<sigma> = ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word)) \<and> RBX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x17853_true_92_def[Ps]

definition P_0x17853_true_92_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17853_true_92_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x17853_true_92_regions :: state_pred where
  \<open>P_0x17853_true_92_regions \<sigma> \<equiv> \<exists>regions. P_0x17853_true_92_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x17b33_92 :: state_pred where
  \<open>Q_0x17b33_92 \<sigma> \<equiv> RIP \<sigma> = 0x17b33 \<and> RAX \<sigma> = ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word)) \<and> RBX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x17b33_92_def[Qs]

schematic_goal nbd_trip_0_1_0x17853_0x17853_92[blocks]:
  assumes \<open>(P_0x17853_true_92 && P_0x17853_true_92_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x17853 92 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x17b33_92 ?\<sigma> \<and> block_usage P_0x17853_true_92_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17853_true_92_def P_0x17853_true_92_regions_def post: Q_0x17b33_92_def regionset: P_0x17853_true_92_regions_set_def)

definition P_0x17b33_93 :: state_pred where
  \<open>P_0x17b33_93 \<sigma> \<equiv> RIP \<sigma> = 0x17b33 \<and> RAX \<sigma> = ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word)) \<and> RBX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x17b33_93_def[Ps]

definition P_0x17b33_93_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17b33_93_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x90), 8)
  }\<close>

definition P_0x17b33_93_regions :: state_pred where
  \<open>P_0x17b33_93_regions \<sigma> \<equiv> \<exists>regions. P_0x17b33_93_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_stack_chk_fail_addr_0x17b33_93 :: state_pred where
  \<open>Q_stack_chk_fail_addr_0x17b33_93 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x90) \<and> RIP \<sigma> = stack_chk_fail_addr \<and> RAX \<sigma> = ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word)) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_stack_chk_fail_addr_0x17b33_93_def[Qs]

schematic_goal nbd_trip_0_1_0x17b33_0x17b33_93[blocks]:
  assumes \<open>(P_0x17b33_93 && P_0x17b33_93_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x17b33 93 \<sigma> \<triangleq> ?\<sigma> \<and> Q_stack_chk_fail_addr_0x17b33_93 ?\<sigma> \<and> block_usage P_0x17b33_93_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17b33_93_def P_0x17b33_93_regions_def post: Q_stack_chk_fail_addr_0x17b33_93_def regionset: P_0x17b33_93_regions_set_def)

definition P_0x17853_false_94 :: state_pred where
  \<open>P_0x17853_false_94 \<sigma> \<equiv> RIP \<sigma> = 0x17853 \<and> RAX \<sigma> = ucast ((\<langle>31,0\<rangle>R12 \<sigma>::32 word)) \<and> RBX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x88) \<and> R15 \<sigma> = RDI\<^sub>0 \<and> R14 \<sigma> = R8\<^sub>0 \<and> R13 \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x17853_false_94_def[Ps]

definition P_0x17853_false_94_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x17853_false_94_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) + 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x40), 8)
  }\<close>

definition P_0x17853_false_94_regions :: state_pred where
  \<open>P_0x17853_false_94_regions \<sigma> \<equiv> \<exists>regions. P_0x17853_false_94_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_94 :: state_pred where
  \<open>Q_ret_address_94 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) + 0x8),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R15\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x40),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_ret_address_94_def[Qs]

schematic_goal nbd_trip_0_9_0x17853_0x17867_94[blocks]:
  assumes \<open>(P_0x17853_false_94 && P_0x17853_false_94_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 9 0x17867 94 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_94 ?\<sigma> \<and> block_usage P_0x17853_false_94_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x17853_false_94_def P_0x17853_false_94_regions_def post: Q_ret_address_94_def regionset: P_0x17853_false_94_regions_set_def)

definition nbd_trip_acode :: ACode where
  \<open>nbd_trip_acode =
    Block 21 0x17777 0;
    Block (Suc 0) 0x17779 (Suc 0);
    CALL nbd_wr_sync_acode;
    Block (Suc 0) 0x1777e 2;
    IF !ZF THEN
      Block 6 0x17ae9 3;
      Block 4 0x1799a 4;
      Block (Suc 0) 0x179a0 5;
      CALL fprintf_chk_acode;
      Block (Suc 0) 0x179a5 6;
      CALL errno_location_acode;
      Block 2 0x179b0 7
    ELSE
      Block 9 0x177a4 8;
      IF !ZF THEN
        Block 8 0x17b0e 9;
        Block 4 0x1782a 10;
        Block (Suc 0) 0x17830 11;
        CALL fprintf_chk_acode;
        Block (Suc 0) 0x17835 12;
        CALL errno_location_acode;
        Block 3 0x17841 13
      ELSE
        Block 2 0x177af 14;
        IF CF THEN
          Block 9 0x1792d 15;
          Block 4 0x1782a 16;
          Block (Suc 0) 0x17830 17;
          CALL fprintf_chk_acode;
          Block (Suc 0) 0x17835 18;
          CALL errno_location_acode;
          Block 3 0x17841 19
        ELSE
          Block 5 0x177c6 20;
          IF CF THEN
            Block 6 0x17b53 21;
            Block 4 0x1799a 22;
            Block (Suc 0) 0x179a0 23;
            CALL fprintf_chk_acode;
            Block (Suc 0) 0x179a5 24;
            CALL errno_location_acode;
            Block 2 0x179b0 25
          ELSE
            Block 2 0x177cf 26;
            IF ja THEN
              Block 12 0x17962 27;
              Block (Suc 0) 0x17968 28;
              CALL fprintf_chk_acode;
              Block 5 0x17985 29;
              Block 4 0x1799a 30;
              Block (Suc 0) 0x179a0 31;
              CALL fprintf_chk_acode;
              Block (Suc 0) 0x179a5 32;
              CALL errno_location_acode;
              Block 2 0x179b0 33
            ELSE
              Block 6 0x177e2 34;
              IF ZF THEN
                Block 8 0x17887 35;
                Block (Suc 0) 0x1788c 36;
                CALL nbd_wr_sync_acode;
                Block 4 0x178a0 37;
                IF !ZF THEN
                  Block 6 0x17a8b 38;
                  Block 4 0x1799a 39;
                  Block (Suc 0) 0x179a0 40;
                  CALL fprintf_chk_acode;
                  Block (Suc 0) 0x179a5 41;
                  CALL errno_location_acode;
                  Block 2 0x179b0 42
                ELSE
                  Block 3 0x178ad 43;
                  IF !ZF THEN
                    Block 3 0x17a65 44;
                    Block 3 0x178ec 45;
                    Block (Suc 0) 0x178ef 46;
                    CALL nbd_send_reply_isra_0_acode;
                    Block 4 0x178fe 47
                  ELSE
                    Block 7 0x178c8 48;
                    Block (Suc 0) 0x178cc 49;
                    CALL bdrv_write_acode;
                    Block 3 0x178d9 50;
                    IF ZF THEN
                      Block 6 0x17b2e 51;
                      Block 3 0x17ab7 52;
                      Block (Suc 0) 0x17ab9 53;
                      CALL fprintf_chk_acode;
                      Block (Suc 0) 0x17abe 54;
                      CALL errno_location_acode;
                      Block 2 0x17ac9 55
                    ELSE
                      Block 3 0x178e5 56;
                      Block 3 0x178ec 57;
                      Block (Suc 0) 0x178ef 58;
                      CALL nbd_send_reply_isra_0_acode;
                      Block 4 0x178fe 59
                    FI
                  FI
                FI
              ELSE
                Block 2 0x177eb 60;
                IF ZF THEN
                  Block 8 0x179e4 61;
                  Block (Suc 0) 0x179e8 62;
                  CALL bdrv_read_acode;
                  Block 3 0x179f4 63;
                  IF ZF THEN
                    Block 5 0x17aa4 64;
                    Block 3 0x17ab7 65;
                    Block (Suc 0) 0x17ab9 66;
                    CALL fprintf_chk_acode;
                    Block (Suc 0) 0x17abe 67;
                    CALL errno_location_acode;
                    Block 2 0x17ac9 68
                  ELSE
                    Block 6 0x17a07 69;
                    Block (Suc 0) 0x17a0b 70;
                    CALL nbd_send_reply_isra_0_acode;
                    Block 2 0x17a13 71;
                    IF ZF THEN
                      Block (Suc 0) 0x17a16 72
                    ELSE
                      Block 7 0x17a2a 73;
                      Block (Suc 0) 0x17a2d 74;
                      CALL nbd_wr_sync_acode;
                      Block 2 0x17a36 75;
                      IF ZF THEN
                        Block (Suc 0) 0x17a39 76
                      ELSE
                        Block 6 0x17a5a 77;
                        Block 4 0x1799a 78;
                        Block (Suc 0) 0x179a0 79;
                        CALL fprintf_chk_acode;
                        Block (Suc 0) 0x179a5 80;
                        CALL errno_location_acode;
                        Block 2 0x179b0 81
                      FI
                    FI
                  FI
                ELSE
                  Block 2 0x177f3 82;
                  IF ZF THEN
                    Block (Suc 0) 0x177f6 83;
                    Block (Suc 0) 0x179b8 84;
                    CALL errno_location_acode;
                    Block 3 0x179c9 85
                  ELSE
                    Block 7 0x17815 86;
                    Block 4 0x1782a 87;
                    Block (Suc 0) 0x17830 88;
                    CALL fprintf_chk_acode;
                    Block (Suc 0) 0x17835 89;
                    CALL errno_location_acode;
                    Block 3 0x17841 90
                  FI
                FI
              FI
            FI
          FI
        FI
      FI
    FI;
    Block 3 0x17850 91;
    IF !ZF THEN
      Block (Suc 0) 0x17853 92;
      Block (Suc 0) 0x17b33 93;
      CALL stack_chk_fail_acode
    ELSE
      Block 9 0x17867 94
    FI
  \<close>

schematic_goal "nbd_trip":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17779 \<longrightarrow> P_0x17779_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1777e \<longrightarrow> P_0x1777e_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17782 \<longrightarrow> P_0x17782_true_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1798c \<longrightarrow> P_0x1798c_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x179a0 \<longrightarrow> P_0x179a0_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x179a5 \<longrightarrow> P_0x179a5_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x179aa \<longrightarrow> P_0x179aa_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17782 \<longrightarrow> P_0x17782_false_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x177a9 \<longrightarrow> P_0x177a9_true_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1781c \<longrightarrow> P_0x1781c_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17830 \<longrightarrow> P_0x17830_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17835 \<longrightarrow> P_0x17835_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1783a \<longrightarrow> P_0x1783a_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x177a9 \<longrightarrow> P_0x177a9_false_14_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x177b7 \<longrightarrow> P_0x177b7_true_15_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1781c \<longrightarrow> P_0x1781c_16_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17830 \<longrightarrow> P_0x17830_17_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17835 \<longrightarrow> P_0x17835_18_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1783a \<longrightarrow> P_0x1783a_19_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x177b7 \<longrightarrow> P_0x177b7_false_20_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x177c9 \<longrightarrow> P_0x177c9_true_21_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1798c \<longrightarrow> P_0x1798c_22_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x179a0 \<longrightarrow> P_0x179a0_23_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x179a5 \<longrightarrow> P_0x179a5_24_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x179aa \<longrightarrow> P_0x179aa_25_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x177c9 \<longrightarrow> P_0x177c9_false_26_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x177d2 \<longrightarrow> P_0x177d2_true_27_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17968 \<longrightarrow> P_0x17968_28_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1796d \<longrightarrow> P_0x1796d_29_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1798c \<longrightarrow> P_0x1798c_30_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x179a0 \<longrightarrow> P_0x179a0_31_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x179a5 \<longrightarrow> P_0x179a5_32_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x179aa \<longrightarrow> P_0x179aa_33_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x177d2 \<longrightarrow> P_0x177d2_false_34_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x177e5 \<longrightarrow> P_0x177e5_true_35_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1788c \<longrightarrow> P_0x1788c_36_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17891 \<longrightarrow> P_0x17891_37_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x178a3 \<longrightarrow> P_0x178a3_true_38_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1798c \<longrightarrow> P_0x1798c_39_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x179a0 \<longrightarrow> P_0x179a0_40_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x179a5 \<longrightarrow> P_0x179a5_41_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x179aa \<longrightarrow> P_0x179aa_42_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x178a3 \<longrightarrow> P_0x178a3_false_43_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x178b2 \<longrightarrow> P_0x178b2_true_44_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x178e7 \<longrightarrow> P_0x178e7_45_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x178ef \<longrightarrow> P_0x178ef_46_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x178f4 \<longrightarrow> P_0x178f4_47_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x178b2 \<longrightarrow> P_0x178b2_false_48_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x178cc \<longrightarrow> P_0x178cc_49_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x178d1 \<longrightarrow> P_0x178d1_50_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x178dc \<longrightarrow> P_0x178dc_true_51_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17aab \<longrightarrow> P_0x17aab_52_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17ab9 \<longrightarrow> P_0x17ab9_53_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17abe \<longrightarrow> P_0x17abe_54_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17ac3 \<longrightarrow> P_0x17ac3_55_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x178dc \<longrightarrow> P_0x178dc_false_56_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x178e7 \<longrightarrow> P_0x178e7_57_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x178ef \<longrightarrow> P_0x178ef_58_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x178f4 \<longrightarrow> P_0x178f4_59_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x177e5 \<longrightarrow> P_0x177e5_false_60_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x177ed \<longrightarrow> P_0x177ed_true_61_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x179e8 \<longrightarrow> P_0x179e8_62_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x179ed \<longrightarrow> P_0x179ed_63_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x179f7 \<longrightarrow> P_0x179f7_true_64_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17aab \<longrightarrow> P_0x17aab_65_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17ab9 \<longrightarrow> P_0x17ab9_66_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17abe \<longrightarrow> P_0x17abe_67_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17ac3 \<longrightarrow> P_0x17ac3_68_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x179f7 \<longrightarrow> P_0x179f7_false_69_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17a0b \<longrightarrow> P_0x17a0b_70_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17a10 \<longrightarrow> P_0x17a10_71_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17a16 \<longrightarrow> P_0x17a16_true_72_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17a16 \<longrightarrow> P_0x17a16_false_73_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17a2d \<longrightarrow> P_0x17a2d_74_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17a32 \<longrightarrow> P_0x17a32_75_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17a39 \<longrightarrow> P_0x17a39_true_76_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17a39 \<longrightarrow> P_0x17a39_false_77_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1798c \<longrightarrow> P_0x1798c_78_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x179a0 \<longrightarrow> P_0x179a0_79_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x179a5 \<longrightarrow> P_0x179a5_80_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x179aa \<longrightarrow> P_0x179aa_81_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x177ed \<longrightarrow> P_0x177ed_false_82_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x177f6 \<longrightarrow> P_0x177f6_true_83_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x179b8 \<longrightarrow> P_0x179b8_84_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x179bd \<longrightarrow> P_0x179bd_85_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x177f6 \<longrightarrow> P_0x177f6_false_86_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1781c \<longrightarrow> P_0x1781c_87_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17830 \<longrightarrow> P_0x17830_88_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17835 \<longrightarrow> P_0x17835_89_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1783a \<longrightarrow> P_0x1783a_90_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17842 \<longrightarrow> P_0x17842_91_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17853 \<longrightarrow> P_0x17853_true_92_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17b33 \<longrightarrow> P_0x17b33_93_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x17853 \<longrightarrow> P_0x17853_false_94_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_nbd_wr_sync_addr_0x17779_1}} \<box>nbd_wr_sync_acode {{P_0x1777e_2;M_0x17779}}\<close>
    and [blocks]: \<open>{{Q_fprintf_chk_addr_0x179a0_5}} \<box>fprintf_chk_acode {{P_0x179a5_6;M_0x179a0}}\<close>
    and [blocks]: \<open>{{Q_errno_location_addr_0x179a5_6}} \<box>errno_location_acode {{P_0x179aa_7;M_0x179a5}}\<close>
    and [blocks]: \<open>{{Q_fprintf_chk_addr_0x17830_11}} \<box>fprintf_chk_acode {{P_0x17835_12;M_0x17830}}\<close>
    and [blocks]: \<open>{{Q_errno_location_addr_0x17835_12}} \<box>errno_location_acode {{P_0x1783a_13;M_0x17835}}\<close>
    and [blocks]: \<open>{{Q_fprintf_chk_addr_0x17830_17}} \<box>fprintf_chk_acode {{P_0x17835_18;M_0x17830}}\<close>
    and [blocks]: \<open>{{Q_errno_location_addr_0x17835_18}} \<box>errno_location_acode {{P_0x1783a_19;M_0x17835}}\<close>
    and [blocks]: \<open>{{Q_fprintf_chk_addr_0x179a0_23}} \<box>fprintf_chk_acode {{P_0x179a5_24;M_0x179a0}}\<close>
    and [blocks]: \<open>{{Q_errno_location_addr_0x179a5_24}} \<box>errno_location_acode {{P_0x179aa_25;M_0x179a5}}\<close>
    and [blocks]: \<open>{{Q_fprintf_chk_addr_0x17968_28}} \<box>fprintf_chk_acode {{P_0x1796d_29;M_0x17968}}\<close>
    and [blocks]: \<open>{{Q_fprintf_chk_addr_0x179a0_31}} \<box>fprintf_chk_acode {{P_0x179a5_32;M_0x179a0}}\<close>
    and [blocks]: \<open>{{Q_errno_location_addr_0x179a5_32}} \<box>errno_location_acode {{P_0x179aa_33;M_0x179a5}}\<close>
    and [blocks]: \<open>{{Q_nbd_wr_sync_addr_0x1788c_36}} \<box>nbd_wr_sync_acode {{P_0x17891_37;M_0x1788c}}\<close>
    and [blocks]: \<open>{{Q_fprintf_chk_addr_0x179a0_40}} \<box>fprintf_chk_acode {{P_0x179a5_41;M_0x179a0}}\<close>
    and [blocks]: \<open>{{Q_errno_location_addr_0x179a5_41}} \<box>errno_location_acode {{P_0x179aa_42;M_0x179a5}}\<close>
    and [blocks]: \<open>{{Q_nbd_send_reply_isra_0_addr_0x178ef_46}} \<box>nbd_send_reply_isra_0_acode {{P_0x178f4_47;M_0x178ef}}\<close>
    and [blocks]: \<open>{{Q_bdrv_write_addr_0x178cc_49}} \<box>bdrv_write_acode {{P_0x178d1_50;M_0x178cc}}\<close>
    and [blocks]: \<open>{{Q_fprintf_chk_addr_0x17ab9_53}} \<box>fprintf_chk_acode {{P_0x17abe_54;M_0x17ab9}}\<close>
    and [blocks]: \<open>{{Q_errno_location_addr_0x17abe_54}} \<box>errno_location_acode {{P_0x17ac3_55;M_0x17abe}}\<close>
    and [blocks]: \<open>{{Q_nbd_send_reply_isra_0_addr_0x178ef_58}} \<box>nbd_send_reply_isra_0_acode {{P_0x178f4_59;M_0x178ef}}\<close>
    and [blocks]: \<open>{{Q_bdrv_read_addr_0x179e8_62}} \<box>bdrv_read_acode {{P_0x179ed_63;M_0x179e8}}\<close>
    and [blocks]: \<open>{{Q_fprintf_chk_addr_0x17ab9_66}} \<box>fprintf_chk_acode {{P_0x17abe_67;M_0x17ab9}}\<close>
    and [blocks]: \<open>{{Q_errno_location_addr_0x17abe_67}} \<box>errno_location_acode {{P_0x17ac3_68;M_0x17abe}}\<close>
    and [blocks]: \<open>{{Q_nbd_send_reply_isra_0_addr_0x17a0b_70}} \<box>nbd_send_reply_isra_0_acode {{P_0x17a10_71;M_0x17a0b}}\<close>
    and [blocks]: \<open>{{Q_nbd_wr_sync_addr_0x17a2d_74}} \<box>nbd_wr_sync_acode {{P_0x17a32_75;M_0x17a2d}}\<close>
    and [blocks]: \<open>{{Q_fprintf_chk_addr_0x179a0_79}} \<box>fprintf_chk_acode {{P_0x179a5_80;M_0x179a0}}\<close>
    and [blocks]: \<open>{{Q_errno_location_addr_0x179a5_80}} \<box>errno_location_acode {{P_0x179aa_81;M_0x179a5}}\<close>
    and [blocks]: \<open>{{Q_errno_location_addr_0x179b8_84}} \<box>errno_location_acode {{P_0x179bd_85;M_0x179b8}}\<close>
    and [blocks]: \<open>{{Q_fprintf_chk_addr_0x17830_88}} \<box>fprintf_chk_acode {{P_0x17835_89;M_0x17830}}\<close>
    and [blocks]: \<open>{{Q_errno_location_addr_0x17835_89}} \<box>errno_location_acode {{P_0x1783a_90;M_0x17835}}\<close>
    and [blocks]: \<open>{{Q_stack_chk_fail_addr_0x17b33_93}} \<box>stack_chk_fail_acode {{Q_fail;M_0x17b33}}\<close>
  shows \<open>{{?P}} nbd_trip_acode {{?Q;?M}}\<close>
  by (vcg acode: nbd_trip_acode_def assms: assms)

end
