theory bdrv_snapshot_dump
  imports
    "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes localtime_r_0x19eb4_retval\<^sub>v strftime_0x19ed3_retval\<^sub>v snprintf_chk_0x19fb6_retval\<^sub>v get_human_readable_size_0x19fcf_retval\<^sub>v snprintf_chk_0x19fff_retval\<^sub>v stack_chk_fail_0x1a061_retval\<^sub>v snprintf_chk_addr stack_chk_fail_addr get_human_readable_size_addr localtime_r_addr strftime_addr :: \<open>64 word\<close>
    and snprintf_chk_acode stack_chk_fail_acode get_human_readable_size_acode localtime_r_acode strftime_acode :: ACode
  assumes fetch:
    "fetch 0x19e60 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x19e62 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x19e64 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x19e66 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r12)) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x19e69 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x19e6a \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rbp)) (Storage (Reg (General ThirtyTwo rsi))), 3)"
    "fetch 0x19e6d \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x19e6e \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 480)), 7)"
    "fetch 0x19e75 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x19e7e \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 472)))) (Storage (Reg (General SixtyFour rax))), 8)"
    "fetch 0x19e86 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x19e88 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x19e8b \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 106552)), 6)"
    "fetch 0x19e91 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r14)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 16)))), 5)"
    "fetch 0x19e96 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8)))), 5)"
    "fetch 0x19e9b \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x19e9e \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rdx)) (A_WordConstant 388))))), 6)"
    "fetch 0x19ea4 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r14))), 3)"
    "fetch 0x19ea7 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r13)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 208)))), 8)"
    "fetch 0x19eaf \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8)))) (Storage (Reg (General SixtyFour rax))), 5)"
    "fetch 0x19eb4 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''localtime_r'')), 5)"
    "fetch 0x19eb9 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour r14))), 3)"
    "fetch 0x19ebc \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 128)), 5)"
    "fetch 0x19ec1 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x19ec4 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 31647)))), 7)"
    "fetch 0x19ecb \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r14)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 336)))), 8)"
    "fetch 0x19ed3 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''strftime'')), 5)"
    "fetch 0x19ed8 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 400))))), 7)"
    "fetch 0x19edf \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x19ee3 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r9)) (Immediate SixtyFour (ImmVal 19342813113834067)), 10)"
    "fetch 0x19eed \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 31624)))), 7)"
    "fetch 0x19ef4 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0x19ef7 \<equiv> (Binary (IS_8088 Shr) (Reg (General SixtyFour rdx)) (Immediate SixtyFour (ImmVal 9)), 4)"
    "fetch 0x19efb \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x19efe \<equiv> (Unary (IS_8088 Mul) (Storage (Reg (General SixtyFour r9))), 3)"
    "fetch 0x19f01 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r9)) (Immediate SixtyFour (ImmVal 655884233731895169)), 10)"
    "fetch 0x19f0b \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x19f0e \<equiv> (Binary (IS_8088 Shr) (Reg (General SixtyFour rdx)) (Immediate SixtyFour (ImmVal 15)), 4)"
    "fetch 0x19f12 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x19f15 \<equiv> (Binary (IS_8088 Shr) (Reg (General SixtyFour rsi)) (Immediate SixtyFour (ImmVal 11)), 4)"
    "fetch 0x19f19 \<equiv> (Unary (IS_8088 Mul) (Storage (Reg (General SixtyFour r9))), 3)"
    "fetch 0x19f1c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0x19f1f \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Immediate SixtyFour (ImmVal 2361183241434822607)), 10)"
    "fetch 0x19f29 \<equiv> (Binary (IS_8088 Shr) (Reg (General SixtyFour rdx)) (Immediate SixtyFour (ImmVal 3)), 4)"
    "fetch 0x19f2d \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r9)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x19f30 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Immediate SixtyFour (ImmVal 4835703278458516699)), 10)"
    "fetch 0x19f3a \<equiv> (Unary (IS_8088 Mul) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x19f3d \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x19f40 \<equiv> (Binary (IS_8088 Shr) (Reg (General SixtyFour rdx)) (Immediate SixtyFour (ImmVal 21)), 4)"
    "fetch 0x19f44 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x19f47 \<equiv> (Binary (IS_8088 Shr) (Reg (General SixtyFour rdi)) (Immediate SixtyFour (ImmVal 18)), 4)"
    "fetch 0x19f4b \<equiv> (Unary (IS_8088 Mul) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0x19f4e \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x19f51 \<equiv> (Binary (IS_8088 Shr) (Reg (General SixtyFour rdx)) (Immediate SixtyFour (ImmVal 4)), 4)"
    "fetch 0x19f55 \<equiv> (Ternary (IS_8088 Imul) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour rdx))) (Immediate SixtyFour (ImmVal 1000)), 7)"
    "fetch 0x19f5c \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0x19f5f \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rdi))), 1)"
    "fetch 0x19f60 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Immediate SixtyFour (ImmVal 9838263505978427529)), 10)"
    "fetch 0x19f6a \<equiv> (Unary (IS_8088 Mul) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x19f6d \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x19f70 \<equiv> (Binary (IS_8088 Shr) (Reg (General SixtyFour rcx)) (Immediate SixtyFour (ImmVal 5)), 4)"
    "fetch 0x19f74 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0x19f77 \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 4)), 4)"
    "fetch 0x19f7b \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0x19f7e \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 2)), 4)"
    "fetch 0x19f82 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x19f85 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rcx))), 3)"
    "fetch 0x19f88 \<equiv> (Unary (IS_8088 Mul) (Storage (Reg (General SixtyFour rdi))), 3)"
    "fetch 0x19f8b \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rsi))), 1)"
    "fetch 0x19f8c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r14))), 3)"
    "fetch 0x19f8f \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 128)), 5)"
    "fetch 0x19f94 \<equiv> (Binary (IS_8088 Shr) (Reg (General SixtyFour rdx)) (Immediate SixtyFour (ImmVal 5)), 4)"
    "fetch 0x19f98 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x19f9b \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 4)), 4)"
    "fetch 0x19f9f \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rdx))), 3)"
    "fetch 0x19fa2 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x19fa7 \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 2)), 4)"
    "fetch 0x19fab \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x19fae \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x19fb0 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rcx))), 1)"
    "fetch 0x19fb1 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rcx)) (Immediate SixtyFour (ImmVal 128)), 5)"
    "fetch 0x19fb6 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__snprintf_chk'')), 5)"
    "fetch 0x19fbb \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 32)), 4)"
    "fetch 0x19fbf \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 384))))), 6)"
    "fetch 0x19fc5 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 128)), 5)"
    "fetch 0x19fca \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 80)))), 5)"
    "fetch 0x19fcf \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''get_human_readable_size'')), 5)"
    "fetch 0x19fd4 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x19fd6 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r9)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x19fd9 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x19fdb \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rax))), 1)"
    "fetch 0x19fdc \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rbx)) (A_WordConstant 128)))), 7)"
    "fetch 0x19fe3 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rax))), 1)"
    "fetch 0x19fe4 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x19fe6 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r8)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 31309)))), 7)"
    "fetch 0x19fed \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x19ff0 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x19ff3 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Immediate SixtyFour (ImmVal 18446744073709551615)), 7)"
    "fetch 0x19ffa \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x19fff \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__snprintf_chk'')), 5)"
    "fetch 0x1a004 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 32)), 4)"
    "fetch 0x1a008 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x1a00b \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 472))))), 8)"
    "fetch 0x1a013 \<equiv> (Binary (IS_8088 Xor) (Reg (General SixtyFour rbx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x1a01c \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 106593)), 6)"
    "fetch 0x1a022 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 480)), 7)"
    "fetch 0x1a029 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x1a02a \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x1a02b \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x1a02d \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x1a02f \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x1a031 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x1a032 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 6)"
    "fetch 0x1a038 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 31249)))), 7)"
    "fetch 0x1a03f \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r9)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 26468)))), 7)"
    "fetch 0x1a046 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rax))), 1)"
    "fetch 0x1a047 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 31243)))), 7)"
    "fetch 0x1a04e \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rax))), 1)"
    "fetch 0x1a04f \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 31240)))), 7)"
    "fetch 0x1a056 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rax))), 1)"
    "fetch 0x1a057 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 31240)))), 7)"
    "fetch 0x1a05e \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rax))), 1)"
    "fetch 0x1a05f \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 106468)), 2)"
    "fetch 0x1a061 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__stack_chk_fail'')), 5)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and snprintf_chk\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__snprintf_chk'') = snprintf_chk_addr\<close>
    and stack_chk_fail\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__stack_chk_fail'') = stack_chk_fail_addr\<close>
    and get_human_readable_size\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''get_human_readable_size'') = get_human_readable_size_addr\<close>
    and localtime_r\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''localtime_r'') = localtime_r_addr\<close>
    and strftime\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''strftime'') = strftime_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>localtime_r_0x19eb4_retval \<equiv> localtime_r_0x19eb4_retval\<^sub>v\<close>
definition \<open>strftime_0x19ed3_retval \<equiv> strftime_0x19ed3_retval\<^sub>v\<close>
definition \<open>snprintf_chk_0x19fb6_retval \<equiv> snprintf_chk_0x19fb6_retval\<^sub>v\<close>
definition \<open>get_human_readable_size_0x19fcf_retval \<equiv> get_human_readable_size_0x19fcf_retval\<^sub>v\<close>
definition \<open>snprintf_chk_0x19fff_retval \<equiv> snprintf_chk_0x19fff_retval\<^sub>v\<close>
definition \<open>stack_chk_fail_0x1a061_retval \<equiv> stack_chk_fail_0x1a061_retval\<^sub>v\<close>

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

locale "bdrv_snapshot_dump" = "qemu_img_xen" +
  fixes RAX\<^sub>0\<^sub>v RBX\<^sub>0\<^sub>v RCX\<^sub>0\<^sub>v RDX\<^sub>0\<^sub>v RDI\<^sub>0\<^sub>v RSI\<^sub>0\<^sub>v RSP\<^sub>0\<^sub>v RBP\<^sub>0\<^sub>v R14\<^sub>0\<^sub>v R13\<^sub>0\<^sub>v R12\<^sub>0\<^sub>v R9\<^sub>0\<^sub>v R8\<^sub>0\<^sub>v FS\<^sub>0\<^sub>v ret_address\<^sub>v :: \<open>64 word\<close>
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
definition \<open>FS\<^sub>0 \<equiv> FS\<^sub>0\<^sub>v\<close>
definition \<open>ret_address \<equiv> ret_address\<^sub>v\<close>

definition P_0x19e60_0 :: state_pred where
  \<open>P_0x19e60_0 \<sigma> \<equiv> RIP \<sigma> = 0x19e60 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x19e60_0_def[Ps]

definition P_0x19e60_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19e60_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x19e60_0_regions :: state_pred where
  \<open>P_0x19e60_0_regions \<sigma> \<equiv> \<exists>regions. P_0x19e60_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x19e8b_0 :: state_pred where
  \<open>Q_0x19e8b_0 \<sigma> \<equiv> RIP \<sigma> = 0x19e8b \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x208) \<and> RBP \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x19e8b_0_def[Qs]

schematic_goal bdrv_snapshot_dump_0_12_0x19e60_0x19e88_0[blocks]:
  assumes \<open>(P_0x19e60_0 && P_0x19e60_0_regions) \<sigma>\<close>
  shows \<open>exec_block 12 0x19e88 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x19e8b_0 ?\<sigma> \<and> block_usage P_0x19e60_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19e60_0_def P_0x19e60_0_regions_def post: Q_0x19e8b_0_def regionset: P_0x19e60_0_regions_set_def)

definition P_0x19e8b_true_1 :: state_pred where
  \<open>P_0x19e8b_true_1 \<sigma> \<equiv> RIP \<sigma> = 0x19e8b \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x208) \<and> RBP \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x19e8b_true_1_def[Ps]

definition P_0x19e8b_true_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19e8b_true_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x210), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x218), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x220), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x228), 8)
  }\<close>

definition P_0x19e8b_true_1_regions :: state_pred where
  \<open>P_0x19e8b_true_1_regions \<sigma> \<equiv> \<exists>regions. P_0x19e8b_true_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x19fe4_1 :: state_pred where
  \<open>Q_0x19fe4_1 \<sigma> \<equiv> RIP \<sigma> = 0x19fe4 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x228) \<and> RBP \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x19fe4_1_def[Qs]

schematic_goal bdrv_snapshot_dump_0_11_0x19e8b_0x1a05f_1[blocks]:
  assumes \<open>(P_0x19e8b_true_1 && P_0x19e8b_true_1_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 11 0x1a05f (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x19fe4_1 ?\<sigma> \<and> block_usage P_0x19e8b_true_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19e8b_true_1_def P_0x19e8b_true_1_regions_def post: Q_0x19fe4_1_def regionset: P_0x19e8b_true_1_regions_set_def)

definition P_0x19e8b_false_2 :: state_pred where
  \<open>P_0x19e8b_false_2 \<sigma> \<equiv> RIP \<sigma> = 0x19e8b \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x208) \<and> RBP \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x19e8b_false_2_def[Ps]

definition P_0x19e8b_false_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19e8b_false_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDX\<^sub>0::64 word) + 0x184), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x200), 8)
  }\<close>

definition P_0x19e8b_false_2_regions :: state_pred where
  \<open>P_0x19e8b_false_2_regions \<sigma> \<equiv> \<exists>regions. P_0x19e8b_false_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x19eb4_2 :: state_pred where
  \<open>Q_0x19eb4_2 \<sigma> \<equiv> RIP \<sigma> = 0x19eb4 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word)) \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x200) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x1f8) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x208) \<and> RBP \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x1f8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x200),8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word))\<close>
declare Q_0x19eb4_2_def[Qs]

schematic_goal bdrv_snapshot_dump_0_8_0x19e8b_0x19eaf_2[blocks]:
  assumes \<open>(P_0x19e8b_false_2 && P_0x19e8b_false_2_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 8 0x19eaf 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x19eb4_2 ?\<sigma> \<and> block_usage P_0x19e8b_false_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19e8b_false_2_def P_0x19e8b_false_2_regions_def post: Q_0x19eb4_2_def regionset: P_0x19e8b_false_2_regions_set_def)

definition P_0x19eb4_3 :: state_pred where
  \<open>P_0x19eb4_3 \<sigma> \<equiv> RIP \<sigma> = 0x19eb4 \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word)) \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x200) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x1f8) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x208) \<and> RBP \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x1f8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x200),8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word))\<close>
declare P_0x19eb4_3_def[Ps]

definition P_0x19eb4_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19eb4_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDX\<^sub>0::64 word) + 0x184), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x200), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x210), 8)
  }\<close>

definition P_0x19eb4_3_regions :: state_pred where
  \<open>P_0x19eb4_3_regions \<sigma> \<equiv> \<exists>regions. P_0x19eb4_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_localtime_r_addr_0x19eb4_3 :: state_pred where
  \<open>Q_localtime_r_addr_0x19eb4_3 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x210) \<and> RIP \<sigma> = localtime_r_addr \<and> RAX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word)) \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x200) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x1f8) \<and> RBP \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x1f8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x200),8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x210),8]::64 word) = 0x19eb9\<close>
declare Q_localtime_r_addr_0x19eb4_3_def[Qs]

schematic_goal bdrv_snapshot_dump_0_1_0x19eb4_0x19eb4_3[blocks]:
  assumes \<open>(P_0x19eb4_3 && P_0x19eb4_3_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x19eb4 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_localtime_r_addr_0x19eb4_3 ?\<sigma> \<and> block_usage P_0x19eb4_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19eb4_3_def P_0x19eb4_3_regions_def post: Q_localtime_r_addr_0x19eb4_3_def regionset: P_0x19eb4_3_regions_set_def)

definition P_0x19eb9_4 :: state_pred where
  \<open>P_0x19eb9_4 \<sigma> \<equiv> RIP \<sigma> = 0x19eb9 \<and> RAX \<sigma> = localtime_r_0x19eb4_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x200) \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x1f8) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x208) \<and> RBP \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x1f8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x200),8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x210),8]::64 word) = 0x19eb9\<close>
declare P_0x19eb9_4_def[Ps]

definition P_0x19eb9_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19eb9_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDX\<^sub>0::64 word) + 0x184), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x200), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x210), 8)
  }\<close>

definition P_0x19eb9_4_regions :: state_pred where
  \<open>P_0x19eb9_4_regions \<sigma> \<equiv> \<exists>regions. P_0x19eb9_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x19ed3_4 :: state_pred where
  \<open>Q_0x19ed3_4 \<sigma> \<equiv> RIP \<sigma> = 0x19ed3 \<and> RAX \<sigma> = localtime_r_0x19eb4_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x1f8) \<and> RDX \<sigma> = 0x21a6a \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x208) \<and> RBP \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0xb8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x200),8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x210),8]::64 word) = 0x19eb9\<close>
declare Q_0x19ed3_4_def[Qs]

schematic_goal bdrv_snapshot_dump_0_5_0x19eb9_0x19ecb_4[blocks]:
  assumes \<open>(P_0x19eb9_4 && P_0x19eb9_4_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x19ecb 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x19ed3_4 ?\<sigma> \<and> block_usage P_0x19eb9_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19eb9_4_def P_0x19eb9_4_regions_def post: Q_0x19ed3_4_def regionset: P_0x19eb9_4_regions_set_def)

definition P_0x19ed3_5 :: state_pred where
  \<open>P_0x19ed3_5 \<sigma> \<equiv> RIP \<sigma> = 0x19ed3 \<and> RAX \<sigma> = localtime_r_0x19eb4_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x1f8) \<and> RDX \<sigma> = 0x21a6a \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x208) \<and> RBP \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0xb8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x200),8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x210),8]::64 word) = 0x19eb9\<close>
declare P_0x19ed3_5_def[Ps]

definition P_0x19ed3_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19ed3_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDX\<^sub>0::64 word) + 0x184), 4),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x200), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x210), 8)
  }\<close>

definition P_0x19ed3_5_regions :: state_pred where
  \<open>P_0x19ed3_5_regions \<sigma> \<equiv> \<exists>regions. P_0x19ed3_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_strftime_addr_0x19ed3_5 :: state_pred where
  \<open>Q_strftime_addr_0x19ed3_5 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x210) \<and> RIP \<sigma> = strftime_addr \<and> RAX \<sigma> = localtime_r_0x19eb4_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x1f8) \<and> RDX \<sigma> = 0x21a6a \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> RSI \<sigma> = 0x80 \<and> RBP \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0xb8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x200),8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x210),8]::64 word) = 0x19ed8\<close>
declare Q_strftime_addr_0x19ed3_5_def[Qs]

schematic_goal bdrv_snapshot_dump_0_1_0x19ed3_0x19ed3_5[blocks]:
  assumes \<open>(P_0x19ed3_5 && P_0x19ed3_5_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x19ed3 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_strftime_addr_0x19ed3_5 ?\<sigma> \<and> block_usage P_0x19ed3_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19ed3_5_def P_0x19ed3_5_regions_def post: Q_strftime_addr_0x19ed3_5_def regionset: P_0x19ed3_5_regions_set_def)

definition P_0x19ed8_6 :: state_pred where
  \<open>P_0x19ed8_6 \<sigma> \<equiv> RIP \<sigma> = 0x19ed8 \<and> RAX \<sigma> = strftime_0x19ed3_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x1f8) \<and> RDX \<sigma> = 0x21a6a \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x208) \<and> RBP \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0xb8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x200),8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x210),8]::64 word) = 0x19ed8\<close>
declare P_0x19ed8_6_def[Ps]

definition P_0x19ed8_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19ed8_6_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDX\<^sub>0::64 word) + 0x184), 4),
    (3, ((RDX\<^sub>0::64 word) + 0x190), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x200), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x210), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x218), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x220), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x228), 8)
  }\<close>

definition P_0x19ed8_6_regions :: state_pred where
  \<open>P_0x19ed8_6_regions \<sigma> \<equiv> \<exists>regions. P_0x19ed8_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x19fb6_6 :: state_pred where
  \<open>Q_0x19fb6_6 \<sigma> \<equiv> RIP \<sigma> = 0x19fb6 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = 0x80 \<and> RDX \<sigma> = 0x1 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0xb8) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x228) \<and> RBP \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0xb8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = ((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 15)::64 word))::64 word) (ucast ((0x91a2b3c4d5e6f81::64 word))::64 word)) >> 3) \<and> R8 \<sigma> = 0x21a7c \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x200),8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x210),8]::64 word) = 0x19ed8 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x218),8]::64 word) = ((((hi_mul(ucast (((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word)::64 word))::64 word) (ucast ((0x431bde82d7b634db::64 word))::64 word)) >> 18)::64 word) - (\<langle>63,0\<rangle>((((hi_mul(ucast ((((hi_mul(ucast (((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word)::64 word))::64 word) (ucast ((0x431bde82d7b634db::64 word))::64 word)) >> 21)::64 word))::64 word) (ucast ((0x20c49ba5e353f7cf::64 word))::64 word)) >> 4)::64 word) * 0x3e8)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x220),8]::64 word) = ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word) - ((ucast ((((((ucast ((((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5)::64 word))::64 word) << 4)::64 word) - ((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5))::64 word))::64 word) << 2)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x228),8]::64 word) = ((((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5)::64 word) - ((ucast ((((((ucast ((((hi_mul(ucast ((((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5)::64 word))::64 word) << 4)::64 word) - ((hi_mul(ucast ((((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5))::64 word))::64 word) << 2))\<close>
declare Q_0x19fb6_6_def[Qs]

schematic_goal bdrv_snapshot_dump_0_54_0x19ed8_0x19fb1_6[blocks]:
  assumes \<open>(P_0x19ed8_6 && P_0x19ed8_6_regions) \<sigma>\<close>
  shows \<open>exec_block 54 0x19fb1 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x19fb6_6 ?\<sigma> \<and> block_usage P_0x19ed8_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19ed8_6_def P_0x19ed8_6_regions_def post: Q_0x19fb6_6_def regionset: P_0x19ed8_6_regions_set_def)

definition P_0x19fb6_7 :: state_pred where
  \<open>P_0x19fb6_7 \<sigma> \<equiv> RIP \<sigma> = 0x19fb6 \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = 0x80 \<and> RDX \<sigma> = 0x1 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0xb8) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x228) \<and> RBP \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0xb8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = ((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 15)::64 word))::64 word) (ucast ((0x91a2b3c4d5e6f81::64 word))::64 word)) >> 3) \<and> R8 \<sigma> = 0x21a7c \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x200),8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x210),8]::64 word) = 0x19ed8 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x218),8]::64 word) = ((((hi_mul(ucast (((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word)::64 word))::64 word) (ucast ((0x431bde82d7b634db::64 word))::64 word)) >> 18)::64 word) - (\<langle>63,0\<rangle>((((hi_mul(ucast ((((hi_mul(ucast (((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word)::64 word))::64 word) (ucast ((0x431bde82d7b634db::64 word))::64 word)) >> 21)::64 word))::64 word) (ucast ((0x20c49ba5e353f7cf::64 word))::64 word)) >> 4)::64 word) * 0x3e8)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x220),8]::64 word) = ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word) - ((ucast ((((((ucast ((((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5)::64 word))::64 word) << 4)::64 word) - ((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5))::64 word))::64 word) << 2)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x228),8]::64 word) = ((((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5)::64 word) - ((ucast ((((((ucast ((((hi_mul(ucast ((((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5)::64 word))::64 word) << 4)::64 word) - ((hi_mul(ucast ((((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5))::64 word))::64 word) << 2))\<close>
declare P_0x19fb6_7_def[Ps]

definition P_0x19fb6_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19fb6_7_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDX\<^sub>0::64 word) + 0x184), 4),
    (3, ((RDX\<^sub>0::64 word) + 0x190), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x200), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x210), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x218), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x220), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x228), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x230), 8)
  }\<close>

definition P_0x19fb6_7_regions :: state_pred where
  \<open>P_0x19fb6_7_regions \<sigma> \<equiv> \<exists>regions. P_0x19fb6_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_snprintf_chk_addr_0x19fb6_7 :: state_pred where
  \<open>Q_snprintf_chk_addr_0x19fb6_7 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x230) \<and> RIP \<sigma> = snprintf_chk_addr \<and> RAX \<sigma> = 0x0 \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = 0x80 \<and> RDX \<sigma> = 0x1 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0xb8) \<and> RSI \<sigma> = 0x80 \<and> RBP \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0xb8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = ((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 15)::64 word))::64 word) (ucast ((0x91a2b3c4d5e6f81::64 word))::64 word)) >> 3) \<and> R8 \<sigma> = 0x21a7c \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x200),8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x210),8]::64 word) = 0x19ed8 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x218),8]::64 word) = ((((hi_mul(ucast (((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word)::64 word))::64 word) (ucast ((0x431bde82d7b634db::64 word))::64 word)) >> 18)::64 word) - (\<langle>63,0\<rangle>((((hi_mul(ucast ((((hi_mul(ucast (((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word)::64 word))::64 word) (ucast ((0x431bde82d7b634db::64 word))::64 word)) >> 21)::64 word))::64 word) (ucast ((0x20c49ba5e353f7cf::64 word))::64 word)) >> 4)::64 word) * 0x3e8)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x220),8]::64 word) = ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word) - ((ucast ((((((ucast ((((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5)::64 word))::64 word) << 4)::64 word) - ((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5))::64 word))::64 word) << 2)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x228),8]::64 word) = ((((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5)::64 word) - ((ucast ((((((ucast ((((hi_mul(ucast ((((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5)::64 word))::64 word) << 4)::64 word) - ((hi_mul(ucast ((((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5))::64 word))::64 word) << 2)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x230),8]::64 word) = 0x19fbb\<close>
declare Q_snprintf_chk_addr_0x19fb6_7_def[Qs]

schematic_goal bdrv_snapshot_dump_0_1_0x19fb6_0x19fb6_7[blocks]:
  assumes \<open>(P_0x19fb6_7 && P_0x19fb6_7_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x19fb6 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_snprintf_chk_addr_0x19fb6_7 ?\<sigma> \<and> block_usage P_0x19fb6_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19fb6_7_def P_0x19fb6_7_regions_def post: Q_snprintf_chk_addr_0x19fb6_7_def regionset: P_0x19fb6_7_regions_set_def)

definition P_0x19fbb_8 :: state_pred where
  \<open>P_0x19fbb_8 \<sigma> \<equiv> RIP \<sigma> = 0x19fbb \<and> RAX \<sigma> = snprintf_chk_0x19fb6_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = 0x80 \<and> RDX \<sigma> = 0x1 \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0xb8) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x228) \<and> RBP \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0xb8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = ((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 15)::64 word))::64 word) (ucast ((0x91a2b3c4d5e6f81::64 word))::64 word)) >> 3) \<and> R8 \<sigma> = 0x21a7c \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x200),8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x210),8]::64 word) = 0x19ed8 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x218),8]::64 word) = ((((hi_mul(ucast (((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word)::64 word))::64 word) (ucast ((0x431bde82d7b634db::64 word))::64 word)) >> 18)::64 word) - (\<langle>63,0\<rangle>((((hi_mul(ucast ((((hi_mul(ucast (((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word)::64 word))::64 word) (ucast ((0x431bde82d7b634db::64 word))::64 word)) >> 21)::64 word))::64 word) (ucast ((0x20c49ba5e353f7cf::64 word))::64 word)) >> 4)::64 word) * 0x3e8)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x220),8]::64 word) = ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word) - ((ucast ((((((ucast ((((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5)::64 word))::64 word) << 4)::64 word) - ((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5))::64 word))::64 word) << 2)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x228),8]::64 word) = ((((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5)::64 word) - ((ucast ((((((ucast ((((hi_mul(ucast ((((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5)::64 word))::64 word) << 4)::64 word) - ((hi_mul(ucast ((((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5))::64 word))::64 word) << 2)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x230),8]::64 word) = 0x19fbb\<close>
declare P_0x19fbb_8_def[Ps]

definition P_0x19fbb_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19fbb_8_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDX\<^sub>0::64 word) + 0x180), 4),
    (3, ((RDX\<^sub>0::64 word) + 0x184), 4),
    (4, ((RDX\<^sub>0::64 word) + 0x190), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x200), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x210), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x218), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x220), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x228), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x230), 8)
  }\<close>

definition P_0x19fbb_8_regions :: state_pred where
  \<open>P_0x19fbb_8_regions \<sigma> \<equiv> \<exists>regions. P_0x19fbb_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x19fcf_8 :: state_pred where
  \<open>Q_0x19fcf_8 \<sigma> \<equiv> RIP \<sigma> = 0x19fcf \<and> RAX \<sigma> = snprintf_chk_0x19fb6_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = 0x80 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x180),4]::32 word)) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x1b8) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x208) \<and> RBP \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0xb8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = ((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 15)::64 word))::64 word) (ucast ((0x91a2b3c4d5e6f81::64 word))::64 word)) >> 3) \<and> R8 \<sigma> = 0x21a7c \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x180),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x180),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x200),8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x210),8]::64 word) = 0x19ed8 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x218),8]::64 word) = ((((hi_mul(ucast (((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word)::64 word))::64 word) (ucast ((0x431bde82d7b634db::64 word))::64 word)) >> 18)::64 word) - (\<langle>63,0\<rangle>((((hi_mul(ucast ((((hi_mul(ucast (((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word)::64 word))::64 word) (ucast ((0x431bde82d7b634db::64 word))::64 word)) >> 21)::64 word))::64 word) (ucast ((0x20c49ba5e353f7cf::64 word))::64 word)) >> 4)::64 word) * 0x3e8)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x220),8]::64 word) = ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word) - ((ucast ((((((ucast ((((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5)::64 word))::64 word) << 4)::64 word) - ((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5))::64 word))::64 word) << 2)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x228),8]::64 word) = ((((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5)::64 word) - ((ucast ((((((ucast ((((hi_mul(ucast ((((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5)::64 word))::64 word) << 4)::64 word) - ((hi_mul(ucast ((((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5))::64 word))::64 word) << 2)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x230),8]::64 word) = 0x19fbb\<close>
declare Q_0x19fcf_8_def[Qs]

schematic_goal bdrv_snapshot_dump_0_4_0x19fbb_0x19fca_8[blocks]:
  assumes \<open>(P_0x19fbb_8 && P_0x19fbb_8_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x19fca 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x19fcf_8 ?\<sigma> \<and> block_usage P_0x19fbb_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19fbb_8_def P_0x19fbb_8_regions_def post: Q_0x19fcf_8_def regionset: P_0x19fbb_8_regions_set_def)

definition P_0x19fcf_9 :: state_pred where
  \<open>P_0x19fcf_9 \<sigma> \<equiv> RIP \<sigma> = 0x19fcf \<and> RAX \<sigma> = snprintf_chk_0x19fb6_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = 0x80 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x180),4]::32 word)) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x1b8) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x208) \<and> RBP \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0xb8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = ((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 15)::64 word))::64 word) (ucast ((0x91a2b3c4d5e6f81::64 word))::64 word)) >> 3) \<and> R8 \<sigma> = 0x21a7c \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x180),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x180),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x200),8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x210),8]::64 word) = 0x19ed8 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x218),8]::64 word) = ((((hi_mul(ucast (((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word)::64 word))::64 word) (ucast ((0x431bde82d7b634db::64 word))::64 word)) >> 18)::64 word) - (\<langle>63,0\<rangle>((((hi_mul(ucast ((((hi_mul(ucast (((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word)::64 word))::64 word) (ucast ((0x431bde82d7b634db::64 word))::64 word)) >> 21)::64 word))::64 word) (ucast ((0x20c49ba5e353f7cf::64 word))::64 word)) >> 4)::64 word) * 0x3e8)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x220),8]::64 word) = ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word) - ((ucast ((((((ucast ((((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5)::64 word))::64 word) << 4)::64 word) - ((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5))::64 word))::64 word) << 2)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x228),8]::64 word) = ((((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5)::64 word) - ((ucast ((((((ucast ((((hi_mul(ucast ((((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5)::64 word))::64 word) << 4)::64 word) - ((hi_mul(ucast ((((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5))::64 word))::64 word) << 2)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x230),8]::64 word) = 0x19fbb\<close>
declare P_0x19fcf_9_def[Ps]

definition P_0x19fcf_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19fcf_9_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDX\<^sub>0::64 word) + 0x180), 4),
    (3, ((RDX\<^sub>0::64 word) + 0x184), 4),
    (4, ((RDX\<^sub>0::64 word) + 0x190), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x200), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x210), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x218), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x220), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x228), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x230), 8)
  }\<close>

definition P_0x19fcf_9_regions :: state_pred where
  \<open>P_0x19fcf_9_regions \<sigma> \<equiv> \<exists>regions. P_0x19fcf_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_get_human_readable_size_addr_0x19fcf_9 :: state_pred where
  \<open>Q_get_human_readable_size_addr_0x19fcf_9 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x210) \<and> RIP \<sigma> = get_human_readable_size_addr \<and> RAX \<sigma> = snprintf_chk_0x19fb6_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = 0x80 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x180),4]::32 word)) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x1b8) \<and> RSI \<sigma> = 0x80 \<and> RBP \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0xb8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = ((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 15)::64 word))::64 word) (ucast ((0x91a2b3c4d5e6f81::64 word))::64 word)) >> 3) \<and> R8 \<sigma> = 0x21a7c \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x180),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x180),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x200),8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x210),8]::64 word) = 0x19fd4 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x218),8]::64 word) = ((((hi_mul(ucast (((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word)::64 word))::64 word) (ucast ((0x431bde82d7b634db::64 word))::64 word)) >> 18)::64 word) - (\<langle>63,0\<rangle>((((hi_mul(ucast ((((hi_mul(ucast (((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word)::64 word))::64 word) (ucast ((0x431bde82d7b634db::64 word))::64 word)) >> 21)::64 word))::64 word) (ucast ((0x20c49ba5e353f7cf::64 word))::64 word)) >> 4)::64 word) * 0x3e8)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x220),8]::64 word) = ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word) - ((ucast ((((((ucast ((((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5)::64 word))::64 word) << 4)::64 word) - ((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5))::64 word))::64 word) << 2)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x228),8]::64 word) = ((((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5)::64 word) - ((ucast ((((((ucast ((((hi_mul(ucast ((((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5)::64 word))::64 word) << 4)::64 word) - ((hi_mul(ucast ((((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5))::64 word))::64 word) << 2)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x230),8]::64 word) = 0x19fbb\<close>
declare Q_get_human_readable_size_addr_0x19fcf_9_def[Qs]

schematic_goal bdrv_snapshot_dump_0_1_0x19fcf_0x19fcf_9[blocks]:
  assumes \<open>(P_0x19fcf_9 && P_0x19fcf_9_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x19fcf 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_get_human_readable_size_addr_0x19fcf_9 ?\<sigma> \<and> block_usage P_0x19fcf_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19fcf_9_def P_0x19fcf_9_regions_def post: Q_get_human_readable_size_addr_0x19fcf_9_def regionset: P_0x19fcf_9_regions_set_def)

definition P_0x19fd4_10 :: state_pred where
  \<open>P_0x19fd4_10 \<sigma> \<equiv> RIP \<sigma> = 0x19fd4 \<and> RAX \<sigma> = get_human_readable_size_0x19fcf_retval \<and> RBX \<sigma> = RDX\<^sub>0 \<and> RCX \<sigma> = 0x80 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x180),4]::32 word)) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x1b8) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x208) \<and> RBP \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0xb8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x138) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R9 \<sigma> = ((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 15)::64 word))::64 word) (ucast ((0x91a2b3c4d5e6f81::64 word))::64 word)) >> 3) \<and> R8 \<sigma> = 0x21a7c \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x180),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x180),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) = (\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x200),8]::64 word) = ucast ((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x184),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x210),8]::64 word) = 0x19fd4 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x218),8]::64 word) = ((((hi_mul(ucast (((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word)::64 word))::64 word) (ucast ((0x431bde82d7b634db::64 word))::64 word)) >> 18)::64 word) - (\<langle>63,0\<rangle>((((hi_mul(ucast ((((hi_mul(ucast (((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word)::64 word))::64 word) (ucast ((0x431bde82d7b634db::64 word))::64 word)) >> 21)::64 word))::64 word) (ucast ((0x20c49ba5e353f7cf::64 word))::64 word)) >> 4)::64 word) * 0x3e8)::64 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x220),8]::64 word) = ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word) - ((ucast ((((((ucast ((((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5)::64 word))::64 word) << 4)::64 word) - ((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5))::64 word))::64 word) << 2)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x228),8]::64 word) = ((((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5)::64 word) - ((ucast ((((((ucast ((((hi_mul(ucast ((((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5)::64 word))::64 word) << 4)::64 word) - ((hi_mul(ucast ((((hi_mul(ucast ((((hi_mul(ucast ((((\<sigma> \<turnstile> *[((RDX\<^sub>0::64 word) + 0x190),8]::64 word) >> 9)::64 word))::64 word) (ucast ((0x44b82fa09b5a53::64 word))::64 word)) >> 11)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5)::64 word))::64 word) (ucast ((0x8888888888888889::64 word))::64 word)) >> 5))::64 word))::64 word) << 2)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x230),8]::64 word) = 0x19fbb\<close>
declare P_0x19fd4_10_def[Ps]

definition P_0x19fd4_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19fd4_10_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RDX\<^sub>0::64 word) + 0x180), 4),
    (3, ((RDX\<^sub>0::64 word) + 0x184), 4),
    (4, ((RDX\<^sub>0::64 word) + 0x190), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (10, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (11, ((RSP\<^sub>0::64 word) - 0x200), 8),
    (12, ((RSP\<^sub>0::64 word) - 0x210), 8),
    (13, ((RSP\<^sub>0::64 word) - 0x218), 8),
    (14, ((RSP\<^sub>0::64 word) - 0x220), 8),
    (15, ((RSP\<^sub>0::64 word) - 0x228), 8),
    (16, ((RSP\<^sub>0::64 word) - 0x230), 8)
  }\<close>

definition P_0x19fd4_10_regions :: state_pred where
  \<open>P_0x19fd4_10_regions \<sigma> \<equiv> \<exists>regions. P_0x19fd4_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x19fe4_10 :: state_pred where
  \<open>Q_0x19fe4_10 \<sigma> \<equiv> RIP \<sigma> = 0x19fe4 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x228) \<and> RBP \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x19fe4_10_def[Qs]

schematic_goal bdrv_snapshot_dump_0_6_0x19fd4_0x19fe3_10[blocks]:
  assumes \<open>(P_0x19fd4_10 && P_0x19fd4_10_regions) \<sigma>\<close>
  shows \<open>exec_block 6 0x19fe3 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x19fe4_10 ?\<sigma> \<and> block_usage P_0x19fd4_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19fd4_10_def P_0x19fd4_10_regions_def post: Q_0x19fe4_10_def regionset: P_0x19fd4_10_regions_set_def)

definition P_0x19fe4_11 :: state_pred where
  \<open>P_0x19fe4_11 \<sigma> \<equiv> RIP \<sigma> = 0x19fe4 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x228) \<and> RBP \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x19fe4_11_def[Ps]

definition P_0x19fe4_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19fe4_11_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x19fe4_11_regions :: state_pred where
  \<open>P_0x19fe4_11_regions \<sigma> \<equiv> \<exists>regions. P_0x19fe4_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x19fff_11 :: state_pred where
  \<open>Q_0x19fff_11 \<sigma> \<equiv> RIP \<sigma> = 0x19fff \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = 0xffffffffffffffff \<and> RDX \<sigma> = 0x1 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x228) \<and> RBP \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = 0x21a3a \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x19fff_11_def[Qs]

schematic_goal bdrv_snapshot_dump_0_6_0x19fe4_0x19ffa_11[blocks]:
  assumes \<open>(P_0x19fe4_11 && P_0x19fe4_11_regions) \<sigma>\<close>
  shows \<open>exec_block 6 0x19ffa 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x19fff_11 ?\<sigma> \<and> block_usage P_0x19fe4_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19fe4_11_def P_0x19fe4_11_regions_def post: Q_0x19fff_11_def regionset: P_0x19fe4_11_regions_set_def)

definition P_0x19fff_12 :: state_pred where
  \<open>P_0x19fff_12 \<sigma> \<equiv> RIP \<sigma> = 0x19fff \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = 0xffffffffffffffff \<and> RDX \<sigma> = 0x1 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x228) \<and> RBP \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = 0x21a3a \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x19fff_12_def[Ps]

definition P_0x19fff_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x19fff_12_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x230), 8)
  }\<close>

definition P_0x19fff_12_regions :: state_pred where
  \<open>P_0x19fff_12_regions \<sigma> \<equiv> \<exists>regions. P_0x19fff_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_snprintf_chk_addr_0x19fff_12 :: state_pred where
  \<open>Q_snprintf_chk_addr_0x19fff_12 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x230) \<and> RIP \<sigma> = snprintf_chk_addr \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = 0xffffffffffffffff \<and> RDX \<sigma> = 0x1 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RBP \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = 0x21a3a \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x230),8]::64 word) = 0x1a004\<close>
declare Q_snprintf_chk_addr_0x19fff_12_def[Qs]

schematic_goal bdrv_snapshot_dump_0_1_0x19fff_0x19fff_12[blocks]:
  assumes \<open>(P_0x19fff_12 && P_0x19fff_12_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x19fff 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_snprintf_chk_addr_0x19fff_12 ?\<sigma> \<and> block_usage P_0x19fff_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x19fff_12_def P_0x19fff_12_regions_def post: Q_snprintf_chk_addr_0x19fff_12_def regionset: P_0x19fff_12_regions_set_def)

definition P_0x1a004_13 :: state_pred where
  \<open>P_0x1a004_13 \<sigma> \<equiv> RIP \<sigma> = 0x1a004 \<and> RAX \<sigma> = snprintf_chk_0x19fff_retval \<and> RCX \<sigma> = 0xffffffffffffffff \<and> RDX \<sigma> = 0x1 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x228) \<and> RBP \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = 0x21a3a \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x230),8]::64 word) = 0x1a004\<close>
declare P_0x1a004_13_def[Ps]

definition P_0x1a004_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a004_13_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x230), 8)
  }\<close>

definition P_0x1a004_13_regions :: state_pred where
  \<open>P_0x1a004_13_regions \<sigma> \<equiv> \<exists>regions. P_0x1a004_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1a01c_13 :: state_pred where
  \<open>Q_0x1a01c_13 \<sigma> \<equiv> RIP \<sigma> = 0x1a01c \<and> RAX \<sigma> = RDI\<^sub>0 \<and> RBX \<sigma> = 0x0 \<and> RCX \<sigma> = 0xffffffffffffffff \<and> RDX \<sigma> = 0x1 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x208) \<and> RBP \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = 0x21a3a \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x230),8]::64 word) = 0x1a004\<close>
declare Q_0x1a01c_13_def[Qs]

schematic_goal bdrv_snapshot_dump_0_4_0x1a004_0x1a013_13[blocks]:
  assumes \<open>(P_0x1a004_13 && P_0x1a004_13_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x1a013 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1a01c_13 ?\<sigma> \<and> block_usage P_0x1a004_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a004_13_def P_0x1a004_13_regions_def post: Q_0x1a01c_13_def regionset: P_0x1a004_13_regions_set_def)

definition P_0x1a01c_true_14 :: state_pred where
  \<open>P_0x1a01c_true_14 \<sigma> \<equiv> RIP \<sigma> = 0x1a01c \<and> RAX \<sigma> = RDI\<^sub>0 \<and> RBX \<sigma> = 0x0 \<and> RCX \<sigma> = 0xffffffffffffffff \<and> RDX \<sigma> = 0x1 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x208) \<and> RBP \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = 0x21a3a \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x230),8]::64 word) = 0x1a004\<close>
declare P_0x1a01c_true_14_def[Ps]

definition P_0x1a01c_true_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a01c_true_14_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x230), 8)
  }\<close>

definition P_0x1a01c_true_14_regions :: state_pred where
  \<open>P_0x1a01c_true_14_regions \<sigma> \<equiv> \<exists>regions. P_0x1a01c_true_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x1a061_14 :: state_pred where
  \<open>Q_0x1a061_14 \<sigma> \<equiv> RIP \<sigma> = 0x1a061 \<and> RAX \<sigma> = RDI\<^sub>0 \<and> RBX \<sigma> = 0x0 \<and> RCX \<sigma> = 0xffffffffffffffff \<and> RDX \<sigma> = 0x1 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x208) \<and> RBP \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = 0x21a3a \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x230),8]::64 word) = 0x1a004\<close>
declare Q_0x1a061_14_def[Qs]

schematic_goal bdrv_snapshot_dump_0_1_0x1a01c_0x1a01c_14[blocks]:
  assumes \<open>(P_0x1a01c_true_14 && P_0x1a01c_true_14_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1a01c 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x1a061_14 ?\<sigma> \<and> block_usage P_0x1a01c_true_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a01c_true_14_def P_0x1a01c_true_14_regions_def post: Q_0x1a061_14_def regionset: P_0x1a01c_true_14_regions_set_def)

definition P_0x1a061_15 :: state_pred where
  \<open>P_0x1a061_15 \<sigma> \<equiv> RIP \<sigma> = 0x1a061 \<and> RAX \<sigma> = RDI\<^sub>0 \<and> RBX \<sigma> = 0x0 \<and> RCX \<sigma> = 0xffffffffffffffff \<and> RDX \<sigma> = 0x1 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x208) \<and> RBP \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = 0x21a3a \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x230),8]::64 word) = 0x1a004\<close>
declare P_0x1a061_15_def[Ps]

definition P_0x1a061_15_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a061_15_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x210), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x230), 8)
  }\<close>

definition P_0x1a061_15_regions :: state_pred where
  \<open>P_0x1a061_15_regions \<sigma> \<equiv> \<exists>regions. P_0x1a061_15_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_stack_chk_fail_addr_0x1a061_15 :: state_pred where
  \<open>Q_stack_chk_fail_addr_0x1a061_15 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x210) \<and> RIP \<sigma> = stack_chk_fail_addr \<and> RAX \<sigma> = RDI\<^sub>0 \<and> RCX \<sigma> = 0xffffffffffffffff \<and> RDX \<sigma> = 0x1 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R8 \<sigma> = 0x21a3a \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x230),8]::64 word) = 0x1a004\<close>
declare Q_stack_chk_fail_addr_0x1a061_15_def[Qs]

schematic_goal bdrv_snapshot_dump_0_1_0x1a061_0x1a061_15[blocks]:
  assumes \<open>(P_0x1a061_15 && P_0x1a061_15_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x1a061 15 \<sigma> \<triangleq> ?\<sigma> \<and> Q_stack_chk_fail_addr_0x1a061_15 ?\<sigma> \<and> block_usage P_0x1a061_15_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a061_15_def P_0x1a061_15_regions_def post: Q_stack_chk_fail_addr_0x1a061_15_def regionset: P_0x1a061_15_regions_set_def)

definition P_0x1a01c_false_16 :: state_pred where
  \<open>P_0x1a01c_false_16 \<sigma> \<equiv> RIP \<sigma> = 0x1a01c \<and> RAX \<sigma> = RDI\<^sub>0 \<and> RBX \<sigma> = 0x0 \<and> RCX \<sigma> = 0xffffffffffffffff \<and> RDX \<sigma> = 0x1 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0x208) \<and> RBP \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R12 \<sigma> = RDI\<^sub>0 \<and> R8 \<sigma> = 0x21a3a \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x230),8]::64 word) = 0x1a004\<close>
declare P_0x1a01c_false_16_def[Ps]

definition P_0x1a01c_false_16_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x1a01c_false_16_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x230), 8)
  }\<close>

definition P_0x1a01c_false_16_regions :: state_pred where
  \<open>P_0x1a01c_false_16_regions \<sigma> \<equiv> \<exists>regions. P_0x1a01c_false_16_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_16 :: state_pred where
  \<open>Q_ret_address_16 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> RCX \<sigma> = 0xffffffffffffffff \<and> RDX \<sigma> = 0x1 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = (sextend (ucast ((\<langle>31,0\<rangle>RSI\<^sub>0::32 word))) 32 64::64 word) \<and> R8 \<sigma> = 0x21a3a \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x230),8]::64 word) = 0x1a004\<close>
declare Q_ret_address_16_def[Qs]

schematic_goal bdrv_snapshot_dump_0_8_0x1a01c_0x1a031_16[blocks]:
  assumes \<open>(P_0x1a01c_false_16 && P_0x1a01c_false_16_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 8 0x1a031 16 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_16 ?\<sigma> \<and> block_usage P_0x1a01c_false_16_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x1a01c_false_16_def P_0x1a01c_false_16_regions_def post: Q_ret_address_16_def regionset: P_0x1a01c_false_16_regions_set_def)

definition bdrv_snapshot_dump_acode :: ACode where
  \<open>bdrv_snapshot_dump_acode =
    Block 12 0x19e88 0;
    IF ZF THEN
      Block 11 0x1a05f (Suc 0)
    ELSE
      Block 8 0x19eaf 2;
      Block (Suc 0) 0x19eb4 3;
      CALL localtime_r_acode;
      Block 5 0x19ecb 4;
      Block (Suc 0) 0x19ed3 5;
      CALL strftime_acode;
      Block 54 0x19fb1 6;
      Block (Suc 0) 0x19fb6 7;
      CALL snprintf_chk_acode;
      Block 4 0x19fca 8;
      Block (Suc 0) 0x19fcf 9;
      CALL get_human_readable_size_acode;
      Block 6 0x19fe3 10
    FI;
    Block 6 0x19ffa 11;
    Block (Suc 0) 0x19fff 12;
    CALL snprintf_chk_acode;
    Block 4 0x1a013 13;
    IF !ZF THEN
      Block (Suc 0) 0x1a01c 14;
      Block (Suc 0) 0x1a061 15;
      CALL stack_chk_fail_acode
    ELSE
      Block 8 0x1a031 16
    FI
  \<close>

schematic_goal "bdrv_snapshot_dump":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19e8b \<longrightarrow> P_0x19e8b_true_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19e8b \<longrightarrow> P_0x19e8b_false_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19eb4 \<longrightarrow> P_0x19eb4_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19eb9 \<longrightarrow> P_0x19eb9_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19ed3 \<longrightarrow> P_0x19ed3_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19ed8 \<longrightarrow> P_0x19ed8_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19fb6 \<longrightarrow> P_0x19fb6_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19fbb \<longrightarrow> P_0x19fbb_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19fcf \<longrightarrow> P_0x19fcf_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19fd4 \<longrightarrow> P_0x19fd4_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19fe4 \<longrightarrow> P_0x19fe4_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x19fff \<longrightarrow> P_0x19fff_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a004 \<longrightarrow> P_0x1a004_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a01c \<longrightarrow> P_0x1a01c_true_14_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a061 \<longrightarrow> P_0x1a061_15_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x1a01c \<longrightarrow> P_0x1a01c_false_16_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_localtime_r_addr_0x19eb4_3}} \<box>localtime_r_acode {{P_0x19eb9_4;M_0x19eb4}}\<close>
    and [blocks]: \<open>{{Q_strftime_addr_0x19ed3_5}} \<box>strftime_acode {{P_0x19ed8_6;M_0x19ed3}}\<close>
    and [blocks]: \<open>{{Q_snprintf_chk_addr_0x19fb6_7}} \<box>snprintf_chk_acode {{P_0x19fbb_8;M_0x19fb6}}\<close>
    and [blocks]: \<open>{{Q_get_human_readable_size_addr_0x19fcf_9}} \<box>get_human_readable_size_acode {{P_0x19fd4_10;M_0x19fcf}}\<close>
    and [blocks]: \<open>{{Q_snprintf_chk_addr_0x19fff_12}} \<box>snprintf_chk_acode {{P_0x1a004_13;M_0x19fff}}\<close>
    and [blocks]: \<open>{{Q_stack_chk_fail_addr_0x1a061_15}} \<box>stack_chk_fail_acode {{Q_fail;M_0x1a061}}\<close>
  shows \<open>{{?P}} bdrv_snapshot_dump_acode {{?Q;?M}}\<close>
  by (vcg acode: bdrv_snapshot_dump_acode_def assms: assms)

end
