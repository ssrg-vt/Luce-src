theory img_info
  imports
    "../../../isabelle/VCG/HTriple"
begin

locale "qemu_img_xen" = execution_context + exec_code +
  fixes getopt_0x3ff0_retval\<^sub>v help_0x4015_retval\<^sub>v bdrv_new_0x403f_retval\<^sub>v bdrv_find_format_0x405c_retval\<^sub>v bdrv_open2_0x4078_retval\<^sub>v bdrv_get_format_0x40a0_retval\<^sub>v bdrv_get_geometry_0x40ad_retval\<^sub>v get_human_readable_size_0x40c3_retval\<^sub>v xstat64_0x40d5_retval\<^sub>v printf_chk_0x4138_retval\<^sub>v bdrv_is_encrypted_0x4140_retval\<^sub>v bdrv_get_info_0x4157_retval\<^sub>v bdrv_get_backing_filename_0x417f_retval\<^sub>v dump_snapshots_0x4191_retval\<^sub>v bdrv_delete_0x4199_retval\<^sub>v get_human_readable_size_0x41d7_retval\<^sub>v puts_0x41e8_retval\<^sub>v path_combine_0x4208_retval\<^sub>v printf_chk_0x4221_retval\<^sub>v printf_chk_0x4240_retval\<^sub>v error_0x4256_retval\<^sub>v error_0x4267_retval\<^sub>v stack_chk_fail_0x426c_retval\<^sub>v error_0x427a_retval\<^sub>v printf_chk_addr stack_chk_fail_addr xstat64_addr bdrv_delete_addr bdrv_find_format_addr bdrv_get_backing_filename_addr bdrv_get_format_addr bdrv_get_geometry_addr bdrv_get_info_addr bdrv_is_encrypted_addr bdrv_new_addr bdrv_open2_addr dump_snapshots_addr error_addr get_human_readable_size_addr getopt_addr help_addr path_combine_addr puts_addr :: \<open>64 word\<close>
    and printf_chk_acode stack_chk_fail_acode xstat64_acode bdrv_delete_acode bdrv_find_format_acode bdrv_get_backing_filename_acode bdrv_get_format_acode bdrv_get_geometry_acode bdrv_get_info_acode bdrv_is_encrypted_acode bdrv_new_acode bdrv_open2_acode dump_snapshots_acode error_acode get_human_readable_size_acode getopt_acode help_acode path_combine_acode puts_acode :: ACode
  assumes fetch:
    "fetch 0x3fb0 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x3fb2 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x3fb4 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo r13)) (Storage (Reg (General ThirtyTwo r13))), 3)"
    "fetch 0x3fb7 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x3fb9 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r12)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 102518)))), 7)"
    "fetch 0x3fc0 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x3fc1 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rbp)) (Storage (Reg (General ThirtyTwo rdi))), 2)"
    "fetch 0x3fc3 \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x3fc4 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rsi))), 3)"
    "fetch 0x3fc7 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 2624)), 7)"
    "fetch 0x3fce \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x3fd7 \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 2616)))) (Storage (Reg (General SixtyFour rax))), 8)"
    "fetch 0x3fdf \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x3fe1 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 0))))), 7)"
    "fetch 0x3fe8 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x3feb \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x3fee \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Storage (Reg (General ThirtyTwo rbp))), 2)"
    "fetch 0x3ff0 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''getopt'')), 5)"
    "fetch 0x3ff5 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 4294967295)), 3)"
    "fetch 0x3ff8 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 16416)), 2)"
    "fetch 0x3ffa \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 102)), 3)"
    "fetch 0x3ffd \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 16400)), 2)"
    "fetch 0x3fff \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r13)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 156394))))), 7)"
    "fetch 0x4006 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 16360)), 2)"
    "fetch 0x4008 \<equiv> (Unary (IS_8088 Nop) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 8)"
    "fetch 0x4010 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Immediate SixtyFour (ImmVal 104)), 3)"
    "fetch 0x4013 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 16360)), 2)"
    "fetch 0x4015 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''help'')), 5)"
    "fetch 0x401a \<equiv> (Unary (IS_8088 Nop) (Storage (Memory Sixteen (A_SizeDirective 16 (A_Plus (A_FromReg (General SixtyFour rax)) (A_Plus (A_Mult 1 (A_FromReg (General SixtyFour rax))) (A_WordConstant 0)))))), 6)"
    "fetch 0x4020 \<equiv> (Binary (IS_X86_64 Movsxd) (Reg (General SixtyFour rax)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 156353))))), 7)"
    "fetch 0x4027 \<equiv> (Binary (IS_8088 Cmp) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rbp))), 2)"
    "fetch 0x4029 \<equiv> (Unary (IS_8088 Jge) (Immediate SixtyFour (ImmVal 16405)), 2)"
    "fetch 0x402b \<equiv> (Binary (IS_8088 Lea) (Reg (General ThirtyTwo rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rax)) (A_WordConstant 1)))), 3)"
    "fetch 0x402e \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 117805)))), 7)"
    "fetch 0x4035 \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 156333)))) (Storage (Reg (General ThirtyTwo rdx))), 6)"
    "fetch 0x403b \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbp)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rbx)) (A_Mult 8 (A_FromReg (General SixtyFour rax))))))), 4)"
    "fetch 0x403f \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_new'')), 5)"
    "fetch 0x4044 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rbx)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x4047 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x404a \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 17009)), 6)"
    "fetch 0x4050 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour r13)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x4053 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 16939)), 6)"
    "fetch 0x4059 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x405c \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_find_format'')), 5)"
    "fetch 0x4061 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x4064 \<equiv> (Binary (IS_8088 Test) (Reg (General SixtyFour rax)) (Storage (Reg (General SixtyFour rax))), 3)"
    "fetch 0x4067 \<equiv> (Unary (IS_8088 Je) (Immediate SixtyFour (ImmVal 16970)), 6)"
    "fetch 0x406d \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 64)), 5)"
    "fetch 0x4072 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x4075 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x4078 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_open2'')), 5)"
    "fetch 0x407d \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x407f \<equiv> (Unary (IS_8088 Js) (Immediate SixtyFour (ImmVal 16987)), 6)"
    "fetch 0x4085 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r12)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 176)))), 8)"
    "fetch 0x408d \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 128)), 5)"
    "fetch 0x4092 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x4095 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x4098 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r13)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 304)))), 8)"
    "fetch 0x40a0 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_get_format'')), 5)"
    "fetch 0x40a5 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8)))), 5)"
    "fetch 0x40aa \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x40ad \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_get_geometry'')), 5)"
    "fetch 0x40b2 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 8))))), 5)"
    "fetch 0x40b7 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 128)), 5)"
    "fetch 0x40bc \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x40bf \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour rdx)) (Immediate SixtyFour (ImmVal 9)), 4)"
    "fetch 0x40c3 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''get_human_readable_size'')), 5)"
    "fetch 0x40c8 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 32)))), 5)"
    "fetch 0x40cd \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x40d0 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x40d5 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__xstat64'')), 5)"
    "fetch 0x40da \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x40dc \<equiv> (Unary (IS_8088 Js) (Immediate SixtyFour (ImmVal 16621)), 2)"
    "fetch 0x40de \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 96))))), 5)"
    "fetch 0x40e3 \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour rdx)) (Immediate SixtyFour (ImmVal 9)), 4)"
    "fetch 0x40e7 \<equiv> (Unary (IS_8088 Jns) (Immediate SixtyFour (ImmVal 16839)), 6)"
    "fetch 0x40ed \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rax)) (Immediate SixtyFour (ImmVal 7020101786482601589)), 10)"
    "fetch 0x40f7 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r14)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 432)))), 8)"
    "fetch 0x40ff \<equiv> (Binary (IS_8088 Mov) (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 440)))) (Immediate SixtyFour (ImmVal 6646882)), 11)"
    "fetch 0x410a \<equiv> (Binary (IS_8088 Mov) (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 432)))) (Storage (Reg (General SixtyFour rax))), 8)"
    "fetch 0x4112 \<equiv> (Binary (IS_8088 Sub) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 8)), 4)"
    "fetch 0x4116 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x4119 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x411c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r8)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x411f \<equiv> (Unary (IS_8088 Push) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x4121 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour r9)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 24))))), 5)"
    "fetch 0x4126 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 104595)))), 7)"
    "fetch 0x412d \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x412f \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x4134 \<equiv> (Binary (IS_8088 Shl) (Reg (General SixtyFour r9)) (Immediate SixtyFour (ImmVal 9)), 4)"
    "fetch 0x4138 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__printf_chk'')), 5)"
    "fetch 0x413d \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x4140 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_is_encrypted'')), 5)"
    "fetch 0x4145 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rdx))), 1)"
    "fetch 0x4146 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rcx))), 1)"
    "fetch 0x4147 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x4149 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 16865)), 6)"
    "fetch 0x414f \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 16)))), 5)"
    "fetch 0x4154 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x4157 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_get_info'')), 5)"
    "fetch 0x415c \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x415e \<equiv> (Unary (IS_8088 Js) (Immediate SixtyFour (ImmVal 16748)), 2)"
    "fetch 0x4160 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Storage (Memory ThirtyTwo (A_SizeDirective 32 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 16))))), 4)"
    "fetch 0x4164 \<equiv> (Binary (IS_8088 Test) (Reg (General ThirtyTwo rdx)) (Storage (Reg (General ThirtyTwo rdx))), 2)"
    "fetch 0x4166 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 16946)), 6)"
    "fetch 0x416c \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r12)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 560)))), 8)"
    "fetch 0x4174 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdx)) (Immediate SixtyFour (ImmVal 1024)), 5)"
    "fetch 0x4179 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x417c \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x417f \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_get_backing_filename'')), 5)"
    "fetch 0x4184 \<equiv> (Binary (IS_8088 Cmp) (Memory Eight (A_SizeDirective 8 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 560)))) (Immediate SixtyFour (ImmVal 0)), 8)"
    "fetch 0x418c \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 16882)), 2)"
    "fetch 0x418e \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x4191 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''dump_snapshots'')), 5)"
    "fetch 0x4196 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour rbx))), 3)"
    "fetch 0x4199 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''bdrv_delete'')), 5)"
    "fetch 0x419e \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x41a0 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 2616))))), 8)"
    "fetch 0x41a8 \<equiv> (Binary (IS_8088 Xor) (Reg (General SixtyFour rcx)) (Storage (Memory SixtyFour (A_SizeDirective 64 (A_Plus (A_FromReg (General SixtyFour fs)) (A_WordConstant 40))))), 9)"
    "fetch 0x41b1 \<equiv> (Unary (IS_8088 Jne) (Immediate SixtyFour (ImmVal 17004)), 6)"
    "fetch 0x41b7 \<equiv> (Binary (IS_8088 Add) (Reg (General SixtyFour rsp)) (Immediate SixtyFour (ImmVal 2624)), 7)"
    "fetch 0x41be \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbx))), 1)"
    "fetch 0x41bf \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour rbp))), 1)"
    "fetch 0x41c0 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r12))), 2)"
    "fetch 0x41c2 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r13))), 2)"
    "fetch 0x41c4 \<equiv> (Unary (IS_8088 Pop) (Storage (Reg (General SixtyFour r14))), 2)"
    "fetch 0x41c6 \<equiv> (Nullary (IS_8088 Ret), 1)"
    "fetch 0x41c7 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r14)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 432)))), 8)"
    "fetch 0x41cf \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 128)), 5)"
    "fetch 0x41d4 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r14))), 3)"
    "fetch 0x41d7 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''get_human_readable_size'')), 5)"
    "fetch 0x41dc \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 16658)), 5)"
    "fetch 0x41e1 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 102033)))), 7)"
    "fetch 0x41e8 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''puts'')), 5)"
    "fetch 0x41ed \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 16719)), 5)"
    "fetch 0x41f2 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour r13)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rsp)) (A_WordConstant 1584)))), 8)"
    "fetch 0x41fa \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x41fd \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x4200 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rsi)) (Immediate SixtyFour (ImmVal 1024)), 5)"
    "fetch 0x4205 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x4208 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''path_combine'')), 5)"
    "fetch 0x420d \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rcx)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x4210 \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rdx)) (Storage (Reg (General SixtyFour r12))), 3)"
    "fetch 0x4213 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x4218 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 104425)))), 7)"
    "fetch 0x421f \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x4221 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__printf_chk'')), 5)"
    "fetch 0x4226 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 16782)), 5)"
    "fetch 0x422b \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rcx)) (Storage (Reg (General ThirtyTwo rcx))), 2)"
    "fetch 0x422d \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 16493)), 5)"
    "fetch 0x4232 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rsi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 101967)))), 7)"
    "fetch 0x4239 \<equiv> (Binary (IS_8088 Mov) (Reg (General ThirtyTwo rdi)) (Immediate SixtyFour (ImmVal 1)), 5)"
    "fetch 0x423e \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x4240 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__printf_chk'')), 5)"
    "fetch 0x4245 \<equiv> (Unary (IS_8088 Jmp) (Immediate SixtyFour (ImmVal 16748)), 5)"
    "fetch 0x424a \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour r13))), 3)"
    "fetch 0x424d \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 101880)))), 7)"
    "fetch 0x4254 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x4256 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''error'')), 5)"
    "fetch 0x425b \<equiv> (Binary (IS_8088 Mov) (Reg (General SixtyFour rsi)) (Storage (Reg (General SixtyFour rbp))), 3)"
    "fetch 0x425e \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 101888)))), 7)"
    "fetch 0x4265 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x4267 \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''error'')), 5)"
    "fetch 0x426c \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''__stack_chk_fail'')), 5)"
    "fetch 0x4271 \<equiv> (Binary (IS_8088 Lea) (Reg (General SixtyFour rdi)) (Storage (Memory SixtyFour (A_Plus (A_FromReg (General SixtyFour rip)) (A_WordConstant 101826)))), 7)"
    "fetch 0x4278 \<equiv> (Binary (IS_8088 Xor) (Reg (General ThirtyTwo rax)) (Storage (Reg (General ThirtyTwo rax))), 2)"
    "fetch 0x427a \<equiv> (Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''error'')), 5)"
    and \<alpha>_def: \<open>\<alpha> = \<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\<rparr>\<close>
    and printf_chk\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__printf_chk'') = printf_chk_addr\<close>
    and stack_chk_fail\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__stack_chk_fail'') = stack_chk_fail_addr\<close>
    and xstat64\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''__xstat64'') = xstat64_addr\<close>
    and bdrv_delete\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''bdrv_delete'') = bdrv_delete_addr\<close>
    and bdrv_find_format\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''bdrv_find_format'') = bdrv_find_format_addr\<close>
    and bdrv_get_backing_filename\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''bdrv_get_backing_filename'') = bdrv_get_backing_filename_addr\<close>
    and bdrv_get_format\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''bdrv_get_format'') = bdrv_get_format_addr\<close>
    and bdrv_get_geometry\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''bdrv_get_geometry'') = bdrv_get_geometry_addr\<close>
    and bdrv_get_info\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''bdrv_get_info'') = bdrv_get_info_addr\<close>
    and bdrv_is_encrypted\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''bdrv_is_encrypted'') = bdrv_is_encrypted_addr\<close>
    and bdrv_new\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''bdrv_new'') = bdrv_new_addr\<close>
    and bdrv_open2\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''bdrv_open2'') = bdrv_open2_addr\<close>
    and dump_snapshots\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''dump_snapshots'') = dump_snapshots_addr\<close>
    and error\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''error'') = error_addr\<close>
    and get_human_readable_size\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''get_human_readable_size'') = get_human_readable_size_addr\<close>
    and getopt\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''getopt'') = getopt_addr\<close>
    and help\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''help'') = help_addr\<close>
    and path_combine\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''path_combine'') = path_combine_addr\<close>
    and puts\<^sub>a\<^sub>d\<^sub>d\<^sub>r[simp]: \<open>the (label_to_address \<alpha> ''puts'') = puts_addr\<close>
begin

text \<open>Using definitions that don't get unfolded immediately prevents locale argument issues.\<close>
definition \<open>getopt_0x3ff0_retval \<equiv> getopt_0x3ff0_retval\<^sub>v\<close>
definition \<open>help_0x4015_retval \<equiv> help_0x4015_retval\<^sub>v\<close>
definition \<open>bdrv_new_0x403f_retval \<equiv> bdrv_new_0x403f_retval\<^sub>v\<close>
definition \<open>bdrv_find_format_0x405c_retval \<equiv> bdrv_find_format_0x405c_retval\<^sub>v\<close>
definition \<open>bdrv_open2_0x4078_retval \<equiv> bdrv_open2_0x4078_retval\<^sub>v\<close>
definition \<open>bdrv_get_format_0x40a0_retval \<equiv> bdrv_get_format_0x40a0_retval\<^sub>v\<close>
definition \<open>bdrv_get_geometry_0x40ad_retval \<equiv> bdrv_get_geometry_0x40ad_retval\<^sub>v\<close>
definition \<open>get_human_readable_size_0x40c3_retval \<equiv> get_human_readable_size_0x40c3_retval\<^sub>v\<close>
definition \<open>xstat64_0x40d5_retval \<equiv> xstat64_0x40d5_retval\<^sub>v\<close>
definition \<open>printf_chk_0x4138_retval \<equiv> printf_chk_0x4138_retval\<^sub>v\<close>
definition \<open>bdrv_is_encrypted_0x4140_retval \<equiv> bdrv_is_encrypted_0x4140_retval\<^sub>v\<close>
definition \<open>bdrv_get_info_0x4157_retval \<equiv> bdrv_get_info_0x4157_retval\<^sub>v\<close>
definition \<open>bdrv_get_backing_filename_0x417f_retval \<equiv> bdrv_get_backing_filename_0x417f_retval\<^sub>v\<close>
definition \<open>dump_snapshots_0x4191_retval \<equiv> dump_snapshots_0x4191_retval\<^sub>v\<close>
definition \<open>bdrv_delete_0x4199_retval \<equiv> bdrv_delete_0x4199_retval\<^sub>v\<close>
definition \<open>get_human_readable_size_0x41d7_retval \<equiv> get_human_readable_size_0x41d7_retval\<^sub>v\<close>
definition \<open>puts_0x41e8_retval \<equiv> puts_0x41e8_retval\<^sub>v\<close>
definition \<open>path_combine_0x4208_retval \<equiv> path_combine_0x4208_retval\<^sub>v\<close>
definition \<open>printf_chk_0x4221_retval \<equiv> printf_chk_0x4221_retval\<^sub>v\<close>
definition \<open>printf_chk_0x4240_retval \<equiv> printf_chk_0x4240_retval\<^sub>v\<close>
definition \<open>error_0x4256_retval \<equiv> error_0x4256_retval\<^sub>v\<close>
definition \<open>error_0x4267_retval \<equiv> error_0x4267_retval\<^sub>v\<close>
definition \<open>stack_chk_fail_0x426c_retval \<equiv> stack_chk_fail_0x426c_retval\<^sub>v\<close>
definition \<open>error_0x427a_retval \<equiv> error_0x427a_retval\<^sub>v\<close>

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
  auto simp: block_usage_def eq_def setcc_def simp_rules Let'_def read_region'_def write_block'_def get'_def set'_def post regionset

method vcg_step uses assms =
  ((rule htriples)+, rule blocks)+,
  (simp add: assms pred_logic Ps Qs)?,
  (((auto simp: eq_def)[])+)?

method vcg_while for P :: state_pred uses assms =
  (rule htriples)+,
  rule HTriple_weaken[where P=P],
  simp add: pred_logic Ps Qs assms,
  rule HTriple_while

method vcg uses acode assms =
  subst acode,
  (vcg_step assms: assms)+

end

locale "img_info" = "qemu_img_xen" +
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

definition P_0x3fb0_0 :: state_pred where
  \<open>P_0x3fb0_0 \<sigma> \<equiv> RIP \<sigma> = 0x3fb0 \<and> RAX \<sigma> = RAX\<^sub>0 \<and> RBX \<sigma> = RBX\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = RDX\<^sub>0 \<and> RDI \<sigma> = RDI\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = RSP\<^sub>0 \<and> RBP \<sigma> = RBP\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = R13\<^sub>0 \<and> R12 \<sigma> = R12\<^sub>0 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address\<close>
declare P_0x3fb0_0_def[Ps]

definition P_0x3fb0_0_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3fb0_0_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x3fb0_0_regions :: state_pred where
  \<open>P_0x3fb0_0_regions \<sigma> \<equiv> \<exists>regions. P_0x3fb0_0_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x3fe8_0 :: state_pred where
  \<open>Q_0x3fe8_0 \<sigma> \<equiv> RIP \<sigma> = 0x3fe8 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x3fe8_0_def[Qs]

schematic_goal img_info_0_14_0x3fb0_0x3fe1_0[blocks]:
  assumes \<open>(P_0x3fb0_0 && P_0x3fb0_0_regions) \<sigma>\<close>
  shows \<open>exec_block 14 0x3fe1 0 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x3fe8_0 ?\<sigma> \<and> block_usage P_0x3fb0_0_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3fb0_0_def P_0x3fb0_0_regions_def post: Q_0x3fe8_0_def regionset: P_0x3fb0_0_regions_set_def)

definition P_0x3fe8_1 :: state_pred where
  \<open>P_0x3fe8_1 \<sigma> \<equiv> RIP \<sigma> = 0x3fe8 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x3fe8_1_def[Ps]

definition P_0x3fe8_1_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3fe8_1_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x3fe8_1_regions :: state_pred where
  \<open>P_0x3fe8_1_regions \<sigma> \<equiv> \<exists>regions. P_0x3fe8_1_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x3ff0_1 :: state_pred where
  \<open>Q_0x3ff0_1 \<sigma> \<equiv> RIP \<sigma> = 0x3ff0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x1d036 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x3ff0_1_def[Qs]

schematic_goal img_info_0_3_0x3fe8_0x3fee_1[blocks]:
  assumes \<open>(P_0x3fe8_1 && P_0x3fe8_1_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x3fee (Suc 0) \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x3ff0_1 ?\<sigma> \<and> block_usage P_0x3fe8_1_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3fe8_1_def P_0x3fe8_1_regions_def post: Q_0x3ff0_1_def regionset: P_0x3fe8_1_regions_set_def)

definition P_0x3ff0_2 :: state_pred where
  \<open>P_0x3ff0_2 \<sigma> \<equiv> RIP \<sigma> = 0x3ff0 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x1d036 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x3ff0_2_def[Ps]

definition P_0x3ff0_2_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3ff0_2_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x3ff0_2_regions :: state_pred where
  \<open>P_0x3ff0_2_regions \<sigma> \<equiv> \<exists>regions. P_0x3ff0_2_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_getopt_addr_0x3ff0_2 :: state_pred where
  \<open>Q_getopt_addr_0x3ff0_2 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa70) \<and> RIP \<sigma> = getopt_addr \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x1d036 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x3ff5\<close>
declare Q_getopt_addr_0x3ff0_2_def[Qs]

schematic_goal img_info_0_1_0x3ff0_0x3ff0_2[blocks]:
  assumes \<open>(P_0x3ff0_2 && P_0x3ff0_2_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x3ff0 2 \<sigma> \<triangleq> ?\<sigma> \<and> Q_getopt_addr_0x3ff0_2 ?\<sigma> \<and> block_usage P_0x3ff0_2_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3ff0_2_def P_0x3ff0_2_regions_def post: Q_getopt_addr_0x3ff0_2_def regionset: P_0x3ff0_2_regions_set_def)

definition P_0x3ff5_3 :: state_pred where
  \<open>P_0x3ff5_3 \<sigma> \<equiv> RIP \<sigma> = 0x3ff5 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x1d036 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x3ff5\<close>
declare P_0x3ff5_3_def[Ps]

definition P_0x3ff5_3_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3ff5_3_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x3ff5_3_regions :: state_pred where
  \<open>P_0x3ff5_3_regions \<sigma> \<equiv> \<exists>regions. P_0x3ff5_3_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x3ff8_3 :: state_pred where
  \<open>Q_0x3ff8_3 \<sigma> \<equiv> RIP \<sigma> = 0x3ff8 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x1d036 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x3ff5\<close>
declare Q_0x3ff8_3_def[Qs]

schematic_goal img_info_0_1_0x3ff5_0x3ff5_3[blocks]:
  assumes \<open>(P_0x3ff5_3 && P_0x3ff5_3_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x3ff5 3 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x3ff8_3 ?\<sigma> \<and> block_usage P_0x3ff5_3_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3ff5_3_def P_0x3ff5_3_regions_def post: Q_0x3ff8_3_def regionset: P_0x3ff5_3_regions_set_def)

definition P_0x3ff8_true_4 :: state_pred where
  \<open>P_0x3ff8_true_4 \<sigma> \<equiv> RIP \<sigma> = 0x3ff8 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x1d036 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x3ff5\<close>
declare P_0x3ff8_true_4_def[Ps]

definition P_0x3ff8_true_4_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3ff8_true_4_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x3ff8_true_4_regions :: state_pred where
  \<open>P_0x3ff8_true_4_regions \<sigma> \<equiv> \<exists>regions. P_0x3ff8_true_4_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x4020_4 :: state_pred where
  \<open>Q_0x4020_4 \<sigma> \<equiv> RIP \<sigma> = 0x4020 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x4020_4_def[Qs]

schematic_goal img_info_0_1_0x3ff8_0x3ff8_4[blocks]:
  assumes \<open>(P_0x3ff8_true_4 && P_0x3ff8_true_4_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x3ff8 4 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x4020_4 ?\<sigma> \<and> block_usage P_0x3ff8_true_4_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3ff8_true_4_def P_0x3ff8_true_4_regions_def post: Q_0x4020_4_def regionset: P_0x3ff8_true_4_regions_set_def)

definition P_0x3ff8_false_5 :: state_pred where
  \<open>P_0x3ff8_false_5 \<sigma> \<equiv> RIP \<sigma> = 0x3ff8 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x1d036 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x3ff5\<close>
declare P_0x3ff8_false_5_def[Ps]

definition P_0x3ff8_false_5_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3ff8_false_5_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x3ff8_false_5_regions :: state_pred where
  \<open>P_0x3ff8_false_5_regions \<sigma> \<equiv> \<exists>regions. P_0x3ff8_false_5_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x3ffd_5 :: state_pred where
  \<open>Q_0x3ffd_5 \<sigma> \<equiv> RIP \<sigma> = 0x3ffd \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x1d036 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x3ff5\<close>
declare Q_0x3ffd_5_def[Qs]

schematic_goal img_info_0_2_0x3ff8_0x3ffa_5[blocks]:
  assumes \<open>(P_0x3ff8_false_5 && P_0x3ff8_false_5_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x3ffa 5 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x3ffd_5 ?\<sigma> \<and> block_usage P_0x3ff8_false_5_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3ff8_false_5_def P_0x3ff8_false_5_regions_def post: Q_0x3ffd_5_def regionset: P_0x3ff8_false_5_regions_set_def)

definition P_0x3ffd_true_6 :: state_pred where
  \<open>P_0x3ffd_true_6 \<sigma> \<equiv> RIP \<sigma> = 0x3ffd \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x1d036 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x3ff5\<close>
declare P_0x3ffd_true_6_def[Ps]

definition P_0x3ffd_true_6_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3ffd_true_6_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x3ffd_true_6_regions :: state_pred where
  \<open>P_0x3ffd_true_6_regions \<sigma> \<equiv> \<exists>regions. P_0x3ffd_true_6_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x4013_6 :: state_pred where
  \<open>Q_0x4013_6 \<sigma> \<equiv> RIP \<sigma> = 0x4013 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x4013_6_def[Qs]

schematic_goal img_info_0_2_0x3ffd_0x4010_6[blocks]:
  assumes \<open>(P_0x3ffd_true_6 && P_0x3ffd_true_6_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x4010 6 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x4013_6 ?\<sigma> \<and> block_usage P_0x3ffd_true_6_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3ffd_true_6_def P_0x3ffd_true_6_regions_def post: Q_0x4013_6_def regionset: P_0x3ffd_true_6_regions_set_def)

definition P_0x4013_true_7 :: state_pred where
  \<open>P_0x4013_true_7 \<sigma> \<equiv> RIP \<sigma> = 0x4013 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x4013_true_7_def[Ps]

definition P_0x4013_true_7_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4013_true_7_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x4013_true_7_regions :: state_pred where
  \<open>P_0x4013_true_7_regions \<sigma> \<equiv> \<exists>regions. P_0x4013_true_7_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x3fe8_7 :: state_pred where
  \<open>Q_0x3fe8_7 \<sigma> \<equiv> RIP \<sigma> = 0x3fe8 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x3fe8_7_def[Qs]

schematic_goal img_info_0_1_0x4013_0x4013_7[blocks]:
  assumes \<open>(P_0x4013_true_7 && P_0x4013_true_7_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x4013 7 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x3fe8_7 ?\<sigma> \<and> block_usage P_0x4013_true_7_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4013_true_7_def P_0x4013_true_7_regions_def post: Q_0x3fe8_7_def regionset: P_0x4013_true_7_regions_set_def)

definition P_0x4013_false_8 :: state_pred where
  \<open>P_0x4013_false_8 \<sigma> \<equiv> RIP \<sigma> = 0x4013 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x4013_false_8_def[Ps]

definition P_0x4013_false_8_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4013_false_8_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x4013_false_8_regions :: state_pred where
  \<open>P_0x4013_false_8_regions \<sigma> \<equiv> \<exists>regions. P_0x4013_false_8_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x4015_8 :: state_pred where
  \<open>Q_0x4015_8 \<sigma> \<equiv> RIP \<sigma> = 0x4015 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x4015_8_def[Qs]

schematic_goal img_info_0_1_0x4013_0x4013_8[blocks]:
  assumes \<open>(P_0x4013_false_8 && P_0x4013_false_8_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x4013 8 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x4015_8 ?\<sigma> \<and> block_usage P_0x4013_false_8_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4013_false_8_def P_0x4013_false_8_regions_def post: Q_0x4015_8_def regionset: P_0x4013_false_8_regions_set_def)

definition P_0x3ffd_false_9 :: state_pred where
  \<open>P_0x3ffd_false_9 \<sigma> \<equiv> RIP \<sigma> = 0x3ffd \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = 0x1d036 \<and> RDI \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x3ff5\<close>
declare P_0x3ffd_false_9_def[Ps]

definition P_0x3ffd_false_9_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x3ffd_false_9_regions_set \<sigma> \<equiv> {
    (0, 0x2a2f0, 8),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x3ffd_false_9_regions :: state_pred where
  \<open>P_0x3ffd_false_9_regions \<sigma> \<equiv> \<exists>regions. P_0x3ffd_false_9_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x3fe8_9 :: state_pred where
  \<open>Q_0x3fe8_9 \<sigma> \<equiv> RIP \<sigma> = 0x3fe8 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x3fe8_9_def[Qs]

schematic_goal img_info_0_3_0x3ffd_0x4006_9[blocks]:
  assumes \<open>(P_0x3ffd_false_9 && P_0x3ffd_false_9_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x4006 9 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x3fe8_9 ?\<sigma> \<and> block_usage P_0x3ffd_false_9_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x3ffd_false_9_def P_0x3ffd_false_9_regions_def post: Q_0x3fe8_9_def regionset: P_0x3ffd_false_9_regions_set_def)

definition P_0x4015_10 :: state_pred where
  \<open>P_0x4015_10 \<sigma> \<equiv> RIP \<sigma> = 0x4015 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x4015_10_def[Ps]

definition P_0x4015_10_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4015_10_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x4015_10_regions :: state_pred where
  \<open>P_0x4015_10_regions \<sigma> \<equiv> \<exists>regions. P_0x4015_10_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_help_addr_0x4015_10 :: state_pred where
  \<open>Q_help_addr_0x4015_10 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa70) \<and> RIP \<sigma> = help_addr \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x401a\<close>
declare Q_help_addr_0x4015_10_def[Qs]

schematic_goal img_info_0_1_0x4015_0x4015_10[blocks]:
  assumes \<open>(P_0x4015_10 && P_0x4015_10_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x4015 10 \<sigma> \<triangleq> ?\<sigma> \<and> Q_help_addr_0x4015_10 ?\<sigma> \<and> block_usage P_0x4015_10_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4015_10_def P_0x4015_10_regions_def post: Q_help_addr_0x4015_10_def regionset: P_0x4015_10_regions_set_def)

definition P_0x401a_11 :: state_pred where
  \<open>P_0x401a_11 \<sigma> \<equiv> RIP \<sigma> = 0x401a \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x401a\<close>
declare P_0x401a_11_def[Ps]

definition P_0x401a_11_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x401a_11_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x401a_11_regions :: state_pred where
  \<open>P_0x401a_11_regions \<sigma> \<equiv> \<exists>regions. P_0x401a_11_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x4020_11 :: state_pred where
  \<open>Q_0x4020_11 \<sigma> \<equiv> RIP \<sigma> = 0x4020 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x401a\<close>
declare Q_0x4020_11_def[Qs]

schematic_goal img_info_0_1_0x401a_0x401a_11[blocks]:
  assumes \<open>(P_0x401a_11 && P_0x401a_11_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x401a 11 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x4020_11 ?\<sigma> \<and> block_usage P_0x401a_11_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x401a_11_def P_0x401a_11_regions_def post: Q_0x4020_11_def regionset: P_0x401a_11_regions_set_def)

definition P_0x4020_12 :: state_pred where
  \<open>P_0x4020_12 \<sigma> \<equiv> RIP \<sigma> = 0x4020 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x401a\<close>
declare P_0x4020_12_def[Ps]

definition P_0x4020_12_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4020_12_regions_set \<sigma> \<equiv> {
    (0, 0x2a2e8, 4),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x4020_12_regions :: state_pred where
  \<open>P_0x4020_12_regions \<sigma> \<equiv> \<exists>regions. P_0x4020_12_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x4029_12 :: state_pred where
  \<open>Q_0x4029_12 \<sigma> \<equiv> RIP \<sigma> = 0x4029 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x4029_12_def[Qs]

schematic_goal img_info_0_2_0x4020_0x4027_12[blocks]:
  assumes \<open>(P_0x4020_12 && P_0x4020_12_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x4027 12 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x4029_12 ?\<sigma> \<and> block_usage P_0x4020_12_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4020_12_def P_0x4020_12_regions_def post: Q_0x4029_12_def regionset: P_0x4020_12_regions_set_def)

definition P_0x4029_true_13 :: state_pred where
  \<open>P_0x4029_true_13 \<sigma> \<equiv> RIP \<sigma> = 0x4029 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x4029_true_13_def[Ps]

definition P_0x4029_true_13_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4029_true_13_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x4029_true_13_regions :: state_pred where
  \<open>P_0x4029_true_13_regions \<sigma> \<equiv> \<exists>regions. P_0x4029_true_13_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x4015_13 :: state_pred where
  \<open>Q_0x4015_13 \<sigma> \<equiv> RIP \<sigma> = 0x4015 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x4015_13_def[Qs]

schematic_goal img_info_0_1_0x4029_0x4029_13[blocks]:
  assumes \<open>(P_0x4029_true_13 && P_0x4029_true_13_regions && jge) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x4029 13 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x4015_13 ?\<sigma> \<and> block_usage P_0x4029_true_13_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4029_true_13_def P_0x4029_true_13_regions_def post: Q_0x4015_13_def regionset: P_0x4029_true_13_regions_set_def)

definition P_0x4029_false_14 :: state_pred where
  \<open>P_0x4029_false_14 \<sigma> \<equiv> RIP \<sigma> = 0x4029 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x4029_false_14_def[Ps]

definition P_0x4029_false_14_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4029_false_14_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x4029_false_14_regions :: state_pred where
  \<open>P_0x4029_false_14_regions \<sigma> \<equiv> \<exists>regions. P_0x4029_false_14_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x402b_14 :: state_pred where
  \<open>Q_0x402b_14 \<sigma> \<equiv> RIP \<sigma> = 0x402b \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x402b_14_def[Qs]

schematic_goal img_info_0_1_0x4029_0x4029_14[blocks]:
  assumes \<open>(P_0x4029_false_14 && P_0x4029_false_14_regions && ! jge) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x4029 14 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x402b_14 ?\<sigma> \<and> block_usage P_0x4029_false_14_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4029_false_14_def P_0x4029_false_14_regions_def post: Q_0x402b_14_def regionset: P_0x4029_false_14_regions_set_def)

definition P_0x4020_15 :: state_pred where
  \<open>P_0x4020_15 \<sigma> \<equiv> RIP \<sigma> = 0x4020 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x4020_15_def[Ps]

definition P_0x4020_15_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4020_15_regions_set \<sigma> \<equiv> {
    (0, 0x2a2e8, 4),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x4020_15_regions :: state_pred where
  \<open>P_0x4020_15_regions \<sigma> \<equiv> \<exists>regions. P_0x4020_15_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x4029_15 :: state_pred where
  \<open>Q_0x4029_15 \<sigma> \<equiv> RIP \<sigma> = 0x4029 \<and> RAX \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[0x2a2e8,4]::32 word))) 32 64::64 word) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a2e8,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a2e8,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x4029_15_def[Qs]

schematic_goal img_info_0_2_0x4020_0x4027_15[blocks]:
  assumes \<open>(P_0x4020_15 && P_0x4020_15_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x4027 15 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x4029_15 ?\<sigma> \<and> block_usage P_0x4020_15_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4020_15_def P_0x4020_15_regions_def post: Q_0x4029_15_def regionset: P_0x4020_15_regions_set_def)

definition P_0x4029_true_16 :: state_pred where
  \<open>P_0x4029_true_16 \<sigma> \<equiv> RIP \<sigma> = 0x4029 \<and> RAX \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[0x2a2e8,4]::32 word))) 32 64::64 word) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a2e8,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a2e8,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x4029_true_16_def[Ps]

definition P_0x4029_true_16_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4029_true_16_regions_set \<sigma> \<equiv> {
    (0, 0x2a2e8, 4),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x4029_true_16_regions :: state_pred where
  \<open>P_0x4029_true_16_regions \<sigma> \<equiv> \<exists>regions. P_0x4029_true_16_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x4015_16 :: state_pred where
  \<open>Q_0x4015_16 \<sigma> \<equiv> RIP \<sigma> = 0x4015 \<and> RAX \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[0x2a2e8,4]::32 word))) 32 64::64 word) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a2e8,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a2e8,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x4015_16_def[Qs]

schematic_goal img_info_0_1_0x4029_0x4029_16[blocks]:
  assumes \<open>(P_0x4029_true_16 && P_0x4029_true_16_regions && jge) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x4029 16 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x4015_16 ?\<sigma> \<and> block_usage P_0x4029_true_16_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4029_true_16_def P_0x4029_true_16_regions_def post: Q_0x4015_16_def regionset: P_0x4029_true_16_regions_set_def)

definition P_0x4015_17 :: state_pred where
  \<open>P_0x4015_17 \<sigma> \<equiv> RIP \<sigma> = 0x4015 \<and> RAX \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[0x2a2e8,4]::32 word))) 32 64::64 word) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a2e8,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a2e8,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x4015_17_def[Ps]

definition P_0x4015_17_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4015_17_regions_set \<sigma> \<equiv> {
    (0, 0x2a2e8, 4),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x4015_17_regions :: state_pred where
  \<open>P_0x4015_17_regions \<sigma> \<equiv> \<exists>regions. P_0x4015_17_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_help_addr_0x4015_17 :: state_pred where
  \<open>Q_help_addr_0x4015_17 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa70) \<and> RIP \<sigma> = help_addr \<and> RAX \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[0x2a2e8,4]::32 word))) 32 64::64 word) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a2e8,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a2e8,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x401a\<close>
declare Q_help_addr_0x4015_17_def[Qs]

schematic_goal img_info_0_1_0x4015_0x4015_17[blocks]:
  assumes \<open>(P_0x4015_17 && P_0x4015_17_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x4015 17 \<sigma> \<triangleq> ?\<sigma> \<and> Q_help_addr_0x4015_17 ?\<sigma> \<and> block_usage P_0x4015_17_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4015_17_def P_0x4015_17_regions_def post: Q_help_addr_0x4015_17_def regionset: P_0x4015_17_regions_set_def)

definition P_0x401a_18 :: state_pred where
  \<open>P_0x401a_18 \<sigma> \<equiv> RIP \<sigma> = 0x401a \<and> RAX \<sigma> = help_0x4015_retval \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a2e8,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a2e8,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x401a\<close>
declare P_0x401a_18_def[Ps]

definition P_0x401a_18_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x401a_18_regions_set \<sigma> \<equiv> {
    (0, 0x2a2e8, 4),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x401a_18_regions :: state_pred where
  \<open>P_0x401a_18_regions \<sigma> \<equiv> \<exists>regions. P_0x401a_18_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x4020_18 :: state_pred where
  \<open>Q_0x4020_18 \<sigma> \<equiv> RIP \<sigma> = 0x4020 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x4020_18_def[Qs]

schematic_goal img_info_0_1_0x401a_0x401a_18[blocks]:
  assumes \<open>(P_0x401a_18 && P_0x401a_18_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x401a 18 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x4020_18 ?\<sigma> \<and> block_usage P_0x401a_18_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x401a_18_def P_0x401a_18_regions_def post: Q_0x4020_18_def regionset: P_0x401a_18_regions_set_def)

definition P_0x4029_false_19 :: state_pred where
  \<open>P_0x4029_false_19 \<sigma> \<equiv> RIP \<sigma> = 0x4029 \<and> RAX \<sigma> = (sextend (ucast ((\<sigma> \<turnstile> *[0x2a2e8,4]::32 word))) 32 64::64 word) \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a2e8,4]::32 word) = ucast ((\<sigma> \<turnstile> *[0x2a2e8,4]::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x4029_false_19_def[Ps]

definition P_0x4029_false_19_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4029_false_19_regions_set \<sigma> \<equiv> {
    (0, 0x2a2e8, 4),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x4029_false_19_regions :: state_pred where
  \<open>P_0x4029_false_19_regions \<sigma> \<equiv> \<exists>regions. P_0x4029_false_19_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x402b_19 :: state_pred where
  \<open>Q_0x402b_19 \<sigma> \<equiv> RIP \<sigma> = 0x402b \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x402b_19_def[Qs]

schematic_goal img_info_0_1_0x4029_0x4029_19[blocks]:
  assumes \<open>(P_0x4029_false_19 && P_0x4029_false_19_regions && ! jge) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x4029 19 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x402b_19 ?\<sigma> \<and> block_usage P_0x4029_false_19_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4029_false_19_def P_0x4029_false_19_regions_def post: Q_0x402b_19_def regionset: P_0x4029_false_19_regions_set_def)

definition P_0x402b_20 :: state_pred where
  \<open>P_0x402b_20 \<sigma> \<equiv> RIP \<sigma> = 0x402b \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> RBP \<sigma> = ucast ((\<langle>31,0\<rangle>RDI\<^sub>0::32 word)) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x402b_20_def[Ps]

definition P_0x402b_20_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x402b_20_regions_set \<sigma> \<equiv> {
    (0, 0x2a2e8, 4),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x8)::64 word)), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8)
  }\<close>

definition P_0x402b_20_regions :: state_pred where
  \<open>P_0x402b_20_regions \<sigma> \<equiv> \<exists>regions. P_0x402b_20_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x403f_20 :: state_pred where
  \<open>Q_0x403f_20 \<sigma> \<equiv> RIP \<sigma> = 0x403f \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RAX \<sigma>::64 word) + 0x1)::32 word)) \<and> RDI \<sigma> = 0x20c62 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a2e8,4]::32 word) = ucast ((\<langle>31,0\<rangle>((RAX \<sigma>::64 word) + 0x1)::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_0x403f_20_def[Qs]

schematic_goal img_info_0_4_0x402b_0x403b_20[blocks]:
  assumes \<open>(P_0x402b_20 && P_0x402b_20_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x403b 20 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x403f_20 ?\<sigma> \<and> block_usage P_0x402b_20_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x402b_20_def P_0x402b_20_regions_def post: Q_0x403f_20_def regionset: P_0x402b_20_regions_set_def)

definition P_0x403f_21 :: state_pred where
  \<open>P_0x403f_21 \<sigma> \<equiv> RIP \<sigma> = 0x403f \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDX \<sigma> = ucast ((\<langle>31,0\<rangle>((RAX \<sigma>::64 word) + 0x1)::32 word)) \<and> RDI \<sigma> = 0x20c62 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> RBP \<sigma> = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[0x2a2e8,4]::32 word) = ucast ((\<langle>31,0\<rangle>((RAX \<sigma>::64 word) + 0x1)::32 word)) \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) = (\<sigma> \<turnstile> *[((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x8)::64 word)),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare P_0x403f_21_def[Ps]

definition P_0x403f_21_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x403f_21_regions_set \<sigma> \<equiv> {
    (0, 0x2a2e8, 4),
    (1, RSP\<^sub>0, 8),
    (2, ((FS\<^sub>0::64 word) + 0x28), 8),
    (3, ((RSI\<^sub>0::64 word) + (\<langle>63,0\<rangle>((RAX \<sigma>::64 word) * 0x8)::64 word)), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (9, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x403f_21_regions :: state_pred where
  \<open>P_0x403f_21_regions \<sigma> \<equiv> \<exists>regions. P_0x403f_21_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_new_addr_0x403f_21 :: state_pred where
  \<open>Q_bdrv_new_addr_0x403f_21 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa70) \<and> RIP \<sigma> = bdrv_new_addr \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = 0x20c62 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4044\<close>
declare Q_bdrv_new_addr_0x403f_21_def[Qs]

schematic_goal img_info_0_1_0x403f_0x403f_21[blocks]:
  assumes \<open>(P_0x403f_21 && P_0x403f_21_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x403f 21 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_new_addr_0x403f_21 ?\<sigma> \<and> block_usage P_0x403f_21_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x403f_21_def P_0x403f_21_regions_def post: Q_bdrv_new_addr_0x403f_21_def regionset: P_0x403f_21_regions_set_def)

definition P_0x4044_22 :: state_pred where
  \<open>P_0x4044_22 \<sigma> \<equiv> RIP \<sigma> = 0x4044 \<and> RBX \<sigma> = RSI\<^sub>0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = 0x20c62 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4044\<close>
declare P_0x4044_22_def[Ps]

definition P_0x4044_22_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4044_22_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x4044_22_regions :: state_pred where
  \<open>P_0x4044_22_regions \<sigma> \<equiv> \<exists>regions. P_0x4044_22_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x404a_22 :: state_pred where
  \<open>Q_0x404a_22 \<sigma> \<equiv> RIP \<sigma> = 0x404a \<and> RBX \<sigma> = RAX \<sigma> \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = 0x20c62 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4044\<close>
declare Q_0x404a_22_def[Qs]

schematic_goal img_info_0_2_0x4044_0x4047_22[blocks]:
  assumes \<open>(P_0x4044_22 && P_0x4044_22_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x4047 22 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x404a_22 ?\<sigma> \<and> block_usage P_0x4044_22_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4044_22_def P_0x4044_22_regions_def post: Q_0x404a_22_def regionset: P_0x4044_22_regions_set_def)

definition P_0x404a_true_23 :: state_pred where
  \<open>P_0x404a_true_23 \<sigma> \<equiv> RIP \<sigma> = 0x404a \<and> RBX \<sigma> = RAX \<sigma> \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = 0x20c62 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4044\<close>
declare P_0x404a_true_23_def[Ps]

definition P_0x404a_true_23_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x404a_true_23_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x404a_true_23_regions :: state_pred where
  \<open>P_0x404a_true_23_regions \<sigma> \<equiv> \<exists>regions. P_0x404a_true_23_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x427a_23 :: state_pred where
  \<open>Q_0x427a_23 \<sigma> \<equiv> RIP \<sigma> = 0x427a \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = 0x1d03a \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4044\<close>
declare Q_0x427a_23_def[Qs]

schematic_goal img_info_0_3_0x404a_0x4278_23[blocks]:
  assumes \<open>(P_0x404a_true_23 && P_0x404a_true_23_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x4278 23 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x427a_23 ?\<sigma> \<and> block_usage P_0x404a_true_23_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x404a_true_23_def P_0x404a_true_23_regions_def post: Q_0x427a_23_def regionset: P_0x404a_true_23_regions_set_def)

definition P_0x427a_24 :: state_pred where
  \<open>P_0x427a_24 \<sigma> \<equiv> RIP \<sigma> = 0x427a \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = 0x1d03a \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4044\<close>
declare P_0x427a_24_def[Ps]

definition P_0x427a_24_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x427a_24_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x427a_24_regions :: state_pred where
  \<open>P_0x427a_24_regions \<sigma> \<equiv> \<exists>regions. P_0x427a_24_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_error_addr_0x427a_24 :: state_pred where
  \<open>Q_error_addr_0x427a_24 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa70) \<and> RIP \<sigma> = error_addr \<and> RAX \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_error_addr_0x427a_24_def[Qs]

schematic_goal img_info_0_1_0x427a_0x427a_24[blocks]:
  assumes \<open>(P_0x427a_24 && P_0x427a_24_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x427a 24 \<sigma> \<triangleq> ?\<sigma> \<and> Q_error_addr_0x427a_24 ?\<sigma> \<and> block_usage P_0x427a_24_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x427a_24_def P_0x427a_24_regions_def post: Q_error_addr_0x427a_24_def regionset: P_0x427a_24_regions_set_def)

definition P_0x404a_false_25 :: state_pred where
  \<open>P_0x404a_false_25 \<sigma> \<equiv> RIP \<sigma> = 0x404a \<and> RBX \<sigma> = RAX \<sigma> \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = 0x20c62 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4044\<close>
declare P_0x404a_false_25_def[Ps]

definition P_0x404a_false_25_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x404a_false_25_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x404a_false_25_regions :: state_pred where
  \<open>P_0x404a_false_25_regions \<sigma> \<equiv> \<exists>regions. P_0x404a_false_25_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x4053_25 :: state_pred where
  \<open>Q_0x4053_25 \<sigma> \<equiv> RIP \<sigma> = 0x4053 \<and> RBX \<sigma> = RAX \<sigma> \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = 0x20c62 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4044\<close>
declare Q_0x4053_25_def[Qs]

schematic_goal img_info_0_2_0x404a_0x4050_25[blocks]:
  assumes \<open>(P_0x404a_false_25 && P_0x404a_false_25_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x4050 25 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x4053_25 ?\<sigma> \<and> block_usage P_0x404a_false_25_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x404a_false_25_def P_0x404a_false_25_regions_def post: Q_0x4053_25_def regionset: P_0x404a_false_25_regions_set_def)

definition P_0x4053_true_26 :: state_pred where
  \<open>P_0x4053_true_26 \<sigma> \<equiv> RIP \<sigma> = 0x4053 \<and> RBX \<sigma> = RAX \<sigma> \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = 0x20c62 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4044\<close>
declare P_0x4053_true_26_def[Ps]

definition P_0x4053_true_26_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4053_true_26_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x4053_true_26_regions :: state_pred where
  \<open>P_0x4053_true_26_regions \<sigma> \<equiv> \<exists>regions. P_0x4053_true_26_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x406d_26 :: state_pred where
  \<open>Q_0x406d_26 \<sigma> \<equiv> RIP \<sigma> = 0x406d \<and> RBX \<sigma> = RAX \<sigma> \<and> RCX \<sigma> = 0x0 \<and> RDI \<sigma> = 0x20c62 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4044\<close>
declare Q_0x406d_26_def[Qs]

schematic_goal img_info_0_3_0x4053_0x422d_26[blocks]:
  assumes \<open>(P_0x4053_true_26 && P_0x4053_true_26_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 3 0x422d 26 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x406d_26 ?\<sigma> \<and> block_usage P_0x4053_true_26_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4053_true_26_def P_0x4053_true_26_regions_def post: Q_0x406d_26_def regionset: P_0x4053_true_26_regions_set_def)

definition P_0x406d_27 :: state_pred where
  \<open>P_0x406d_27 \<sigma> \<equiv> RIP \<sigma> = 0x406d \<and> RBX \<sigma> = RAX \<sigma> \<and> RCX \<sigma> = 0x0 \<and> RDI \<sigma> = 0x20c62 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4044\<close>
declare P_0x406d_27_def[Ps]

definition P_0x406d_27_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x406d_27_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x406d_27_regions :: state_pred where
  \<open>P_0x406d_27_regions \<sigma> \<equiv> \<exists>regions. P_0x406d_27_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x4078_27 :: state_pred where
  \<open>Q_0x4078_27 \<sigma> \<equiv> RIP \<sigma> = 0x4078 \<and> RBX \<sigma> = RAX \<sigma> \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = RAX \<sigma> \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4044\<close>
declare Q_0x4078_27_def[Qs]

schematic_goal img_info_0_3_0x406d_0x4075_27[blocks]:
  assumes \<open>(P_0x406d_27 && P_0x406d_27_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x4075 27 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x4078_27 ?\<sigma> \<and> block_usage P_0x406d_27_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x406d_27_def P_0x406d_27_regions_def post: Q_0x4078_27_def regionset: P_0x406d_27_regions_set_def)

definition P_0x4078_28 :: state_pred where
  \<open>P_0x4078_28 \<sigma> \<equiv> RIP \<sigma> = 0x4078 \<and> RBX \<sigma> = RAX \<sigma> \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = RAX \<sigma> \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4044\<close>
declare P_0x4078_28_def[Ps]

definition P_0x4078_28_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4078_28_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x4078_28_regions :: state_pred where
  \<open>P_0x4078_28_regions \<sigma> \<equiv> \<exists>regions. P_0x4078_28_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_open2_addr_0x4078_28 :: state_pred where
  \<open>Q_bdrv_open2_addr_0x4078_28 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa70) \<and> RIP \<sigma> = bdrv_open2_addr \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = 0x40 \<and> RSI \<sigma> = RBP \<sigma> \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x407d\<close>
declare Q_bdrv_open2_addr_0x4078_28_def[Qs]

schematic_goal img_info_0_1_0x4078_0x4078_28[blocks]:
  assumes \<open>(P_0x4078_28 && P_0x4078_28_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x4078 28 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_open2_addr_0x4078_28 ?\<sigma> \<and> block_usage P_0x4078_28_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4078_28_def P_0x4078_28_regions_def post: Q_bdrv_open2_addr_0x4078_28_def regionset: P_0x4078_28_regions_set_def)

definition P_0x407d_29 :: state_pred where
  \<open>P_0x407d_29 \<sigma> \<equiv> RIP \<sigma> = 0x407d \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = 0x40 \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x407d\<close>
declare P_0x407d_29_def[Ps]

definition P_0x407d_29_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x407d_29_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x407d_29_regions :: state_pred where
  \<open>P_0x407d_29_regions \<sigma> \<equiv> \<exists>regions. P_0x407d_29_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x407f_29 :: state_pred where
  \<open>Q_0x407f_29 \<sigma> \<equiv> RIP \<sigma> = 0x407f \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = 0x40 \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x407d\<close>
declare Q_0x407f_29_def[Qs]

schematic_goal img_info_0_1_0x407d_0x407d_29[blocks]:
  assumes \<open>(P_0x407d_29 && P_0x407d_29_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x407d 29 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x407f_29 ?\<sigma> \<and> block_usage P_0x407d_29_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x407d_29_def P_0x407d_29_regions_def post: Q_0x407f_29_def regionset: P_0x407d_29_regions_set_def)

definition P_0x407f_true_30 :: state_pred where
  \<open>P_0x407f_true_30 \<sigma> \<equiv> RIP \<sigma> = 0x407f \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = 0x40 \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x407d\<close>
declare P_0x407f_true_30_def[Ps]

definition P_0x407f_true_30_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x407f_true_30_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x407f_true_30_regions :: state_pred where
  \<open>P_0x407f_true_30_regions \<sigma> \<equiv> \<exists>regions. P_0x407f_true_30_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x4267_30 :: state_pred where
  \<open>Q_0x4267_30 \<sigma> \<equiv> RIP \<sigma> = 0x4267 \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = 0x1d065 \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x407d\<close>
declare Q_0x4267_30_def[Qs]

schematic_goal img_info_0_4_0x407f_0x4265_30[blocks]:
  assumes \<open>(P_0x407f_true_30 && P_0x407f_true_30_regions && SF) \<sigma>\<close>
  shows \<open>exec_block 4 0x4265 30 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x4267_30 ?\<sigma> \<and> block_usage P_0x407f_true_30_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x407f_true_30_def P_0x407f_true_30_regions_def post: Q_0x4267_30_def regionset: P_0x407f_true_30_regions_set_def)

definition P_0x4267_31 :: state_pred where
  \<open>P_0x4267_31 \<sigma> \<equiv> RIP \<sigma> = 0x4267 \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = 0x1d065 \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x407d\<close>
declare P_0x4267_31_def[Ps]

definition P_0x4267_31_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4267_31_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x4267_31_regions :: state_pred where
  \<open>P_0x4267_31_regions \<sigma> \<equiv> \<exists>regions. P_0x4267_31_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_error_addr_0x4267_31 :: state_pred where
  \<open>Q_error_addr_0x4267_31 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa70) \<and> RIP \<sigma> = error_addr \<and> RAX \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_error_addr_0x4267_31_def[Qs]

schematic_goal img_info_0_1_0x4267_0x4267_31[blocks]:
  assumes \<open>(P_0x4267_31 && P_0x4267_31_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x4267 31 \<sigma> \<triangleq> ?\<sigma> \<and> Q_error_addr_0x4267_31 ?\<sigma> \<and> block_usage P_0x4267_31_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4267_31_def P_0x4267_31_regions_def post: Q_error_addr_0x4267_31_def regionset: P_0x4267_31_regions_set_def)

definition P_0x407f_false_32 :: state_pred where
  \<open>P_0x407f_false_32 \<sigma> \<equiv> RIP \<sigma> = 0x407f \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = 0x40 \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x407d\<close>
declare P_0x407f_false_32_def[Ps]

definition P_0x407f_false_32_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x407f_false_32_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x407f_false_32_regions :: state_pred where
  \<open>P_0x407f_false_32_regions \<sigma> \<equiv> \<exists>regions. P_0x407f_false_32_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x40a0_32 :: state_pred where
  \<open>Q_0x40a0_32 \<sigma> \<equiv> RIP \<sigma> = 0x40a0 \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = 0x80 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x407d\<close>
declare Q_0x40a0_32_def[Qs]

schematic_goal img_info_0_6_0x407f_0x4098_32[blocks]:
  assumes \<open>(P_0x407f_false_32 && P_0x407f_false_32_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 6 0x4098 32 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x40a0_32 ?\<sigma> \<and> block_usage P_0x407f_false_32_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x407f_false_32_def P_0x407f_false_32_regions_def post: Q_0x40a0_32_def regionset: P_0x407f_false_32_regions_set_def)

definition P_0x40a0_33 :: state_pred where
  \<open>P_0x40a0_33 \<sigma> \<equiv> RIP \<sigma> = 0x40a0 \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = 0x80 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x407d\<close>
declare P_0x40a0_33_def[Ps]

definition P_0x40a0_33_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x40a0_33_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x40a0_33_regions :: state_pred where
  \<open>P_0x40a0_33_regions \<sigma> \<equiv> \<exists>regions. P_0x40a0_33_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_get_format_addr_0x40a0_33 :: state_pred where
  \<open>Q_bdrv_get_format_addr_0x40a0_33 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa70) \<and> RIP \<sigma> = bdrv_get_format_addr \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = 0x80 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x40a5\<close>
declare Q_bdrv_get_format_addr_0x40a0_33_def[Qs]

schematic_goal img_info_0_1_0x40a0_0x40a0_33[blocks]:
  assumes \<open>(P_0x40a0_33 && P_0x40a0_33_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x40a0 33 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_get_format_addr_0x40a0_33 ?\<sigma> \<and> block_usage P_0x40a0_33_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x40a0_33_def P_0x40a0_33_regions_def post: Q_bdrv_get_format_addr_0x40a0_33_def regionset: P_0x40a0_33_regions_set_def)

definition P_0x40a5_34 :: state_pred where
  \<open>P_0x40a5_34 \<sigma> \<equiv> RIP \<sigma> = 0x40a5 \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = 0x80 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x40a5\<close>
declare P_0x40a5_34_def[Ps]

definition P_0x40a5_34_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x40a5_34_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x40a5_34_regions :: state_pred where
  \<open>P_0x40a5_34_regions \<sigma> \<equiv> \<exists>regions. P_0x40a5_34_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x40ad_34 :: state_pred where
  \<open>Q_0x40ad_34 \<sigma> \<equiv> RIP \<sigma> = 0x40ad \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = 0x80 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0xa60) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x40a5\<close>
declare Q_0x40ad_34_def[Qs]

schematic_goal img_info_0_2_0x40a5_0x40aa_34[blocks]:
  assumes \<open>(P_0x40a5_34 && P_0x40a5_34_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x40aa 34 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x40ad_34 ?\<sigma> \<and> block_usage P_0x40a5_34_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x40a5_34_def P_0x40a5_34_regions_def post: Q_0x40ad_34_def regionset: P_0x40a5_34_regions_set_def)

definition P_0x40ad_35 :: state_pred where
  \<open>P_0x40ad_35 \<sigma> \<equiv> RIP \<sigma> = 0x40ad \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = 0x80 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0xa60) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x40a5\<close>
declare P_0x40ad_35_def[Ps]

definition P_0x40ad_35_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x40ad_35_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x40ad_35_regions :: state_pred where
  \<open>P_0x40ad_35_regions \<sigma> \<equiv> \<exists>regions. P_0x40ad_35_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_get_geometry_addr_0x40ad_35 :: state_pred where
  \<open>Q_bdrv_get_geometry_addr_0x40ad_35 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa70) \<and> RIP \<sigma> = bdrv_get_geometry_addr \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = 0x80 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0xa60) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x40b2\<close>
declare Q_bdrv_get_geometry_addr_0x40ad_35_def[Qs]

schematic_goal img_info_0_1_0x40ad_0x40ad_35[blocks]:
  assumes \<open>(P_0x40ad_35 && P_0x40ad_35_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x40ad 35 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_get_geometry_addr_0x40ad_35 ?\<sigma> \<and> block_usage P_0x40ad_35_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x40ad_35_def P_0x40ad_35_regions_def post: Q_bdrv_get_geometry_addr_0x40ad_35_def regionset: P_0x40ad_35_regions_set_def)

definition P_0x40b2_36 :: state_pred where
  \<open>P_0x40b2_36 \<sigma> \<equiv> RIP \<sigma> = 0x40b2 \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = 0x80 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0xa60) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x40b2\<close>
declare P_0x40b2_36_def[Ps]

definition P_0x40b2_36_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x40b2_36_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x40b2_36_regions :: state_pred where
  \<open>P_0x40b2_36_regions \<sigma> \<equiv> \<exists>regions. P_0x40b2_36_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x40c3_36 :: state_pred where
  \<open>Q_0x40c3_36 \<sigma> \<equiv> RIP \<sigma> = 0x40c3 \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x40b2\<close>
declare Q_0x40c3_36_def[Qs]

schematic_goal img_info_0_4_0x40b2_0x40bf_36[blocks]:
  assumes \<open>(P_0x40b2_36 && P_0x40b2_36_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x40bf 36 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x40c3_36 ?\<sigma> \<and> block_usage P_0x40b2_36_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x40b2_36_def P_0x40b2_36_regions_def post: Q_0x40c3_36_def regionset: P_0x40b2_36_regions_set_def)

definition P_0x40c3_37 :: state_pred where
  \<open>P_0x40c3_37 \<sigma> \<equiv> RIP \<sigma> = 0x40c3 \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x40b2\<close>
declare P_0x40c3_37_def[Ps]

definition P_0x40c3_37_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x40c3_37_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x40c3_37_regions :: state_pred where
  \<open>P_0x40c3_37_regions \<sigma> \<equiv> \<exists>regions. P_0x40c3_37_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_get_human_readable_size_addr_0x40c3_37 :: state_pred where
  \<open>Q_get_human_readable_size_addr_0x40c3_37 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa70) \<and> RIP \<sigma> = get_human_readable_size_addr \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> RSI \<sigma> = 0x80 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x40c8\<close>
declare Q_get_human_readable_size_addr_0x40c3_37_def[Qs]

schematic_goal img_info_0_1_0x40c3_0x40c3_37[blocks]:
  assumes \<open>(P_0x40c3_37 && P_0x40c3_37_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x40c3 37 \<sigma> \<triangleq> ?\<sigma> \<and> Q_get_human_readable_size_addr_0x40c3_37 ?\<sigma> \<and> block_usage P_0x40c3_37_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x40c3_37_def P_0x40c3_37_regions_def post: Q_get_human_readable_size_addr_0x40c3_37_def regionset: P_0x40c3_37_regions_set_def)

definition P_0x40c8_38 :: state_pred where
  \<open>P_0x40c8_38 \<sigma> \<equiv> RIP \<sigma> = 0x40c8 \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x40c8\<close>
declare P_0x40c8_38_def[Ps]

definition P_0x40c8_38_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x40c8_38_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x40c8_38_regions :: state_pred where
  \<open>P_0x40c8_38_regions \<sigma> \<equiv> \<exists>regions. P_0x40c8_38_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x40d5_38 :: state_pred where
  \<open>Q_0x40d5_38 \<sigma> \<equiv> RIP \<sigma> = 0x40d5 \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0xa48) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x40c8\<close>
declare Q_0x40d5_38_def[Qs]

schematic_goal img_info_0_3_0x40c8_0x40d0_38[blocks]:
  assumes \<open>(P_0x40c8_38 && P_0x40c8_38_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x40d0 38 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x40d5_38 ?\<sigma> \<and> block_usage P_0x40c8_38_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x40c8_38_def P_0x40c8_38_regions_def post: Q_0x40d5_38_def regionset: P_0x40c8_38_regions_set_def)

definition P_0x40d5_39 :: state_pred where
  \<open>P_0x40d5_39 \<sigma> \<equiv> RIP \<sigma> = 0x40d5 \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0xa48) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x40c8\<close>
declare P_0x40d5_39_def[Ps]

definition P_0x40d5_39_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x40d5_39_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x40d5_39_regions :: state_pred where
  \<open>P_0x40d5_39_regions \<sigma> \<equiv> \<exists>regions. P_0x40d5_39_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_xstat64_addr_0x40d5_39 :: state_pred where
  \<open>Q_xstat64_addr_0x40d5_39 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa70) \<and> RIP \<sigma> = xstat64_addr \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0xa48) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = RBP \<sigma> \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x40da\<close>
declare Q_xstat64_addr_0x40d5_39_def[Qs]

schematic_goal img_info_0_1_0x40d5_0x40d5_39[blocks]:
  assumes \<open>(P_0x40d5_39 && P_0x40d5_39_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x40d5 39 \<sigma> \<triangleq> ?\<sigma> \<and> Q_xstat64_addr_0x40d5_39 ?\<sigma> \<and> block_usage P_0x40d5_39_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x40d5_39_def P_0x40d5_39_regions_def post: Q_xstat64_addr_0x40d5_39_def regionset: P_0x40d5_39_regions_set_def)

definition P_0x40da_40 :: state_pred where
  \<open>P_0x40da_40 \<sigma> \<equiv> RIP \<sigma> = 0x40da \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0xa48) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x40da\<close>
declare P_0x40da_40_def[Ps]

definition P_0x40da_40_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x40da_40_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x40da_40_regions :: state_pred where
  \<open>P_0x40da_40_regions \<sigma> \<equiv> \<exists>regions. P_0x40da_40_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x40dc_40 :: state_pred where
  \<open>Q_0x40dc_40 \<sigma> \<equiv> RIP \<sigma> = 0x40dc \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0xa48) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x40da\<close>
declare Q_0x40dc_40_def[Qs]

schematic_goal img_info_0_1_0x40da_0x40da_40[blocks]:
  assumes \<open>(P_0x40da_40 && P_0x40da_40_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x40da 40 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x40dc_40 ?\<sigma> \<and> block_usage P_0x40da_40_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x40da_40_def P_0x40da_40_regions_def post: Q_0x40dc_40_def regionset: P_0x40da_40_regions_set_def)

definition P_0x40dc_true_41 :: state_pred where
  \<open>P_0x40dc_true_41 \<sigma> \<equiv> RIP \<sigma> = 0x40dc \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0xa48) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x40da\<close>
declare P_0x40dc_true_41_def[Ps]

definition P_0x40dc_true_41_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x40dc_true_41_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x8b0), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x8b8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x40dc_true_41_regions :: state_pred where
  \<open>P_0x40dc_true_41_regions \<sigma> \<equiv> \<exists>regions. P_0x40dc_true_41_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x4112_41 :: state_pred where
  \<open>Q_0x4112_41 \<sigma> \<equiv> RIP \<sigma> = 0x4112 \<and> RCX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word)\<close>
declare Q_0x4112_41_def[Qs]

schematic_goal img_info_0_5_0x40dc_0x410a_41[blocks]:
  assumes \<open>(P_0x40dc_true_41 && P_0x40dc_true_41_regions && SF) \<sigma>\<close>
  shows \<open>exec_block 5 0x410a 41 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x4112_41 ?\<sigma> \<and> block_usage P_0x40dc_true_41_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x40dc_true_41_def P_0x40dc_true_41_regions_def post: Q_0x4112_41_def regionset: P_0x40dc_true_41_regions_set_def)

definition P_0x40dc_false_42 :: state_pred where
  \<open>P_0x40dc_false_42 \<sigma> \<equiv> RIP \<sigma> = 0x40dc \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0xa48) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x40da\<close>
declare P_0x40dc_false_42_def[Ps]

definition P_0x40dc_false_42_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x40dc_false_42_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa08), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x40dc_false_42_regions :: state_pred where
  \<open>P_0x40dc_false_42_regions \<sigma> \<equiv> \<exists>regions. P_0x40dc_false_42_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x40e7_42 :: state_pred where
  \<open>Q_0x40e7_42 \<sigma> \<equiv> RIP \<sigma> = 0x40e7 \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa08),8]::64 word) << 9) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa08),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa08),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x40da\<close>
declare Q_0x40e7_42_def[Qs]

schematic_goal img_info_0_3_0x40dc_0x40e3_42[blocks]:
  assumes \<open>(P_0x40dc_false_42 && P_0x40dc_false_42_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 3 0x40e3 42 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x40e7_42 ?\<sigma> \<and> block_usage P_0x40dc_false_42_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x40dc_false_42_def P_0x40dc_false_42_regions_def post: Q_0x40e7_42_def regionset: P_0x40dc_false_42_regions_set_def)

definition P_0x40e7_true_43 :: state_pred where
  \<open>P_0x40e7_true_43 \<sigma> \<equiv> RIP \<sigma> = 0x40e7 \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa08),8]::64 word) << 9) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa08),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa08),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x40da\<close>
declare P_0x40e7_true_43_def[Ps]

definition P_0x40e7_true_43_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x40e7_true_43_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa08), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x40e7_true_43_regions :: state_pred where
  \<open>P_0x40e7_true_43_regions \<sigma> \<equiv> \<exists>regions. P_0x40e7_true_43_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x41d7_43 :: state_pred where
  \<open>Q_0x41d7_43 \<sigma> \<equiv> RIP \<sigma> = 0x41d7 \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa08),8]::64 word) << 9) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa08),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa08),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x40da\<close>
declare Q_0x41d7_43_def[Qs]

schematic_goal img_info_0_4_0x40e7_0x41d4_43[blocks]:
  assumes \<open>(P_0x40e7_true_43 && P_0x40e7_true_43_regions && !SF) \<sigma>\<close>
  shows \<open>exec_block 4 0x41d4 43 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x41d7_43 ?\<sigma> \<and> block_usage P_0x40e7_true_43_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x40e7_true_43_def P_0x40e7_true_43_regions_def post: Q_0x41d7_43_def regionset: P_0x40e7_true_43_regions_set_def)

definition P_0x41d7_44 :: state_pred where
  \<open>P_0x41d7_44 \<sigma> \<equiv> RIP \<sigma> = 0x41d7 \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa08),8]::64 word) << 9) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa08),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa08),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x40da\<close>
declare P_0x41d7_44_def[Ps]

definition P_0x41d7_44_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x41d7_44_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa08), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x41d7_44_regions :: state_pred where
  \<open>P_0x41d7_44_regions \<sigma> \<equiv> \<exists>regions. P_0x41d7_44_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_get_human_readable_size_addr_0x41d7_44 :: state_pred where
  \<open>Q_get_human_readable_size_addr_0x41d7_44 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa70) \<and> RIP \<sigma> = get_human_readable_size_addr \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa08),8]::64 word) << 9) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> RSI \<sigma> = 0x80 \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa08),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa08),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x41dc\<close>
declare Q_get_human_readable_size_addr_0x41d7_44_def[Qs]

schematic_goal img_info_0_1_0x41d7_0x41d7_44[blocks]:
  assumes \<open>(P_0x41d7_44 && P_0x41d7_44_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x41d7 44 \<sigma> \<triangleq> ?\<sigma> \<and> Q_get_human_readable_size_addr_0x41d7_44 ?\<sigma> \<and> block_usage P_0x41d7_44_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x41d7_44_def P_0x41d7_44_regions_def post: Q_get_human_readable_size_addr_0x41d7_44_def regionset: P_0x41d7_44_regions_set_def)

definition P_0x41dc_45 :: state_pred where
  \<open>P_0x41dc_45 \<sigma> \<equiv> RIP \<sigma> = 0x41dc \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa08),8]::64 word) << 9) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa08),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa08),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x41dc\<close>
declare P_0x41dc_45_def[Ps]

definition P_0x41dc_45_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x41dc_45_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa08), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x41dc_45_regions :: state_pred where
  \<open>P_0x41dc_45_regions \<sigma> \<equiv> \<exists>regions. P_0x41dc_45_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x4112_45 :: state_pred where
  \<open>Q_0x4112_45 \<sigma> \<equiv> RIP \<sigma> = 0x4112 \<and> RCX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word)\<close>
declare Q_0x4112_45_def[Qs]

schematic_goal img_info_0_1_0x41dc_0x41dc_45[blocks]:
  assumes \<open>(P_0x41dc_45 && P_0x41dc_45_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x41dc 45 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x4112_45 ?\<sigma> \<and> block_usage P_0x41dc_45_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x41dc_45_def P_0x41dc_45_regions_def post: Q_0x4112_45_def regionset: P_0x41dc_45_regions_set_def)

definition P_0x40e7_false_46 :: state_pred where
  \<open>P_0x40e7_false_46 \<sigma> \<equiv> RIP \<sigma> = 0x40e7 \<and> RCX \<sigma> = 0x0 \<and> RDX \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa08),8]::64 word) << 9) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa08),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa08),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x40da\<close>
declare P_0x40e7_false_46_def[Ps]

definition P_0x40e7_false_46_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x40e7_false_46_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x8b0), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x8b8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa08), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x40e7_false_46_regions :: state_pred where
  \<open>P_0x40e7_false_46_regions \<sigma> \<equiv> \<exists>regions. P_0x40e7_false_46_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x4112_46 :: state_pred where
  \<open>Q_0x4112_46 \<sigma> \<equiv> RIP \<sigma> = 0x4112 \<and> RCX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word)\<close>
declare Q_0x4112_46_def[Qs]

schematic_goal img_info_0_5_0x40e7_0x410a_46[blocks]:
  assumes \<open>(P_0x40e7_false_46 && P_0x40e7_false_46_regions && ! !SF) \<sigma>\<close>
  shows \<open>exec_block 5 0x410a 46 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x4112_46 ?\<sigma> \<and> block_usage P_0x40e7_false_46_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x40e7_false_46_def P_0x40e7_false_46_regions_def post: Q_0x4112_46_def regionset: P_0x40e7_false_46_regions_set_def)

definition P_0x4112_47 :: state_pred where
  \<open>P_0x4112_47 \<sigma> \<equiv> RIP \<sigma> = 0x4112 \<and> RCX \<sigma> = 0x0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word)\<close>
declare P_0x4112_47_def[Ps]

definition P_0x4112_47_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4112_47_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa78), 8)
  }\<close>

definition P_0x4112_47_regions :: state_pred where
  \<open>P_0x4112_47_regions \<sigma> \<equiv> \<exists>regions. P_0x4112_47_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x4138_47 :: state_pred where
  \<open>Q_0x4138_47 \<sigma> \<equiv> RIP \<sigma> = 0x4138 \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> RDX \<sigma> = RBP \<sigma> \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x1d9c0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa78) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8)\<close>
declare Q_0x4138_47_def[Qs]

schematic_goal img_info_0_10_0x4112_0x4134_47[blocks]:
  assumes \<open>(P_0x4112_47 && P_0x4112_47_regions) \<sigma>\<close>
  shows \<open>exec_block 10 0x4134 47 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x4138_47 ?\<sigma> \<and> block_usage P_0x4112_47_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4112_47_def P_0x4112_47_regions_def post: Q_0x4138_47_def regionset: P_0x4112_47_regions_set_def)

definition P_0x4138_48 :: state_pred where
  \<open>P_0x4138_48 \<sigma> \<equiv> RIP \<sigma> = 0x4138 \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> RDX \<sigma> = RBP \<sigma> \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x1d9c0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa78) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8)\<close>
declare P_0x4138_48_def[Ps]

definition P_0x4138_48_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4138_48_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x4138_48_regions :: state_pred where
  \<open>P_0x4138_48_regions \<sigma> \<equiv> \<exists>regions. P_0x4138_48_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_printf_chk_addr_0x4138_48 :: state_pred where
  \<open>Q_printf_chk_addr_0x4138_48 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa80) \<and> RIP \<sigma> = printf_chk_addr \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> RDX \<sigma> = RBP \<sigma> \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x1d9c0 \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x413d\<close>
declare Q_printf_chk_addr_0x4138_48_def[Qs]

schematic_goal img_info_0_1_0x4138_0x4138_48[blocks]:
  assumes \<open>(P_0x4138_48 && P_0x4138_48_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x4138 48 \<sigma> \<triangleq> ?\<sigma> \<and> Q_printf_chk_addr_0x4138_48 ?\<sigma> \<and> block_usage P_0x4138_48_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4138_48_def P_0x4138_48_regions_def post: Q_printf_chk_addr_0x4138_48_def regionset: P_0x4138_48_regions_set_def)

definition P_0x413d_49 :: state_pred where
  \<open>P_0x413d_49 \<sigma> \<equiv> RIP \<sigma> = 0x413d \<and> RAX \<sigma> = printf_chk_0x4138_retval \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> RDX \<sigma> = RBP \<sigma> \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x1d9c0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa78) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x413d\<close>
declare P_0x413d_49_def[Ps]

definition P_0x413d_49_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x413d_49_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x413d_49_regions :: state_pred where
  \<open>P_0x413d_49_regions \<sigma> \<equiv> \<exists>regions. P_0x413d_49_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x4140_49 :: state_pred where
  \<open>Q_0x4140_49 \<sigma> \<equiv> RIP \<sigma> = 0x4140 \<and> RAX \<sigma> = printf_chk_0x4138_retval \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> RDX \<sigma> = RBP \<sigma> \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = 0x1d9c0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa78) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x413d\<close>
declare Q_0x4140_49_def[Qs]

schematic_goal img_info_0_1_0x413d_0x413d_49[blocks]:
  assumes \<open>(P_0x413d_49 && P_0x413d_49_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x413d 49 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x4140_49 ?\<sigma> \<and> block_usage P_0x413d_49_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x413d_49_def P_0x413d_49_regions_def post: Q_0x4140_49_def regionset: P_0x413d_49_regions_set_def)

definition P_0x4140_50 :: state_pred where
  \<open>P_0x4140_50 \<sigma> \<equiv> RIP \<sigma> = 0x4140 \<and> RAX \<sigma> = printf_chk_0x4138_retval \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> RDX \<sigma> = RBP \<sigma> \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = 0x1d9c0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa78) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x413d\<close>
declare P_0x4140_50_def[Ps]

definition P_0x4140_50_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4140_50_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x4140_50_regions :: state_pred where
  \<open>P_0x4140_50_regions \<sigma> \<equiv> \<exists>regions. P_0x4140_50_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_is_encrypted_addr_0x4140_50 :: state_pred where
  \<open>Q_bdrv_is_encrypted_addr_0x4140_50 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa80) \<and> RIP \<sigma> = bdrv_is_encrypted_addr \<and> RAX \<sigma> = printf_chk_0x4138_retval \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> RDX \<sigma> = RBP \<sigma> \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = 0x1d9c0 \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_bdrv_is_encrypted_addr_0x4140_50_def[Qs]

schematic_goal img_info_0_1_0x4140_0x4140_50[blocks]:
  assumes \<open>(P_0x4140_50 && P_0x4140_50_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x4140 50 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_is_encrypted_addr_0x4140_50 ?\<sigma> \<and> block_usage P_0x4140_50_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4140_50_def P_0x4140_50_regions_def post: Q_bdrv_is_encrypted_addr_0x4140_50_def regionset: P_0x4140_50_regions_set_def)

definition P_0x4145_51 :: state_pred where
  \<open>P_0x4145_51 \<sigma> \<equiv> RIP \<sigma> = 0x4145 \<and> RAX \<sigma> = ucast (bdrv_is_encrypted_0x4140_retval) \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> RDX \<sigma> = RBP \<sigma> \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = 0x1d9c0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa78) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x4145_51_def[Ps]

definition P_0x4145_51_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4145_51_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x4145_51_regions :: state_pred where
  \<open>P_0x4145_51_regions \<sigma> \<equiv> \<exists>regions. P_0x4145_51_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x4149_51 :: state_pred where
  \<open>Q_0x4149_51 \<sigma> \<equiv> RIP \<sigma> = 0x4149 \<and> RAX \<sigma> = ucast (bdrv_is_encrypted_0x4140_retval) \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = 0x1d9c0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_0x4149_51_def[Qs]

schematic_goal img_info_0_3_0x4145_0x4147_51[blocks]:
  assumes \<open>(P_0x4145_51 && P_0x4145_51_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x4147 51 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x4149_51 ?\<sigma> \<and> block_usage P_0x4145_51_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4145_51_def P_0x4145_51_regions_def post: Q_0x4149_51_def regionset: P_0x4145_51_regions_set_def)

definition P_0x4149_true_52 :: state_pred where
  \<open>P_0x4149_true_52 \<sigma> \<equiv> RIP \<sigma> = 0x4149 \<and> RAX \<sigma> = ucast (bdrv_is_encrypted_0x4140_retval) \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = 0x1d9c0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x4149_true_52_def[Ps]

definition P_0x4149_true_52_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4149_true_52_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x4149_true_52_regions :: state_pred where
  \<open>P_0x4149_true_52_regions \<sigma> \<equiv> \<exists>regions. P_0x4149_true_52_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x41e8_52 :: state_pred where
  \<open>Q_0x41e8_52 \<sigma> \<equiv> RIP \<sigma> = 0x41e8 \<and> RAX \<sigma> = ucast (bdrv_is_encrypted_0x4140_retval) \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> RDI \<sigma> = 0x1d079 \<and> RSI \<sigma> = 0x1d9c0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_0x41e8_52_def[Qs]

schematic_goal img_info_0_2_0x4149_0x41e1_52[blocks]:
  assumes \<open>(P_0x4149_true_52 && P_0x4149_true_52_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x41e1 52 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x41e8_52 ?\<sigma> \<and> block_usage P_0x4149_true_52_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4149_true_52_def P_0x4149_true_52_regions_def post: Q_0x41e8_52_def regionset: P_0x4149_true_52_regions_set_def)

definition P_0x41e8_53 :: state_pred where
  \<open>P_0x41e8_53 \<sigma> \<equiv> RIP \<sigma> = 0x41e8 \<and> RAX \<sigma> = ucast (bdrv_is_encrypted_0x4140_retval) \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> RDI \<sigma> = 0x1d079 \<and> RSI \<sigma> = 0x1d9c0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x41e8_53_def[Ps]

definition P_0x41e8_53_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x41e8_53_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x41e8_53_regions :: state_pred where
  \<open>P_0x41e8_53_regions \<sigma> \<equiv> \<exists>regions. P_0x41e8_53_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_puts_addr_0x41e8_53 :: state_pred where
  \<open>Q_puts_addr_0x41e8_53 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa70) \<and> RIP \<sigma> = puts_addr \<and> RAX \<sigma> = ucast (bdrv_is_encrypted_0x4140_retval) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> RDI \<sigma> = 0x1d079 \<and> RSI \<sigma> = 0x1d9c0 \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x41ed \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_puts_addr_0x41e8_53_def[Qs]

schematic_goal img_info_0_1_0x41e8_0x41e8_53[blocks]:
  assumes \<open>(P_0x41e8_53 && P_0x41e8_53_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x41e8 53 \<sigma> \<triangleq> ?\<sigma> \<and> Q_puts_addr_0x41e8_53 ?\<sigma> \<and> block_usage P_0x41e8_53_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x41e8_53_def P_0x41e8_53_regions_def post: Q_puts_addr_0x41e8_53_def regionset: P_0x41e8_53_regions_set_def)

definition P_0x41ed_54 :: state_pred where
  \<open>P_0x41ed_54 \<sigma> \<equiv> RIP \<sigma> = 0x41ed \<and> RAX \<sigma> = puts_0x41e8_retval \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> RDI \<sigma> = 0x1d079 \<and> RSI \<sigma> = 0x1d9c0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x41ed \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x41ed_54_def[Ps]

definition P_0x41ed_54_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x41ed_54_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x41ed_54_regions :: state_pred where
  \<open>P_0x41ed_54_regions \<sigma> \<equiv> \<exists>regions. P_0x41ed_54_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x414f_54 :: state_pred where
  \<open>Q_0x414f_54 \<sigma> \<equiv> RIP \<sigma> = 0x414f \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> RSI \<sigma> = 0x1d9c0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_0x414f_54_def[Qs]

schematic_goal img_info_0_1_0x41ed_0x41ed_54[blocks]:
  assumes \<open>(P_0x41ed_54 && P_0x41ed_54_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x41ed 54 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x414f_54 ?\<sigma> \<and> block_usage P_0x41ed_54_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x41ed_54_def P_0x41ed_54_regions_def post: Q_0x414f_54_def regionset: P_0x41ed_54_regions_set_def)

definition P_0x4149_false_55 :: state_pred where
  \<open>P_0x4149_false_55 \<sigma> \<equiv> RIP \<sigma> = 0x4149 \<and> RAX \<sigma> = ucast (bdrv_is_encrypted_0x4140_retval) \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = 0x1d9c0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x4149_false_55_def[Ps]

definition P_0x4149_false_55_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4149_false_55_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x4149_false_55_regions :: state_pred where
  \<open>P_0x4149_false_55_regions \<sigma> \<equiv> \<exists>regions. P_0x4149_false_55_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x414f_55 :: state_pred where
  \<open>Q_0x414f_55 \<sigma> \<equiv> RIP \<sigma> = 0x414f \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> RSI \<sigma> = 0x1d9c0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_0x414f_55_def[Qs]

schematic_goal img_info_0_1_0x4149_0x4149_55[blocks]:
  assumes \<open>(P_0x4149_false_55 && P_0x4149_false_55_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x4149 55 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x414f_55 ?\<sigma> \<and> block_usage P_0x4149_false_55_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4149_false_55_def P_0x4149_false_55_regions_def post: Q_0x414f_55_def regionset: P_0x4149_false_55_regions_set_def)

definition P_0x414f_56 :: state_pred where
  \<open>P_0x414f_56 \<sigma> \<equiv> RIP \<sigma> = 0x414f \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> RSI \<sigma> = 0x1d9c0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x414f_56_def[Ps]

definition P_0x414f_56_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x414f_56_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x414f_56_regions :: state_pred where
  \<open>P_0x414f_56_regions \<sigma> \<equiv> \<exists>regions. P_0x414f_56_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x4157_56 :: state_pred where
  \<open>Q_0x4157_56 \<sigma> \<equiv> RIP \<sigma> = 0x4157 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0xa58) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_0x4157_56_def[Qs]

schematic_goal img_info_0_2_0x414f_0x4154_56[blocks]:
  assumes \<open>(P_0x414f_56 && P_0x414f_56_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x4154 56 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x4157_56 ?\<sigma> \<and> block_usage P_0x414f_56_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x414f_56_def P_0x414f_56_regions_def post: Q_0x4157_56_def regionset: P_0x414f_56_regions_set_def)

definition P_0x4157_57 :: state_pred where
  \<open>P_0x4157_57 \<sigma> \<equiv> RIP \<sigma> = 0x4157 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0xa58) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x4157_57_def[Ps]

definition P_0x4157_57_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4157_57_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x4157_57_regions :: state_pred where
  \<open>P_0x4157_57_regions \<sigma> \<equiv> \<exists>regions. P_0x4157_57_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_get_info_addr_0x4157_57 :: state_pred where
  \<open>Q_bdrv_get_info_addr_0x4157_57 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa70) \<and> RIP \<sigma> = bdrv_get_info_addr \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0xa58) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x415c \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_bdrv_get_info_addr_0x4157_57_def[Qs]

schematic_goal img_info_0_1_0x4157_0x4157_57[blocks]:
  assumes \<open>(P_0x4157_57 && P_0x4157_57_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x4157 57 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_get_info_addr_0x4157_57 ?\<sigma> \<and> block_usage P_0x4157_57_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4157_57_def P_0x4157_57_regions_def post: Q_bdrv_get_info_addr_0x4157_57_def regionset: P_0x4157_57_regions_set_def)

definition P_0x415c_58 :: state_pred where
  \<open>P_0x415c_58 \<sigma> \<equiv> RIP \<sigma> = 0x415c \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0xa58) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x415c \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x415c_58_def[Ps]

definition P_0x415c_58_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x415c_58_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x415c_58_regions :: state_pred where
  \<open>P_0x415c_58_regions \<sigma> \<equiv> \<exists>regions. P_0x415c_58_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x415e_58 :: state_pred where
  \<open>Q_0x415e_58 \<sigma> \<equiv> RIP \<sigma> = 0x415e \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0xa58) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x415c \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_0x415e_58_def[Qs]

schematic_goal img_info_0_1_0x415c_0x415c_58[blocks]:
  assumes \<open>(P_0x415c_58 && P_0x415c_58_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x415c 58 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x415e_58 ?\<sigma> \<and> block_usage P_0x415c_58_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x415c_58_def P_0x415c_58_regions_def post: Q_0x415e_58_def regionset: P_0x415c_58_regions_set_def)

definition P_0x415e_true_59 :: state_pred where
  \<open>P_0x415e_true_59 \<sigma> \<equiv> RIP \<sigma> = 0x415e \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0xa58) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x415c \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x415e_true_59_def[Ps]

definition P_0x415e_true_59_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x415e_true_59_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x415e_true_59_regions :: state_pred where
  \<open>P_0x415e_true_59_regions \<sigma> \<equiv> \<exists>regions. P_0x415e_true_59_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x416c_59 :: state_pred where
  \<open>Q_0x416c_59 \<sigma> \<equiv> RIP \<sigma> = 0x416c \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_0x416c_59_def[Qs]

schematic_goal img_info_0_1_0x415e_0x415e_59[blocks]:
  assumes \<open>(P_0x415e_true_59 && P_0x415e_true_59_regions && SF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x415e 59 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x416c_59 ?\<sigma> \<and> block_usage P_0x415e_true_59_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x415e_true_59_def P_0x415e_true_59_regions_def post: Q_0x416c_59_def regionset: P_0x415e_true_59_regions_set_def)

definition P_0x415e_false_60 :: state_pred where
  \<open>P_0x415e_false_60 \<sigma> \<equiv> RIP \<sigma> = 0x415e \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0xa58) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x415c \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x415e_false_60_def[Ps]

definition P_0x415e_false_60_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x415e_false_60_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa58), 4),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x415e_false_60_regions :: state_pred where
  \<open>P_0x415e_false_60_regions \<sigma> \<equiv> \<exists>regions. P_0x415e_false_60_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x4166_60 :: state_pred where
  \<open>Q_0x4166_60 \<sigma> \<equiv> RIP \<sigma> = 0x4166 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa58),4]::32 word)) \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0xa58) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x415c \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_0x4166_60_def[Qs]

schematic_goal img_info_0_3_0x415e_0x4164_60[blocks]:
  assumes \<open>(P_0x415e_false_60 && P_0x415e_false_60_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 3 0x4164 60 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x4166_60 ?\<sigma> \<and> block_usage P_0x415e_false_60_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x415e_false_60_def P_0x415e_false_60_regions_def post: Q_0x4166_60_def regionset: P_0x415e_false_60_regions_set_def)

definition P_0x4166_true_61 :: state_pred where
  \<open>P_0x4166_true_61 \<sigma> \<equiv> RIP \<sigma> = 0x4166 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa58),4]::32 word)) \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0xa58) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x415c \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x4166_true_61_def[Ps]

definition P_0x4166_true_61_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4166_true_61_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa58), 4),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x4166_true_61_regions :: state_pred where
  \<open>P_0x4166_true_61_regions \<sigma> \<equiv> \<exists>regions. P_0x4166_true_61_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x4240_61 :: state_pred where
  \<open>Q_0x4240_61 \<sigma> \<equiv> RIP \<sigma> = 0x4240 \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa58),4]::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x1d088 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x415c \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_0x4240_61_def[Qs]

schematic_goal img_info_0_4_0x4166_0x423e_61[blocks]:
  assumes \<open>(P_0x4166_true_61 && P_0x4166_true_61_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x423e 61 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x4240_61 ?\<sigma> \<and> block_usage P_0x4166_true_61_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4166_true_61_def P_0x4166_true_61_regions_def post: Q_0x4240_61_def regionset: P_0x4166_true_61_regions_set_def)

definition P_0x4240_62 :: state_pred where
  \<open>P_0x4240_62 \<sigma> \<equiv> RIP \<sigma> = 0x4240 \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa58),4]::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x1d088 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x415c \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x4240_62_def[Ps]

definition P_0x4240_62_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4240_62_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa58), 4),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x4240_62_regions :: state_pred where
  \<open>P_0x4240_62_regions \<sigma> \<equiv> \<exists>regions. P_0x4240_62_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_printf_chk_addr_0x4240_62 :: state_pred where
  \<open>Q_printf_chk_addr_0x4240_62 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa70) \<and> RIP \<sigma> = printf_chk_addr \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa58),4]::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x1d088 \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4245 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_printf_chk_addr_0x4240_62_def[Qs]

schematic_goal img_info_0_1_0x4240_0x4240_62[blocks]:
  assumes \<open>(P_0x4240_62 && P_0x4240_62_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x4240 62 \<sigma> \<triangleq> ?\<sigma> \<and> Q_printf_chk_addr_0x4240_62 ?\<sigma> \<and> block_usage P_0x4240_62_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4240_62_def P_0x4240_62_regions_def post: Q_printf_chk_addr_0x4240_62_def regionset: P_0x4240_62_regions_set_def)

definition P_0x4245_63 :: state_pred where
  \<open>P_0x4245_63 \<sigma> \<equiv> RIP \<sigma> = 0x4245 \<and> RAX \<sigma> = printf_chk_0x4240_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa58),4]::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x1d088 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4245 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x4245_63_def[Ps]

definition P_0x4245_63_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4245_63_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa58), 4),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x4245_63_regions :: state_pred where
  \<open>P_0x4245_63_regions \<sigma> \<equiv> \<exists>regions. P_0x4245_63_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x416c_63 :: state_pred where
  \<open>Q_0x416c_63 \<sigma> \<equiv> RIP \<sigma> = 0x416c \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_0x416c_63_def[Qs]

schematic_goal img_info_0_1_0x4245_0x4245_63[blocks]:
  assumes \<open>(P_0x4245_63 && P_0x4245_63_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x4245 63 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x416c_63 ?\<sigma> \<and> block_usage P_0x4245_63_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4245_63_def P_0x4245_63_regions_def post: Q_0x416c_63_def regionset: P_0x4245_63_regions_set_def)

definition P_0x4166_false_64 :: state_pred where
  \<open>P_0x4166_false_64 \<sigma> \<equiv> RIP \<sigma> = 0x4166 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa58),4]::32 word)) \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0xa58) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x415c \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x4166_false_64_def[Ps]

definition P_0x4166_false_64_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4166_false_64_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa58), 4),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x4166_false_64_regions :: state_pred where
  \<open>P_0x4166_false_64_regions \<sigma> \<equiv> \<exists>regions. P_0x4166_false_64_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x416c_64 :: state_pred where
  \<open>Q_0x416c_64 \<sigma> \<equiv> RIP \<sigma> = 0x416c \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_0x416c_64_def[Qs]

schematic_goal img_info_0_1_0x4166_0x4166_64[blocks]:
  assumes \<open>(P_0x4166_false_64 && P_0x4166_false_64_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x4166 64 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x416c_64 ?\<sigma> \<and> block_usage P_0x4166_false_64_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4166_false_64_def P_0x4166_false_64_regions_def post: Q_0x416c_64_def regionset: P_0x4166_false_64_regions_set_def)

definition P_0x416c_65 :: state_pred where
  \<open>P_0x416c_65 \<sigma> \<equiv> RIP \<sigma> = 0x416c \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x416c_65_def[Ps]

definition P_0x416c_65_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x416c_65_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x416c_65_regions :: state_pred where
  \<open>P_0x416c_65_regions \<sigma> \<equiv> \<exists>regions. P_0x416c_65_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x417f_65 :: state_pred where
  \<open>Q_0x417f_65 \<sigma> \<equiv> RIP \<sigma> = 0x417f \<and> RDX \<sigma> = 0x400 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_0x417f_65_def[Qs]

schematic_goal img_info_0_4_0x416c_0x417c_65[blocks]:
  assumes \<open>(P_0x416c_65 && P_0x416c_65_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x417c 65 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x417f_65 ?\<sigma> \<and> block_usage P_0x416c_65_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x416c_65_def P_0x416c_65_regions_def post: Q_0x417f_65_def regionset: P_0x416c_65_regions_set_def)

definition P_0x417f_66 :: state_pred where
  \<open>P_0x417f_66 \<sigma> \<equiv> RIP \<sigma> = 0x417f \<and> RDX \<sigma> = 0x400 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x417f_66_def[Ps]

definition P_0x417f_66_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x417f_66_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x417f_66_regions :: state_pred where
  \<open>P_0x417f_66_regions \<sigma> \<equiv> \<exists>regions. P_0x417f_66_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_get_backing_filename_addr_0x417f_66 :: state_pred where
  \<open>Q_bdrv_get_backing_filename_addr_0x417f_66 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa70) \<and> RIP \<sigma> = bdrv_get_backing_filename_addr \<and> RDX \<sigma> = 0x400 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4184 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_bdrv_get_backing_filename_addr_0x417f_66_def[Qs]

schematic_goal img_info_0_1_0x417f_0x417f_66[blocks]:
  assumes \<open>(P_0x417f_66 && P_0x417f_66_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x417f 66 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_get_backing_filename_addr_0x417f_66 ?\<sigma> \<and> block_usage P_0x417f_66_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x417f_66_def P_0x417f_66_regions_def post: Q_bdrv_get_backing_filename_addr_0x417f_66_def regionset: P_0x417f_66_regions_set_def)

definition P_0x4184_67 :: state_pred where
  \<open>P_0x4184_67 \<sigma> \<equiv> RIP \<sigma> = 0x4184 \<and> RDX \<sigma> = 0x400 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4184 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x4184_67_def[Ps]

definition P_0x4184_67_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4184_67_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x838), 1),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x4184_67_regions :: state_pred where
  \<open>P_0x4184_67_regions \<sigma> \<equiv> \<exists>regions. P_0x4184_67_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x418c_67 :: state_pred where
  \<open>Q_0x418c_67 \<sigma> \<equiv> RIP \<sigma> = 0x418c \<and> RDX \<sigma> = 0x400 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4184 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_0x418c_67_def[Qs]

schematic_goal img_info_0_1_0x4184_0x4184_67[blocks]:
  assumes \<open>(P_0x4184_67 && P_0x4184_67_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x4184 67 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x418c_67 ?\<sigma> \<and> block_usage P_0x4184_67_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4184_67_def P_0x4184_67_regions_def post: Q_0x418c_67_def regionset: P_0x4184_67_regions_set_def)

definition P_0x418c_true_68 :: state_pred where
  \<open>P_0x418c_true_68 \<sigma> \<equiv> RIP \<sigma> = 0x418c \<and> RDX \<sigma> = 0x400 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4184 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x418c_true_68_def[Ps]

definition P_0x418c_true_68_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x418c_true_68_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x838), 1),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x418c_true_68_regions :: state_pred where
  \<open>P_0x418c_true_68_regions \<sigma> \<equiv> \<exists>regions. P_0x418c_true_68_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x4208_68 :: state_pred where
  \<open>Q_0x4208_68 \<sigma> \<equiv> RIP \<sigma> = 0x4208 \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> RDX \<sigma> = RBP \<sigma> \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x438) \<and> RSI \<sigma> = 0x400 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x438) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4184 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_0x4208_68_def[Qs]

schematic_goal img_info_0_6_0x418c_0x4205_68[blocks]:
  assumes \<open>(P_0x418c_true_68 && P_0x418c_true_68_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 6 0x4205 68 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x4208_68 ?\<sigma> \<and> block_usage P_0x418c_true_68_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x418c_true_68_def P_0x418c_true_68_regions_def post: Q_0x4208_68_def regionset: P_0x418c_true_68_regions_set_def)

definition P_0x4208_69 :: state_pred where
  \<open>P_0x4208_69 \<sigma> \<equiv> RIP \<sigma> = 0x4208 \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> RDX \<sigma> = RBP \<sigma> \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x438) \<and> RSI \<sigma> = 0x400 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x438) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4184 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x4208_69_def[Ps]

definition P_0x4208_69_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4208_69_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x838), 1),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x4208_69_regions :: state_pred where
  \<open>P_0x4208_69_regions \<sigma> \<equiv> \<exists>regions. P_0x4208_69_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_path_combine_addr_0x4208_69 :: state_pred where
  \<open>Q_path_combine_addr_0x4208_69 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa70) \<and> RIP \<sigma> = path_combine_addr \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> RDX \<sigma> = RBP \<sigma> \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x438) \<and> RSI \<sigma> = 0x400 \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x438) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x420d \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_path_combine_addr_0x4208_69_def[Qs]

schematic_goal img_info_0_1_0x4208_0x4208_69[blocks]:
  assumes \<open>(P_0x4208_69 && P_0x4208_69_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x4208 69 \<sigma> \<triangleq> ?\<sigma> \<and> Q_path_combine_addr_0x4208_69 ?\<sigma> \<and> block_usage P_0x4208_69_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4208_69_def P_0x4208_69_regions_def post: Q_path_combine_addr_0x4208_69_def regionset: P_0x4208_69_regions_set_def)

definition P_0x420d_70 :: state_pred where
  \<open>P_0x420d_70 \<sigma> \<equiv> RIP \<sigma> = 0x420d \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> RDX \<sigma> = RBP \<sigma> \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x438) \<and> RSI \<sigma> = 0x400 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x438) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x420d \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x420d_70_def[Ps]

definition P_0x420d_70_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x420d_70_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x838), 1),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x420d_70_regions :: state_pred where
  \<open>P_0x420d_70_regions \<sigma> \<equiv> \<exists>regions. P_0x420d_70_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x4221_70 :: state_pred where
  \<open>Q_0x4221_70 \<sigma> \<equiv> RIP \<sigma> = 0x4221 \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x438) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x1da08 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x438) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x420d \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_0x4221_70_def[Qs]

schematic_goal img_info_0_5_0x420d_0x421f_70[blocks]:
  assumes \<open>(P_0x420d_70 && P_0x420d_70_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x421f 70 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x4221_70 ?\<sigma> \<and> block_usage P_0x420d_70_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x420d_70_def P_0x420d_70_regions_def post: Q_0x4221_70_def regionset: P_0x420d_70_regions_set_def)

definition P_0x4221_71 :: state_pred where
  \<open>P_0x4221_71 \<sigma> \<equiv> RIP \<sigma> = 0x4221 \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x438) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x1da08 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x438) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x420d \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x4221_71_def[Ps]

definition P_0x4221_71_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4221_71_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x838), 1),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x4221_71_regions :: state_pred where
  \<open>P_0x4221_71_regions \<sigma> \<equiv> \<exists>regions. P_0x4221_71_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_printf_chk_addr_0x4221_71 :: state_pred where
  \<open>Q_printf_chk_addr_0x4221_71 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa70) \<and> RIP \<sigma> = printf_chk_addr \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x438) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x1da08 \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x438) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4226 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_printf_chk_addr_0x4221_71_def[Qs]

schematic_goal img_info_0_1_0x4221_0x4221_71[blocks]:
  assumes \<open>(P_0x4221_71 && P_0x4221_71_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x4221 71 \<sigma> \<triangleq> ?\<sigma> \<and> Q_printf_chk_addr_0x4221_71 ?\<sigma> \<and> block_usage P_0x4221_71_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4221_71_def P_0x4221_71_regions_def post: Q_printf_chk_addr_0x4221_71_def regionset: P_0x4221_71_regions_set_def)

definition P_0x4226_72 :: state_pred where
  \<open>P_0x4226_72 \<sigma> \<equiv> RIP \<sigma> = 0x4226 \<and> RAX \<sigma> = printf_chk_0x4221_retval \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x438) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x1da08 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x438) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4226 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x4226_72_def[Ps]

definition P_0x4226_72_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4226_72_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x838), 1),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x4226_72_regions :: state_pred where
  \<open>P_0x4226_72_regions \<sigma> \<equiv> \<exists>regions. P_0x4226_72_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x418e_72 :: state_pred where
  \<open>Q_0x418e_72 \<sigma> \<equiv> RIP \<sigma> = 0x418e \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_0x418e_72_def[Qs]

schematic_goal img_info_0_1_0x4226_0x4226_72[blocks]:
  assumes \<open>(P_0x4226_72 && P_0x4226_72_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x4226 72 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x418e_72 ?\<sigma> \<and> block_usage P_0x4226_72_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4226_72_def P_0x4226_72_regions_def post: Q_0x418e_72_def regionset: P_0x4226_72_regions_set_def)

definition P_0x418c_false_73 :: state_pred where
  \<open>P_0x418c_false_73 \<sigma> \<equiv> RIP \<sigma> = 0x418c \<and> RDX \<sigma> = 0x400 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4184 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x418c_false_73_def[Ps]

definition P_0x418c_false_73_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x418c_false_73_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x838), 1),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x418c_false_73_regions :: state_pred where
  \<open>P_0x418c_false_73_regions \<sigma> \<equiv> \<exists>regions. P_0x418c_false_73_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x418e_73 :: state_pred where
  \<open>Q_0x418e_73 \<sigma> \<equiv> RIP \<sigma> = 0x418e \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_0x418e_73_def[Qs]

schematic_goal img_info_0_1_0x418c_0x418c_73[blocks]:
  assumes \<open>(P_0x418c_false_73 && P_0x418c_false_73_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x418c 73 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x418e_73 ?\<sigma> \<and> block_usage P_0x418c_false_73_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x418c_false_73_def P_0x418c_false_73_regions_def post: Q_0x418e_73_def regionset: P_0x418c_false_73_regions_set_def)

definition P_0x418e_74 :: state_pred where
  \<open>P_0x418e_74 \<sigma> \<equiv> RIP \<sigma> = 0x418e \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x418e_74_def[Ps]

definition P_0x418e_74_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x418e_74_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x838), 1),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x418e_74_regions :: state_pred where
  \<open>P_0x418e_74_regions \<sigma> \<equiv> \<exists>regions. P_0x418e_74_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x4191_74 :: state_pred where
  \<open>Q_0x4191_74 \<sigma> \<equiv> RIP \<sigma> = 0x4191 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_0x4191_74_def[Qs]

schematic_goal img_info_0_1_0x418e_0x418e_74[blocks]:
  assumes \<open>(P_0x418e_74 && P_0x418e_74_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x418e 74 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x4191_74 ?\<sigma> \<and> block_usage P_0x418e_74_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x418e_74_def P_0x418e_74_regions_def post: Q_0x4191_74_def regionset: P_0x418e_74_regions_set_def)

definition P_0x4191_75 :: state_pred where
  \<open>P_0x4191_75 \<sigma> \<equiv> RIP \<sigma> = 0x4191 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x4191_75_def[Ps]

definition P_0x4191_75_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4191_75_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x838), 1),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x4191_75_regions :: state_pred where
  \<open>P_0x4191_75_regions \<sigma> \<equiv> \<exists>regions. P_0x4191_75_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_dump_snapshots_addr_0x4191_75 :: state_pred where
  \<open>Q_dump_snapshots_addr_0x4191_75 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa70) \<and> RIP \<sigma> = dump_snapshots_addr \<and> RDI \<sigma> = RBX \<sigma> \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4196 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_dump_snapshots_addr_0x4191_75_def[Qs]

schematic_goal img_info_0_1_0x4191_0x4191_75[blocks]:
  assumes \<open>(P_0x4191_75 && P_0x4191_75_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x4191 75 \<sigma> \<triangleq> ?\<sigma> \<and> Q_dump_snapshots_addr_0x4191_75 ?\<sigma> \<and> block_usage P_0x4191_75_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4191_75_def P_0x4191_75_regions_def post: Q_dump_snapshots_addr_0x4191_75_def regionset: P_0x4191_75_regions_set_def)

definition P_0x4196_76 :: state_pred where
  \<open>P_0x4196_76 \<sigma> \<equiv> RIP \<sigma> = 0x4196 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4196 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x4196_76_def[Ps]

definition P_0x4196_76_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4196_76_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x838), 1),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x4196_76_regions :: state_pred where
  \<open>P_0x4196_76_regions \<sigma> \<equiv> \<exists>regions. P_0x4196_76_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x4199_76 :: state_pred where
  \<open>Q_0x4199_76 \<sigma> \<equiv> RIP \<sigma> = 0x4199 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4196 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_0x4199_76_def[Qs]

schematic_goal img_info_0_1_0x4196_0x4196_76[blocks]:
  assumes \<open>(P_0x4196_76 && P_0x4196_76_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x4196 76 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x4199_76 ?\<sigma> \<and> block_usage P_0x4196_76_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4196_76_def P_0x4196_76_regions_def post: Q_0x4199_76_def regionset: P_0x4196_76_regions_set_def)

definition P_0x4199_77 :: state_pred where
  \<open>P_0x4199_77 \<sigma> \<equiv> RIP \<sigma> = 0x4199 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4196 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x4199_77_def[Ps]

definition P_0x4199_77_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4199_77_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x838), 1),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x4199_77_regions :: state_pred where
  \<open>P_0x4199_77_regions \<sigma> \<equiv> \<exists>regions. P_0x4199_77_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_delete_addr_0x4199_77 :: state_pred where
  \<open>Q_bdrv_delete_addr_0x4199_77 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa70) \<and> RIP \<sigma> = bdrv_delete_addr \<and> RDI \<sigma> = RBX \<sigma> \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x419e \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_bdrv_delete_addr_0x4199_77_def[Qs]

schematic_goal img_info_0_1_0x4199_0x4199_77[blocks]:
  assumes \<open>(P_0x4199_77 && P_0x4199_77_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x4199 77 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_delete_addr_0x4199_77 ?\<sigma> \<and> block_usage P_0x4199_77_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4199_77_def P_0x4199_77_regions_def post: Q_bdrv_delete_addr_0x4199_77_def regionset: P_0x4199_77_regions_set_def)

definition P_0x419e_78 :: state_pred where
  \<open>P_0x419e_78 \<sigma> \<equiv> RIP \<sigma> = 0x419e \<and> RDI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x419e \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x419e_78_def[Ps]

definition P_0x419e_78_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x419e_78_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x838), 1),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x419e_78_regions :: state_pred where
  \<open>P_0x419e_78_regions \<sigma> \<equiv> \<exists>regions. P_0x419e_78_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x41b1_78 :: state_pred where
  \<open>Q_0x41b1_78 \<sigma> \<equiv> RIP \<sigma> = 0x41b1 \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = 0x0 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x419e \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_0x41b1_78_def[Qs]

schematic_goal img_info_0_3_0x419e_0x41a8_78[blocks]:
  assumes \<open>(P_0x419e_78 && P_0x419e_78_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x41a8 78 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x41b1_78 ?\<sigma> \<and> block_usage P_0x419e_78_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x419e_78_def P_0x419e_78_regions_def post: Q_0x41b1_78_def regionset: P_0x419e_78_regions_set_def)

definition P_0x41b1_true_79 :: state_pred where
  \<open>P_0x41b1_true_79 \<sigma> \<equiv> RIP \<sigma> = 0x41b1 \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = 0x0 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x419e \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x41b1_true_79_def[Ps]

definition P_0x41b1_true_79_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x41b1_true_79_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x838), 1),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x41b1_true_79_regions :: state_pred where
  \<open>P_0x41b1_true_79_regions \<sigma> \<equiv> \<exists>regions. P_0x41b1_true_79_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x426c_79 :: state_pred where
  \<open>Q_0x426c_79 \<sigma> \<equiv> RIP \<sigma> = 0x426c \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = 0x0 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x419e \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_0x426c_79_def[Qs]

schematic_goal img_info_0_1_0x41b1_0x41b1_79[blocks]:
  assumes \<open>(P_0x41b1_true_79 && P_0x41b1_true_79_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x41b1 79 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x426c_79 ?\<sigma> \<and> block_usage P_0x41b1_true_79_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x41b1_true_79_def P_0x41b1_true_79_regions_def post: Q_0x426c_79_def regionset: P_0x41b1_true_79_regions_set_def)

definition P_0x426c_80 :: state_pred where
  \<open>P_0x426c_80 \<sigma> \<equiv> RIP \<sigma> = 0x426c \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = 0x0 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x419e \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x426c_80_def[Ps]

definition P_0x426c_80_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x426c_80_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x838), 1),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x426c_80_regions :: state_pred where
  \<open>P_0x426c_80_regions \<sigma> \<equiv> \<exists>regions. P_0x426c_80_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_stack_chk_fail_addr_0x426c_80 :: state_pred where
  \<open>Q_stack_chk_fail_addr_0x426c_80 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa70) \<and> RIP \<sigma> = stack_chk_fail_addr \<and> RAX \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_stack_chk_fail_addr_0x426c_80_def[Qs]

schematic_goal img_info_0_1_0x426c_0x426c_80[blocks]:
  assumes \<open>(P_0x426c_80 && P_0x426c_80_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x426c 80 \<sigma> \<triangleq> ?\<sigma> \<and> Q_stack_chk_fail_addr_0x426c_80 ?\<sigma> \<and> block_usage P_0x426c_80_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x426c_80_def P_0x426c_80_regions_def post: Q_stack_chk_fail_addr_0x426c_80_def regionset: P_0x426c_80_regions_set_def)

definition P_0x41b1_false_81 :: state_pred where
  \<open>P_0x41b1_false_81 \<sigma> \<equiv> RIP \<sigma> = 0x41b1 \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = 0x0 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x419e \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x41b1_false_81_def[Ps]

definition P_0x41b1_false_81_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x41b1_false_81_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x838), 1),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x41b1_false_81_regions :: state_pred where
  \<open>P_0x41b1_false_81_regions \<sigma> \<equiv> \<exists>regions. P_0x41b1_false_81_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_81 :: state_pred where
  \<open>Q_ret_address_81 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_ret_address_81_def[Qs]

schematic_goal img_info_0_8_0x41b1_0x41c6_81[blocks]:
  assumes \<open>(P_0x41b1_false_81 && P_0x41b1_false_81_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 8 0x41c6 81 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_81 ?\<sigma> \<and> block_usage P_0x41b1_false_81_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x41b1_false_81_def P_0x41b1_false_81_regions_def post: Q_ret_address_81_def regionset: P_0x41b1_false_81_regions_set_def)

definition P_0x4053_false_82 :: state_pred where
  \<open>P_0x4053_false_82 \<sigma> \<equiv> RIP \<sigma> = 0x4053 \<and> RBX \<sigma> = RAX \<sigma> \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = 0x20c62 \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4044\<close>
declare P_0x4053_false_82_def[Ps]

definition P_0x4053_false_82_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4053_false_82_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x4053_false_82_regions :: state_pred where
  \<open>P_0x4053_false_82_regions \<sigma> \<equiv> \<exists>regions. P_0x4053_false_82_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x405c_82 :: state_pred where
  \<open>Q_0x405c_82 \<sigma> \<equiv> RIP \<sigma> = 0x405c \<and> RBX \<sigma> = RAX \<sigma> \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = R13 \<sigma> \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4044\<close>
declare Q_0x405c_82_def[Qs]

schematic_goal img_info_0_2_0x4053_0x4059_82[blocks]:
  assumes \<open>(P_0x4053_false_82 && P_0x4053_false_82_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x4059 82 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x405c_82 ?\<sigma> \<and> block_usage P_0x4053_false_82_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4053_false_82_def P_0x4053_false_82_regions_def post: Q_0x405c_82_def regionset: P_0x4053_false_82_regions_set_def)

definition P_0x405c_83 :: state_pred where
  \<open>P_0x405c_83 \<sigma> \<equiv> RIP \<sigma> = 0x405c \<and> RBX \<sigma> = RAX \<sigma> \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = R13 \<sigma> \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4044\<close>
declare P_0x405c_83_def[Ps]

definition P_0x405c_83_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x405c_83_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x405c_83_regions :: state_pred where
  \<open>P_0x405c_83_regions \<sigma> \<equiv> \<exists>regions. P_0x405c_83_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_find_format_addr_0x405c_83 :: state_pred where
  \<open>Q_bdrv_find_format_addr_0x405c_83 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa70) \<and> RIP \<sigma> = bdrv_find_format_addr \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = R13 \<sigma> \<and> RSI \<sigma> = RSI\<^sub>0 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4061\<close>
declare Q_bdrv_find_format_addr_0x405c_83_def[Qs]

schematic_goal img_info_0_1_0x405c_0x405c_83[blocks]:
  assumes \<open>(P_0x405c_83 && P_0x405c_83_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x405c 83 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_find_format_addr_0x405c_83 ?\<sigma> \<and> block_usage P_0x405c_83_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x405c_83_def P_0x405c_83_regions_def post: Q_bdrv_find_format_addr_0x405c_83_def regionset: P_0x405c_83_regions_set_def)

definition P_0x4061_84 :: state_pred where
  \<open>P_0x4061_84 \<sigma> \<equiv> RIP \<sigma> = 0x4061 \<and> RCX \<sigma> = RCX\<^sub>0 \<and> RDI \<sigma> = R13 \<sigma> \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4061\<close>
declare P_0x4061_84_def[Ps]

definition P_0x4061_84_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4061_84_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x4061_84_regions :: state_pred where
  \<open>P_0x4061_84_regions \<sigma> \<equiv> \<exists>regions. P_0x4061_84_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x4067_84 :: state_pred where
  \<open>Q_0x4067_84 \<sigma> \<equiv> RIP \<sigma> = 0x4067 \<and> RCX \<sigma> = RAX \<sigma> \<and> RDI \<sigma> = R13 \<sigma> \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4061\<close>
declare Q_0x4067_84_def[Qs]

schematic_goal img_info_0_2_0x4061_0x4064_84[blocks]:
  assumes \<open>(P_0x4061_84 && P_0x4061_84_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x4064 84 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x4067_84 ?\<sigma> \<and> block_usage P_0x4061_84_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4061_84_def P_0x4061_84_regions_def post: Q_0x4067_84_def regionset: P_0x4061_84_regions_set_def)

definition P_0x4067_true_85 :: state_pred where
  \<open>P_0x4067_true_85 \<sigma> \<equiv> RIP \<sigma> = 0x4067 \<and> RCX \<sigma> = RAX \<sigma> \<and> RDI \<sigma> = R13 \<sigma> \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4061\<close>
declare P_0x4067_true_85_def[Ps]

definition P_0x4067_true_85_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4067_true_85_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x4067_true_85_regions :: state_pred where
  \<open>P_0x4067_true_85_regions \<sigma> \<equiv> \<exists>regions. P_0x4067_true_85_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x4256_85 :: state_pred where
  \<open>Q_0x4256_85 \<sigma> \<equiv> RIP \<sigma> = 0x4256 \<and> RAX \<sigma> = 0x0 \<and> RDI \<sigma> = 0x1d04c \<and> RSI \<sigma> = R13 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4061\<close>
declare Q_0x4256_85_def[Qs]

schematic_goal img_info_0_4_0x4067_0x4254_85[blocks]:
  assumes \<open>(P_0x4067_true_85 && P_0x4067_true_85_regions && ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x4254 85 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x4256_85 ?\<sigma> \<and> block_usage P_0x4067_true_85_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4067_true_85_def P_0x4067_true_85_regions_def post: Q_0x4256_85_def regionset: P_0x4067_true_85_regions_set_def)

definition P_0x4256_86 :: state_pred where
  \<open>P_0x4256_86 \<sigma> \<equiv> RIP \<sigma> = 0x4256 \<and> RAX \<sigma> = 0x0 \<and> RDI \<sigma> = 0x1d04c \<and> RSI \<sigma> = R13 \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4061\<close>
declare P_0x4256_86_def[Ps]

definition P_0x4256_86_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4256_86_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x4256_86_regions :: state_pred where
  \<open>P_0x4256_86_regions \<sigma> \<equiv> \<exists>regions. P_0x4256_86_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_error_addr_0x4256_86 :: state_pred where
  \<open>Q_error_addr_0x4256_86 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa70) \<and> RIP \<sigma> = error_addr \<and> RAX \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_error_addr_0x4256_86_def[Qs]

schematic_goal img_info_0_1_0x4256_0x4256_86[blocks]:
  assumes \<open>(P_0x4256_86 && P_0x4256_86_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x4256 86 \<sigma> \<triangleq> ?\<sigma> \<and> Q_error_addr_0x4256_86 ?\<sigma> \<and> block_usage P_0x4256_86_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4256_86_def P_0x4256_86_regions_def post: Q_error_addr_0x4256_86_def regionset: P_0x4256_86_regions_set_def)

definition P_0x4067_false_87 :: state_pred where
  \<open>P_0x4067_false_87 \<sigma> \<equiv> RIP \<sigma> = 0x4067 \<and> RCX \<sigma> = RAX \<sigma> \<and> RDI \<sigma> = R13 \<sigma> \<and> RSI \<sigma> = RSI\<^sub>0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4061\<close>
declare P_0x4067_false_87_def[Ps]

definition P_0x4067_false_87_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4067_false_87_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x4067_false_87_regions :: state_pred where
  \<open>P_0x4067_false_87_regions \<sigma> \<equiv> \<exists>regions. P_0x4067_false_87_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x4078_87 :: state_pred where
  \<open>Q_0x4078_87 \<sigma> \<equiv> RIP \<sigma> = 0x4078 \<and> RCX \<sigma> = RAX \<sigma> \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4061\<close>
declare Q_0x4078_87_def[Qs]

schematic_goal img_info_0_4_0x4067_0x4075_87[blocks]:
  assumes \<open>(P_0x4067_false_87 && P_0x4067_false_87_regions && ! ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x4075 87 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x4078_87 ?\<sigma> \<and> block_usage P_0x4067_false_87_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4067_false_87_def P_0x4067_false_87_regions_def post: Q_0x4078_87_def regionset: P_0x4067_false_87_regions_set_def)

definition P_0x4078_88 :: state_pred where
  \<open>P_0x4078_88 \<sigma> \<equiv> RIP \<sigma> = 0x4078 \<and> RCX \<sigma> = RAX \<sigma> \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4061\<close>
declare P_0x4078_88_def[Ps]

definition P_0x4078_88_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4078_88_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x4078_88_regions :: state_pred where
  \<open>P_0x4078_88_regions \<sigma> \<equiv> \<exists>regions. P_0x4078_88_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_open2_addr_0x4078_88 :: state_pred where
  \<open>Q_bdrv_open2_addr_0x4078_88 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa70) \<and> RIP \<sigma> = bdrv_open2_addr \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = RBP \<sigma> \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x407d\<close>
declare Q_bdrv_open2_addr_0x4078_88_def[Qs]

schematic_goal img_info_0_1_0x4078_0x4078_88[blocks]:
  assumes \<open>(P_0x4078_88 && P_0x4078_88_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x4078 88 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_open2_addr_0x4078_88 ?\<sigma> \<and> block_usage P_0x4078_88_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4078_88_def P_0x4078_88_regions_def post: Q_bdrv_open2_addr_0x4078_88_def regionset: P_0x4078_88_regions_set_def)

definition P_0x407d_89 :: state_pred where
  \<open>P_0x407d_89 \<sigma> \<equiv> RIP \<sigma> = 0x407d \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x407d\<close>
declare P_0x407d_89_def[Ps]

definition P_0x407d_89_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x407d_89_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x407d_89_regions :: state_pred where
  \<open>P_0x407d_89_regions \<sigma> \<equiv> \<exists>regions. P_0x407d_89_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x407f_89 :: state_pred where
  \<open>Q_0x407f_89 \<sigma> \<equiv> RIP \<sigma> = 0x407f \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x407d\<close>
declare Q_0x407f_89_def[Qs]

schematic_goal img_info_0_1_0x407d_0x407d_89[blocks]:
  assumes \<open>(P_0x407d_89 && P_0x407d_89_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x407d 89 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x407f_89 ?\<sigma> \<and> block_usage P_0x407d_89_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x407d_89_def P_0x407d_89_regions_def post: Q_0x407f_89_def regionset: P_0x407d_89_regions_set_def)

definition P_0x407f_true_90 :: state_pred where
  \<open>P_0x407f_true_90 \<sigma> \<equiv> RIP \<sigma> = 0x407f \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x407d\<close>
declare P_0x407f_true_90_def[Ps]

definition P_0x407f_true_90_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x407f_true_90_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x407f_true_90_regions :: state_pred where
  \<open>P_0x407f_true_90_regions \<sigma> \<equiv> \<exists>regions. P_0x407f_true_90_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x4267_90 :: state_pred where
  \<open>Q_0x4267_90 \<sigma> \<equiv> RIP \<sigma> = 0x4267 \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = 0x1d065 \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x407d\<close>
declare Q_0x4267_90_def[Qs]

schematic_goal img_info_0_4_0x407f_0x4265_90[blocks]:
  assumes \<open>(P_0x407f_true_90 && P_0x407f_true_90_regions && SF) \<sigma>\<close>
  shows \<open>exec_block 4 0x4265 90 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x4267_90 ?\<sigma> \<and> block_usage P_0x407f_true_90_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x407f_true_90_def P_0x407f_true_90_regions_def post: Q_0x4267_90_def regionset: P_0x407f_true_90_regions_set_def)

definition P_0x4267_91 :: state_pred where
  \<open>P_0x4267_91 \<sigma> \<equiv> RIP \<sigma> = 0x4267 \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = 0x1d065 \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x407d\<close>
declare P_0x4267_91_def[Ps]

definition P_0x4267_91_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4267_91_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x4267_91_regions :: state_pred where
  \<open>P_0x4267_91_regions \<sigma> \<equiv> \<exists>regions. P_0x4267_91_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_error_addr_0x4267_91 :: state_pred where
  \<open>Q_error_addr_0x4267_91 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa70) \<and> RIP \<sigma> = error_addr \<and> RAX \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_error_addr_0x4267_91_def[Qs]

schematic_goal img_info_0_1_0x4267_0x4267_91[blocks]:
  assumes \<open>(P_0x4267_91 && P_0x4267_91_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x4267 91 \<sigma> \<triangleq> ?\<sigma> \<and> Q_error_addr_0x4267_91 ?\<sigma> \<and> block_usage P_0x4267_91_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4267_91_def P_0x4267_91_regions_def post: Q_error_addr_0x4267_91_def regionset: P_0x4267_91_regions_set_def)

definition P_0x407f_false_92 :: state_pred where
  \<open>P_0x407f_false_92 \<sigma> \<equiv> RIP \<sigma> = 0x407f \<and> RDX \<sigma> = 0x40 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R12 \<sigma> = 0x1d036 \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x407d\<close>
declare P_0x407f_false_92_def[Ps]

definition P_0x407f_false_92_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x407f_false_92_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x407f_false_92_regions :: state_pred where
  \<open>P_0x407f_false_92_regions \<sigma> \<equiv> \<exists>regions. P_0x407f_false_92_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x40a0_92 :: state_pred where
  \<open>Q_0x40a0_92 \<sigma> \<equiv> RIP \<sigma> = 0x40a0 \<and> RDX \<sigma> = 0x80 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x407d\<close>
declare Q_0x40a0_92_def[Qs]

schematic_goal img_info_0_6_0x407f_0x4098_92[blocks]:
  assumes \<open>(P_0x407f_false_92 && P_0x407f_false_92_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 6 0x4098 92 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x40a0_92 ?\<sigma> \<and> block_usage P_0x407f_false_92_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x407f_false_92_def P_0x407f_false_92_regions_def post: Q_0x40a0_92_def regionset: P_0x407f_false_92_regions_set_def)

definition P_0x40a0_93 :: state_pred where
  \<open>P_0x40a0_93 \<sigma> \<equiv> RIP \<sigma> = 0x40a0 \<and> RDX \<sigma> = 0x80 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x407d\<close>
declare P_0x40a0_93_def[Ps]

definition P_0x40a0_93_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x40a0_93_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x40a0_93_regions :: state_pred where
  \<open>P_0x40a0_93_regions \<sigma> \<equiv> \<exists>regions. P_0x40a0_93_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_get_format_addr_0x40a0_93 :: state_pred where
  \<open>Q_bdrv_get_format_addr_0x40a0_93 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa70) \<and> RIP \<sigma> = bdrv_get_format_addr \<and> RDX \<sigma> = 0x80 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x40a5\<close>
declare Q_bdrv_get_format_addr_0x40a0_93_def[Qs]

schematic_goal img_info_0_1_0x40a0_0x40a0_93[blocks]:
  assumes \<open>(P_0x40a0_93 && P_0x40a0_93_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x40a0 93 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_get_format_addr_0x40a0_93 ?\<sigma> \<and> block_usage P_0x40a0_93_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x40a0_93_def P_0x40a0_93_regions_def post: Q_bdrv_get_format_addr_0x40a0_93_def regionset: P_0x40a0_93_regions_set_def)

definition P_0x40a5_94 :: state_pred where
  \<open>P_0x40a5_94 \<sigma> \<equiv> RIP \<sigma> = 0x40a5 \<and> RDX \<sigma> = 0x80 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x40a5\<close>
declare P_0x40a5_94_def[Ps]

definition P_0x40a5_94_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x40a5_94_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x40a5_94_regions :: state_pred where
  \<open>P_0x40a5_94_regions \<sigma> \<equiv> \<exists>regions. P_0x40a5_94_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x40ad_94 :: state_pred where
  \<open>Q_0x40ad_94 \<sigma> \<equiv> RIP \<sigma> = 0x40ad \<and> RDX \<sigma> = 0x80 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0xa60) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x40a5\<close>
declare Q_0x40ad_94_def[Qs]

schematic_goal img_info_0_2_0x40a5_0x40aa_94[blocks]:
  assumes \<open>(P_0x40a5_94 && P_0x40a5_94_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x40aa 94 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x40ad_94 ?\<sigma> \<and> block_usage P_0x40a5_94_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x40a5_94_def P_0x40a5_94_regions_def post: Q_0x40ad_94_def regionset: P_0x40a5_94_regions_set_def)

definition P_0x40ad_95 :: state_pred where
  \<open>P_0x40ad_95 \<sigma> \<equiv> RIP \<sigma> = 0x40ad \<and> RDX \<sigma> = 0x80 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0xa60) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x40a5\<close>
declare P_0x40ad_95_def[Ps]

definition P_0x40ad_95_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x40ad_95_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x40ad_95_regions :: state_pred where
  \<open>P_0x40ad_95_regions \<sigma> \<equiv> \<exists>regions. P_0x40ad_95_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_get_geometry_addr_0x40ad_95 :: state_pred where
  \<open>Q_bdrv_get_geometry_addr_0x40ad_95 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa70) \<and> RIP \<sigma> = bdrv_get_geometry_addr \<and> RDX \<sigma> = 0x80 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0xa60) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x40b2\<close>
declare Q_bdrv_get_geometry_addr_0x40ad_95_def[Qs]

schematic_goal img_info_0_1_0x40ad_0x40ad_95[blocks]:
  assumes \<open>(P_0x40ad_95 && P_0x40ad_95_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x40ad 95 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_get_geometry_addr_0x40ad_95 ?\<sigma> \<and> block_usage P_0x40ad_95_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x40ad_95_def P_0x40ad_95_regions_def post: Q_bdrv_get_geometry_addr_0x40ad_95_def regionset: P_0x40ad_95_regions_set_def)

definition P_0x40b2_96 :: state_pred where
  \<open>P_0x40b2_96 \<sigma> \<equiv> RIP \<sigma> = 0x40b2 \<and> RDX \<sigma> = 0x80 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0xa60) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x40b2\<close>
declare P_0x40b2_96_def[Ps]

definition P_0x40b2_96_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x40b2_96_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x40b2_96_regions :: state_pred where
  \<open>P_0x40b2_96_regions \<sigma> \<equiv> \<exists>regions. P_0x40b2_96_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x40c3_96 :: state_pred where
  \<open>Q_0x40c3_96 \<sigma> \<equiv> RIP \<sigma> = 0x40c3 \<and> RDX \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x40b2\<close>
declare Q_0x40c3_96_def[Qs]

schematic_goal img_info_0_4_0x40b2_0x40bf_96[blocks]:
  assumes \<open>(P_0x40b2_96 && P_0x40b2_96_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x40bf 96 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x40c3_96 ?\<sigma> \<and> block_usage P_0x40b2_96_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x40b2_96_def P_0x40b2_96_regions_def post: Q_0x40c3_96_def regionset: P_0x40b2_96_regions_set_def)

definition P_0x40c3_97 :: state_pred where
  \<open>P_0x40c3_97 \<sigma> \<equiv> RIP \<sigma> = 0x40c3 \<and> RDX \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x40b2\<close>
declare P_0x40c3_97_def[Ps]

definition P_0x40c3_97_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x40c3_97_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x40c3_97_regions :: state_pred where
  \<open>P_0x40c3_97_regions \<sigma> \<equiv> \<exists>regions. P_0x40c3_97_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_get_human_readable_size_addr_0x40c3_97 :: state_pred where
  \<open>Q_get_human_readable_size_addr_0x40c3_97 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa70) \<and> RIP \<sigma> = get_human_readable_size_addr \<and> RDX \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> RSI \<sigma> = 0x80 \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x40c8\<close>
declare Q_get_human_readable_size_addr_0x40c3_97_def[Qs]

schematic_goal img_info_0_1_0x40c3_0x40c3_97[blocks]:
  assumes \<open>(P_0x40c3_97 && P_0x40c3_97_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x40c3 97 \<sigma> \<triangleq> ?\<sigma> \<and> Q_get_human_readable_size_addr_0x40c3_97 ?\<sigma> \<and> block_usage P_0x40c3_97_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x40c3_97_def P_0x40c3_97_regions_def post: Q_get_human_readable_size_addr_0x40c3_97_def regionset: P_0x40c3_97_regions_set_def)

definition P_0x40c8_98 :: state_pred where
  \<open>P_0x40c8_98 \<sigma> \<equiv> RIP \<sigma> = 0x40c8 \<and> RDX \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x40c8\<close>
declare P_0x40c8_98_def[Ps]

definition P_0x40c8_98_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x40c8_98_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x40c8_98_regions :: state_pred where
  \<open>P_0x40c8_98_regions \<sigma> \<equiv> \<exists>regions. P_0x40c8_98_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x40d5_98 :: state_pred where
  \<open>Q_0x40d5_98 \<sigma> \<equiv> RIP \<sigma> = 0x40d5 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0xa48) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x40c8\<close>
declare Q_0x40d5_98_def[Qs]

schematic_goal img_info_0_3_0x40c8_0x40d0_98[blocks]:
  assumes \<open>(P_0x40c8_98 && P_0x40c8_98_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x40d0 98 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x40d5_98 ?\<sigma> \<and> block_usage P_0x40c8_98_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x40c8_98_def P_0x40c8_98_regions_def post: Q_0x40d5_98_def regionset: P_0x40c8_98_regions_set_def)

definition P_0x40d5_99 :: state_pred where
  \<open>P_0x40d5_99 \<sigma> \<equiv> RIP \<sigma> = 0x40d5 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0xa48) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x40c8\<close>
declare P_0x40d5_99_def[Ps]

definition P_0x40d5_99_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x40d5_99_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x40d5_99_regions :: state_pred where
  \<open>P_0x40d5_99_regions \<sigma> \<equiv> \<exists>regions. P_0x40d5_99_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_xstat64_addr_0x40d5_99 :: state_pred where
  \<open>Q_xstat64_addr_0x40d5_99 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa70) \<and> RIP \<sigma> = xstat64_addr \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0xa48) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = RBP \<sigma> \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x40da\<close>
declare Q_xstat64_addr_0x40d5_99_def[Qs]

schematic_goal img_info_0_1_0x40d5_0x40d5_99[blocks]:
  assumes \<open>(P_0x40d5_99 && P_0x40d5_99_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x40d5 99 \<sigma> \<triangleq> ?\<sigma> \<and> Q_xstat64_addr_0x40d5_99 ?\<sigma> \<and> block_usage P_0x40d5_99_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x40d5_99_def P_0x40d5_99_regions_def post: Q_xstat64_addr_0x40d5_99_def regionset: P_0x40d5_99_regions_set_def)

definition P_0x40da_100 :: state_pred where
  \<open>P_0x40da_100 \<sigma> \<equiv> RIP \<sigma> = 0x40da \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0xa48) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x40da\<close>
declare P_0x40da_100_def[Ps]

definition P_0x40da_100_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x40da_100_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x40da_100_regions :: state_pred where
  \<open>P_0x40da_100_regions \<sigma> \<equiv> \<exists>regions. P_0x40da_100_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x40dc_100 :: state_pred where
  \<open>Q_0x40dc_100 \<sigma> \<equiv> RIP \<sigma> = 0x40dc \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0xa48) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x40da\<close>
declare Q_0x40dc_100_def[Qs]

schematic_goal img_info_0_1_0x40da_0x40da_100[blocks]:
  assumes \<open>(P_0x40da_100 && P_0x40da_100_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x40da 100 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x40dc_100 ?\<sigma> \<and> block_usage P_0x40da_100_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x40da_100_def P_0x40da_100_regions_def post: Q_0x40dc_100_def regionset: P_0x40da_100_regions_set_def)

definition P_0x40dc_true_101 :: state_pred where
  \<open>P_0x40dc_true_101 \<sigma> \<equiv> RIP \<sigma> = 0x40dc \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0xa48) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x40da\<close>
declare P_0x40dc_true_101_def[Ps]

definition P_0x40dc_true_101_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x40dc_true_101_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x8b0), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x8b8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x40dc_true_101_regions :: state_pred where
  \<open>P_0x40dc_true_101_regions \<sigma> \<equiv> \<exists>regions. P_0x40dc_true_101_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x4112_101 :: state_pred where
  \<open>Q_0x4112_101 \<sigma> \<equiv> RIP \<sigma> = 0x4112 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word)\<close>
declare Q_0x4112_101_def[Qs]

schematic_goal img_info_0_5_0x40dc_0x410a_101[blocks]:
  assumes \<open>(P_0x40dc_true_101 && P_0x40dc_true_101_regions && SF) \<sigma>\<close>
  shows \<open>exec_block 5 0x410a 101 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x4112_101 ?\<sigma> \<and> block_usage P_0x40dc_true_101_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x40dc_true_101_def P_0x40dc_true_101_regions_def post: Q_0x4112_101_def regionset: P_0x40dc_true_101_regions_set_def)

definition P_0x40dc_false_102 :: state_pred where
  \<open>P_0x40dc_false_102 \<sigma> \<equiv> RIP \<sigma> = 0x40dc \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0xa48) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x40da\<close>
declare P_0x40dc_false_102_def[Ps]

definition P_0x40dc_false_102_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x40dc_false_102_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa08), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x40dc_false_102_regions :: state_pred where
  \<open>P_0x40dc_false_102_regions \<sigma> \<equiv> \<exists>regions. P_0x40dc_false_102_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x40e7_102 :: state_pred where
  \<open>Q_0x40e7_102 \<sigma> \<equiv> RIP \<sigma> = 0x40e7 \<and> RDX \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa08),8]::64 word) << 9) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa08),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa08),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x40da\<close>
declare Q_0x40e7_102_def[Qs]

schematic_goal img_info_0_3_0x40dc_0x40e3_102[blocks]:
  assumes \<open>(P_0x40dc_false_102 && P_0x40dc_false_102_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 3 0x40e3 102 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x40e7_102 ?\<sigma> \<and> block_usage P_0x40dc_false_102_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x40dc_false_102_def P_0x40dc_false_102_regions_def post: Q_0x40e7_102_def regionset: P_0x40dc_false_102_regions_set_def)

definition P_0x40e7_true_103 :: state_pred where
  \<open>P_0x40e7_true_103 \<sigma> \<equiv> RIP \<sigma> = 0x40e7 \<and> RDX \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa08),8]::64 word) << 9) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa08),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa08),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x40da\<close>
declare P_0x40e7_true_103_def[Ps]

definition P_0x40e7_true_103_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x40e7_true_103_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa08), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x40e7_true_103_regions :: state_pred where
  \<open>P_0x40e7_true_103_regions \<sigma> \<equiv> \<exists>regions. P_0x40e7_true_103_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x41d7_103 :: state_pred where
  \<open>Q_0x41d7_103 \<sigma> \<equiv> RIP \<sigma> = 0x41d7 \<and> RDX \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa08),8]::64 word) << 9) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa08),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa08),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x40da\<close>
declare Q_0x41d7_103_def[Qs]

schematic_goal img_info_0_4_0x40e7_0x41d4_103[blocks]:
  assumes \<open>(P_0x40e7_true_103 && P_0x40e7_true_103_regions && !SF) \<sigma>\<close>
  shows \<open>exec_block 4 0x41d4 103 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x41d7_103 ?\<sigma> \<and> block_usage P_0x40e7_true_103_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x40e7_true_103_def P_0x40e7_true_103_regions_def post: Q_0x41d7_103_def regionset: P_0x40e7_true_103_regions_set_def)

definition P_0x41d7_104 :: state_pred where
  \<open>P_0x41d7_104 \<sigma> \<equiv> RIP \<sigma> = 0x41d7 \<and> RDX \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa08),8]::64 word) << 9) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa08),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa08),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x40da\<close>
declare P_0x41d7_104_def[Ps]

definition P_0x41d7_104_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x41d7_104_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa08), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x41d7_104_regions :: state_pred where
  \<open>P_0x41d7_104_regions \<sigma> \<equiv> \<exists>regions. P_0x41d7_104_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_get_human_readable_size_addr_0x41d7_104 :: state_pred where
  \<open>Q_get_human_readable_size_addr_0x41d7_104 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa70) \<and> RIP \<sigma> = get_human_readable_size_addr \<and> RDX \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa08),8]::64 word) << 9) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> RSI \<sigma> = 0x80 \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa08),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa08),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x41dc\<close>
declare Q_get_human_readable_size_addr_0x41d7_104_def[Qs]

schematic_goal img_info_0_1_0x41d7_0x41d7_104[blocks]:
  assumes \<open>(P_0x41d7_104 && P_0x41d7_104_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x41d7 104 \<sigma> \<triangleq> ?\<sigma> \<and> Q_get_human_readable_size_addr_0x41d7_104 ?\<sigma> \<and> block_usage P_0x41d7_104_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x41d7_104_def P_0x41d7_104_regions_def post: Q_get_human_readable_size_addr_0x41d7_104_def regionset: P_0x41d7_104_regions_set_def)

definition P_0x41dc_105 :: state_pred where
  \<open>P_0x41dc_105 \<sigma> \<equiv> RIP \<sigma> = 0x41dc \<and> RDX \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa08),8]::64 word) << 9) \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> RSI \<sigma> = 0x80 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa08),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa08),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x41dc\<close>
declare P_0x41dc_105_def[Ps]

definition P_0x41dc_105_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x41dc_105_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa08), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x41dc_105_regions :: state_pred where
  \<open>P_0x41dc_105_regions \<sigma> \<equiv> \<exists>regions. P_0x41dc_105_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x4112_105 :: state_pred where
  \<open>Q_0x4112_105 \<sigma> \<equiv> RIP \<sigma> = 0x4112 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word)\<close>
declare Q_0x4112_105_def[Qs]

schematic_goal img_info_0_1_0x41dc_0x41dc_105[blocks]:
  assumes \<open>(P_0x41dc_105 && P_0x41dc_105_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x41dc 105 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x4112_105 ?\<sigma> \<and> block_usage P_0x41dc_105_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x41dc_105_def P_0x41dc_105_regions_def post: Q_0x4112_105_def regionset: P_0x41dc_105_regions_set_def)

definition P_0x40e7_false_106 :: state_pred where
  \<open>P_0x40e7_false_106 \<sigma> \<equiv> RIP \<sigma> = 0x40e7 \<and> RDX \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa08),8]::64 word) << 9) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = RBP \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = R14\<^sub>0 \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa08),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa08),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x40da\<close>
declare P_0x40e7_false_106_def[Ps]

definition P_0x40e7_false_106_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x40e7_false_106_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x8b0), 4),
    (9, ((RSP\<^sub>0::64 word) - 0x8b8), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa08), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xa70), 8)
  }\<close>

definition P_0x40e7_false_106_regions :: state_pred where
  \<open>P_0x40e7_false_106_regions \<sigma> \<equiv> \<exists>regions. P_0x40e7_false_106_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x4112_106 :: state_pred where
  \<open>Q_0x4112_106 \<sigma> \<equiv> RIP \<sigma> = 0x4112 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word)\<close>
declare Q_0x4112_106_def[Qs]

schematic_goal img_info_0_5_0x40e7_0x410a_106[blocks]:
  assumes \<open>(P_0x40e7_false_106 && P_0x40e7_false_106_regions && ! !SF) \<sigma>\<close>
  shows \<open>exec_block 5 0x410a 106 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x4112_106 ?\<sigma> \<and> block_usage P_0x40e7_false_106_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x40e7_false_106_def P_0x40e7_false_106_regions_def post: Q_0x4112_106_def regionset: P_0x40e7_false_106_regions_set_def)

definition P_0x4112_107 :: state_pred where
  \<open>P_0x4112_107 \<sigma> \<equiv> RIP \<sigma> = 0x4112 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = R9\<^sub>0 \<and> R8 \<sigma> = R8\<^sub>0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word)\<close>
declare P_0x4112_107_def[Ps]

definition P_0x4112_107_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4112_107_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa78), 8)
  }\<close>

definition P_0x4112_107_regions :: state_pred where
  \<open>P_0x4112_107_regions \<sigma> \<equiv> \<exists>regions. P_0x4112_107_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x4138_107 :: state_pred where
  \<open>Q_0x4138_107 \<sigma> \<equiv> RIP \<sigma> = 0x4138 \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> RDX \<sigma> = RBP \<sigma> \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x1d9c0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa78) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8)\<close>
declare Q_0x4138_107_def[Qs]

schematic_goal img_info_0_10_0x4112_0x4134_107[blocks]:
  assumes \<open>(P_0x4112_107 && P_0x4112_107_regions) \<sigma>\<close>
  shows \<open>exec_block 10 0x4134 107 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x4138_107 ?\<sigma> \<and> block_usage P_0x4112_107_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4112_107_def P_0x4112_107_regions_def post: Q_0x4138_107_def regionset: P_0x4112_107_regions_set_def)

definition P_0x4138_108 :: state_pred where
  \<open>P_0x4138_108 \<sigma> \<equiv> RIP \<sigma> = 0x4138 \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> RDX \<sigma> = RBP \<sigma> \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x1d9c0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa78) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8)\<close>
declare P_0x4138_108_def[Ps]

definition P_0x4138_108_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4138_108_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x4138_108_regions :: state_pred where
  \<open>P_0x4138_108_regions \<sigma> \<equiv> \<exists>regions. P_0x4138_108_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_printf_chk_addr_0x4138_108 :: state_pred where
  \<open>Q_printf_chk_addr_0x4138_108 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa80) \<and> RIP \<sigma> = printf_chk_addr \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> RDX \<sigma> = RBP \<sigma> \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x1d9c0 \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x413d\<close>
declare Q_printf_chk_addr_0x4138_108_def[Qs]

schematic_goal img_info_0_1_0x4138_0x4138_108[blocks]:
  assumes \<open>(P_0x4138_108 && P_0x4138_108_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x4138 108 \<sigma> \<triangleq> ?\<sigma> \<and> Q_printf_chk_addr_0x4138_108 ?\<sigma> \<and> block_usage P_0x4138_108_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4138_108_def P_0x4138_108_regions_def post: Q_printf_chk_addr_0x4138_108_def regionset: P_0x4138_108_regions_set_def)

definition P_0x413d_109 :: state_pred where
  \<open>P_0x413d_109 \<sigma> \<equiv> RIP \<sigma> = 0x413d \<and> RAX \<sigma> = printf_chk_0x4138_retval \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> RDX \<sigma> = RBP \<sigma> \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x1d9c0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa78) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x413d\<close>
declare P_0x413d_109_def[Ps]

definition P_0x413d_109_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x413d_109_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x413d_109_regions :: state_pred where
  \<open>P_0x413d_109_regions \<sigma> \<equiv> \<exists>regions. P_0x413d_109_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x4140_109 :: state_pred where
  \<open>Q_0x4140_109 \<sigma> \<equiv> RIP \<sigma> = 0x4140 \<and> RAX \<sigma> = printf_chk_0x4138_retval \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> RDX \<sigma> = RBP \<sigma> \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = 0x1d9c0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa78) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x413d\<close>
declare Q_0x4140_109_def[Qs]

schematic_goal img_info_0_1_0x413d_0x413d_109[blocks]:
  assumes \<open>(P_0x413d_109 && P_0x413d_109_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x413d 109 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x4140_109 ?\<sigma> \<and> block_usage P_0x413d_109_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x413d_109_def P_0x413d_109_regions_def post: Q_0x4140_109_def regionset: P_0x413d_109_regions_set_def)

definition P_0x4140_110 :: state_pred where
  \<open>P_0x4140_110 \<sigma> \<equiv> RIP \<sigma> = 0x4140 \<and> RAX \<sigma> = printf_chk_0x4138_retval \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> RDX \<sigma> = RBP \<sigma> \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = 0x1d9c0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa78) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x413d\<close>
declare P_0x4140_110_def[Ps]

definition P_0x4140_110_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4140_110_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x4140_110_regions :: state_pred where
  \<open>P_0x4140_110_regions \<sigma> \<equiv> \<exists>regions. P_0x4140_110_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_is_encrypted_addr_0x4140_110 :: state_pred where
  \<open>Q_bdrv_is_encrypted_addr_0x4140_110 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa80) \<and> RIP \<sigma> = bdrv_is_encrypted_addr \<and> RAX \<sigma> = printf_chk_0x4138_retval \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> RDX \<sigma> = RBP \<sigma> \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = 0x1d9c0 \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_bdrv_is_encrypted_addr_0x4140_110_def[Qs]

schematic_goal img_info_0_1_0x4140_0x4140_110[blocks]:
  assumes \<open>(P_0x4140_110 && P_0x4140_110_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x4140 110 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_is_encrypted_addr_0x4140_110 ?\<sigma> \<and> block_usage P_0x4140_110_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4140_110_def P_0x4140_110_regions_def post: Q_bdrv_is_encrypted_addr_0x4140_110_def regionset: P_0x4140_110_regions_set_def)

definition P_0x4145_111 :: state_pred where
  \<open>P_0x4145_111 \<sigma> \<equiv> RIP \<sigma> = 0x4145 \<and> RAX \<sigma> = ucast (bdrv_is_encrypted_0x4140_retval) \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> RDX \<sigma> = RBP \<sigma> \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = 0x1d9c0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa78) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x4145_111_def[Ps]

definition P_0x4145_111_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4145_111_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x4145_111_regions :: state_pred where
  \<open>P_0x4145_111_regions \<sigma> \<equiv> \<exists>regions. P_0x4145_111_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x4149_111 :: state_pred where
  \<open>Q_0x4149_111 \<sigma> \<equiv> RIP \<sigma> = 0x4149 \<and> RAX \<sigma> = ucast (bdrv_is_encrypted_0x4140_retval) \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = 0x1d9c0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_0x4149_111_def[Qs]

schematic_goal img_info_0_3_0x4145_0x4147_111[blocks]:
  assumes \<open>(P_0x4145_111 && P_0x4145_111_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x4147 111 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x4149_111 ?\<sigma> \<and> block_usage P_0x4145_111_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4145_111_def P_0x4145_111_regions_def post: Q_0x4149_111_def regionset: P_0x4145_111_regions_set_def)

definition P_0x4149_true_112 :: state_pred where
  \<open>P_0x4149_true_112 \<sigma> \<equiv> RIP \<sigma> = 0x4149 \<and> RAX \<sigma> = ucast (bdrv_is_encrypted_0x4140_retval) \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = 0x1d9c0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x4149_true_112_def[Ps]

definition P_0x4149_true_112_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4149_true_112_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x4149_true_112_regions :: state_pred where
  \<open>P_0x4149_true_112_regions \<sigma> \<equiv> \<exists>regions. P_0x4149_true_112_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x41e8_112 :: state_pred where
  \<open>Q_0x41e8_112 \<sigma> \<equiv> RIP \<sigma> = 0x41e8 \<and> RAX \<sigma> = ucast (bdrv_is_encrypted_0x4140_retval) \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> RDI \<sigma> = 0x1d079 \<and> RSI \<sigma> = 0x1d9c0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_0x41e8_112_def[Qs]

schematic_goal img_info_0_2_0x4149_0x41e1_112[blocks]:
  assumes \<open>(P_0x4149_true_112 && P_0x4149_true_112_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 2 0x41e1 112 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x41e8_112 ?\<sigma> \<and> block_usage P_0x4149_true_112_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4149_true_112_def P_0x4149_true_112_regions_def post: Q_0x41e8_112_def regionset: P_0x4149_true_112_regions_set_def)

definition P_0x41e8_113 :: state_pred where
  \<open>P_0x41e8_113 \<sigma> \<equiv> RIP \<sigma> = 0x41e8 \<and> RAX \<sigma> = ucast (bdrv_is_encrypted_0x4140_retval) \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> RDI \<sigma> = 0x1d079 \<and> RSI \<sigma> = 0x1d9c0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x41e8_113_def[Ps]

definition P_0x41e8_113_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x41e8_113_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x41e8_113_regions :: state_pred where
  \<open>P_0x41e8_113_regions \<sigma> \<equiv> \<exists>regions. P_0x41e8_113_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_puts_addr_0x41e8_113 :: state_pred where
  \<open>Q_puts_addr_0x41e8_113 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa70) \<and> RIP \<sigma> = puts_addr \<and> RAX \<sigma> = ucast (bdrv_is_encrypted_0x4140_retval) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> RDI \<sigma> = 0x1d079 \<and> RSI \<sigma> = 0x1d9c0 \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x41ed \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_puts_addr_0x41e8_113_def[Qs]

schematic_goal img_info_0_1_0x41e8_0x41e8_113[blocks]:
  assumes \<open>(P_0x41e8_113 && P_0x41e8_113_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x41e8 113 \<sigma> \<triangleq> ?\<sigma> \<and> Q_puts_addr_0x41e8_113 ?\<sigma> \<and> block_usage P_0x41e8_113_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x41e8_113_def P_0x41e8_113_regions_def post: Q_puts_addr_0x41e8_113_def regionset: P_0x41e8_113_regions_set_def)

definition P_0x41ed_114 :: state_pred where
  \<open>P_0x41ed_114 \<sigma> \<equiv> RIP \<sigma> = 0x41ed \<and> RAX \<sigma> = puts_0x41e8_retval \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> RDI \<sigma> = 0x1d079 \<and> RSI \<sigma> = 0x1d9c0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x41ed \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x41ed_114_def[Ps]

definition P_0x41ed_114_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x41ed_114_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x41ed_114_regions :: state_pred where
  \<open>P_0x41ed_114_regions \<sigma> \<equiv> \<exists>regions. P_0x41ed_114_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x414f_114 :: state_pred where
  \<open>Q_0x414f_114 \<sigma> \<equiv> RIP \<sigma> = 0x414f \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> RSI \<sigma> = 0x1d9c0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_0x414f_114_def[Qs]

schematic_goal img_info_0_1_0x41ed_0x41ed_114[blocks]:
  assumes \<open>(P_0x41ed_114 && P_0x41ed_114_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x41ed 114 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x414f_114 ?\<sigma> \<and> block_usage P_0x41ed_114_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x41ed_114_def P_0x41ed_114_regions_def post: Q_0x414f_114_def regionset: P_0x41ed_114_regions_set_def)

definition P_0x4149_false_115 :: state_pred where
  \<open>P_0x4149_false_115 \<sigma> \<equiv> RIP \<sigma> = 0x4149 \<and> RAX \<sigma> = ucast (bdrv_is_encrypted_0x4140_retval) \<and> RCX \<sigma> = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = 0x1d9c0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x4149_false_115_def[Ps]

definition P_0x4149_false_115_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4149_false_115_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x4149_false_115_regions :: state_pred where
  \<open>P_0x4149_false_115_regions \<sigma> \<equiv> \<exists>regions. P_0x4149_false_115_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x414f_115 :: state_pred where
  \<open>Q_0x414f_115 \<sigma> \<equiv> RIP \<sigma> = 0x414f \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> RSI \<sigma> = 0x1d9c0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_0x414f_115_def[Qs]

schematic_goal img_info_0_1_0x4149_0x4149_115[blocks]:
  assumes \<open>(P_0x4149_false_115 && P_0x4149_false_115_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x4149 115 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x414f_115 ?\<sigma> \<and> block_usage P_0x4149_false_115_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4149_false_115_def P_0x4149_false_115_regions_def post: Q_0x414f_115_def regionset: P_0x4149_false_115_regions_set_def)

definition P_0x414f_116 :: state_pred where
  \<open>P_0x414f_116 \<sigma> \<equiv> RIP \<sigma> = 0x414f \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> RSI \<sigma> = 0x1d9c0 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x414f_116_def[Ps]

definition P_0x414f_116_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x414f_116_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x414f_116_regions :: state_pred where
  \<open>P_0x414f_116_regions \<sigma> \<equiv> \<exists>regions. P_0x414f_116_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x4157_116 :: state_pred where
  \<open>Q_0x4157_116 \<sigma> \<equiv> RIP \<sigma> = 0x4157 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0xa58) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_0x4157_116_def[Qs]

schematic_goal img_info_0_2_0x414f_0x4154_116[blocks]:
  assumes \<open>(P_0x414f_116 && P_0x414f_116_regions) \<sigma>\<close>
  shows \<open>exec_block 2 0x4154 116 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x4157_116 ?\<sigma> \<and> block_usage P_0x414f_116_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x414f_116_def P_0x414f_116_regions_def post: Q_0x4157_116_def regionset: P_0x414f_116_regions_set_def)

definition P_0x4157_117 :: state_pred where
  \<open>P_0x4157_117 \<sigma> \<equiv> RIP \<sigma> = 0x4157 \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0xa58) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x4157_117_def[Ps]

definition P_0x4157_117_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4157_117_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x4157_117_regions :: state_pred where
  \<open>P_0x4157_117_regions \<sigma> \<equiv> \<exists>regions. P_0x4157_117_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_get_info_addr_0x4157_117 :: state_pred where
  \<open>Q_bdrv_get_info_addr_0x4157_117 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa70) \<and> RIP \<sigma> = bdrv_get_info_addr \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0xa58) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x415c \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_bdrv_get_info_addr_0x4157_117_def[Qs]

schematic_goal img_info_0_1_0x4157_0x4157_117[blocks]:
  assumes \<open>(P_0x4157_117 && P_0x4157_117_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x4157 117 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_get_info_addr_0x4157_117 ?\<sigma> \<and> block_usage P_0x4157_117_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4157_117_def P_0x4157_117_regions_def post: Q_bdrv_get_info_addr_0x4157_117_def regionset: P_0x4157_117_regions_set_def)

definition P_0x415c_118 :: state_pred where
  \<open>P_0x415c_118 \<sigma> \<equiv> RIP \<sigma> = 0x415c \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0xa58) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x415c \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x415c_118_def[Ps]

definition P_0x415c_118_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x415c_118_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x415c_118_regions :: state_pred where
  \<open>P_0x415c_118_regions \<sigma> \<equiv> \<exists>regions. P_0x415c_118_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x415e_118 :: state_pred where
  \<open>Q_0x415e_118 \<sigma> \<equiv> RIP \<sigma> = 0x415e \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0xa58) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x415c \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_0x415e_118_def[Qs]

schematic_goal img_info_0_1_0x415c_0x415c_118[blocks]:
  assumes \<open>(P_0x415c_118 && P_0x415c_118_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x415c 118 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x415e_118 ?\<sigma> \<and> block_usage P_0x415c_118_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x415c_118_def P_0x415c_118_regions_def post: Q_0x415e_118_def regionset: P_0x415c_118_regions_set_def)

definition P_0x415e_true_119 :: state_pred where
  \<open>P_0x415e_true_119 \<sigma> \<equiv> RIP \<sigma> = 0x415e \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0xa58) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x415c \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x415e_true_119_def[Ps]

definition P_0x415e_true_119_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x415e_true_119_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x415e_true_119_regions :: state_pred where
  \<open>P_0x415e_true_119_regions \<sigma> \<equiv> \<exists>regions. P_0x415e_true_119_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x416c_119 :: state_pred where
  \<open>Q_0x416c_119 \<sigma> \<equiv> RIP \<sigma> = 0x416c \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_0x416c_119_def[Qs]

schematic_goal img_info_0_1_0x415e_0x415e_119[blocks]:
  assumes \<open>(P_0x415e_true_119 && P_0x415e_true_119_regions && SF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x415e 119 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x416c_119 ?\<sigma> \<and> block_usage P_0x415e_true_119_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x415e_true_119_def P_0x415e_true_119_regions_def post: Q_0x416c_119_def regionset: P_0x415e_true_119_regions_set_def)

definition P_0x415e_false_120 :: state_pred where
  \<open>P_0x415e_false_120 \<sigma> \<equiv> RIP \<sigma> = 0x415e \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0xa58) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x415c \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x415e_false_120_def[Ps]

definition P_0x415e_false_120_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x415e_false_120_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa58), 4),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x415e_false_120_regions :: state_pred where
  \<open>P_0x415e_false_120_regions \<sigma> \<equiv> \<exists>regions. P_0x415e_false_120_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x4166_120 :: state_pred where
  \<open>Q_0x4166_120 \<sigma> \<equiv> RIP \<sigma> = 0x4166 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa58),4]::32 word)) \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0xa58) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x415c \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_0x4166_120_def[Qs]

schematic_goal img_info_0_3_0x415e_0x4164_120[blocks]:
  assumes \<open>(P_0x415e_false_120 && P_0x415e_false_120_regions && ! SF) \<sigma>\<close>
  shows \<open>exec_block 3 0x4164 120 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x4166_120 ?\<sigma> \<and> block_usage P_0x415e_false_120_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x415e_false_120_def P_0x415e_false_120_regions_def post: Q_0x4166_120_def regionset: P_0x415e_false_120_regions_set_def)

definition P_0x4166_true_121 :: state_pred where
  \<open>P_0x4166_true_121 \<sigma> \<equiv> RIP \<sigma> = 0x4166 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa58),4]::32 word)) \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0xa58) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x415c \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x4166_true_121_def[Ps]

definition P_0x4166_true_121_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4166_true_121_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa58), 4),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x4166_true_121_regions :: state_pred where
  \<open>P_0x4166_true_121_regions \<sigma> \<equiv> \<exists>regions. P_0x4166_true_121_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x4240_121 :: state_pred where
  \<open>Q_0x4240_121 \<sigma> \<equiv> RIP \<sigma> = 0x4240 \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa58),4]::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x1d088 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x415c \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_0x4240_121_def[Qs]

schematic_goal img_info_0_4_0x4166_0x423e_121[blocks]:
  assumes \<open>(P_0x4166_true_121 && P_0x4166_true_121_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 4 0x423e 121 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x4240_121 ?\<sigma> \<and> block_usage P_0x4166_true_121_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4166_true_121_def P_0x4166_true_121_regions_def post: Q_0x4240_121_def regionset: P_0x4166_true_121_regions_set_def)

definition P_0x4240_122 :: state_pred where
  \<open>P_0x4240_122 \<sigma> \<equiv> RIP \<sigma> = 0x4240 \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa58),4]::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x1d088 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x415c \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x4240_122_def[Ps]

definition P_0x4240_122_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4240_122_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa58), 4),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x4240_122_regions :: state_pred where
  \<open>P_0x4240_122_regions \<sigma> \<equiv> \<exists>regions. P_0x4240_122_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_printf_chk_addr_0x4240_122 :: state_pred where
  \<open>Q_printf_chk_addr_0x4240_122 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa70) \<and> RIP \<sigma> = printf_chk_addr \<and> RAX \<sigma> = 0x0 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa58),4]::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x1d088 \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4245 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_printf_chk_addr_0x4240_122_def[Qs]

schematic_goal img_info_0_1_0x4240_0x4240_122[blocks]:
  assumes \<open>(P_0x4240_122 && P_0x4240_122_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x4240 122 \<sigma> \<triangleq> ?\<sigma> \<and> Q_printf_chk_addr_0x4240_122 ?\<sigma> \<and> block_usage P_0x4240_122_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4240_122_def P_0x4240_122_regions_def post: Q_printf_chk_addr_0x4240_122_def regionset: P_0x4240_122_regions_set_def)

definition P_0x4245_123 :: state_pred where
  \<open>P_0x4245_123 \<sigma> \<equiv> RIP \<sigma> = 0x4245 \<and> RAX \<sigma> = printf_chk_0x4240_retval \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa58),4]::32 word)) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x1d088 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4245 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x4245_123_def[Ps]

definition P_0x4245_123_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4245_123_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa58), 4),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x4245_123_regions :: state_pred where
  \<open>P_0x4245_123_regions \<sigma> \<equiv> \<exists>regions. P_0x4245_123_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x416c_123 :: state_pred where
  \<open>Q_0x416c_123 \<sigma> \<equiv> RIP \<sigma> = 0x416c \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_0x416c_123_def[Qs]

schematic_goal img_info_0_1_0x4245_0x4245_123[blocks]:
  assumes \<open>(P_0x4245_123 && P_0x4245_123_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x4245 123 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x416c_123 ?\<sigma> \<and> block_usage P_0x4245_123_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4245_123_def P_0x4245_123_regions_def post: Q_0x416c_123_def regionset: P_0x4245_123_regions_set_def)

definition P_0x4166_false_124 :: state_pred where
  \<open>P_0x4166_false_124 \<sigma> \<equiv> RIP \<sigma> = 0x4166 \<and> RDX \<sigma> = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa58),4]::32 word)) \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0xa58) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa58),4]::32 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa58),4]::32 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x415c \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x4166_false_124_def[Ps]

definition P_0x4166_false_124_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4166_false_124_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa58), 4),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x4166_false_124_regions :: state_pred where
  \<open>P_0x4166_false_124_regions \<sigma> \<equiv> \<exists>regions. P_0x4166_false_124_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x416c_124 :: state_pred where
  \<open>Q_0x416c_124 \<sigma> \<equiv> RIP \<sigma> = 0x416c \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_0x416c_124_def[Qs]

schematic_goal img_info_0_1_0x4166_0x4166_124[blocks]:
  assumes \<open>(P_0x4166_false_124 && P_0x4166_false_124_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x4166 124 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x416c_124 ?\<sigma> \<and> block_usage P_0x4166_false_124_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4166_false_124_def P_0x4166_false_124_regions_def post: Q_0x416c_124_def regionset: P_0x4166_false_124_regions_set_def)

definition P_0x416c_125 :: state_pred where
  \<open>P_0x416c_125 \<sigma> \<equiv> RIP \<sigma> = 0x416c \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x9b8) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x416c_125_def[Ps]

definition P_0x416c_125_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x416c_125_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x416c_125_regions :: state_pred where
  \<open>P_0x416c_125_regions \<sigma> \<equiv> \<exists>regions. P_0x416c_125_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x417f_125 :: state_pred where
  \<open>Q_0x417f_125 \<sigma> \<equiv> RIP \<sigma> = 0x417f \<and> RDX \<sigma> = 0x400 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_0x417f_125_def[Qs]

schematic_goal img_info_0_4_0x416c_0x417c_125[blocks]:
  assumes \<open>(P_0x416c_125 && P_0x416c_125_regions) \<sigma>\<close>
  shows \<open>exec_block 4 0x417c 125 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x417f_125 ?\<sigma> \<and> block_usage P_0x416c_125_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x416c_125_def P_0x416c_125_regions_def post: Q_0x417f_125_def regionset: P_0x416c_125_regions_set_def)

definition P_0x417f_126 :: state_pred where
  \<open>P_0x417f_126 \<sigma> \<equiv> RIP \<sigma> = 0x417f \<and> RDX \<sigma> = 0x400 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x417f_126_def[Ps]

definition P_0x417f_126_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x417f_126_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (9, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x417f_126_regions :: state_pred where
  \<open>P_0x417f_126_regions \<sigma> \<equiv> \<exists>regions. P_0x417f_126_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_get_backing_filename_addr_0x417f_126 :: state_pred where
  \<open>Q_bdrv_get_backing_filename_addr_0x417f_126 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa70) \<and> RIP \<sigma> = bdrv_get_backing_filename_addr \<and> RDX \<sigma> = 0x400 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4184 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_bdrv_get_backing_filename_addr_0x417f_126_def[Qs]

schematic_goal img_info_0_1_0x417f_0x417f_126[blocks]:
  assumes \<open>(P_0x417f_126 && P_0x417f_126_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x417f 126 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_get_backing_filename_addr_0x417f_126 ?\<sigma> \<and> block_usage P_0x417f_126_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x417f_126_def P_0x417f_126_regions_def post: Q_bdrv_get_backing_filename_addr_0x417f_126_def regionset: P_0x417f_126_regions_set_def)

definition P_0x4184_127 :: state_pred where
  \<open>P_0x4184_127 \<sigma> \<equiv> RIP \<sigma> = 0x4184 \<and> RDX \<sigma> = 0x400 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4184 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x4184_127_def[Ps]

definition P_0x4184_127_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4184_127_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x838), 1),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x4184_127_regions :: state_pred where
  \<open>P_0x4184_127_regions \<sigma> \<equiv> \<exists>regions. P_0x4184_127_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x418c_127 :: state_pred where
  \<open>Q_0x418c_127 \<sigma> \<equiv> RIP \<sigma> = 0x418c \<and> RDX \<sigma> = 0x400 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4184 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_0x418c_127_def[Qs]

schematic_goal img_info_0_1_0x4184_0x4184_127[blocks]:
  assumes \<open>(P_0x4184_127 && P_0x4184_127_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x4184 127 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x418c_127 ?\<sigma> \<and> block_usage P_0x4184_127_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4184_127_def P_0x4184_127_regions_def post: Q_0x418c_127_def regionset: P_0x4184_127_regions_set_def)

definition P_0x418c_true_128 :: state_pred where
  \<open>P_0x418c_true_128 \<sigma> \<equiv> RIP \<sigma> = 0x418c \<and> RDX \<sigma> = 0x400 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4184 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x418c_true_128_def[Ps]

definition P_0x418c_true_128_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x418c_true_128_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x838), 1),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x418c_true_128_regions :: state_pred where
  \<open>P_0x418c_true_128_regions \<sigma> \<equiv> \<exists>regions. P_0x418c_true_128_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x4208_128 :: state_pred where
  \<open>Q_0x4208_128 \<sigma> \<equiv> RIP \<sigma> = 0x4208 \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> RDX \<sigma> = RBP \<sigma> \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x438) \<and> RSI \<sigma> = 0x400 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x438) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4184 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_0x4208_128_def[Qs]

schematic_goal img_info_0_6_0x418c_0x4205_128[blocks]:
  assumes \<open>(P_0x418c_true_128 && P_0x418c_true_128_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block 6 0x4205 128 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x4208_128 ?\<sigma> \<and> block_usage P_0x418c_true_128_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x418c_true_128_def P_0x418c_true_128_regions_def post: Q_0x4208_128_def regionset: P_0x418c_true_128_regions_set_def)

definition P_0x4208_129 :: state_pred where
  \<open>P_0x4208_129 \<sigma> \<equiv> RIP \<sigma> = 0x4208 \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> RDX \<sigma> = RBP \<sigma> \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x438) \<and> RSI \<sigma> = 0x400 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x438) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4184 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x4208_129_def[Ps]

definition P_0x4208_129_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4208_129_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x838), 1),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x4208_129_regions :: state_pred where
  \<open>P_0x4208_129_regions \<sigma> \<equiv> \<exists>regions. P_0x4208_129_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_path_combine_addr_0x4208_129 :: state_pred where
  \<open>Q_path_combine_addr_0x4208_129 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa70) \<and> RIP \<sigma> = path_combine_addr \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> RDX \<sigma> = RBP \<sigma> \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x438) \<and> RSI \<sigma> = 0x400 \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x438) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x420d \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_path_combine_addr_0x4208_129_def[Qs]

schematic_goal img_info_0_1_0x4208_0x4208_129[blocks]:
  assumes \<open>(P_0x4208_129 && P_0x4208_129_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x4208 129 \<sigma> \<triangleq> ?\<sigma> \<and> Q_path_combine_addr_0x4208_129 ?\<sigma> \<and> block_usage P_0x4208_129_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4208_129_def P_0x4208_129_regions_def post: Q_path_combine_addr_0x4208_129_def regionset: P_0x4208_129_regions_set_def)

definition P_0x420d_130 :: state_pred where
  \<open>P_0x420d_130 \<sigma> \<equiv> RIP \<sigma> = 0x420d \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> RDX \<sigma> = RBP \<sigma> \<and> RDI \<sigma> = ((RSP\<^sub>0::64 word) - 0x438) \<and> RSI \<sigma> = 0x400 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x438) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x420d \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x420d_130_def[Ps]

definition P_0x420d_130_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x420d_130_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x838), 1),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x420d_130_regions :: state_pred where
  \<open>P_0x420d_130_regions \<sigma> \<equiv> \<exists>regions. P_0x420d_130_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x4221_130 :: state_pred where
  \<open>Q_0x4221_130 \<sigma> \<equiv> RIP \<sigma> = 0x4221 \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x438) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x1da08 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x438) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x420d \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_0x4221_130_def[Qs]

schematic_goal img_info_0_5_0x420d_0x421f_130[blocks]:
  assumes \<open>(P_0x420d_130 && P_0x420d_130_regions) \<sigma>\<close>
  shows \<open>exec_block 5 0x421f 130 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x4221_130 ?\<sigma> \<and> block_usage P_0x420d_130_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x420d_130_def P_0x420d_130_regions_def post: Q_0x4221_130_def regionset: P_0x420d_130_regions_set_def)

definition P_0x4221_131 :: state_pred where
  \<open>P_0x4221_131 \<sigma> \<equiv> RIP \<sigma> = 0x4221 \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x438) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x1da08 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x438) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x420d \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x4221_131_def[Ps]

definition P_0x4221_131_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4221_131_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x838), 1),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x4221_131_regions :: state_pred where
  \<open>P_0x4221_131_regions \<sigma> \<equiv> \<exists>regions. P_0x4221_131_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_printf_chk_addr_0x4221_131 :: state_pred where
  \<open>Q_printf_chk_addr_0x4221_131 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa70) \<and> RIP \<sigma> = printf_chk_addr \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x438) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x1da08 \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x438) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4226 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_printf_chk_addr_0x4221_131_def[Qs]

schematic_goal img_info_0_1_0x4221_0x4221_131[blocks]:
  assumes \<open>(P_0x4221_131 && P_0x4221_131_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x4221 131 \<sigma> \<triangleq> ?\<sigma> \<and> Q_printf_chk_addr_0x4221_131 ?\<sigma> \<and> block_usage P_0x4221_131_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4221_131_def P_0x4221_131_regions_def post: Q_printf_chk_addr_0x4221_131_def regionset: P_0x4221_131_regions_set_def)

definition P_0x4226_132 :: state_pred where
  \<open>P_0x4226_132 \<sigma> \<equiv> RIP \<sigma> = 0x4226 \<and> RAX \<sigma> = printf_chk_0x4221_retval \<and> RCX \<sigma> = ((RSP\<^sub>0::64 word) - 0x438) \<and> RDX \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> RDI \<sigma> = 0x1 \<and> RSI \<sigma> = 0x1da08 \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x438) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4226 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x4226_132_def[Ps]

definition P_0x4226_132_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4226_132_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x838), 1),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x4226_132_regions :: state_pred where
  \<open>P_0x4226_132_regions \<sigma> \<equiv> \<exists>regions. P_0x4226_132_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x418e_132 :: state_pred where
  \<open>Q_0x418e_132 \<sigma> \<equiv> RIP \<sigma> = 0x418e \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_0x418e_132_def[Qs]

schematic_goal img_info_0_1_0x4226_0x4226_132[blocks]:
  assumes \<open>(P_0x4226_132 && P_0x4226_132_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x4226 132 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x418e_132 ?\<sigma> \<and> block_usage P_0x4226_132_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4226_132_def P_0x4226_132_regions_def post: Q_0x418e_132_def regionset: P_0x4226_132_regions_set_def)

definition P_0x418c_false_133 :: state_pred where
  \<open>P_0x418c_false_133 \<sigma> \<equiv> RIP \<sigma> = 0x418c \<and> RDX \<sigma> = 0x400 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSI \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R13 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4184 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x418c_false_133_def[Ps]

definition P_0x418c_false_133_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x418c_false_133_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x838), 1),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x418c_false_133_regions :: state_pred where
  \<open>P_0x418c_false_133_regions \<sigma> \<equiv> \<exists>regions. P_0x418c_false_133_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x418e_133 :: state_pred where
  \<open>Q_0x418e_133 \<sigma> \<equiv> RIP \<sigma> = 0x418e \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_0x418e_133_def[Qs]

schematic_goal img_info_0_1_0x418c_0x418c_133[blocks]:
  assumes \<open>(P_0x418c_false_133 && P_0x418c_false_133_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x418c 133 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x418e_133 ?\<sigma> \<and> block_usage P_0x418c_false_133_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x418c_false_133_def P_0x418c_false_133_regions_def post: Q_0x418e_133_def regionset: P_0x418c_false_133_regions_set_def)

definition P_0x418e_134 :: state_pred where
  \<open>P_0x418e_134 \<sigma> \<equiv> RIP \<sigma> = 0x418e \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x418e_134_def[Ps]

definition P_0x418e_134_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x418e_134_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x838), 1),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x418e_134_regions :: state_pred where
  \<open>P_0x418e_134_regions \<sigma> \<equiv> \<exists>regions. P_0x418e_134_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x4191_134 :: state_pred where
  \<open>Q_0x4191_134 \<sigma> \<equiv> RIP \<sigma> = 0x4191 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_0x4191_134_def[Qs]

schematic_goal img_info_0_1_0x418e_0x418e_134[blocks]:
  assumes \<open>(P_0x418e_134 && P_0x418e_134_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x418e 134 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x4191_134 ?\<sigma> \<and> block_usage P_0x418e_134_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x418e_134_def P_0x418e_134_regions_def post: Q_0x4191_134_def regionset: P_0x418e_134_regions_set_def)

definition P_0x4191_135 :: state_pred where
  \<open>P_0x4191_135 \<sigma> \<equiv> RIP \<sigma> = 0x4191 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x4191_135_def[Ps]

definition P_0x4191_135_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4191_135_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x838), 1),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x4191_135_regions :: state_pred where
  \<open>P_0x4191_135_regions \<sigma> \<equiv> \<exists>regions. P_0x4191_135_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_dump_snapshots_addr_0x4191_135 :: state_pred where
  \<open>Q_dump_snapshots_addr_0x4191_135 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa70) \<and> RIP \<sigma> = dump_snapshots_addr \<and> RDI \<sigma> = RBX \<sigma> \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4196 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_dump_snapshots_addr_0x4191_135_def[Qs]

schematic_goal img_info_0_1_0x4191_0x4191_135[blocks]:
  assumes \<open>(P_0x4191_135 && P_0x4191_135_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x4191 135 \<sigma> \<triangleq> ?\<sigma> \<and> Q_dump_snapshots_addr_0x4191_135 ?\<sigma> \<and> block_usage P_0x4191_135_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4191_135_def P_0x4191_135_regions_def post: Q_dump_snapshots_addr_0x4191_135_def regionset: P_0x4191_135_regions_set_def)

definition P_0x4196_136 :: state_pred where
  \<open>P_0x4196_136 \<sigma> \<equiv> RIP \<sigma> = 0x4196 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4196 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x4196_136_def[Ps]

definition P_0x4196_136_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4196_136_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x838), 1),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x4196_136_regions :: state_pred where
  \<open>P_0x4196_136_regions \<sigma> \<equiv> \<exists>regions. P_0x4196_136_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x4199_136 :: state_pred where
  \<open>Q_0x4199_136 \<sigma> \<equiv> RIP \<sigma> = 0x4199 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4196 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_0x4199_136_def[Qs]

schematic_goal img_info_0_1_0x4196_0x4196_136[blocks]:
  assumes \<open>(P_0x4196_136 && P_0x4196_136_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x4196 136 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x4199_136 ?\<sigma> \<and> block_usage P_0x4196_136_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4196_136_def P_0x4196_136_regions_def post: Q_0x4199_136_def regionset: P_0x4196_136_regions_set_def)

definition P_0x4199_137 :: state_pred where
  \<open>P_0x4199_137 \<sigma> \<equiv> RIP \<sigma> = 0x4199 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x4196 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x4199_137_def[Ps]

definition P_0x4199_137_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x4199_137_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x838), 1),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x4199_137_regions :: state_pred where
  \<open>P_0x4199_137_regions \<sigma> \<equiv> \<exists>regions. P_0x4199_137_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_bdrv_delete_addr_0x4199_137 :: state_pred where
  \<open>Q_bdrv_delete_addr_0x4199_137 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa70) \<and> RIP \<sigma> = bdrv_delete_addr \<and> RDI \<sigma> = RBX \<sigma> \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x419e \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_bdrv_delete_addr_0x4199_137_def[Qs]

schematic_goal img_info_0_1_0x4199_0x4199_137[blocks]:
  assumes \<open>(P_0x4199_137 && P_0x4199_137_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x4199 137 \<sigma> \<triangleq> ?\<sigma> \<and> Q_bdrv_delete_addr_0x4199_137 ?\<sigma> \<and> block_usage P_0x4199_137_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x4199_137_def P_0x4199_137_regions_def post: Q_bdrv_delete_addr_0x4199_137_def regionset: P_0x4199_137_regions_set_def)

definition P_0x419e_138 :: state_pred where
  \<open>P_0x419e_138 \<sigma> \<equiv> RIP \<sigma> = 0x419e \<and> RDI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x419e \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x419e_138_def[Ps]

definition P_0x419e_138_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x419e_138_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x838), 1),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x419e_138_regions :: state_pred where
  \<open>P_0x419e_138_regions \<sigma> \<equiv> \<exists>regions. P_0x419e_138_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x41b1_138 :: state_pred where
  \<open>Q_0x41b1_138 \<sigma> \<equiv> RIP \<sigma> = 0x41b1 \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = 0x0 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x419e \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_0x41b1_138_def[Qs]

schematic_goal img_info_0_3_0x419e_0x41a8_138[blocks]:
  assumes \<open>(P_0x419e_138 && P_0x419e_138_regions) \<sigma>\<close>
  shows \<open>exec_block 3 0x41a8 138 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x41b1_138 ?\<sigma> \<and> block_usage P_0x419e_138_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x419e_138_def P_0x419e_138_regions_def post: Q_0x41b1_138_def regionset: P_0x419e_138_regions_set_def)

definition P_0x41b1_true_139 :: state_pred where
  \<open>P_0x41b1_true_139 \<sigma> \<equiv> RIP \<sigma> = 0x41b1 \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = 0x0 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x419e \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x41b1_true_139_def[Ps]

definition P_0x41b1_true_139_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x41b1_true_139_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x838), 1),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x41b1_true_139_regions :: state_pred where
  \<open>P_0x41b1_true_139_regions \<sigma> \<equiv> \<exists>regions. P_0x41b1_true_139_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_0x426c_139 :: state_pred where
  \<open>Q_0x426c_139 \<sigma> \<equiv> RIP \<sigma> = 0x426c \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = 0x0 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x419e \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare Q_0x426c_139_def[Qs]

schematic_goal img_info_0_1_0x41b1_0x41b1_139[blocks]:
  assumes \<open>(P_0x41b1_true_139 && P_0x41b1_true_139_regions && !ZF) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x41b1 139 \<sigma> \<triangleq> ?\<sigma> \<and> Q_0x426c_139 ?\<sigma> \<and> block_usage P_0x41b1_true_139_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x41b1_true_139_def P_0x41b1_true_139_regions_def post: Q_0x426c_139_def regionset: P_0x41b1_true_139_regions_set_def)

definition P_0x426c_140 :: state_pred where
  \<open>P_0x426c_140 \<sigma> \<equiv> RIP \<sigma> = 0x426c \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = 0x0 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x419e \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x426c_140_def[Ps]

definition P_0x426c_140_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x426c_140_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x838), 1),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x426c_140_regions :: state_pred where
  \<open>P_0x426c_140_regions \<sigma> \<equiv> \<exists>regions. P_0x426c_140_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_stack_chk_fail_addr_0x426c_140 :: state_pred where
  \<open>Q_stack_chk_fail_addr_0x426c_140 \<sigma> \<equiv> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa70) \<and> RIP \<sigma> = stack_chk_fail_addr \<and> RAX \<sigma> = 0x0 \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_stack_chk_fail_addr_0x426c_140_def[Qs]

schematic_goal img_info_0_1_0x426c_0x426c_140[blocks]:
  assumes \<open>(P_0x426c_140 && P_0x426c_140_regions) \<sigma>\<close>
  shows \<open>exec_block (Suc 0) 0x426c 140 \<sigma> \<triangleq> ?\<sigma> \<and> Q_stack_chk_fail_addr_0x426c_140 ?\<sigma> \<and> block_usage P_0x426c_140_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x426c_140_def P_0x426c_140_regions_def post: Q_stack_chk_fail_addr_0x426c_140_def regionset: P_0x426c_140_regions_set_def)

definition P_0x41b1_false_141 :: state_pred where
  \<open>P_0x41b1_false_141 \<sigma> \<equiv> RIP \<sigma> = 0x41b1 \<and> RAX \<sigma> = 0x0 \<and> RCX \<sigma> = 0x0 \<and> RDI \<sigma> = RBX \<sigma> \<and> RSP \<sigma> = ((RSP\<^sub>0::64 word) - 0xa68) \<and> R14 \<sigma> = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> R12 \<sigma> = ((RSP\<^sub>0::64 word) - 0x838) \<and> R9 \<sigma> = ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) << 9) \<and> R8 \<sigma> = ((RSP\<^sub>0::64 word) - 0x938) \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word) = ucast ((\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x838),1]::8 word)) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) = (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa60),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa70),8]::64 word) = 0x419e \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa78),8]::64 word) = ((RSP\<^sub>0::64 word) - 0x8b8) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0xa80),8]::64 word) = 0x4145\<close>
declare P_0x41b1_false_141_def[Ps]

definition P_0x41b1_false_141_regions_set :: \<open>state \<Rightarrow> (nat \<times> 64 word \<times> nat) set\<close> where
  \<open>P_0x41b1_false_141_regions_set \<sigma> \<equiv> {
    (0, RSP\<^sub>0, 8),
    (1, ((FS\<^sub>0::64 word) + 0x28), 8),
    (2, ((RSP\<^sub>0::64 word) - 0x8), 8),
    (3, ((RSP\<^sub>0::64 word) - 0x10), 8),
    (4, ((RSP\<^sub>0::64 word) - 0x18), 8),
    (5, ((RSP\<^sub>0::64 word) - 0x20), 8),
    (6, ((RSP\<^sub>0::64 word) - 0x28), 8),
    (7, ((RSP\<^sub>0::64 word) - 0x30), 8),
    (8, ((RSP\<^sub>0::64 word) - 0x838), 1),
    (9, ((RSP\<^sub>0::64 word) - 0xa60), 8),
    (10, ((RSP\<^sub>0::64 word) - 0xa70), 8),
    (11, ((RSP\<^sub>0::64 word) - 0xa78), 8),
    (12, ((RSP\<^sub>0::64 word) - 0xa80), 8)
  }\<close>

definition P_0x41b1_false_141_regions :: state_pred where
  \<open>P_0x41b1_false_141_regions \<sigma> \<equiv> \<exists>regions. P_0x41b1_false_141_regions_set \<sigma> \<subseteq> regions
  \<and> (\<forall>i r. (i, r) \<in> regions \<longrightarrow> no_block_overflow r)
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<sqsubseteq> r' = (i = i' \<or> (i, i') \<in> {}))
  \<and> (\<forall>i r i' r'. (i, r) \<in> regions \<longrightarrow> (i', r') \<in> regions \<longrightarrow> r \<bowtie> r' = (i \<noteq> i' \<and> (i, i') \<notin> {}))
\<close>

definition Q_ret_address_141 :: state_pred where
  \<open>Q_ret_address_141 \<sigma> \<equiv> RIP \<sigma> = ret_address \<and> FS \<sigma> = FS\<^sub>0 \<and> (\<sigma> \<turnstile> *[RSP\<^sub>0,8]::64 word) = ret_address \<and> (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word) \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x8),8]::64 word) = R14\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x10),8]::64 word) = R13\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x18),8]::64 word) = R12\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x20),8]::64 word) = RBP\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x28),8]::64 word) = RBX\<^sub>0 \<and> (\<sigma> \<turnstile> *[((RSP\<^sub>0::64 word) - 0x30),8]::64 word) = (\<sigma> \<turnstile> *[((FS\<^sub>0::64 word) + 0x28),8]::64 word)\<close>
declare Q_ret_address_141_def[Qs]

schematic_goal img_info_0_8_0x41b1_0x41c6_141[blocks]:
  assumes \<open>(P_0x41b1_false_141 && P_0x41b1_false_141_regions && ! !ZF) \<sigma>\<close>
  shows \<open>exec_block 8 0x41c6 141 \<sigma> \<triangleq> ?\<sigma> \<and> Q_ret_address_141 ?\<sigma> \<and> block_usage P_0x41b1_false_141_regions_set \<sigma> ?\<sigma>\<close>
  using assms
  by (steps pre: P_0x41b1_false_141_def P_0x41b1_false_141_regions_def post: Q_ret_address_141_def regionset: P_0x41b1_false_141_regions_set_def)

definition img_info_acode :: ACode where
  \<open>img_info_acode =
    Block 14 0x3fe1 0;
    WHILE P_0x3fe8_1 DO
      Block 3 0x3fee (Suc 0);
      Block (Suc 0) 0x3ff0 2;
      CALL getopt_acode;
      Block (Suc 0) 0x3ff5 3;
      IF ZF THEN
        Block (Suc 0) 0x3ff8 4
      ELSE
        Block 2 0x3ffa 5;
        IF !ZF THEN
          Block 2 0x4010 6;
          IF !ZF THEN
            Block (Suc 0) 0x4013 7
          ELSE
            Block (Suc 0) 0x4013 8
          FI
        ELSE
          Block 3 0x4006 9
        FI
      FI
    OD;
    CASES [
      (P_0x4015_10,
        WHILE P_0x4015_10 DO
          Block (Suc 0) 0x4015 10;
          CALL help_acode;
          Block (Suc 0) 0x401a 11;
          Block 2 0x4027 12;
          IF jge THEN
            Block (Suc 0) 0x4029 13
          ELSE
            Block (Suc 0) 0x4029 14
          FI
        OD
      ),
      (P_0x4020_15,
        WHILE P_0x4020_15 DO
          Block 2 0x4027 15;
          IF jge THEN
            Block (Suc 0) 0x4029 16;
            Block (Suc 0) 0x4015 17;
            CALL help_acode;
            Block (Suc 0) 0x401a 18
          ELSE
            Block (Suc 0) 0x4029 19
          FI
        OD
      )
    ];
    Block 4 0x403b 20;
    Block (Suc 0) 0x403f 21;
    CALL bdrv_new_acode;
    Block 2 0x4047 22;
    IF ZF THEN
      Block 3 0x4278 23;
      Block (Suc 0) 0x427a 24;
      CALL error_acode
    ELSE
      Block 2 0x4050 25;
      IF ZF THEN
        Block 3 0x422d 26;
        Block 3 0x4075 27;
        Block (Suc 0) 0x4078 28;
        CALL bdrv_open2_acode;
        Block (Suc 0) 0x407d 29;
        IF SF THEN
          Block 4 0x4265 30;
          Block (Suc 0) 0x4267 31;
          CALL error_acode
        ELSE
          Block 6 0x4098 32;
          Block (Suc 0) 0x40a0 33;
          CALL bdrv_get_format_acode;
          Block 2 0x40aa 34;
          Block (Suc 0) 0x40ad 35;
          CALL bdrv_get_geometry_acode;
          Block 4 0x40bf 36;
          Block (Suc 0) 0x40c3 37;
          CALL get_human_readable_size_acode;
          Block 3 0x40d0 38;
          Block (Suc 0) 0x40d5 39;
          CALL xstat64_acode;
          Block (Suc 0) 0x40da 40;
          IF SF THEN
            Block 5 0x410a 41
          ELSE
            Block 3 0x40e3 42;
            IF !SF THEN
              Block 4 0x41d4 43;
              Block (Suc 0) 0x41d7 44;
              CALL get_human_readable_size_acode;
              Block (Suc 0) 0x41dc 45
            ELSE
              Block 5 0x410a 46
            FI
          FI;
          Block 10 0x4134 47;
          Block (Suc 0) 0x4138 48;
          CALL printf_chk_acode;
          Block (Suc 0) 0x413d 49;
          Block (Suc 0) 0x4140 50;
          CALL bdrv_is_encrypted_acode;
          Block 3 0x4147 51;
          IF !ZF THEN
            Block 2 0x41e1 52;
            Block (Suc 0) 0x41e8 53;
            CALL puts_acode;
            Block (Suc 0) 0x41ed 54
          ELSE
            Block (Suc 0) 0x4149 55
          FI;
          Block 2 0x4154 56;
          Block (Suc 0) 0x4157 57;
          CALL bdrv_get_info_acode;
          Block (Suc 0) 0x415c 58;
          IF SF THEN
            Block (Suc 0) 0x415e 59
          ELSE
            Block 3 0x4164 60;
            IF !ZF THEN
              Block 4 0x423e 61;
              Block (Suc 0) 0x4240 62;
              CALL printf_chk_acode;
              Block (Suc 0) 0x4245 63
            ELSE
              Block (Suc 0) 0x4166 64
            FI
          FI;
          Block 4 0x417c 65;
          Block (Suc 0) 0x417f 66;
          CALL bdrv_get_backing_filename_acode;
          Block (Suc 0) 0x4184 67;
          IF !ZF THEN
            Block 6 0x4205 68;
            Block (Suc 0) 0x4208 69;
            CALL path_combine_acode;
            Block 5 0x421f 70;
            Block (Suc 0) 0x4221 71;
            CALL printf_chk_acode;
            Block (Suc 0) 0x4226 72
          ELSE
            Block (Suc 0) 0x418c 73
          FI;
          Block (Suc 0) 0x418e 74;
          Block (Suc 0) 0x4191 75;
          CALL dump_snapshots_acode;
          Block (Suc 0) 0x4196 76;
          Block (Suc 0) 0x4199 77;
          CALL bdrv_delete_acode;
          Block 3 0x41a8 78;
          IF !ZF THEN
            Block (Suc 0) 0x41b1 79;
            Block (Suc 0) 0x426c 80;
            CALL stack_chk_fail_acode
          ELSE
            Block 8 0x41c6 81
          FI
        FI
      ELSE
        Block 2 0x4059 82;
        Block (Suc 0) 0x405c 83;
        CALL bdrv_find_format_acode;
        Block 2 0x4064 84;
        IF ZF THEN
          Block 4 0x4254 85;
          Block (Suc 0) 0x4256 86;
          CALL error_acode
        ELSE
          Block 4 0x4075 87;
          Block (Suc 0) 0x4078 88;
          CALL bdrv_open2_acode;
          Block (Suc 0) 0x407d 89;
          IF SF THEN
            Block 4 0x4265 90;
            Block (Suc 0) 0x4267 91;
            CALL error_acode
          ELSE
            Block 6 0x4098 92;
            Block (Suc 0) 0x40a0 93;
            CALL bdrv_get_format_acode;
            Block 2 0x40aa 94;
            Block (Suc 0) 0x40ad 95;
            CALL bdrv_get_geometry_acode;
            Block 4 0x40bf 96;
            Block (Suc 0) 0x40c3 97;
            CALL get_human_readable_size_acode;
            Block 3 0x40d0 98;
            Block (Suc 0) 0x40d5 99;
            CALL xstat64_acode;
            Block (Suc 0) 0x40da 100;
            IF SF THEN
              Block 5 0x410a 101
            ELSE
              Block 3 0x40e3 102;
              IF !SF THEN
                Block 4 0x41d4 103;
                Block (Suc 0) 0x41d7 104;
                CALL get_human_readable_size_acode;
                Block (Suc 0) 0x41dc 105
              ELSE
                Block 5 0x410a 106
              FI
            FI;
            Block 10 0x4134 107;
            Block (Suc 0) 0x4138 108;
            CALL printf_chk_acode;
            Block (Suc 0) 0x413d 109;
            Block (Suc 0) 0x4140 110;
            CALL bdrv_is_encrypted_acode;
            Block 3 0x4147 111;
            IF !ZF THEN
              Block 2 0x41e1 112;
              Block (Suc 0) 0x41e8 113;
              CALL puts_acode;
              Block (Suc 0) 0x41ed 114
            ELSE
              Block (Suc 0) 0x4149 115
            FI;
            Block 2 0x4154 116;
            Block (Suc 0) 0x4157 117;
            CALL bdrv_get_info_acode;
            Block (Suc 0) 0x415c 118;
            IF SF THEN
              Block (Suc 0) 0x415e 119
            ELSE
              Block 3 0x4164 120;
              IF !ZF THEN
                Block 4 0x423e 121;
                Block (Suc 0) 0x4240 122;
                CALL printf_chk_acode;
                Block (Suc 0) 0x4245 123
              ELSE
                Block (Suc 0) 0x4166 124
              FI
            FI;
            Block 4 0x417c 125;
            Block (Suc 0) 0x417f 126;
            CALL bdrv_get_backing_filename_acode;
            Block (Suc 0) 0x4184 127;
            IF !ZF THEN
              Block 6 0x4205 128;
              Block (Suc 0) 0x4208 129;
              CALL path_combine_acode;
              Block 5 0x421f 130;
              Block (Suc 0) 0x4221 131;
              CALL printf_chk_acode;
              Block (Suc 0) 0x4226 132
            ELSE
              Block (Suc 0) 0x418c 133
            FI;
            Block (Suc 0) 0x418e 134;
            Block (Suc 0) 0x4191 135;
            CALL dump_snapshots_acode;
            Block (Suc 0) 0x4196 136;
            Block (Suc 0) 0x4199 137;
            CALL bdrv_delete_acode;
            Block 3 0x41a8 138;
            IF !ZF THEN
              Block (Suc 0) 0x41b1 139;
              Block (Suc 0) 0x426c 140;
              CALL stack_chk_fail_acode
            ELSE
              Block 8 0x41c6 141
            FI
          FI
        FI
      FI
    FI
  \<close>

method vcg_while' for P :: state_pred uses assms =
  ((rule htriples)+)?,
  rule HTriple_weaken[where P=P],
  simp add: pred_logic Ps Qs assms,
  rule HTriple_while


schematic_goal "img_info":
  assumes
    \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3fe8 \<longrightarrow> P_0x3fe8_1_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3ff0 \<longrightarrow> P_0x3ff0_2_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3ff5 \<longrightarrow> P_0x3ff5_3_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3ff8 \<longrightarrow> P_0x3ff8_true_4_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3ff8 \<longrightarrow> P_0x3ff8_false_5_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3ffd \<longrightarrow> P_0x3ffd_true_6_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4013 \<longrightarrow> P_0x4013_true_7_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4013 \<longrightarrow> P_0x4013_false_8_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x3ffd \<longrightarrow> P_0x3ffd_false_9_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4015 \<longrightarrow> P_0x4015_10_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x401a \<longrightarrow> P_0x401a_11_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4020 \<longrightarrow> P_0x4020_12_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4029 \<longrightarrow> P_0x4029_true_13_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4029 \<longrightarrow> P_0x4029_false_14_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4020 \<longrightarrow> P_0x4020_15_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4029 \<longrightarrow> P_0x4029_true_16_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4015 \<longrightarrow> P_0x4015_17_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x401a \<longrightarrow> P_0x401a_18_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4029 \<longrightarrow> P_0x4029_false_19_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x402b \<longrightarrow> P_0x402b_20_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x403f \<longrightarrow> P_0x403f_21_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4044 \<longrightarrow> P_0x4044_22_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x404a \<longrightarrow> P_0x404a_true_23_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x427a \<longrightarrow> P_0x427a_24_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x404a \<longrightarrow> P_0x404a_false_25_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4053 \<longrightarrow> P_0x4053_true_26_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x406d \<longrightarrow> P_0x406d_27_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4078 \<longrightarrow> P_0x4078_28_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x407d \<longrightarrow> P_0x407d_29_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x407f \<longrightarrow> P_0x407f_true_30_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4267 \<longrightarrow> P_0x4267_31_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x407f \<longrightarrow> P_0x407f_false_32_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x40a0 \<longrightarrow> P_0x40a0_33_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x40a5 \<longrightarrow> P_0x40a5_34_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x40ad \<longrightarrow> P_0x40ad_35_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x40b2 \<longrightarrow> P_0x40b2_36_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x40c3 \<longrightarrow> P_0x40c3_37_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x40c8 \<longrightarrow> P_0x40c8_38_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x40d5 \<longrightarrow> P_0x40d5_39_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x40da \<longrightarrow> P_0x40da_40_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x40dc \<longrightarrow> P_0x40dc_true_41_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x40dc \<longrightarrow> P_0x40dc_false_42_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x40e7 \<longrightarrow> P_0x40e7_true_43_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x41d7 \<longrightarrow> P_0x41d7_44_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x41dc \<longrightarrow> P_0x41dc_45_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x40e7 \<longrightarrow> P_0x40e7_false_46_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4112 \<longrightarrow> P_0x4112_47_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4138 \<longrightarrow> P_0x4138_48_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x413d \<longrightarrow> P_0x413d_49_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4140 \<longrightarrow> P_0x4140_50_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4145 \<longrightarrow> P_0x4145_51_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4149 \<longrightarrow> P_0x4149_true_52_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x41e8 \<longrightarrow> P_0x41e8_53_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x41ed \<longrightarrow> P_0x41ed_54_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4149 \<longrightarrow> P_0x4149_false_55_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x414f \<longrightarrow> P_0x414f_56_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4157 \<longrightarrow> P_0x4157_57_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x415c \<longrightarrow> P_0x415c_58_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x415e \<longrightarrow> P_0x415e_true_59_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x415e \<longrightarrow> P_0x415e_false_60_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4166 \<longrightarrow> P_0x4166_true_61_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4240 \<longrightarrow> P_0x4240_62_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4245 \<longrightarrow> P_0x4245_63_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4166 \<longrightarrow> P_0x4166_false_64_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x416c \<longrightarrow> P_0x416c_65_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x417f \<longrightarrow> P_0x417f_66_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4184 \<longrightarrow> P_0x4184_67_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x418c \<longrightarrow> P_0x418c_true_68_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4208 \<longrightarrow> P_0x4208_69_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x420d \<longrightarrow> P_0x420d_70_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4221 \<longrightarrow> P_0x4221_71_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4226 \<longrightarrow> P_0x4226_72_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x418c \<longrightarrow> P_0x418c_false_73_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x418e \<longrightarrow> P_0x418e_74_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4191 \<longrightarrow> P_0x4191_75_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4196 \<longrightarrow> P_0x4196_76_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4199 \<longrightarrow> P_0x4199_77_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x419e \<longrightarrow> P_0x419e_78_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x41b1 \<longrightarrow> P_0x41b1_true_79_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x426c \<longrightarrow> P_0x426c_80_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x41b1 \<longrightarrow> P_0x41b1_false_81_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4053 \<longrightarrow> P_0x4053_false_82_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x405c \<longrightarrow> P_0x405c_83_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4061 \<longrightarrow> P_0x4061_84_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4067 \<longrightarrow> P_0x4067_true_85_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4256 \<longrightarrow> P_0x4256_86_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4067 \<longrightarrow> P_0x4067_false_87_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4078 \<longrightarrow> P_0x4078_88_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x407d \<longrightarrow> P_0x407d_89_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x407f \<longrightarrow> P_0x407f_true_90_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4267 \<longrightarrow> P_0x4267_91_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x407f \<longrightarrow> P_0x407f_false_92_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x40a0 \<longrightarrow> P_0x40a0_93_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x40a5 \<longrightarrow> P_0x40a5_94_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x40ad \<longrightarrow> P_0x40ad_95_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x40b2 \<longrightarrow> P_0x40b2_96_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x40c3 \<longrightarrow> P_0x40c3_97_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x40c8 \<longrightarrow> P_0x40c8_98_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x40d5 \<longrightarrow> P_0x40d5_99_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x40da \<longrightarrow> P_0x40da_100_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x40dc \<longrightarrow> P_0x40dc_true_101_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x40dc \<longrightarrow> P_0x40dc_false_102_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x40e7 \<longrightarrow> P_0x40e7_true_103_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x41d7 \<longrightarrow> P_0x41d7_104_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x41dc \<longrightarrow> P_0x41dc_105_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x40e7 \<longrightarrow> P_0x40e7_false_106_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4112 \<longrightarrow> P_0x4112_107_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4138 \<longrightarrow> P_0x4138_108_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x413d \<longrightarrow> P_0x413d_109_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4140 \<longrightarrow> P_0x4140_110_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4145 \<longrightarrow> P_0x4145_111_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4149 \<longrightarrow> P_0x4149_true_112_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x41e8 \<longrightarrow> P_0x41e8_113_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x41ed \<longrightarrow> P_0x41ed_114_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4149 \<longrightarrow> P_0x4149_false_115_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x414f \<longrightarrow> P_0x414f_116_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4157 \<longrightarrow> P_0x4157_117_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x415c \<longrightarrow> P_0x415c_118_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x415e \<longrightarrow> P_0x415e_true_119_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x415e \<longrightarrow> P_0x415e_false_120_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4166 \<longrightarrow> P_0x4166_true_121_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4240 \<longrightarrow> P_0x4240_122_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4245 \<longrightarrow> P_0x4245_123_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4166 \<longrightarrow> P_0x4166_false_124_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x416c \<longrightarrow> P_0x416c_125_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x417f \<longrightarrow> P_0x417f_126_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4184 \<longrightarrow> P_0x4184_127_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x418c \<longrightarrow> P_0x418c_true_128_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4208 \<longrightarrow> P_0x4208_129_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x420d \<longrightarrow> P_0x420d_130_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4221 \<longrightarrow> P_0x4221_131_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4226 \<longrightarrow> P_0x4226_132_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x418c \<longrightarrow> P_0x418c_false_133_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x418e \<longrightarrow> P_0x418e_134_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4191 \<longrightarrow> P_0x4191_135_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4196 \<longrightarrow> P_0x4196_136_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x4199 \<longrightarrow> P_0x4199_137_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x419e \<longrightarrow> P_0x419e_138_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x41b1 \<longrightarrow> P_0x41b1_true_139_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x426c \<longrightarrow> P_0x426c_140_regions \<sigma>\<close>
    and \<open>\<forall>\<sigma>. RIP \<sigma> = 0x41b1 \<longrightarrow> P_0x41b1_false_141_regions \<sigma>\<close>
    and [blocks]: \<open>{{Q_getopt_addr_0x3ff0_2}} \<box>getopt_acode {{P_0x3ff5_3;M_0x3ff0}}\<close>
    and [blocks]: \<open>{{Q_help_addr_0x4015_10}} \<box>help_acode {{P_0x401a_11;M_0x4015}}\<close>
    and [blocks]: \<open>{{Q_help_addr_0x4015_17}} \<box>help_acode {{P_0x401a_18;M_0x4015}}\<close>
    and [blocks]: \<open>{{Q_bdrv_new_addr_0x403f_21}} \<box>bdrv_new_acode {{P_0x4044_22;M_0x403f}}\<close>
    and [blocks]: \<open>{{Q_error_addr_0x427a_24}} \<box>error_acode {{Q_fail;M_0x427a}}\<close>
    and [blocks]: \<open>{{Q_bdrv_open2_addr_0x4078_28}} \<box>bdrv_open2_acode {{P_0x407d_29;M_0x4078}}\<close>
    and [blocks]: \<open>{{Q_error_addr_0x4267_31}} \<box>error_acode {{Q_fail;M_0x4267}}\<close>
    and [blocks]: \<open>{{Q_bdrv_get_format_addr_0x40a0_33}} \<box>bdrv_get_format_acode {{P_0x40a5_34;M_0x40a0}}\<close>
    and [blocks]: \<open>{{Q_bdrv_get_geometry_addr_0x40ad_35}} \<box>bdrv_get_geometry_acode {{P_0x40b2_36;M_0x40ad}}\<close>
    and [blocks]: \<open>{{Q_get_human_readable_size_addr_0x40c3_37}} \<box>get_human_readable_size_acode {{P_0x40c8_38;M_0x40c3}}\<close>
    and [blocks]: \<open>{{Q_xstat64_addr_0x40d5_39}} \<box>xstat64_acode {{P_0x40da_40;M_0x40d5}}\<close>
    and [blocks]: \<open>{{Q_get_human_readable_size_addr_0x41d7_44}} \<box>get_human_readable_size_acode {{P_0x41dc_45;M_0x41d7}}\<close>
    and [blocks]: \<open>{{Q_printf_chk_addr_0x4138_48}} \<box>printf_chk_acode {{P_0x413d_49;M_0x4138}}\<close>
    and [blocks]: \<open>{{Q_bdrv_is_encrypted_addr_0x4140_50}} \<box>bdrv_is_encrypted_acode {{P_0x4145_51;M_0x4140}}\<close>
    and [blocks]: \<open>{{Q_puts_addr_0x41e8_53}} \<box>puts_acode {{P_0x41ed_54;M_0x41e8}}\<close>
    and [blocks]: \<open>{{Q_bdrv_get_info_addr_0x4157_57}} \<box>bdrv_get_info_acode {{P_0x415c_58;M_0x4157}}\<close>
    and [blocks]: \<open>{{Q_printf_chk_addr_0x4240_62}} \<box>printf_chk_acode {{P_0x4245_63;M_0x4240}}\<close>
    and [blocks]: \<open>{{Q_bdrv_get_backing_filename_addr_0x417f_66}} \<box>bdrv_get_backing_filename_acode {{P_0x4184_67;M_0x417f}}\<close>
    and [blocks]: \<open>{{Q_path_combine_addr_0x4208_69}} \<box>path_combine_acode {{P_0x420d_70;M_0x4208}}\<close>
    and [blocks]: \<open>{{Q_printf_chk_addr_0x4221_71}} \<box>printf_chk_acode {{P_0x4226_72;M_0x4221}}\<close>
    and [blocks]: \<open>{{Q_dump_snapshots_addr_0x4191_75}} \<box>dump_snapshots_acode {{P_0x4196_76;M_0x4191}}\<close>
    and [blocks]: \<open>{{Q_bdrv_delete_addr_0x4199_77}} \<box>bdrv_delete_acode {{P_0x419e_78;M_0x4199}}\<close>
    and [blocks]: \<open>{{Q_stack_chk_fail_addr_0x426c_80}} \<box>stack_chk_fail_acode {{Q_fail;M_0x426c}}\<close>
    and [blocks]: \<open>{{Q_bdrv_find_format_addr_0x405c_83}} \<box>bdrv_find_format_acode {{P_0x4061_84;M_0x405c}}\<close>
    and [blocks]: \<open>{{Q_error_addr_0x4256_86}} \<box>error_acode {{Q_fail;M_0x4256}}\<close>
    and [blocks]: \<open>{{Q_bdrv_open2_addr_0x4078_88}} \<box>bdrv_open2_acode {{P_0x407d_89;M_0x4078}}\<close>
    and [blocks]: \<open>{{Q_error_addr_0x4267_91}} \<box>error_acode {{Q_fail;M_0x4267}}\<close>
    and [blocks]: \<open>{{Q_bdrv_get_format_addr_0x40a0_93}} \<box>bdrv_get_format_acode {{P_0x40a5_94;M_0x40a0}}\<close>
    and [blocks]: \<open>{{Q_bdrv_get_geometry_addr_0x40ad_95}} \<box>bdrv_get_geometry_acode {{P_0x40b2_96;M_0x40ad}}\<close>
    and [blocks]: \<open>{{Q_get_human_readable_size_addr_0x40c3_97}} \<box>get_human_readable_size_acode {{P_0x40c8_98;M_0x40c3}}\<close>
    and [blocks]: \<open>{{Q_xstat64_addr_0x40d5_99}} \<box>xstat64_acode {{P_0x40da_100;M_0x40d5}}\<close>
    and [blocks]: \<open>{{Q_get_human_readable_size_addr_0x41d7_104}} \<box>get_human_readable_size_acode {{P_0x41dc_105;M_0x41d7}}\<close>
    and [blocks]: \<open>{{Q_printf_chk_addr_0x4138_108}} \<box>printf_chk_acode {{P_0x413d_109;M_0x4138}}\<close>
    and [blocks]: \<open>{{Q_bdrv_is_encrypted_addr_0x4140_110}} \<box>bdrv_is_encrypted_acode {{P_0x4145_111;M_0x4140}}\<close>
    and [blocks]: \<open>{{Q_puts_addr_0x41e8_113}} \<box>puts_acode {{P_0x41ed_114;M_0x41e8}}\<close>
    and [blocks]: \<open>{{Q_bdrv_get_info_addr_0x4157_117}} \<box>bdrv_get_info_acode {{P_0x415c_118;M_0x4157}}\<close>
    and [blocks]: \<open>{{Q_printf_chk_addr_0x4240_122}} \<box>printf_chk_acode {{P_0x4245_123;M_0x4240}}\<close>
    and [blocks]: \<open>{{Q_bdrv_get_backing_filename_addr_0x417f_126}} \<box>bdrv_get_backing_filename_acode {{P_0x4184_127;M_0x417f}}\<close>
    and [blocks]: \<open>{{Q_path_combine_addr_0x4208_129}} \<box>path_combine_acode {{P_0x420d_130;M_0x4208}}\<close>
    and [blocks]: \<open>{{Q_printf_chk_addr_0x4221_131}} \<box>printf_chk_acode {{P_0x4226_132;M_0x4221}}\<close>
    and [blocks]: \<open>{{Q_dump_snapshots_addr_0x4191_135}} \<box>dump_snapshots_acode {{P_0x4196_136;M_0x4191}}\<close>
    and [blocks]: \<open>{{Q_bdrv_delete_addr_0x4199_137}} \<box>bdrv_delete_acode {{P_0x419e_138;M_0x4199}}\<close>
    and [blocks]: \<open>{{Q_stack_chk_fail_addr_0x426c_140}} \<box>stack_chk_fail_acode {{Q_fail;M_0x426c}}\<close>
  shows \<open>{{?P}} img_info_acode {{?Q;?M}}\<close>
  apply (vcg acode: img_info_acode_def assms: assms)
  apply (vcg_while' "P_0x3fe8_1 || P_0x4015_10 || P_0x4020_15")
  apply (vcg_step assms: assms)+
  apply (auto simp add: Ps Qs pred_logic)[1]
  apply (rule htriples)+
  apply (simp only: fst_conv snd_conv)

  apply (vcg_while' "P_0x4015_10 || P_0x402b_20")
  apply (vcg_step assms: assms)+
  apply (auto simp add: Ps Qs pred_logic)[1]
  apply (simp only: fst_conv snd_conv)
  apply (vcg_while' "P_0x4020_15 || P_0x402b_20")
  apply (vcg_step assms: assms)+
  apply (auto simp add: Ps Qs pred_logic)[1]
  apply simp
  apply simp
  apply (vcg_step assms: assms)+
  apply (auto simp add: Ps Qs pred_logic assms)[1]
  apply (auto simp add: Ps Qs pred_logic assms)[1]
  apply simp
  apply (vcg_step assms: assms)+
  done


end
