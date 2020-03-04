0000000000003710 <qemu_malloc.cold.0>:
    3710:	call   30c0 <abort@plt>

0000000000003715 <qemu_realloc.cold.1>:
    3715:	call   30c0 <abort@plt>

000000000000371a <qemu_mallocz.cold.2>:
    371a:	call   30c0 <abort@plt>

000000000000371f <qemu_strdup.cold.3>:
    371f:	call   30c0 <abort@plt>

0000000000003724 <qemu_strndup.cold.4>:
    3724:	call   30c0 <abort@plt>

0000000000003729 <insert_mapping.cold.9>:
    3729:	mov    QWORD PTR ds:0x18,0x0
    3735:	ud2

0000000000003737 <schedule_rename.cold.10>:
    3737:	mov    QWORD PTR ds:0x0,r15
    373f:	ud2

0000000000003741 <commit_direntries.cold.11>:
    3741:	mov    eax,DWORD PTR ds:0x14
    3748:	ud2
    374a:	mov    eax,DWORD PTR ds:0x20
    3751:	ud2

0000000000003753 <check_directory_consistency.cold.12>:
    3753:	mov    QWORD PTR ds:0x0,0x0
    375f:	ud2
    3761:	mov    QWORD PTR ds:0x0,r8
    3769:	ud2
    376b:	mov    QWORD PTR ds:0x0,r12
    3773:	ud2

0000000000003775 <try_commit.cold.13>:
    3775:	mov    rax,QWORD PTR ds:0x18
    377d:	ud2

000000000000377f <read_directory.cold.14>:
    377f:	mov    QWORD PTR [r12+0x8080],0x0
    378b:	mov    DWORD PTR ds:0x0,0x0
    3796:	ud2
    3798:	mov    BYTE PTR ds:0xb,0x0
    37a0:	ud2

00000000000037a2 <vvfat_open.cold.15>:
    37a2:	mov    BYTE PTR ds:0xb,0x0
    37aa:	ud2
    37ac:	mov    DWORD PTR ds:0x0,0x0
    37b7:	ud2
    37b9:	nop    DWORD PTR [rax+0x0]

0000000000003d70 <term_exit>:
    3d70:	lea    rdx,[rip+0x265a9]        # 2a320 <oldtty>
    3d77:	xor    esi,esi
    3d79:	xor    edi,edi
    3d7b:	jmp    3590 <tcsetattr@plt>

0000000000003d80 <format_print>:
    3d80:	mov    rdx,rsi
    3d83:	mov    edi,0x1
    3d88:	xor    eax,eax
    3d8a:	lea    rsi,[rip+0x19273]        # 1d004 <_IO_stdin_used+0x4>
    3d91:	jmp    34d0 <__printf_chk@plt>
    3d96:	nop    WORD PTR cs:[rax+rax*1+0x0]

0000000000003da0 <error>:
    3da0:	push   rbx
    3da1:	mov    rbx,rdi
    3da4:	sub    rsp,0xd0
    3dab:	mov    QWORD PTR [rsp+0x28],rsi
    3db0:	mov    QWORD PTR [rsp+0x30],rdx
    3db5:	mov    QWORD PTR [rsp+0x38],rcx
    3dba:	mov    QWORD PTR [rsp+0x40],r8
    3dbf:	mov    QWORD PTR [rsp+0x48],r9
    3dc4:	test   al,al
    3dc6:	je     3dff <error+0x5f>
    3dc8:	movaps XMMWORD PTR [rsp+0x50],xmm0
    3dcd:	movaps XMMWORD PTR [rsp+0x60],xmm1
    3dd2:	movaps XMMWORD PTR [rsp+0x70],xmm2
    3dd7:	movaps XMMWORD PTR [rsp+0x80],xmm3
    3ddf:	movaps XMMWORD PTR [rsp+0x90],xmm4
    3de7:	movaps XMMWORD PTR [rsp+0xa0],xmm5
    3def:	movaps XMMWORD PTR [rsp+0xb0],xmm6
    3df7:	movaps XMMWORD PTR [rsp+0xc0],xmm7
    3dff:	mov    rax,QWORD PTR fs:0x28
    3e08:	mov    QWORD PTR [rsp+0x18],rax
    3e0d:	xor    eax,eax
    3e0f:	mov    edx,0xa
    3e14:	mov    esi,0x1
    3e19:	lea    rax,[rsp+0xe0]
    3e21:	mov    rcx,QWORD PTR [rip+0x264d8]        # 2a300 <stderr@@GLIBC_2.2.5>
    3e28:	mov    QWORD PTR [rsp+0x8],rax
    3e2d:	lea    rdi,[rip+0x191d4]        # 1d008 <_IO_stdin_used+0x8>
    3e34:	lea    rax,[rsp+0x20]
    3e39:	mov    DWORD PTR [rsp],0x8
    3e40:	mov    DWORD PTR [rsp+0x4],0x30
    3e48:	mov    QWORD PTR [rsp+0x10],rax
    3e4d:	call   3640 <fwrite@plt>
    3e52:	mov    rcx,rsp
    3e55:	mov    rdx,rbx
    3e58:	mov    esi,0x1
    3e5d:	mov    rdi,QWORD PTR [rip+0x2649c]        # 2a300 <stderr@@GLIBC_2.2.5>
    3e64:	call   30b0 <__vfprintf_chk@plt>
    3e69:	mov    rsi,QWORD PTR [rip+0x26490]        # 2a300 <stderr@@GLIBC_2.2.5>
    3e70:	mov    edi,0xa
    3e75:	call   32b0 <fputc@plt>
    3e7a:	mov    edi,0x1
    3e7f:	call   3620 <exit@plt>
    3e84:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    3e8f:	nop

0000000000003e90 <dump_snapshots>:
    3e90:	push   r12
    3e92:	push   rbp
    3e93:	push   rbx
    3e94:	sub    rsp,0x120
    3e9b:	mov    rax,QWORD PTR fs:0x28
    3ea4:	mov    QWORD PTR [rsp+0x118],rax
    3eac:	xor    eax,eax
    3eae:	lea    rsi,[rsp+0x8]
    3eb3:	call   19cc0 <bdrv_snapshot_list>
    3eb8:	test   eax,eax
    3eba:	jle    3f33 <dump_snapshots+0xa3>
    3ebc:	mov    ebx,eax
    3ebe:	lea    rdi,[rip+0x1914e]        # 1d013 <_IO_stdin_used+0x13>
    3ec5:	lea    r12,[rsp+0x10]
    3eca:	call   3130 <puts@plt>
    3ecf:	lea    ebp,[rbx-0x1]
    3ed2:	xor    edx,edx
    3ed4:	mov    esi,0x100
    3ed9:	mov    rdi,r12
    3edc:	add    rbp,0x1
    3ee0:	xor    ebx,ebx
    3ee2:	call   19e60 <bdrv_snapshot_dump>
    3ee7:	imul   rbp,rbp,0x198
    3eee:	mov    rdi,rax
    3ef1:	call   3130 <puts@plt>
    3ef6:	nop    WORD PTR cs:[rax+rax*1+0x0]
    3f00:	mov    rdx,QWORD PTR [rsp+0x8]
    3f05:	mov    esi,0x100
    3f0a:	mov    rdi,r12
    3f0d:	add    rdx,rbx
    3f10:	add    rbx,0x198
    3f17:	call   19e60 <bdrv_snapshot_dump>
    3f1c:	mov    rdi,rax
    3f1f:	call   3130 <puts@plt>
    3f24:	cmp    rbx,rbp
    3f27:	jne    3f00 <dump_snapshots+0x70>
    3f29:	mov    rdi,QWORD PTR [rsp+0x8]
    3f2e:	call   5960 <qemu_free>
    3f33:	mov    rax,QWORD PTR [rsp+0x118]
    3f3b:	xor    rax,QWORD PTR fs:0x28
    3f44:	jne    3f52 <dump_snapshots+0xc2>
    3f46:	add    rsp,0x120
    3f4d:	pop    rbx
    3f4e:	pop    rbp
    3f4f:	pop    r12
    3f51:	ret
    3f52:	call   31c0 <__stack_chk_fail@plt>
    3f57:	nop    WORD PTR [rax+rax*1+0x0]

0000000000003f60 <help>:
    3f60:	sub    rsp,0x8
    3f64:	lea    rdi,[rip+0x1932d]        # 1d298 <_IO_stdin_used+0x298>
    3f6b:	call   3130 <puts@plt>
    3f70:	lea    rsi,[rip+0x190ab]        # 1d022 <_IO_stdin_used+0x22>
    3f77:	mov    edi,0x1
    3f7c:	xor    eax,eax
    3f7e:	call   34d0 <__printf_chk@plt>
    3f83:	xor    esi,esi
    3f85:	lea    rdi,[rip+0xfffffffffffffdf4]        # 3d80 <format_print>
    3f8c:	call   19620 <bdrv_iterate_format>
    3f91:	mov    edi,0xa
    3f96:	call   3090 <putchar@plt>
    3f9b:	mov    edi,0x1
    3fa0:	call   3620 <exit@plt>
    3fa5:	data16 nop WORD PTR cs:[rax+rax*1+0x0]

0000000000003fb0 <img_info>:
    3fb0:	push   r14
    3fb2:	push   r13
    3fb4:	xor    r13d,r13d
    3fb7:	push   r12
    3fb9:	lea    r12,[rip+0x19076]        # 1d036 <_IO_stdin_used+0x36>
    3fc0:	push   rbp
    3fc1:	mov    ebp,edi
    3fc3:	push   rbx
    3fc4:	mov    rbx,rsi
    3fc7:	sub    rsp,0xa40
    3fce:	mov    rax,QWORD PTR fs:0x28
    3fd7:	mov    QWORD PTR [rsp+0xa38],rax
    3fdf:	xor    eax,eax
    3fe1:	nop    DWORD PTR [rax+0x0]
    3fe8:	mov    rdx,r12
    3feb:	mov    rsi,rbx
    3fee:	mov    edi,ebp
    3ff0:	call   35d0 <getopt@plt>
    3ff5:	cmp    eax,0xffffffff
    3ff8:	je     4020 <img_info+0x70>
    3ffa:	cmp    eax,0x66
    3ffd:	jne    4010 <img_info+0x60>
    3fff:	mov    r13,QWORD PTR [rip+0x262ea]        # 2a2f0 <optarg@@GLIBC_2.2.5>
    4006:	jmp    3fe8 <img_info+0x38>
    4008:	nop    DWORD PTR [rax+rax*1+0x0]
    4010:	cmp    eax,0x68
    4013:	jne    3fe8 <img_info+0x38>
    4015:	call   3f60 <help>
    401a:	nop    WORD PTR [rax+rax*1+0x0]
    4020:	movsxd rax,DWORD PTR [rip+0x262c1]        # 2a2e8 <optind@@GLIBC_2.2.5>
    4027:	cmp    eax,ebp
    4029:	jge    4015 <img_info+0x65>
    402b:	lea    edx,[rax+0x1]
    402e:	lea    rdi,[rip+0x1cc2d]        # 20c62 <desc_template.13939+0x382>
    4035:	mov    DWORD PTR [rip+0x262ad],edx        # 2a2e8 <optind@@GLIBC_2.2.5>
    403b:	mov    rbp,QWORD PTR [rbx+rax*8]
    403f:	call   17ff0 <bdrv_new>
    4044:	mov    rbx,rax
    4047:	test   rax,rax
    404a:	je     4271 <img_info+0x2c1>
    4050:	test   r13,r13
    4053:	je     422b <img_info+0x27b>
    4059:	mov    rdi,r13
    405c:	call   18060 <bdrv_find_format>
    4061:	mov    rcx,rax
    4064:	test   rax,rax
    4067:	je     424a <img_info+0x29a>
    406d:	mov    edx,0x40
    4072:	mov    rsi,rbp
    4075:	mov    rdi,rbx
    4078:	call   18b80 <bdrv_open2>
    407d:	test   eax,eax
    407f:	js     425b <img_info+0x2ab>
    4085:	lea    r12,[rsp+0xb0]
    408d:	mov    edx,0x80
    4092:	mov    rdi,rbx
    4095:	mov    rsi,r12
    4098:	lea    r13,[rsp+0x130]
    40a0:	call   195f0 <bdrv_get_format>
    40a5:	lea    rsi,[rsp+0x8]
    40aa:	mov    rdi,rbx
    40ad:	call   191f0 <bdrv_get_geometry>
    40b2:	mov    rdx,QWORD PTR [rsp+0x8]
    40b7:	mov    esi,0x80
    40bc:	mov    rdi,r13
    40bf:	shl    rdx,0x9
    40c3:	call   19cf0 <get_human_readable_size>
    40c8:	lea    rdx,[rsp+0x20]
    40cd:	mov    rsi,rbp
    40d0:	mov    edi,0x1
    40d5:	call   3180 <__xstat64@plt>
    40da:	test   eax,eax
    40dc:	js     40ed <img_info+0x13d>
    40de:	mov    rdx,QWORD PTR [rsp+0x60]
    40e3:	shl    rdx,0x9
    40e7:	jns    41c7 <img_info+0x217>
    40ed:	movabs rax,0x616c696176616e75
    40f7:	lea    r14,[rsp+0x1b0]
    40ff:	mov    DWORD PTR [rsp+0x1b8],0x656c62
    410a:	mov    QWORD PTR [rsp+0x1b0],rax
    4112:	sub    rsp,0x8
    4116:	mov    rcx,r12
    4119:	mov    rdx,rbp
    411c:	mov    r8,r13
    411f:	push   r14
    4121:	mov    r9,QWORD PTR [rsp+0x18]
    4126:	lea    rsi,[rip+0x19893]        # 1d9c0 <_IO_stdin_used+0x9c0>
    412d:	xor    eax,eax
    412f:	mov    edi,0x1
    4134:	shl    r9,0x9
    4138:	call   34d0 <__printf_chk@plt>
    413d:	mov    rdi,rbx
    4140:	call   19510 <bdrv_is_encrypted>
    4145:	pop    rdx
    4146:	pop    rcx
    4147:	test   eax,eax
    4149:	jne    41e1 <img_info+0x231>
    414f:	lea    rsi,[rsp+0x10]
    4154:	mov    rdi,rbx
    4157:	call   19ba0 <bdrv_get_info>
    415c:	test   eax,eax
    415e:	js     416c <img_info+0x1bc>
    4160:	mov    edx,DWORD PTR [rsp+0x10]
    4164:	test   edx,edx
    4166:	jne    4232 <img_info+0x282>
    416c:	lea    r12,[rsp+0x230]
    4174:	mov    edx,0x400
    4179:	mov    rdi,rbx
    417c:	mov    rsi,r12
    417f:	call   19aa0 <bdrv_get_backing_filename>
    4184:	cmp    BYTE PTR [rsp+0x230],0x0
    418c:	jne    41f2 <img_info+0x242>
    418e:	mov    rdi,rbx
    4191:	call   3e90 <dump_snapshots>
    4196:	mov    rdi,rbx
    4199:	call   18130 <bdrv_delete>
    419e:	xor    eax,eax
    41a0:	mov    rcx,QWORD PTR [rsp+0xa38]
    41a8:	xor    rcx,QWORD PTR fs:0x28
    41b1:	jne    426c <img_info+0x2bc>
    41b7:	add    rsp,0xa40
    41be:	pop    rbx
    41bf:	pop    rbp
    41c0:	pop    r12
    41c2:	pop    r13
    41c4:	pop    r14
    41c6:	ret
    41c7:	lea    r14,[rsp+0x1b0]
    41cf:	mov    esi,0x80
    41d4:	mov    rdi,r14
    41d7:	call   19cf0 <get_human_readable_size>
    41dc:	jmp    4112 <img_info+0x162>
    41e1:	lea    rdi,[rip+0x18e91]        # 1d079 <_IO_stdin_used+0x79>
    41e8:	call   3130 <puts@plt>
    41ed:	jmp    414f <img_info+0x19f>
    41f2:	lea    r13,[rsp+0x630]
    41fa:	mov    rcx,r12
    41fd:	mov    rdx,rbp
    4200:	mov    esi,0x400
    4205:	mov    rdi,r13
    4208:	call   17ee0 <path_combine>
    420d:	mov    rcx,r13
    4210:	mov    rdx,r12
    4213:	mov    edi,0x1
    4218:	lea    rsi,[rip+0x197e9]        # 1da08 <_IO_stdin_used+0xa08>
    421f:	xor    eax,eax
    4221:	call   34d0 <__printf_chk@plt>
    4226:	jmp    418e <img_info+0x1de>
    422b:	xor    ecx,ecx
    422d:	jmp    406d <img_info+0xbd>
    4232:	lea    rsi,[rip+0x18e4f]        # 1d088 <_IO_stdin_used+0x88>
    4239:	mov    edi,0x1
    423e:	xor    eax,eax
    4240:	call   34d0 <__printf_chk@plt>
    4245:	jmp    416c <img_info+0x1bc>
    424a:	mov    rsi,r13
    424d:	lea    rdi,[rip+0x18df8]        # 1d04c <_IO_stdin_used+0x4c>
    4254:	xor    eax,eax
    4256:	call   3da0 <error>
    425b:	mov    rsi,rbp
    425e:	lea    rdi,[rip+0x18e00]        # 1d065 <_IO_stdin_used+0x65>
    4265:	xor    eax,eax
    4267:	call   3da0 <error>
    426c:	call   31c0 <__stack_chk_fail@plt>
    4271:	lea    rdi,[rip+0x18dc2]        # 1d03a <_IO_stdin_used+0x3a>
    4278:	xor    eax,eax
    427a:	call   3da0 <error>
    427f:	nop

00000000000050f0 <qemu_service_io>:
    50f0:	ret
    50f1:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    50fc:	nop    DWORD PTR [rax+0x0]

0000000000005100 <term_printf>:
    5100:	ret
    5101:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    510c:	nop    DWORD PTR [rax+0x0]

0000000000005110 <term_print_filename>:
    5110:	ret
    5111:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    511c:	nop    DWORD PTR [rax+0x0]

0000000000005120 <qemu_bh_new>:
    5120:	push   rbp
    5121:	mov    rbp,rdi
    5124:	mov    edi,0x10
    5129:	push   rbx
    512a:	mov    rbx,rsi
    512d:	sub    rsp,0x8
    5131:	call   5970 <qemu_malloc>
    5136:	mov    QWORD PTR [rax],rbp
    5139:	mov    QWORD PTR [rax+0x8],rbx
    513d:	add    rsp,0x8
    5141:	pop    rbx
    5142:	pop    rbp
    5143:	ret
    5144:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    514f:	nop

0000000000005150 <qemu_bh_poll>:
    5150:	xor    eax,eax
    5152:	ret
    5153:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    515e:	xchg   ax,ax

0000000000005170 <qemu_bh_cancel>:
    5170:	ret
    5171:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    517c:	nop    DWORD PTR [rax+0x0]

0000000000005180 <qemu_bh_delete>:
    5180:	jmp    5960 <qemu_free>
    5185:	data16 nop WORD PTR cs:[rax+rax*1+0x0]

0000000000005190 <qemu_set_fd_handler2>:
    5190:	xor    eax,eax
    5192:	ret
    5193:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    519e:	xchg   ax,ax

00000000000051a0 <qemu_get_clock>:
    51a0:	sub    rsp,0x28
    51a4:	xor    esi,esi
    51a6:	mov    rax,QWORD PTR fs:0x28
    51af:	mov    QWORD PTR [rsp+0x18],rax
    51b4:	xor    eax,eax
    51b6:	mov    rdi,rsp
    51b9:	call   3220 <gettimeofday@plt>
    51be:	imul   rcx,QWORD PTR [rsp],0x3b9aca00
    51c6:	movabs rdx,0x431bde82d7b634db
    51d0:	imul   rax,QWORD PTR [rsp+0x8],0x3e8
    51d9:	add    rcx,rax
    51dc:	mov    rax,rcx
    51df:	sar    rcx,0x3f
    51e3:	imul   rdx
    51e6:	sar    rdx,0x12
    51ea:	mov    rax,rdx
    51ed:	sub    rax,rcx
    51f0:	mov    rsi,QWORD PTR [rsp+0x18]
    51f5:	xor    rsi,QWORD PTR fs:0x28
    51fe:	jne    5205 <qemu_get_clock+0x65>
    5200:	add    rsp,0x28
    5204:	ret
    5205:	call   31c0 <__stack_chk_fail@plt>
    520a:	nop    WORD PTR [rax+rax*1+0x0]

0000000000005210 <qemu_read>:
    5210:	push   r13
    5212:	mov    r13d,edi
    5215:	push   r12
    5217:	mov    r12,rsi
    521a:	push   rbp
    521b:	xor    ebp,ebp
    521d:	push   rbx
    521e:	mov    rbx,rdx
    5221:	sub    rsp,0x8
    5225:	test   rdx,rdx
    5228:	je     524f <qemu_read+0x3f>
    522a:	mov    rdx,rbx
    522d:	mov    rsi,r12
    5230:	mov    edi,r13d
    5233:	call   32e0 <read@plt>
    5238:	test   rax,rax
    523b:	je     5290 <qemu_read+0x80>
    523d:	js     5260 <qemu_read+0x50>
    523f:	cmp    rax,rbx
    5242:	ja     529d <qemu_read+0x8d>
    5244:	add    rbp,rax
    5247:	add    r12,rax
    524a:	sub    rbx,rax
    524d:	jne    522a <qemu_read+0x1a>
    524f:	add    rsp,0x8
    5253:	mov    rax,rbp
    5256:	pop    rbx
    5257:	pop    rbp
    5258:	pop    r12
    525a:	pop    r13
    525c:	ret
    525d:	nop    DWORD PTR [rax]
    5260:	call   30d0 <__errno_location@plt>
    5265:	cmp    DWORD PTR [rax],0x4
    5268:	je     522a <qemu_read+0x1a>
    526a:	test   rbp,rbp
    526d:	mov    rax,0xffffffffffffffff
    5274:	cmove  rbp,rax
    5278:	add    rsp,0x8
    527c:	pop    rbx
    527d:	mov    rax,rbp
    5280:	pop    rbp
    5281:	pop    r12
    5283:	pop    r13
    5285:	ret
    5286:	nop    WORD PTR cs:[rax+rax*1+0x0]
    5290:	call   30d0 <__errno_location@plt>
    5295:	mov    DWORD PTR [rax],0x0
    529b:	jmp    524f <qemu_read+0x3f>
    529d:	lea    rcx,[rip+0x18c0c]        # 1deb0 <__PRETTY_FUNCTION__.13430>
    52a4:	mov    edx,0x4b
    52a9:	lea    rsi,[rip+0x18bd4]        # 1de84 <__PRETTY_FUNCTION__.13895+0xc>
    52b0:	lea    rdi,[rip+0x18bd5]        # 1de8c <__PRETTY_FUNCTION__.13895+0x14>
    52b7:	call   3230 <__assert_fail@plt>
    52bc:	nop    DWORD PTR [rax+0x0]

00000000000052c0 <qemu_read_ok>:
    52c0:	push   rbx
    52c1:	mov    rbx,rdx
    52c4:	call   5210 <qemu_read>
    52c9:	cmp    rbx,rax
    52cc:	pop    rbx
    52cd:	sete   al
    52d0:	movzx  eax,al
    52d3:	lea    eax,[rax+rax*1-0x1]
    52d7:	ret
    52d8:	nop    DWORD PTR [rax+rax*1+0x0]

00000000000052e0 <qemu_write>:
    52e0:	push   r13
    52e2:	mov    r13d,edi
    52e5:	push   r12
    52e7:	mov    r12,rsi
    52ea:	push   rbp
    52eb:	xor    ebp,ebp
    52ed:	push   rbx
    52ee:	mov    rbx,rdx
    52f1:	sub    rsp,0x8
    52f5:	test   rdx,rdx
    52f8:	je     531f <qemu_write+0x3f>
    52fa:	mov    rdx,rbx
    52fd:	mov    rsi,r12
    5300:	mov    edi,r13d
    5303:	call   3160 <write@plt>
    5308:	test   rax,rax
    530b:	je     5360 <qemu_write+0x80>
    530d:	js     5330 <qemu_write+0x50>
    530f:	cmp    rax,rbx
    5312:	ja     536d <qemu_write+0x8d>
    5314:	add    rbp,rax
    5317:	add    r12,rax
    531a:	sub    rbx,rax
    531d:	jne    52fa <qemu_write+0x1a>
    531f:	add    rsp,0x8
    5323:	mov    rax,rbp
    5326:	pop    rbx
    5327:	pop    rbp
    5328:	pop    r12
    532a:	pop    r13
    532c:	ret
    532d:	nop    DWORD PTR [rax]
    5330:	call   30d0 <__errno_location@plt>
    5335:	cmp    DWORD PTR [rax],0x4
    5338:	je     52fa <qemu_write+0x1a>
    533a:	test   rbp,rbp
    533d:	mov    rax,0xffffffffffffffff
    5344:	cmove  rbp,rax
    5348:	add    rsp,0x8
    534c:	pop    rbx
    534d:	mov    rax,rbp
    5350:	pop    rbp
    5351:	pop    r12
    5353:	pop    r13
    5355:	ret
    5356:	nop    WORD PTR cs:[rax+rax*1+0x0]
    5360:	call   30d0 <__errno_location@plt>
    5365:	mov    DWORD PTR [rax],0x0
    536b:	jmp    531f <qemu_write+0x3f>
    536d:	lea    rcx,[rip+0x18b2c]        # 1dea0 <__PRETTY_FUNCTION__.13447>
    5374:	mov    edx,0x4c
    5379:	lea    rsi,[rip+0x18b04]        # 1de84 <__PRETTY_FUNCTION__.13895+0xc>
    5380:	lea    rdi,[rip+0x18b05]        # 1de8c <__PRETTY_FUNCTION__.13895+0x14>
    5387:	call   3230 <__assert_fail@plt>
    538c:	nop    DWORD PTR [rax+0x0]

0000000000005390 <qemu_write_ok>:
    5390:	push   rbx
    5391:	mov    rbx,rdx
    5394:	call   52e0 <qemu_write>
    5399:	cmp    rbx,rax
    539c:	pop    rbx
    539d:	sete   al
    53a0:	movzx  eax,al
    53a3:	lea    eax,[rax+rax*1-0x1]
    53a7:	ret
    53a8:	nop    DWORD PTR [rax+rax*1+0x0]

00000000000053b0 <qemu_memalign>:
    53b0:	sub    rsp,0x18
    53b4:	mov    rax,rdi
    53b7:	mov    rdx,rsi
    53ba:	mov    rcx,QWORD PTR fs:0x28
    53c3:	mov    QWORD PTR [rsp+0x8],rcx
    53c8:	xor    ecx,ecx
    53ca:	mov    rdi,rsp
    53cd:	mov    rsi,rax
    53d0:	call   3670 <posix_memalign@plt>
    53d5:	mov    rdx,QWORD PTR [rsp]
    53d9:	test   eax,eax
    53db:	je     53df <qemu_memalign+0x2f>
    53dd:	xor    edx,edx
    53df:	mov    rcx,QWORD PTR [rsp+0x8]
    53e4:	xor    rcx,QWORD PTR fs:0x28
    53ed:	mov    rax,rdx
    53f0:	jne    53f7 <qemu_memalign+0x47>
    53f2:	add    rsp,0x18
    53f6:	ret
    53f7:	call   31c0 <__stack_chk_fail@plt>
    53fc:	nop    DWORD PTR [rax+0x0]

0000000000005400 <qemu_vmalloc>:
    5400:	push   rbx
    5401:	mov    rbx,rdi
    5404:	sub    rsp,0x10
    5408:	mov    rax,QWORD PTR fs:0x28
    5411:	mov    QWORD PTR [rsp+0x8],rax
    5416:	xor    eax,eax
    5418:	call   3610 <getpagesize@plt>
    541d:	mov    rdx,rbx
    5420:	mov    rdi,rsp
    5423:	movsxd rsi,eax
    5426:	call   3670 <posix_memalign@plt>
    542b:	mov    rdx,QWORD PTR [rsp]
    542f:	test   eax,eax
    5431:	je     5435 <qemu_vmalloc+0x35>
    5433:	xor    edx,edx
    5435:	mov    rcx,QWORD PTR [rsp+0x8]
    543a:	xor    rcx,QWORD PTR fs:0x28
    5443:	mov    rax,rdx
    5446:	jne    544e <qemu_vmalloc+0x4e>
    5448:	add    rsp,0x10
    544c:	pop    rbx
    544d:	ret
    544e:	call   31c0 <__stack_chk_fail@plt>
    5453:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    545e:	xchg   ax,ax

0000000000005460 <qemu_vfree>:
    5460:	jmp    3070 <free@plt>
    5465:	data16 nop WORD PTR cs:[rax+rax*1+0x0]

0000000000005470 <qemu_create_pidfile>:
    5470:	push   r12
    5472:	mov    edx,0x180
    5477:	mov    esi,0x42
    547c:	push   rbp
    547d:	push   rbx
    547e:	sub    rsp,0x90
    5485:	mov    rax,QWORD PTR fs:0x28
    548e:	mov    QWORD PTR [rsp+0x88],rax
    5496:	xor    eax,eax
    5498:	call   3500 <open64@plt>
    549d:	cmp    eax,0xffffffff
    54a0:	je     5520 <qemu_create_pidfile+0xb0>
    54a2:	xor    edx,edx
    54a4:	mov    esi,0x2
    54a9:	mov    edi,eax
    54ab:	mov    ebp,eax
    54ad:	call   3550 <lockf64@plt>
    54b2:	cmp    eax,0xffffffff
    54b5:	je     5520 <qemu_create_pidfile+0xb0>
    54b7:	call   3170 <getpid@plt>
    54bc:	mov    r12,rsp
    54bf:	mov    ecx,0x80
    54c4:	lea    r8,[rip+0x189ce]        # 1de99 <__PRETTY_FUNCTION__.13895+0x21>
    54cb:	movsxd r9,eax
    54ce:	mov    edx,0x1
    54d3:	mov    esi,0x80
    54d8:	mov    rdi,r12
    54db:	xor    eax,eax
    54dd:	call   3060 <__snprintf_chk@plt>
    54e2:	mov    rsi,r12
    54e5:	mov    edi,ebp
    54e7:	movsxd rbx,eax
    54ea:	mov    rdx,rbx
    54ed:	call   3160 <write@plt>
    54f2:	cmp    rbx,rax
    54f5:	setne  al
    54f8:	movzx  eax,al
    54fb:	neg    eax
    54fd:	mov    rcx,QWORD PTR [rsp+0x88]
    5505:	xor    rcx,QWORD PTR fs:0x28
    550e:	jne    5527 <qemu_create_pidfile+0xb7>
    5510:	add    rsp,0x90
    5517:	pop    rbx
    5518:	pop    rbp
    5519:	pop    r12
    551b:	ret
    551c:	nop    DWORD PTR [rax+0x0]
    5520:	mov    eax,0xffffffff
    5525:	jmp    54fd <qemu_create_pidfile+0x8d>
    5527:	call   31c0 <__stack_chk_fail@plt>
    552c:	nop    DWORD PTR [rax+0x0]

0000000000005530 <socket_set_nonblock>:
    5530:	push   rbx
    5531:	mov    esi,0x3
    5536:	xor    eax,eax
    5538:	mov    ebx,edi
    553a:	call   3520 <fcntl64@plt>
    553f:	mov    edi,ebx
    5541:	mov    esi,0x4
    5546:	pop    rbx
    5547:	or     ah,0x8
    554a:	mov    edx,eax
    554c:	xor    eax,eax
    554e:	jmp    3520 <fcntl64@plt>
    5553:	nop    WORD PTR cs:[rax+rax*1+0x0]
    555d:	nop    DWORD PTR [rax]

0000000000005560 <pstrcpy>:
    5560:	test   rsi,rsi
    5563:	je     559b <pstrcpy+0x3b>
    5565:	movzx  eax,BYTE PTR [rdx]
    5568:	lea    rcx,[rdx+0x1]
    556c:	test   al,al
    556e:	je     5598 <pstrcpy+0x38>
    5570:	lea    rdx,[rdi+rsi*1-0x1]
    5575:	cmp    rdi,rdx
    5578:	jb     5585 <pstrcpy+0x25>
    557a:	jmp    5598 <pstrcpy+0x38>
    557c:	nop    DWORD PTR [rax+0x0]
    5580:	cmp    rdi,rdx
    5583:	je     5598 <pstrcpy+0x38>
    5585:	add    rdi,0x1
    5589:	add    rcx,0x1
    558d:	mov    BYTE PTR [rdi-0x1],al
    5590:	movzx  eax,BYTE PTR [rcx-0x1]
    5594:	test   al,al
    5596:	jne    5580 <pstrcpy+0x20>
    5598:	mov    BYTE PTR [rdi],0x0
    559b:	ret
    559c:	nop    DWORD PTR [rax+0x0]

00000000000055a0 <pstrcat>:
    55a0:	push   r12
    55a2:	mov    r12,rdx
    55a5:	push   rbp
    55a6:	mov    rbp,rdi
    55a9:	push   rbx
    55aa:	mov    rbx,rsi
    55ad:	call   31b0 <strlen@plt>
    55b2:	cdqe
    55b4:	cmp    rax,rbx
    55b7:	jb     55c8 <pstrcat+0x28>
    55b9:	mov    rax,rbp
    55bc:	pop    rbx
    55bd:	pop    rbp
    55be:	pop    r12
    55c0:	ret
    55c1:	nop    DWORD PTR [rax+0x0]
    55c8:	movzx  edx,BYTE PTR [r12]
    55cd:	sub    rbx,0x1
    55d1:	add    rax,rbp
    55d4:	lea    rcx,[r12+0x1]
    55d9:	test   dl,dl
    55db:	je     5608 <pstrcat+0x68>
    55dd:	add    rbx,rbp
    55e0:	cmp    rax,rbx
    55e3:	jb     55f5 <pstrcat+0x55>
    55e5:	jmp    5608 <pstrcat+0x68>
    55e7:	nop    WORD PTR [rax+rax*1+0x0]
    55f0:	cmp    rax,rbx
    55f3:	je     5608 <pstrcat+0x68>
    55f5:	add    rax,0x1
    55f9:	add    rcx,0x1
    55fd:	mov    BYTE PTR [rax-0x1],dl
    5600:	movzx  edx,BYTE PTR [rcx-0x1]
    5604:	test   dl,dl
    5606:	jne    55f0 <pstrcat+0x50>
    5608:	mov    BYTE PTR [rax],0x0
    560b:	mov    rax,rbp
    560e:	pop    rbx
    560f:	pop    rbp
    5610:	pop    r12
    5612:	ret
    5613:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    561e:	xchg   ax,ax

0000000000005620 <strstart>:
    5620:	jmp    5634 <strstart+0x14>
    5622:	nop    WORD PTR [rax+rax*1+0x0]
    5628:	cmp    BYTE PTR [rdi],al
    562a:	jne    5650 <strstart+0x30>
    562c:	add    rdi,0x1
    5630:	add    rsi,0x1
    5634:	movzx  eax,BYTE PTR [rsi]
    5637:	test   al,al
    5639:	jne    5628 <strstart+0x8>
    563b:	mov    eax,0x1
    5640:	test   rdx,rdx
    5643:	je     5652 <strstart+0x32>
    5645:	mov    QWORD PTR [rdx],rdi
    5648:	ret
    5649:	nop    DWORD PTR [rax+0x0]
    5650:	xor    eax,eax
    5652:	ret
    5653:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    565e:	xchg   ax,ax

0000000000005660 <stristart>:
    5660:	push   r13
    5662:	mov    r13,rdx
    5665:	push   r12
    5667:	mov    r12,rdi
    566a:	push   rbp
    566b:	push   rbx
    566c:	sub    rsp,0x8
    5670:	movzx  ebx,BYTE PTR [rsi]
    5673:	test   bl,bl
    5675:	je     56b8 <stristart+0x58>
    5677:	mov    rbp,rsi
    567a:	call   3030 <__ctype_toupper_loc@plt>
    567f:	mov    rax,QWORD PTR [rax]
    5682:	jmp    5698 <stristart+0x38>
    5684:	nop    DWORD PTR [rax+0x0]
    5688:	add    rbp,0x1
    568c:	movzx  ebx,BYTE PTR [rbp+0x0]
    5690:	add    r12,0x1
    5694:	test   bl,bl
    5696:	je     56b8 <stristart+0x58>
    5698:	movzx  ecx,BYTE PTR [r12]
    569d:	mov    edx,DWORD PTR [rax+rbx*4]
    56a0:	cmp    DWORD PTR [rax+rcx*4],edx
    56a3:	je     5688 <stristart+0x28>
    56a5:	xor    eax,eax
    56a7:	add    rsp,0x8
    56ab:	pop    rbx
    56ac:	pop    rbp
    56ad:	pop    r12
    56af:	pop    r13
    56b1:	ret
    56b2:	nop    WORD PTR [rax+rax*1+0x0]
    56b8:	mov    eax,0x1
    56bd:	test   r13,r13
    56c0:	je     56a7 <stristart+0x47>
    56c2:	mov    QWORD PTR [r13+0x0],r12
    56c6:	add    rsp,0x8
    56ca:	pop    rbx
    56cb:	pop    rbp
    56cc:	pop    r12
    56ce:	pop    r13
    56d0:	ret
    56d1:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    56dc:	nop    DWORD PTR [rax+0x0]

00000000000056e0 <mktimegm>:
    56e0:	mov    edx,DWORD PTR [rdi+0x10]
    56e3:	mov    esi,DWORD PTR [rdi+0x14]
    56e6:	mov    ecx,DWORD PTR [rdi+0xc]
    56e9:	lea    eax,[rdx+0x1]
    56ec:	cmp    eax,0x2
    56ef:	jle    5780 <mktimegm+0xa0>
    56f5:	add    esi,0x76c
    56fb:	imul   eax,eax,0x99
    5701:	mov    edx,0x66666667
    5706:	lea    r8d,[rax-0x1c9]
    570d:	mov    eax,r8d
    5710:	sar    r8d,0x1f
    5714:	imul   edx
    5716:	mov    eax,esi
    5718:	sar    edx,1
    571a:	sub    edx,r8d
    571d:	add    edx,ecx
    571f:	imul   ecx,esi,0x16d
    5725:	add    edx,ecx
    5727:	test   esi,esi
    5729:	lea    ecx,[rsi+0x3]
    572c:	cmovns ecx,esi
    572f:	sar    esi,0x1f
    5732:	mov    r9d,esi
    5735:	sar    ecx,0x2
    5738:	add    ecx,edx
    573a:	mov    edx,0x51eb851f
    573f:	imul   edx
    5741:	mov    eax,edx
    5743:	sar    edx,0x7
    5746:	sar    eax,0x5
    5749:	sub    edx,esi
    574b:	sub    r9d,eax
    574e:	add    ecx,r9d
    5751:	lea    eax,[rcx+rdx*1-0xafa6d]
    5758:	imul   eax,eax,0x15180
    575e:	imul   edx,DWORD PTR [rdi+0x8],0xe10
    5765:	movsxd rcx,eax
    5768:	imul   eax,DWORD PTR [rdi+0x4],0x3c
    576c:	add    edx,eax
    576e:	mov    eax,DWORD PTR [rdi]
    5770:	add    eax,edx
    5772:	cdqe
    5774:	add    rax,rcx
    5777:	ret
    5778:	nop    DWORD PTR [rax+rax*1+0x0]
    5780:	lea    eax,[rdx+0xd]
    5783:	add    esi,0x76b
    5789:	jmp    56fb <mktimegm+0x1b>
    578e:	xchg   ax,ax

0000000000005790 <qemu_fls>:
    5790:	xor    eax,eax
    5792:	test   edi,edi
    5794:	je     57a3 <qemu_fls+0x13>
    5796:	bsr    edi,edi
    5799:	mov    eax,0x20
    579e:	xor    edi,0x1f
    57a1:	sub    eax,edi
    57a3:	ret
    57a4:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    57af:	nop

00000000000057b0 <qemu_iovec_init>:
    57b0:	push   rbp
    57b1:	push   rbx
    57b2:	mov    rbx,rdi
    57b5:	movsxd rdi,esi
    57b8:	mov    rbp,rdi
    57bb:	shl    rdi,0x4
    57bf:	sub    rsp,0x8
    57c3:	call   5970 <qemu_malloc>
    57c8:	mov    DWORD PTR [rbx+0xc],ebp
    57cb:	mov    QWORD PTR [rbx],rax
    57ce:	mov    DWORD PTR [rbx+0x8],0x0
    57d5:	mov    QWORD PTR [rbx+0x10],0x0
    57dd:	add    rsp,0x8
    57e1:	pop    rbx
    57e2:	pop    rbp
    57e3:	ret
    57e4:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    57ef:	nop

00000000000057f0 <qemu_iovec_add>:
    57f0:	push   rbp
    57f1:	mov    rbp,rsi
    57f4:	push   rbx
    57f5:	mov    rbx,rdi
    57f8:	sub    rsp,0x18
    57fc:	movsxd rcx,DWORD PTR [rdi+0x8]
    5800:	mov    rax,QWORD PTR [rdi]
    5803:	cmp    ecx,DWORD PTR [rdi+0xc]
    5806:	je     5830 <qemu_iovec_add+0x40>
    5808:	shl    rcx,0x4
    580c:	mov    QWORD PTR [rax+rcx*1],rbp
    5810:	movsxd rax,DWORD PTR [rbx+0x8]
    5814:	shl    rax,0x4
    5818:	add    rax,QWORD PTR [rbx]
    581b:	mov    QWORD PTR [rax+0x8],rdx
    581f:	add    QWORD PTR [rbx+0x10],rdx
    5823:	add    DWORD PTR [rbx+0x8],0x1
    5827:	add    rsp,0x18
    582b:	pop    rbx
    582c:	pop    rbp
    582d:	ret
    582e:	xchg   ax,ax
    5830:	lea    esi,[rcx+rcx*1+0x1]
    5834:	mov    QWORD PTR [rsp+0x8],rdx
    5839:	mov    DWORD PTR [rdi+0xc],esi
    583c:	movsxd rsi,esi
    583f:	mov    rdi,rax
    5842:	shl    rsi,0x4
    5846:	call   5990 <qemu_realloc>
    584b:	movsxd rcx,DWORD PTR [rbx+0x8]
    584f:	mov    rdx,QWORD PTR [rsp+0x8]
    5854:	mov    QWORD PTR [rbx],rax
    5857:	jmp    5808 <qemu_iovec_add+0x18>
    5859:	nop    DWORD PTR [rax+0x0]

0000000000005860 <qemu_iovec_destroy>:
    5860:	mov    rdi,QWORD PTR [rdi]
    5863:	jmp    5960 <qemu_free>
    5868:	nop    DWORD PTR [rax+rax*1+0x0]

0000000000005870 <qemu_iovec_reset>:
    5870:	mov    DWORD PTR [rdi+0x8],0x0
    5877:	mov    QWORD PTR [rdi+0x10],0x0
    587f:	ret

0000000000005880 <qemu_iovec_to_buffer>:
    5880:	mov    eax,DWORD PTR [rdi+0x8]
    5883:	test   eax,eax
    5885:	jle    58d8 <qemu_iovec_to_buffer+0x58>
    5887:	push   r12
    5889:	mov    rcx,rsi
    588c:	mov    r12,rdi
    588f:	push   rbp
    5890:	push   rbx
    5891:	mov    rax,QWORD PTR [rdi]
    5894:	xor    ebx,ebx
    5896:	nop    WORD PTR cs:[rax+rax*1+0x0]
    58a0:	mov    rbp,rbx
    58a3:	mov    rdi,rcx
    58a6:	add    rbx,0x1
    58aa:	shl    rbp,0x4
    58ae:	add    rax,rbp
    58b1:	mov    rsi,QWORD PTR [rax]
    58b4:	mov    rdx,QWORD PTR [rax+0x8]
    58b8:	call   33b0 <memcpy@plt>
    58bd:	mov    rcx,rax
    58c0:	mov    rax,QWORD PTR [r12]
    58c4:	add    rcx,QWORD PTR [rax+rbp*1+0x8]
    58c9:	cmp    DWORD PTR [r12+0x8],ebx
    58ce:	jg     58a0 <qemu_iovec_to_buffer+0x20>
    58d0:	pop    rbx
    58d1:	pop    rbp
    58d2:	pop    r12
    58d4:	ret
    58d5:	nop    DWORD PTR [rax]
    58d8:	ret
    58d9:	nop    DWORD PTR [rax+0x0]

00000000000058e0 <qemu_iovec_from_buffer>:
    58e0:	mov    eax,DWORD PTR [rdi+0x8]
    58e3:	test   eax,eax
    58e5:	jle    594a <qemu_iovec_from_buffer+0x6a>
    58e7:	push   r14
    58e9:	push   r13
    58eb:	push   r12
    58ed:	push   rbp
    58ee:	push   rbx
    58ef:	mov    rbx,rdx
    58f2:	test   rdx,rdx
    58f5:	je     5941 <qemu_iovec_from_buffer+0x61>
    58f7:	mov    r14,rdi
    58fa:	mov    r13,rsi
    58fd:	xor    r12d,r12d
    5900:	mov    rax,r12
    5903:	mov    rbp,rbx
    5906:	mov    rsi,r13
    5909:	shl    rax,0x4
    590d:	add    rax,QWORD PTR [r14]
    5910:	cmp    QWORD PTR [rax+0x8],rbx
    5914:	cmovbe rbp,QWORD PTR [rax+0x8]
    5919:	mov    rdi,QWORD PTR [rax]
    591c:	mov    rdx,rbp
    591f:	add    r13,rbp
    5922:	call   33b0 <memcpy@plt>
    5927:	lea    eax,[r12+0x1]
    592c:	cmp    DWORD PTR [r14+0x8],eax
    5930:	setg   dl
    5933:	sub    rbx,rbp
    5936:	setne  al
    5939:	add    r12,0x1
    593d:	test   dl,al
    593f:	jne    5900 <qemu_iovec_from_buffer+0x20>
    5941:	pop    rbx
    5942:	pop    rbp
    5943:	pop    r12
    5945:	pop    r13
    5947:	pop    r14
    5949:	ret
    594a:	ret
    594b:	nop    DWORD PTR [rax+rax*1+0x0]

0000000000005950 <get_mmap_addr>:
    5950:	xor    eax,eax
    5952:	ret
    5953:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    595e:	xchg   ax,ax

0000000000005960 <qemu_free>:
    5960:	jmp    3070 <free@plt>
    5965:	data16 nop WORD PTR cs:[rax+rax*1+0x0]

0000000000005970 <qemu_malloc>:
    5970:	sub    rsp,0x8
    5974:	call   3450 <malloc@plt>
    5979:	test   rax,rax
    597c:	je     3710 <qemu_malloc.cold.0>
    5982:	add    rsp,0x8
    5986:	ret
    5987:	nop    WORD PTR [rax+rax*1+0x0]

0000000000005990 <qemu_realloc>:
    5990:	test   rsi,rsi
    5993:	je     59b0 <qemu_realloc+0x20>
    5995:	sub    rsp,0x8
    5999:	call   34a0 <realloc@plt>
    599e:	test   rax,rax
    59a1:	je     3715 <qemu_realloc.cold.1>
    59a7:	add    rsp,0x8
    59ab:	ret
    59ac:	nop    DWORD PTR [rax+0x0]
    59b0:	xor    esi,esi
    59b2:	jmp    34a0 <realloc@plt>
    59b7:	nop    WORD PTR [rax+rax*1+0x0]

00000000000059c0 <qemu_mallocz>:
    59c0:	sub    rsp,0x8
    59c4:	mov    esi,0x1
    59c9:	call   3330 <calloc@plt>
    59ce:	test   rax,rax
    59d1:	je     371a <qemu_mallocz.cold.2>
    59d7:	add    rsp,0x8
    59db:	ret
    59dc:	nop    DWORD PTR [rax+0x0]

00000000000059e0 <qemu_strdup>:
    59e0:	push   rbp
    59e1:	mov    rbp,rdi
    59e4:	push   rbx
    59e5:	sub    rsp,0x8
    59e9:	call   31b0 <strlen@plt>
    59ee:	lea    rbx,[rax+0x1]
    59f2:	mov    rdi,rbx
    59f5:	call   3450 <malloc@plt>
    59fa:	test   rax,rax
    59fd:	je     371f <qemu_strdup.cold.3>
    5a03:	mov    rdx,rbx
    5a06:	mov    rsi,rbp
    5a09:	mov    rdi,rax
    5a0c:	call   33b0 <memcpy@plt>
    5a11:	add    rsp,0x8
    5a15:	pop    rbx
    5a16:	pop    rbp
    5a17:	ret
    5a18:	nop    DWORD PTR [rax+rax*1+0x0]

0000000000005a20 <qemu_strndup>:
    5a20:	push   rbp
    5a21:	mov    rdx,rsi
    5a24:	mov    rbp,rdi
    5a27:	push   rbx
    5a28:	mov    rbx,rsi
    5a2b:	xor    esi,esi
    5a2d:	sub    rsp,0x8
    5a31:	call   32d0 <memchr@plt>
    5a36:	mov    rdx,rax
    5a39:	sub    rdx,rbp
    5a3c:	test   rax,rax
    5a3f:	cmovne rbx,rdx
    5a43:	lea    rdi,[rbx+0x1]
    5a47:	call   3450 <malloc@plt>
    5a4c:	test   rax,rax
    5a4f:	je     3724 <qemu_strndup.cold.4>
    5a55:	mov    BYTE PTR [rax+rbx*1],0x0
    5a59:	add    rsp,0x8
    5a5d:	mov    rdx,rbx
    5a60:	mov    rsi,rbp
    5a63:	pop    rbx
    5a64:	mov    rdi,rax
    5a67:	pop    rbp
    5a68:	jmp    33b0 <memcpy@plt>
    5a6d:	nop    DWORD PTR [rax]

0000000000005a70 <cow_is_allocated>:
    5a70:	mov    rax,QWORD PTR [rdi+0x40]
    5a74:	mov    r9,rcx
    5a77:	mov    r8,QWORD PTR [rax+0x8]
    5a7b:	test   r8,r8
    5a7e:	je     5b58 <cow_is_allocated+0xe8>
    5a84:	test   edx,edx
    5a86:	je     5b58 <cow_is_allocated+0xe8>
    5a8c:	test   rsi,rsi
    5a8f:	lea    rax,[rsi+0x7]
    5a93:	mov    rdi,rsi
    5a96:	cmovns rax,rsi
    5a9a:	sar    rdi,0x3f
    5a9e:	shr    rdi,0x3d
    5aa2:	sar    rax,0x3
    5aa6:	lea    rcx,[rsi+rdi*1]
    5aaa:	movzx  eax,BYTE PTR [r8+rax*1]
    5aaf:	and    ecx,0x7
    5ab2:	mov    DWORD PTR [r9],0x1
    5ab9:	sub    rcx,rdi
    5abc:	sar    eax,cl
    5abe:	and    eax,0x1
    5ac1:	cmp    edx,0x1
    5ac4:	jle    5b54 <cow_is_allocated+0xe4>
    5aca:	mov    rcx,rsi
    5acd:	lea    rdi,[rsi+0x8]
    5ad1:	add    rcx,0x1
    5ad5:	mov    r10,rcx
    5ad8:	cmovns rdi,rcx
    5adc:	sar    r10,0x3f
    5ae0:	shr    r10,0x3d
    5ae4:	sar    rdi,0x3
    5ae8:	add    rcx,r10
    5aeb:	movzx  edi,BYTE PTR [r8+rdi*1]
    5af0:	and    ecx,0x7
    5af3:	sub    rcx,r10
    5af6:	sar    edi,cl
    5af8:	and    edi,0x1
    5afb:	cmp    eax,edi
    5afd:	jne    5b54 <cow_is_allocated+0xe4>
    5aff:	lea    rdi,[rsi+0x2]
    5b03:	lea    r10d,[rdx-0x2]
    5b07:	add    r10,rdi
    5b0a:	jmp    5b48 <cow_is_allocated+0xd8>
    5b0c:	nop    DWORD PTR [rax+0x0]
    5b10:	mov    rcx,rdi
    5b13:	add    rdi,0x1
    5b17:	lea    rdx,[rcx+0x7]
    5b1b:	test   rcx,rcx
    5b1e:	mov    r11,rcx
    5b21:	cmovns rdx,rcx
    5b25:	sar    r11,0x3f
    5b29:	shr    r11,0x3d
    5b2d:	sar    rdx,0x3
    5b31:	add    rcx,r11
    5b34:	movzx  edx,BYTE PTR [r8+rdx*1]
    5b39:	and    ecx,0x7
    5b3c:	sub    rcx,r11
    5b3f:	sar    edx,cl
    5b41:	and    edx,0x1
    5b44:	cmp    edx,eax
    5b46:	jne    5b54 <cow_is_allocated+0xe4>
    5b48:	mov    edx,edi
    5b4a:	sub    edx,esi
    5b4c:	mov    DWORD PTR [r9],edx
    5b4f:	cmp    rdi,r10
    5b52:	jne    5b10 <cow_is_allocated+0xa0>
    5b54:	ret
    5b55:	nop    DWORD PTR [rax]
    5b58:	mov    DWORD PTR [r9],edx
    5b5b:	xor    eax,eax
    5b5d:	ret
    5b5e:	xchg   ax,ax

0000000000005b60 <cow_close>:
    5b60:	push   rbx
    5b61:	mov    rbx,QWORD PTR [rdi+0x40]
    5b65:	mov    rdi,QWORD PTR [rbx+0x10]
    5b69:	movsxd rsi,DWORD PTR [rbx+0x18]
    5b6d:	call   34b0 <munmap@plt>
    5b72:	mov    edi,DWORD PTR [rbx]
    5b74:	pop    rbx
    5b75:	jmp    3270 <close@plt>
    5b7a:	nop    WORD PTR [rax+rax*1+0x0]

0000000000005b80 <cow_write>:
    5b80:	push   r14
    5b82:	mov    r14,rsi
    5b85:	shl    rsi,0x9
    5b89:	push   r13
    5b8b:	mov    r13,rdx
    5b8e:	xor    edx,edx
    5b90:	push   r12
    5b92:	push   rbp
    5b93:	mov    ebp,ecx
    5b95:	push   rbx
    5b96:	mov    rbx,QWORD PTR [rdi+0x40]
    5b9a:	mov    r12d,ebp
    5b9d:	shl    r12d,0x9
    5ba1:	mov    edi,DWORD PTR [rbx]
    5ba3:	add    rsi,QWORD PTR [rbx+0x20]
    5ba7:	call   3650 <lseek64@plt>
    5bac:	mov    edi,DWORD PTR [rbx]
    5bae:	movsxd rdx,r12d
    5bb1:	mov    rsi,r13
    5bb4:	call   3160 <write@plt>
    5bb9:	cmp    r12d,eax
    5bbc:	jne    5c1a <cow_write+0x9a>
    5bbe:	test   ebp,ebp
    5bc0:	jle    5c0f <cow_write+0x8f>
    5bc2:	lea    eax,[rbp-0x1]
    5bc5:	mov    rsi,r14
    5bc8:	mov    edi,0x1
    5bcd:	lea    r8,[r14+rax*1+0x1]
    5bd2:	nop    WORD PTR [rax+rax*1+0x0]
    5bd8:	test   rsi,rsi
    5bdb:	lea    rax,[rsi+0x7]
    5bdf:	mov    rdx,rsi
    5be2:	cmovns rax,rsi
    5be6:	sar    rdx,0x3f
    5bea:	shr    rdx,0x3d
    5bee:	lea    rcx,[rsi+rdx*1]
    5bf2:	sar    rax,0x3
    5bf6:	add    rsi,0x1
    5bfa:	add    rax,QWORD PTR [rbx+0x8]
    5bfe:	and    ecx,0x7
    5c01:	sub    rcx,rdx
    5c04:	mov    edx,edi
    5c06:	shl    edx,cl
    5c08:	or     BYTE PTR [rax],dl
    5c0a:	cmp    r8,rsi
    5c0d:	jne    5bd8 <cow_write+0x58>
    5c0f:	xor    eax,eax
    5c11:	pop    rbx
    5c12:	pop    rbp
    5c13:	pop    r12
    5c15:	pop    r13
    5c17:	pop    r14
    5c19:	ret
    5c1a:	mov    eax,0xffffffff
    5c1f:	jmp    5c11 <cow_write+0x91>
    5c21:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    5c2c:	nop    DWORD PTR [rax+0x0]

0000000000005c30 <cow_read>:
    5c30:	push   r15
    5c32:	push   r14
    5c34:	push   r13
    5c36:	push   r12
    5c38:	push   rbp
    5c39:	push   rbx
    5c3a:	sub    rsp,0x18
    5c3e:	mov    rbx,QWORD PTR [rdi+0x40]
    5c42:	test   ecx,ecx
    5c44:	jle    5d78 <cow_read+0x148>
    5c4a:	mov    rbp,rdi
    5c4d:	mov    r14,rsi
    5c50:	mov    r15,rdx
    5c53:	mov    r13d,ecx
    5c56:	nop    WORD PTR cs:[rax+rax*1+0x0]
    5c60:	mov    rdi,QWORD PTR [rbx+0x8]
    5c64:	test   rdi,rdi
    5c67:	je     5d90 <cow_read+0x160>
    5c6d:	test   r14,r14
    5c70:	lea    rax,[r14+0x7]
    5c74:	cmovns rax,r14
    5c78:	sar    rax,0x3
    5c7c:	movzx  esi,BYTE PTR [rdi+rax*1]
    5c80:	mov    rax,r14
    5c83:	sar    rax,0x3f
    5c87:	shr    rax,0x3d
    5c8b:	lea    rcx,[r14+rax*1]
    5c8f:	and    ecx,0x7
    5c92:	sub    rcx,rax
    5c95:	sar    esi,cl
    5c97:	and    esi,0x1
    5c9a:	cmp    r13d,0x1
    5c9e:	je     5e20 <cow_read+0x1f0>
    5ca4:	mov    rax,r14
    5ca7:	lea    rdx,[r14+0x8]
    5cab:	add    rax,0x1
    5caf:	mov    r8,rax
    5cb2:	cmovns rdx,rax
    5cb6:	sar    r8,0x3f
    5cba:	shr    r8,0x3d
    5cbe:	sar    rdx,0x3
    5cc2:	lea    rcx,[rax+r8*1]
    5cc6:	movzx  edx,BYTE PTR [rdi+rdx*1]
    5cca:	and    ecx,0x7
    5ccd:	sub    rcx,r8
    5cd0:	sar    edx,cl
    5cd2:	and    edx,0x1
    5cd5:	cmp    edx,esi
    5cd7:	jne    5e20 <cow_read+0x1f0>
    5cdd:	lea    rdx,[r14+0x2]
    5ce1:	mov    r12d,0x1
    5ce7:	jmp    5d27 <cow_read+0xf7>
    5ce9:	nop    DWORD PTR [rax+0x0]
    5cf0:	mov    rcx,rdx
    5cf3:	add    rdx,0x1
    5cf7:	lea    rax,[rcx+0x7]
    5cfb:	test   rcx,rcx
    5cfe:	mov    r8,rcx
    5d01:	cmovns rax,rcx
    5d05:	sar    r8,0x3f
    5d09:	shr    r8,0x3d
    5d0d:	sar    rax,0x3
    5d11:	add    rcx,r8
    5d14:	movzx  eax,BYTE PTR [rdi+rax*1]
    5d18:	and    ecx,0x7
    5d1b:	sub    rcx,r8
    5d1e:	sar    eax,cl
    5d20:	and    eax,0x1
    5d23:	cmp    esi,eax
    5d25:	jne    5d30 <cow_read+0x100>
    5d27:	add    r12d,0x1
    5d2b:	cmp    r12d,r13d
    5d2e:	jne    5cf0 <cow_read+0xc0>
    5d30:	test   esi,esi
    5d32:	jne    5dc8 <cow_read+0x198>
    5d38:	mov    rdi,QWORD PTR [rbp+0x850]
    5d3f:	mov    ecx,r12d
    5d42:	test   rdi,rdi
    5d45:	je     5da2 <cow_read+0x172>
    5d47:	mov    rdx,r15
    5d4a:	mov    rsi,r14
    5d4d:	call   18210 <bdrv_read>
    5d52:	test   eax,eax
    5d54:	js     5e04 <cow_read+0x1d4>
    5d5a:	mov    ecx,r12d
    5d5d:	shl    ecx,0x9
    5d60:	movsxd rcx,ecx
    5d63:	sub    r13d,r12d
    5d66:	movsxd r12,r12d
    5d69:	add    r15,rcx
    5d6c:	add    r14,r12
    5d6f:	test   r13d,r13d
    5d72:	jg     5c60 <cow_read+0x30>
    5d78:	add    rsp,0x18
    5d7c:	xor    eax,eax
    5d7e:	pop    rbx
    5d7f:	pop    rbp
    5d80:	pop    r12
    5d82:	pop    r13
    5d84:	pop    r14
    5d86:	pop    r15
    5d88:	ret
    5d89:	nop    DWORD PTR [rax+0x0]
    5d90:	mov    rdi,QWORD PTR [rbp+0x850]
    5d97:	mov    r12d,r13d
    5d9a:	mov    ecx,r12d
    5d9d:	test   rdi,rdi
    5da0:	jne    5d47 <cow_read+0x117>
    5da2:	shl    ecx,0x9
    5da5:	xor    esi,esi
    5da7:	mov    rdi,r15
    5daa:	movsxd rcx,ecx
    5dad:	mov    rdx,rcx
    5db0:	mov    QWORD PTR [rsp+0x8],rcx
    5db5:	call   3250 <memset@plt>
    5dba:	mov    rcx,QWORD PTR [rsp+0x8]
    5dbf:	jmp    5d63 <cow_read+0x133>
    5dc1:	nop    DWORD PTR [rax+0x0]
    5dc8:	mov    edi,DWORD PTR [rbx]
    5dca:	mov    rsi,r14
    5dcd:	xor    edx,edx
    5dcf:	shl    rsi,0x9
    5dd3:	add    rsi,QWORD PTR [rbx+0x20]
    5dd7:	call   3650 <lseek64@plt>
    5ddc:	mov    ecx,r12d
    5ddf:	mov    edi,DWORD PTR [rbx]
    5de1:	mov    rsi,r15
    5de4:	shl    ecx,0x9
    5de7:	movsxd rcx,ecx
    5dea:	mov    rdx,rcx
    5ded:	mov    QWORD PTR [rsp+0x8],rcx
    5df2:	call   52c0 <qemu_read_ok>
    5df7:	mov    rcx,QWORD PTR [rsp+0x8]
    5dfc:	test   eax,eax
    5dfe:	jns    5d63 <cow_read+0x133>
    5e04:	add    rsp,0x18
    5e08:	mov    eax,0xffffffff
    5e0d:	pop    rbx
    5e0e:	pop    rbp
    5e0f:	pop    r12
    5e11:	pop    r13
    5e13:	pop    r14
    5e15:	pop    r15
    5e17:	ret
    5e18:	nop    DWORD PTR [rax+rax*1+0x0]
    5e20:	mov    r12d,0x1
    5e26:	jmp    5d30 <cow_read+0x100>
    5e2b:	nop    DWORD PTR [rax+rax*1+0x0]

0000000000005e30 <cow_open>:
    5e30:	push   r13
    5e32:	mov    r13,rsi
    5e35:	mov    esi,0x2
    5e3a:	push   r12
    5e3c:	push   rbp
    5e3d:	push   rbx
    5e3e:	mov    rbx,rdi
    5e41:	sub    rsp,0x438
    5e48:	mov    rbp,QWORD PTR [rdi+0x40]
    5e4c:	mov    rdi,r13
    5e4f:	mov    rax,QWORD PTR fs:0x28
    5e58:	mov    QWORD PTR [rsp+0x428],rax
    5e60:	xor    eax,eax
    5e62:	call   3500 <open64@plt>
    5e67:	mov    r12d,eax
    5e6a:	test   eax,eax
    5e6c:	js     5f70 <cow_open+0x140>
    5e72:	mov    DWORD PTR [rbp+0x0],r12d
    5e76:	mov    r13,rsp
    5e79:	mov    edx,0x420
    5e7e:	mov    edi,r12d
    5e81:	mov    rsi,r13
    5e84:	call   52c0 <qemu_read_ok>
    5e89:	test   eax,eax
    5e8b:	js     5f90 <cow_open+0x160>
    5e91:	cmp    DWORD PTR [rsp],0x4d4f4f4f
    5e98:	jne    5f90 <cow_open+0x160>
    5e9e:	cmp    DWORD PTR [rsp+0x4],0x2000000
    5ea6:	jne    5f90 <cow_open+0x160>
    5eac:	lea    rdx,[r13+0x8]
    5eb0:	mov    rax,QWORD PTR [rsp+0x410]
    5eb8:	mov    esi,0x400
    5ebd:	lea    rdi,[rbx+0x448]
    5ec4:	bswap  rax
    5ec7:	mov    rcx,rax
    5eca:	lea    rax,[rax+0x1ff]
    5ed1:	test   rcx,rcx
    5ed4:	cmovns rax,rcx
    5ed8:	sar    rax,0x9
    5edc:	mov    QWORD PTR [rbx],rax
    5edf:	call   5560 <pstrcpy>
    5ee4:	mov    rbx,QWORD PTR [rbx]
    5ee7:	mov    r13d,DWORD PTR [rbp+0x0]
    5eeb:	add    rbx,0x7
    5eef:	sar    rbx,0x3
    5ef3:	add    ebx,0x420
    5ef9:	mov    DWORD PTR [rbp+0x18],ebx
    5efc:	movsxd rbx,ebx
    5eff:	mov    rdi,rbx
    5f02:	call   5950 <get_mmap_addr>
    5f07:	xor    r9d,r9d
    5f0a:	mov    r8d,r13d
    5f0d:	mov    ecx,0x1
    5f12:	mov    edx,0x3
    5f17:	mov    rsi,rbx
    5f1a:	mov    rdi,rax
    5f1d:	call   3420 <mmap64@plt>
    5f22:	mov    QWORD PTR [rbp+0x10],rax
    5f26:	cmp    rax,0xffffffffffffffff
    5f2a:	je     5f90 <cow_open+0x160>
    5f2c:	add    rax,0x420
    5f32:	mov    QWORD PTR [rbp+0x8],rax
    5f36:	mov    eax,DWORD PTR [rbp+0x18]
    5f39:	add    eax,0x1ff
    5f3e:	and    eax,0xfffffe00
    5f43:	cdqe
    5f45:	mov    QWORD PTR [rbp+0x20],rax
    5f49:	xor    eax,eax
    5f4b:	mov    rcx,QWORD PTR [rsp+0x428]
    5f53:	xor    rcx,QWORD PTR fs:0x28
    5f5c:	jne    5f9f <cow_open+0x16f>
    5f5e:	add    rsp,0x438
    5f65:	pop    rbx
    5f66:	pop    rbp
    5f67:	pop    r12
    5f69:	pop    r13
    5f6b:	ret
    5f6c:	nop    DWORD PTR [rax+0x0]
    5f70:	xor    esi,esi
    5f72:	mov    rdi,r13
    5f75:	xor    eax,eax
    5f77:	call   3500 <open64@plt>
    5f7c:	mov    r12d,eax
    5f7f:	test   eax,eax
    5f81:	jns    5e72 <cow_open+0x42>
    5f87:	mov    eax,0xffffffff
    5f8c:	jmp    5f4b <cow_open+0x11b>
    5f8e:	xchg   ax,ax
    5f90:	mov    edi,r12d
    5f93:	call   3270 <close@plt>
    5f98:	mov    eax,0xffffffff
    5f9d:	jmp    5f4b <cow_open+0x11b>
    5f9f:	call   31c0 <__stack_chk_fail@plt>
    5fa4:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    5faf:	nop

0000000000005fb0 <cow_flush>:
    5fb0:	sub    rsp,0x8
    5fb4:	mov    rax,QWORD PTR [rdi+0x40]
    5fb8:	mov    edi,DWORD PTR [rax]
    5fba:	call   3560 <fsync@plt>
    5fbf:	test   eax,eax
    5fc1:	je     5fca <cow_flush+0x1a>
    5fc3:	call   30d0 <__errno_location@plt>
    5fc8:	mov    eax,DWORD PTR [rax]
    5fca:	add    rsp,0x8
    5fce:	ret
    5fcf:	nop

0000000000005fd0 <cow_probe>:
    5fd0:	xor    eax,eax
    5fd2:	cmp    esi,0x41f
    5fd8:	ja     5fe0 <cow_probe+0x10>
    5fda:	ret
    5fdb:	nop    DWORD PTR [rax+rax*1+0x0]
    5fe0:	cmp    DWORD PTR [rdi],0x4d4f4f4f
    5fe6:	jne    5fda <cow_probe+0xa>
    5fe8:	cmp    DWORD PTR [rdi+0x4],0x2000000
    5fef:	mov    edx,0x64
    5ff4:	cmove  eax,edx
    5ff7:	ret
    5ff8:	nop    DWORD PTR [rax+rax*1+0x0]

0000000000006170 <qcow_get_info>:
    6170:	mov    rax,QWORD PTR [rdi+0x40]
    6174:	mov    eax,DWORD PTR [rax+0xc]
    6177:	mov    DWORD PTR [rsi],eax
    6179:	xor    eax,eax
    617b:	ret
    617c:	nop    DWORD PTR [rax+0x0]

0000000000012820 <qcow_get_info>:
   12820:   mov    rax,QWORD PTR [rdi+0x40]
   12824:   mov    edx,DWORD PTR [rax+0xc]
   12827:   mov    DWORD PTR [rsi],edx
   12829:   movsxd rdx,DWORD PTR [rax+0x20]
   1282d:   mov    ecx,DWORD PTR [rax+0x14]
   12830:   add    ecx,DWORD PTR [rax+0x8]
   12833:   xor    eax,eax
   12835:   shl    rdx,cl
   12838:   mov    QWORD PTR [rsi+0x8],rdx
   1283c:   ret
   1283d:   nop    DWORD PTR [rax]

0000000000006260 <qcow_aio_cancel>:
    6260:	push   rbx
    6261:	mov    rbx,rdi
    6264:	mov    rdi,QWORD PTR [rdi+0x50]
    6268:	test   rdi,rdi
    626b:	je     6272 <qcow_aio_cancel+0x12>
    626d:	call   1a520 <bdrv_aio_cancel>
    6272:	mov    rdi,rbx
    6275:	pop    rbx
    6276:	jmp    1a860 <qemu_aio_release>
    627b:	nop    DWORD PTR [rax+rax*1+0x0]

0000000000006290 <qcow_close>:
    6290:	push   rbx
    6291:	mov    rbx,QWORD PTR [rdi+0x40]
    6295:	mov    rdi,QWORD PTR [rbx+0x30]
    6299:	call   5960 <qemu_free>
    629e:	mov    rdi,QWORD PTR [rbx+0x38]
    62a2:	call   5960 <qemu_free>
    62a7:	mov    rdi,QWORD PTR [rbx+0x100]
    62ae:	call   5960 <qemu_free>
    62b3:	mov    rdi,QWORD PTR [rbx+0x108]
    62ba:	call   5960 <qemu_free>
    62bf:	mov    rdi,QWORD PTR [rbx]
    62c2:	pop    rbx
    62c3:	jmp    18130 <bdrv_delete>
    62c8:	nop    DWORD PTR [rax+rax*1+0x0]

00000000000129d0 <qcow_close>:
   129d0:   push   rbp
   129d1:   mov    rbp,rdi
   129d4:   push   rbx
   129d5:   sub    rsp,0x8
   129d9:   mov    rbx,QWORD PTR [rdi+0x40]
   129dd:   mov    rdi,QWORD PTR [rbx+0x40]
   129e1:   call   5960 <qemu_free>
   129e6:   mov    rdi,QWORD PTR [rbx+0x48]
   129ea:   call   5960 <qemu_free>
   129ef:   mov    rdi,QWORD PTR [rbx+0x110]
   129f6:   call   5960 <qemu_free>
   129fb:   mov    rdi,QWORD PTR [rbx+0x118]
   12a02:   call   5960 <qemu_free>
   12a07:   mov    rbp,QWORD PTR [rbp+0x40]
   12a0b:   mov    rdi,QWORD PTR [rbp+0x148]
   12a12:   call   5960 <qemu_free>
   12a17:   mov    rdi,QWORD PTR [rbp+0x128]
   12a1e:   call   5960 <qemu_free>
   12a23:   mov    rdi,QWORD PTR [rbx]
   12a26:   add    rsp,0x8
   12a2a:   pop    rbx
   12a2b:   pop    rbp
   12a2c:   jmp    18130 <bdrv_delete>
   12a31:   data16 nop WORD PTR cs:[rax+rax*1+0x0]
   12a3c:   nop    DWORD PTR [rax+0x0]

00000000000066e0 <encrypt_sectors.isra.0>:
    66e0:	push   r15
    66e2:	push   r14
    66e4:	push   r13
    66e6:	push   r12
    66e8:	push   rbp
    66e9:	push   rbx
    66ea:	sub    rsp,0x38
    66ee:	mov    rax,QWORD PTR fs:0x28
    66f7:	mov    QWORD PTR [rsp+0x28],rax
    66fc:	xor    eax,eax
    66fe:	test   ecx,ecx
    6700:	jle    676b <encrypt_sectors.isra.0+0x8b>
    6702:	lea    r12d,[rcx-0x1]
    6706:	lea    rbx,[rdi+0x1]
    670a:	mov    rbp,rsi
    670d:	mov    r15,rdx
    6710:	lea    rax,[rsp+0x10]
    6715:	mov    r13d,r8d
    6718:	mov    r14,r9
    671b:	add    r12,rbx
    671e:	mov    QWORD PTR [rsp+0x8],rax
    6723:	jmp    672c <encrypt_sectors.isra.0+0x4c>
    6725:	nop    DWORD PTR [rax]
    6728:	add    rbx,0x1
    672c:	mov    r8,QWORD PTR [rsp+0x8]
    6731:	mov    QWORD PTR [rsp+0x10],rdi
    6736:	mov    rsi,rbp
    6739:	mov    rdi,r15
    673c:	mov    r9d,r13d
    673f:	mov    rcx,r14
    6742:	mov    edx,0x200
    6747:	mov    QWORD PTR [rsp+0x18],0x0
    6750:	add    r15,0x200
    6757:	add    rbp,0x200
    675e:	call   8630 <AES_cbc_encrypt>
    6763:	mov    rdi,rbx
    6766:	cmp    rbx,r12
    6769:	jne    6728 <encrypt_sectors.isra.0+0x48>
    676b:	mov    rax,QWORD PTR [rsp+0x28]
    6770:	xor    rax,QWORD PTR fs:0x28
    6779:	jne    678a <encrypt_sectors.isra.0+0xaa>
    677b:	add    rsp,0x38
    677f:	pop    rbx
    6780:	pop    rbp
    6781:	pop    r12
    6783:	pop    r13
    6785:	pop    r14
    6787:	pop    r15
    6789:	ret
    678a:	call   31c0 <__stack_chk_fail@plt>
    678f:	nop

00000000000068f0 <qcow_set_key>:
    68f0:	push   r12
    68f2:	pxor   xmm0,xmm0
    68f6:	push   rbp
    68f7:	mov    rbp,rsi
    68fa:	push   rbx
    68fb:	sub    rsp,0x20
    68ff:	mov    r12,QWORD PTR [rdi+0x40]
    6903:	mov    rdi,rsi
    6906:	mov    rax,QWORD PTR fs:0x28
    690f:	mov    QWORD PTR [rsp+0x18],rax
    6914:	xor    eax,eax
    6916:	movaps XMMWORD PTR [rsp],xmm0
    691a:	mov    rbx,rsp
    691d:	call   31b0 <strlen@plt>
    6922:	mov    edi,0x10
    6927:	cmp    eax,0x10
    692a:	cmovle edi,eax
    692d:	test   eax,eax
    692f:	jle    6950 <qcow_set_key+0x60>
    6931:	xor    eax,eax
    6933:	mov    rbx,rsp
    6936:	nop    WORD PTR cs:[rax+rax*1+0x0]
    6940:	movzx  ecx,BYTE PTR [rbp+rax*1+0x0]
    6945:	mov    BYTE PTR [rbx+rax*1],cl
    6948:	add    rax,0x1
    694c:	cmp    edi,eax
    694e:	jg     6940 <qcow_set_key+0x50>
    6950:	mov    eax,DWORD PTR [r12+0x11c]
    6958:	lea    rdx,[r12+0x120]
    6960:	mov    esi,0x80
    6965:	mov    rdi,rbx
    6968:	mov    DWORD PTR [r12+0x118],eax
    6970:	call   7880 <AES_set_encrypt_key>
    6975:	test   eax,eax
    6977:	jne    69b1 <qcow_set_key+0xc1>
    6979:	lea    rdx,[r12+0x214]
    6981:	mov    esi,0x80
    6986:	mov    rdi,rbx
    6989:	call   7cb0 <AES_set_decrypt_key>
    698e:	test   eax,eax
    6990:	setne  al
    6993:	movzx  eax,al
    6996:	neg    eax
    6998:	mov    rsi,QWORD PTR [rsp+0x18]
    699d:	xor    rsi,QWORD PTR fs:0x28
    69a6:	jne    69b8 <qcow_set_key+0xc8>
    69a8:	add    rsp,0x20
    69ac:	pop    rbx
    69ad:	pop    rbp
    69ae:	pop    r12
    69b0:	ret
    69b1:	mov    eax,0xffffffff
    69b6:	jmp    6998 <qcow_set_key+0xa8>
    69b8:	call   31c0 <__stack_chk_fail@plt>
    69bd:	nop    DWORD PTR [rax]

00000000000075c0 <qcow_aio_read>:
    75c0:	push   r13
    75c2:	mov    r13d,ecx
    75c5:	push   r12
    75c7:	mov    r12,rsi
    75ca:	mov    rsi,r8
    75cd:	push   rbp
    75ce:	mov    rbp,rdx
    75d1:	mov    rdx,r9
    75d4:	push   rbx
    75d5:	sub    rsp,0x8
    75d9:	call   1a680 <qemu_aio_get>
    75de:	mov    rbx,rax
    75e1:	test   rax,rax
    75e4:	je     7613 <qcow_aio_read+0x53>
    75e6:	mov    QWORD PTR [rax+0x50],0x0
    75ee:	xor    esi,esi
    75f0:	mov    rdi,rax
    75f3:	mov    QWORD PTR [rax+0x28],r12
    75f7:	mov    QWORD PTR [rax+0x30],rbp
    75fb:	mov    DWORD PTR [rax+0x38],r13d
    75ff:	mov    DWORD PTR [rax+0x3c],0x0
    7606:	mov    QWORD PTR [rax+0x40],0x0
    760e:	call   73c0 <qcow_aio_read_cb>
    7613:	add    rsp,0x8
    7617:	mov    rax,rbx
    761a:	pop    rbx
    761b:	pop    rbp
    761c:	pop    r12
    761e:	pop    r13
    7620:	ret
    7621:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    762c:	nop    DWORD PTR [rax+0x0]

0000000000013610 <qcow_aio_read>:
   13610:   push   r13
   13612:   mov    r13d,ecx
   13615:   push   r12
   13617:   mov    r12,rsi
   1361a:   mov    rsi,r8
   1361d:   push   rbp
   1361e:   mov    rbp,rdx
   13621:   mov    rdx,r9
   13624:   push   rbx
   13625:   sub    rsp,0x8
   13629:   call   1a680 <qemu_aio_get>
   1362e:   mov    rbx,rax
   13631:   test   rax,rax
   13634:   je     1366a <qcow_aio_read+0x5a>
   13636:   mov    QWORD PTR [rax+0x50],0x0
   1363e:   xor    esi,esi
   13640:   mov    rdi,rax
   13643:   mov    QWORD PTR [rax+0x28],r12
   13647:   mov    QWORD PTR [rax+0x30],rbp
   1364b:   mov    DWORD PTR [rax+0x38],r13d
   1364f:   mov    DWORD PTR [rax+0x3c],0x0
   13656:   mov    QWORD PTR [rax+0x40],0x0
   1365e:   mov    DWORD PTR [rax+0x70],0x0
   13665:   call   133d0 <qcow_aio_read_cb>
   1366a:   add    rsp,0x8
   1366e:   mov    rax,rbx
   13671:   pop    rbx
   13672:   pop    rbp
   13673:   pop    r12
   13675:   pop    r13
   13677:   ret
   13678:   nop    DWORD PTR [rax+rax*1+0x0]

0000000000007cb0 <AES_set_decrypt_key>:
    7cb0:	push   r14
    7cb2:	mov    r14,rdx
    7cb5:	push   rbp
    7cb6:	push   rbx
    7cb7:	call   7880 <AES_set_encrypt_key>
    7cbc:	test   eax,eax
    7cbe:	js     7e91 <AES_set_decrypt_key+0x1e1>
    7cc4:	mov    eax,DWORD PTR [r14+0xf0]
    7ccb:	mov    rdx,r14
    7cce:	lea    r9d,[rax*4+0x0]
    7cd6:	test   r9d,r9d
    7cd9:	jle    7d41 <AES_set_decrypt_key+0x91>
    7cdb:	movsxd rax,r9d
    7cde:	mov    rcx,r14
    7ce1:	xor    esi,esi
    7ce3:	lea    rax,[r14+rax*4]
    7ce7:	nop    WORD PTR [rax+rax*1+0x0]
    7cf0:	mov    edi,DWORD PTR [rcx]
    7cf2:	mov    r8d,DWORD PTR [rax]
    7cf5:	add    esi,0x4
    7cf8:	add    rcx,0x10
    7cfc:	sub    rax,0x10
    7d00:	mov    DWORD PTR [rcx-0x10],r8d
    7d04:	mov    r8d,DWORD PTR [rax+0x14]
    7d08:	mov    DWORD PTR [rax+0x10],edi
    7d0b:	mov    edi,DWORD PTR [rcx-0xc]
    7d0e:	mov    DWORD PTR [rcx-0xc],r8d
    7d12:	mov    r8d,DWORD PTR [rax+0x18]
    7d16:	mov    DWORD PTR [rax+0x14],edi
    7d19:	mov    edi,DWORD PTR [rcx-0x8]
    7d1c:	mov    DWORD PTR [rcx-0x8],r8d
    7d20:	mov    r8d,DWORD PTR [rax+0x1c]
    7d24:	mov    DWORD PTR [rax+0x18],edi
    7d27:	mov    edi,DWORD PTR [rcx-0x4]
    7d2a:	mov    DWORD PTR [rcx-0x4],r8d
    7d2e:	mov    DWORD PTR [rax+0x1c],edi
    7d31:	mov    edi,r9d
    7d34:	sub    edi,esi
    7d36:	cmp    esi,edi
    7d38:	jl     7cf0 <AES_set_decrypt_key+0x40>
    7d3a:	mov    eax,DWORD PTR [r14+0xf0]
    7d41:	cmp    eax,0x1
    7d44:	jle    7e8f <AES_set_decrypt_key+0x1df>
    7d4a:	mov    r10d,0x1
    7d50:	lea    r9,[rip+0x17249]        # 1efa0 <Td0>
    7d57:	lea    rax,[rip+0x17642]        # 1f3a0 <Te4>
    7d5e:	lea    r8,[rip+0x1663b]        # 1e3a0 <Td3>
    7d65:	lea    rdi,[rip+0x16e34]        # 1eba0 <Td1>
    7d6c:	lea    rsi,[rip+0x16a2d]        # 1e7a0 <Td2>
    7d73:	nop    DWORD PTR [rax+rax*1+0x0]
    7d78:	add    rdx,0x10
    7d7c:	mov    r11d,DWORD PTR [rdx]
    7d7f:	add    r10d,0x1
    7d83:	mov    ecx,r11d
    7d86:	movzx  ebp,r11b
    7d8a:	mov    ebx,r11d
    7d8d:	shr    ecx,0x18
    7d90:	movzx  ebp,BYTE PTR [rax+rbp*4]
    7d94:	movzx  ebx,bh
    7d97:	movzx  ecx,BYTE PTR [rax+rcx*4]
    7d9b:	mov    ecx,DWORD PTR [r9+rcx*4]
    7d9f:	xor    ecx,DWORD PTR [r8+rbp*4]
    7da3:	mov    ebp,r11d
    7da6:	shr    ebp,0x10
    7da9:	movzx  r11d,BYTE PTR [rax+rbx*4]
    7dae:	movzx  ebp,bpl
    7db2:	movzx  ebp,BYTE PTR [rax+rbp*4]
    7db6:	xor    ecx,DWORD PTR [rdi+rbp*4]
    7db9:	xor    ecx,DWORD PTR [rsi+r11*4]
    7dbd:	mov    r11d,DWORD PTR [rdx+0x4]
    7dc1:	mov    DWORD PTR [rdx],ecx
    7dc3:	mov    ecx,r11d
    7dc6:	movzx  ebp,r11b
    7dca:	mov    ebx,r11d
    7dcd:	shr    ecx,0x18
    7dd0:	movzx  ebp,BYTE PTR [rax+rbp*4]
    7dd4:	movzx  ebx,bh
    7dd7:	movzx  ecx,BYTE PTR [rax+rcx*4]
    7ddb:	mov    ecx,DWORD PTR [r9+rcx*4]
    7ddf:	xor    ecx,DWORD PTR [r8+rbp*4]
    7de3:	mov    ebp,r11d
    7de6:	shr    ebp,0x10
    7de9:	movzx  r11d,BYTE PTR [rax+rbx*4]
    7dee:	movzx  ebp,bpl
    7df2:	movzx  ebp,BYTE PTR [rax+rbp*4]
    7df6:	xor    ecx,DWORD PTR [rdi+rbp*4]
    7df9:	xor    ecx,DWORD PTR [rsi+r11*4]
    7dfd:	mov    r11d,DWORD PTR [rdx+0x8]
    7e01:	mov    DWORD PTR [rdx+0x4],ecx
    7e04:	mov    ecx,r11d
    7e07:	movzx  ebp,r11b
    7e0b:	mov    ebx,r11d
    7e0e:	shr    ecx,0x18
    7e11:	movzx  ebp,BYTE PTR [rax+rbp*4]
    7e15:	movzx  ebx,bh
    7e18:	movzx  ecx,BYTE PTR [rax+rcx*4]
    7e1c:	mov    ecx,DWORD PTR [r9+rcx*4]
    7e20:	xor    ecx,DWORD PTR [r8+rbp*4]
    7e24:	mov    ebp,r11d
    7e27:	shr    ebp,0x10
    7e2a:	movzx  r11d,BYTE PTR [rax+rbx*4]
    7e2f:	movzx  ebp,bpl
    7e33:	movzx  ebp,BYTE PTR [rax+rbp*4]
    7e37:	xor    ecx,DWORD PTR [rdi+rbp*4]
    7e3a:	xor    ecx,DWORD PTR [rsi+r11*4]
    7e3e:	mov    r11d,DWORD PTR [rdx+0xc]
    7e42:	mov    DWORD PTR [rdx+0x8],ecx
    7e45:	mov    ecx,r11d
    7e48:	movzx  ebp,r11b
    7e4c:	mov    ebx,r11d
    7e4f:	shr    ecx,0x18
    7e52:	movzx  ebx,bh
    7e55:	movzx  ecx,BYTE PTR [rax+rcx*4]
    7e59:	movzx  ebp,BYTE PTR [rax+rbp*4]
    7e5d:	mov    ecx,DWORD PTR [r9+rcx*4]
    7e61:	xor    ecx,DWORD PTR [r8+rbp*4]
    7e65:	mov    ebp,r11d
    7e68:	shr    ebp,0x10
    7e6b:	movzx  r11d,BYTE PTR [rax+rbx*4]
    7e70:	movzx  ebp,bpl
    7e74:	movzx  ebp,BYTE PTR [rax+rbp*4]
    7e78:	xor    ecx,DWORD PTR [rdi+rbp*4]
    7e7b:	xor    ecx,DWORD PTR [rsi+r11*4]
    7e7f:	mov    DWORD PTR [rdx+0xc],ecx
    7e82:	cmp    DWORD PTR [r14+0xf0],r10d
    7e89:	jg     7d78 <AES_set_decrypt_key+0xc8>
    7e8f:	xor    eax,eax
    7e91:	pop    rbx
    7e92:	pop    rbp
    7e93:	pop    r14
    7e95:	ret
    7e96:	nop    WORD PTR cs:[rax+rax*1+0x0]

0000000000008630 <AES_cbc_encrypt>:
    8630:	push   r15
    8632:	mov    r15,rdx
    8635:	push   r14
    8637:	mov    r14,r8
    863a:	push   r13
    863c:	push   r12
    863e:	push   rbp
    863f:	mov    rbp,rcx
    8642:	push   rbx
    8643:	mov    rbx,rsi
    8646:	sub    rsp,0x48
    864a:	mov    QWORD PTR [rsp+0x8],rdi
    864f:	mov    rax,QWORD PTR fs:0x28
    8658:	mov    QWORD PTR [rsp+0x38],rax
    865d:	xor    eax,eax
    865f:	test   r9d,r9d
    8662:	jne    8713 <AES_cbc_encrypt+0xe3>
    8668:	mov    r12,rsi
    866b:	cmp    rdx,0xf
    866f:	jbe    86e7 <AES_cbc_encrypt+0xb7>
    8671:	lea    rax,[rdx-0x10]
    8675:	mov    r13,QWORD PTR [rsp+0x8]
    867a:	and    rax,0xfffffffffffffff0
    867e:	add    rax,0x10
    8682:	mov    QWORD PTR [rsp+0x10],rax
    8687:	lea    r12,[rsi+rax*1]
    868b:	nop    DWORD PTR [rax+rax*1+0x0]
    8690:	movdqu xmm2,XMMWORD PTR [r13+0x0]
    8696:	mov    rdx,rbp
    8699:	mov    rsi,rbx
    869c:	mov    rdi,r13
    869f:	movaps XMMWORD PTR [rsp+0x20],xmm2
    86a4:	call   8270 <AES_decrypt>
    86a9:	xor    eax,eax
    86ab:	nop    DWORD PTR [rax+rax*1+0x0]
    86b0:	movzx  edx,BYTE PTR [r14+rax*1]
    86b5:	xor    BYTE PTR [rbx+rax*1],dl
    86b8:	add    rax,0x1
    86bc:	cmp    rax,0x10
    86c0:	jne    86b0 <AES_cbc_encrypt+0x80>
    86c2:	movdqa xmm3,XMMWORD PTR [rsp+0x20]
    86c8:	add    rbx,0x10
    86cc:	add    r13,0x10
    86d0:	movups XMMWORD PTR [r14],xmm3
    86d4:	cmp    rbx,r12
    86d7:	jne    8690 <AES_cbc_encrypt+0x60>
    86d9:	mov    rcx,QWORD PTR [rsp+0x10]
    86de:	add    QWORD PTR [rsp+0x8],rcx
    86e3:	and    r15d,0xf
    86e7:	test   r15,r15
    86ea:	jne    8801 <AES_cbc_encrypt+0x1d1>
    86f0:	mov    rax,QWORD PTR [rsp+0x38]
    86f5:	xor    rax,QWORD PTR fs:0x28
    86fe:	jne    8858 <AES_cbc_encrypt+0x228>
    8704:	add    rsp,0x48
    8708:	pop    rbx
    8709:	pop    rbp
    870a:	pop    r12
    870c:	pop    r13
    870e:	pop    r14
    8710:	pop    r15
    8712:	ret
    8713:	cmp    rdx,0xf
    8717:	jbe    884e <AES_cbc_encrypt+0x21e>
    871d:	lea    rax,[rdx-0x10]
    8721:	mov    r12,QWORD PTR [rsp+0x8]
    8726:	lea    r13,[rsp+0x20]
    872b:	and    rax,0xfffffffffffffff0
    872f:	add    rax,0x10
    8733:	mov    QWORD PTR [rsp+0x18],rax
    8738:	add    rax,rsi
    873b:	mov    QWORD PTR [rsp+0x10],rax
    8740:	xor    eax,eax
    8742:	nop    WORD PTR [rax+rax*1+0x0]
    8748:	movzx  edx,BYTE PTR [r12+rax*1]
    874d:	xor    dl,BYTE PTR [r14+rax*1]
    8751:	mov    BYTE PTR [r13+rax*1+0x0],dl
    8756:	add    rax,0x1
    875a:	cmp    rax,0x10
    875e:	jne    8748 <AES_cbc_encrypt+0x118>
    8760:	mov    rsi,rbx
    8763:	mov    rdx,rbp
    8766:	mov    rdi,r13
    8769:	add    r12,0x10
    876d:	call   7ea0 <AES_encrypt>
    8772:	movdqu xmm1,XMMWORD PTR [rbx]
    8776:	add    rbx,0x10
    877a:	movups XMMWORD PTR [r14],xmm1
    877e:	cmp    rbx,QWORD PTR [rsp+0x10]
    8783:	jne    8740 <AES_cbc_encrypt+0x110>
    8785:	mov    rcx,QWORD PTR [rsp+0x18]
    878a:	add    QWORD PTR [rsp+0x8],rcx
    878f:	and    r15d,0xf
    8793:	test   r15,r15
    8796:	je     86f0 <AES_cbc_encrypt+0xc0>
    879c:	xor    eax,eax
    879e:	lea    r13,[rsp+0x20]
    87a3:	nop    DWORD PTR [rax+rax*1+0x0]
    87a8:	mov    rcx,QWORD PTR [rsp+0x8]
    87ad:	movzx  edx,BYTE PTR [rcx+rax*1]
    87b1:	xor    dl,BYTE PTR [r14+rax*1]
    87b5:	mov    BYTE PTR [r13+rax*1+0x0],dl
    87ba:	add    rax,0x1
    87be:	cmp    rax,r15
    87c1:	jne    87a8 <AES_cbc_encrypt+0x178>
    87c3:	nop    DWORD PTR [rax+rax*1+0x0]
    87c8:	movzx  eax,BYTE PTR [r14+r15*1]
    87cd:	mov    BYTE PTR [r13+r15*1+0x0],al
    87d2:	add    r15,0x1
    87d6:	cmp    r15,0x10
    87da:	jne    87c8 <AES_cbc_encrypt+0x198>
    87dc:	mov    rdx,rbp
    87df:	mov    rsi,r13
    87e2:	mov    rdi,r13
    87e5:	call   7ea0 <AES_encrypt>
    87ea:	movdqa xmm0,XMMWORD PTR [rsp+0x20]
    87f0:	mov    rax,QWORD PTR [rsp+0x10]
    87f5:	movups XMMWORD PTR [rax],xmm0
    87f8:	movups XMMWORD PTR [r14],xmm0
    87fc:	jmp    86f0 <AES_cbc_encrypt+0xc0>
    8801:	mov    rax,QWORD PTR [rsp+0x8]
    8806:	lea    r13,[rsp+0x20]
    880b:	mov    rdx,rbp
    880e:	mov    rsi,r13
    8811:	mov    rdi,r13
    8814:	movdqu xmm4,XMMWORD PTR [rax]
    8818:	movaps XMMWORD PTR [rsp+0x20],xmm4
    881d:	call   8270 <AES_decrypt>
    8822:	xor    eax,eax
    8824:	nop    DWORD PTR [rax+0x0]
    8828:	movzx  edx,BYTE PTR [r13+rax*1+0x0]
    882e:	xor    dl,BYTE PTR [r14+rax*1]
    8832:	mov    BYTE PTR [r12+rax*1],dl
    8836:	add    rax,0x1
    883a:	cmp    rax,r15
    883d:	jne    8828 <AES_cbc_encrypt+0x1f8>
    883f:	movdqa xmm5,XMMWORD PTR [rsp+0x20]
    8845:	movups XMMWORD PTR [r14],xmm5
    8849:	jmp    86f0 <AES_cbc_encrypt+0xc0>
    884e:	mov    QWORD PTR [rsp+0x10],rsi
    8853:	jmp    8793 <AES_cbc_encrypt+0x163>
    8858:	call   31c0 <__stack_chk_fail@plt>
    885d:	nop    DWORD PTR [rax]

0000000000008870 <vmdk_snapshot_create>:
    8870:	push   r15
    8872:	mov    edx,0x1a4
    8877:	mov    r15,rsi
    887a:	mov    esi,0x242
    887f:	push   r14
    8881:	push   r13
    8883:	push   r12
    8885:	push   rbp
    8886:	mov    rbp,rdi
    8889:	push   rbx
    888a:	sub    rsp,0x5298
    8891:	mov    rax,QWORD PTR fs:0x28
    889a:	mov    QWORD PTR [rsp+0x5288],rax
    88a2:	xor    eax,eax
    88a4:	call   3500 <open64@plt>
    88a9:	test   eax,eax
    88ab:	js     8c80 <vmdk_snapshot_create+0x410>
    88b1:	mov    r12d,eax
    88b4:	xor    esi,esi
    88b6:	mov    rdi,r15
    88b9:	xor    eax,eax
    88bb:	call   3500 <open64@plt>
    88c0:	mov    r13d,eax
    88c3:	test   eax,eax
    88c5:	js     8c68 <vmdk_snapshot_create+0x3f8>
    88cb:	xor    edx,edx
    88cd:	xor    esi,esi
    88cf:	mov    edi,eax
    88d1:	call   3650 <lseek64@plt>
    88d6:	cmp    rax,0xffffffffffffffff
    88da:	je     8c60 <vmdk_snapshot_create+0x3f0>
    88e0:	lea    rbx,[rsp+0x80]
    88e8:	mov    edx,0x200
    88ed:	mov    edi,r13d
    88f0:	mov    rsi,rbx
    88f3:	call   52c0 <qemu_read_ok>
    88f8:	test   eax,eax
    88fa:	js     8c60 <vmdk_snapshot_create+0x3f0>
    8900:	xor    edx,edx
    8902:	xor    esi,esi
    8904:	mov    edi,r12d
    8907:	call   3650 <lseek64@plt>
    890c:	cmp    rax,0xffffffffffffffff
    8910:	je     8c60 <vmdk_snapshot_create+0x3f0>
    8916:	mov    edx,0x200
    891b:	mov    rsi,rbx
    891e:	mov    edi,r12d
    8921:	call   5390 <qemu_write_ok>
    8926:	cmp    eax,0xffffffff
    8929:	je     8c60 <vmdk_snapshot_create+0x3f0>
    892f:	mov    rax,QWORD PTR [rsp+0x94]
    8937:	mov    edi,r12d
    893a:	movdqu xmm2,XMMWORD PTR [rsp+0xa4]
    8943:	mov    rdx,QWORD PTR [rsp+0xc4]
    894b:	movdqu xmm3,XMMWORD PTR [rsp+0xb4]
    8954:	movdqu xmm0,XMMWORD PTR [rsp+0x84]
    895d:	movaps XMMWORD PTR [rsp+0x50],xmm2
    8962:	movdqu xmm1,XMMWORD PTR [rsp+0x94]
    896b:	mov    QWORD PTR [rsp+0x18],rax
    8970:	mov    eax,DWORD PTR [rsp+0x58]
    8974:	movaps XMMWORD PTR [rsp+0x60],xmm3
    8979:	mov    r14,QWORD PTR [rsp+0x64]
    897e:	mov    QWORD PTR [rsp+0x70],rdx
    8983:	mov    rsi,QWORD PTR [rsp+0x6c]
    8988:	movzx  edx,BYTE PTR [rsp+0xcc]
    8990:	mov    DWORD PTR [rsp+0xc],eax
    8994:	mov    rax,QWORD PTR [rsp+0x5c]
    8999:	shl    rsi,0x9
    899d:	movaps XMMWORD PTR [rsp+0x30],xmm0
    89a2:	mov    rbx,QWORD PTR [rsp+0x38]
    89a7:	mov    BYTE PTR [rsp+0x78],dl
    89ab:	movaps XMMWORD PTR [rsp+0x40],xmm1
    89b0:	mov    QWORD PTR [rsp+0x10],rax
    89b5:	call   34c0 <ftruncate64@plt>
    89ba:	xor    edx,edx
    89bc:	mov    esi,0x200
    89c1:	mov    edi,r13d
    89c4:	call   3650 <lseek64@plt>
    89c9:	cmp    rax,0xffffffffffffffff
    89cd:	je     8c60 <vmdk_snapshot_create+0x3f0>
    89d3:	lea    rcx,[rsp+0x280]
    89db:	mov    edx,0x2800
    89e0:	mov    edi,r13d
    89e3:	mov    rsi,rcx
    89e6:	mov    QWORD PTR [rsp],rcx
    89ea:	call   52c0 <qemu_read_ok>
    89ef:	test   eax,eax
    89f1:	js     8c60 <vmdk_snapshot_create+0x3f0>
    89f7:	mov    rcx,QWORD PTR [rsp]
    89fb:	lea    rsi,[rip+0x17da7]        # 207a9 <Te0+0x409>
    8a02:	mov    rdi,rcx
    8a05:	call   36b0 <strstr@plt>
    8a0a:	test   rax,rax
    8a0d:	je     8a26 <vmdk_snapshot_create+0x1b6>
    8a0f:	lea    rdi,[rax+0x4]
    8a13:	lea    rdx,[rsp+0x2c]
    8a18:	xor    eax,eax
    8a1a:	lea    rsi,[rip+0x17d7f]        # 207a0 <Te0+0x400>
    8a21:	call   3480 <sscanf@plt>
    8a26:	mov    rdi,rbp
    8a29:	mov    esi,0x5c
    8a2e:	call   3210 <strrchr@plt>
    8a33:	mov    esi,0x2f
    8a38:	lea    rdx,[rax+0x1]
    8a3c:	test   rax,rax
    8a3f:	cmovne rbp,rdx
    8a43:	mov    rdi,rbp
    8a46:	call   3210 <strrchr@plt>
    8a4b:	mov    esi,0x3a
    8a50:	lea    rdx,[rax+0x1]
    8a54:	test   rax,rax
    8a57:	cmovne rbp,rdx
    8a5b:	mov    rdi,rbp
    8a5e:	call   3210 <strrchr@plt>
    8a63:	mov    r9d,DWORD PTR [rsp+0x2c]
    8a68:	lea    r10,[rsp+0x2a80]
    8a70:	mov    esi,0x2800
    8a75:	test   rax,rax
    8a78:	lea    rdx,[rax+0x1]
    8a7c:	mov    rdi,r10
    8a7f:	mov    ecx,0x2800
    8a84:	cmovne rbp,rdx
    8a88:	lea    r8,[rip+0x17d91]        # 20820 <desc_template.13799>
    8a8f:	mov    edx,0x1
    8a94:	xor    eax,eax
    8a96:	push   rbp
    8a97:	push   rbx
    8a98:	push   r15
    8a9a:	push   r9
    8a9c:	mov    QWORD PTR [rsp+0x20],r10
    8aa1:	call   3060 <__snprintf_chk@plt>
    8aa6:	add    rsp,0x20
    8aaa:	xor    edx,edx
    8aac:	mov    esi,0x200
    8ab1:	mov    edi,r12d
    8ab4:	call   3650 <lseek64@plt>
    8ab9:	cmp    rax,0xffffffffffffffff
    8abd:	je     8c60 <vmdk_snapshot_create+0x3f0>
    8ac3:	mov    r10,QWORD PTR [rsp]
    8ac7:	mov    rdx,r10
    8aca:	mov    ecx,DWORD PTR [rdx]
    8acc:	add    rdx,0x4
    8ad0:	lea    eax,[rcx-0x1010101]
    8ad6:	not    ecx
    8ad8:	and    eax,ecx
    8ada:	and    eax,0x80808080
    8adf:	je     8aca <vmdk_snapshot_create+0x25a>
    8ae1:	mov    ecx,eax
    8ae3:	mov    rsi,r10
    8ae6:	mov    edi,r12d
    8ae9:	shr    ecx,0x10
    8aec:	test   eax,0x8080
    8af1:	cmove  eax,ecx
    8af4:	lea    rcx,[rdx+0x2]
    8af8:	cmove  rdx,rcx
    8afc:	mov    ecx,eax
    8afe:	add    cl,al
    8b00:	sbb    rdx,0x3
    8b04:	sub    rdx,r10
    8b07:	call   5390 <qemu_write_ok>
    8b0c:	cmp    eax,0xffffffff
    8b0f:	je     8c60 <vmdk_snapshot_create+0x3f0>
    8b15:	movsxd rcx,DWORD PTR [rsp+0xc]
    8b1a:	mov    rbp,QWORD PTR [rsp+0x10]
    8b1f:	mov    rax,rbx
    8b22:	shl    r14,0x9
    8b26:	imul   rcx,QWORD PTR [rsp+0x18]
    8b2c:	shl    rax,0x9
    8b30:	shl    rbp,0x9
    8b34:	shl    rcx,0x9
    8b38:	je     8c60 <vmdk_snapshot_create+0x3f0>
    8b3e:	cqo
    8b40:	idiv   rcx
    8b43:	lea    ebx,[rax*4+0x0]
    8b4a:	mov    rdi,rbx
    8b4d:	call   5970 <qemu_malloc>
    8b52:	xor    edx,edx
    8b54:	mov    rsi,rbp
    8b57:	mov    edi,r13d
    8b5a:	mov    r15,rax
    8b5d:	call   3650 <lseek64@plt>
    8b62:	cmp    rax,0xffffffffffffffff
    8b66:	je     8c58 <vmdk_snapshot_create+0x3e8>
    8b6c:	mov    rdx,rbx
    8b6f:	mov    rsi,r15
    8b72:	mov    edi,r13d
    8b75:	call   52c0 <qemu_read_ok>
    8b7a:	test   eax,eax
    8b7c:	js     8c58 <vmdk_snapshot_create+0x3e8>
    8b82:	xor    edx,edx
    8b84:	mov    rsi,rbp
    8b87:	mov    edi,r12d
    8b8a:	call   3650 <lseek64@plt>
    8b8f:	cmp    rax,0xffffffffffffffff
    8b93:	je     8c58 <vmdk_snapshot_create+0x3e8>
    8b99:	mov    rdx,rbx
    8b9c:	mov    rsi,r15
    8b9f:	mov    edi,r12d
    8ba2:	call   5390 <qemu_write_ok>
    8ba7:	cmp    eax,0xffffffff
    8baa:	je     8c58 <vmdk_snapshot_create+0x3e8>
    8bb0:	mov    rdi,r15
    8bb3:	call   5960 <qemu_free>
    8bb8:	mov    rdi,rbx
    8bbb:	call   5970 <qemu_malloc>
    8bc0:	xor    edx,edx
    8bc2:	mov    rsi,r14
    8bc5:	mov    edi,r13d
    8bc8:	mov    rbp,rax
    8bcb:	call   3650 <lseek64@plt>
    8bd0:	cmp    rax,0xffffffffffffffff
    8bd4:	je     8c50 <vmdk_snapshot_create+0x3e0>
    8bd6:	mov    rdx,rbx
    8bd9:	mov    rsi,rbp
    8bdc:	mov    edi,r13d
    8bdf:	call   52c0 <qemu_read_ok>
    8be4:	test   eax,eax
    8be6:	js     8c50 <vmdk_snapshot_create+0x3e0>
    8be8:	xor    edx,edx
    8bea:	mov    rsi,r14
    8bed:	mov    edi,r12d
    8bf0:	call   3650 <lseek64@plt>
    8bf5:	cmp    rax,0xffffffffffffffff
    8bf9:	je     8c50 <vmdk_snapshot_create+0x3e0>
    8bfb:	mov    rdx,rbx
    8bfe:	mov    rsi,rbp
    8c01:	mov    edi,r12d
    8c04:	call   5390 <qemu_write_ok>
    8c09:	cmp    eax,0xffffffff
    8c0c:	je     8c50 <vmdk_snapshot_create+0x3e0>
    8c0e:	mov    rdi,rbp
    8c11:	call   5960 <qemu_free>
    8c16:	mov    edi,r13d
    8c19:	call   3270 <close@plt>
    8c1e:	mov    edi,r12d
    8c21:	call   3270 <close@plt>
    8c26:	xor    eax,eax
    8c28:	mov    rbx,QWORD PTR [rsp+0x5288]
    8c30:	xor    rbx,QWORD PTR fs:0x28
    8c39:	jne    8c87 <vmdk_snapshot_create+0x417>
    8c3b:	add    rsp,0x5298
    8c42:	pop    rbx
    8c43:	pop    rbp
    8c44:	pop    r12
    8c46:	pop    r13
    8c48:	pop    r14
    8c4a:	pop    r15
    8c4c:	ret
    8c4d:	nop    DWORD PTR [rax]
    8c50:	mov    rdi,rbp
    8c53:	call   5960 <qemu_free>
    8c58:	mov    rdi,r15
    8c5b:	call   5960 <qemu_free>
    8c60:	mov    edi,r13d
    8c63:	call   3270 <close@plt>
    8c68:	mov    edi,r12d
    8c6b:	call   3270 <close@plt>
    8c70:	mov    eax,0xffffffff
    8c75:	jmp    8c28 <vmdk_snapshot_create+0x3b8>
    8c77:	nop    WORD PTR [rax+rax*1+0x0]
    8c80:	mov    eax,0xffffffff
    8c85:	jmp    8c28 <vmdk_snapshot_create+0x3b8>
    8c87:	call   31c0 <__stack_chk_fail@plt>
    8c8c:	nop    DWORD PTR [rax+0x0]

0000000000008c90 <vmdk_close>:
    8c90:	push   rbx
    8c91:	mov    rbx,QWORD PTR [rdi+0x40]
    8c95:	mov    rdi,QWORD PTR [rbx+0x18]
    8c99:	call   5960 <qemu_free>
    8c9e:	mov    rdi,QWORD PTR [rbx+0x38]
    8ca2:	call   5960 <qemu_free>
    8ca7:	mov    rdi,QWORD PTR [rbx]
    8caa:	mov    rax,QWORD PTR [rdi+0x850]
    8cb1:	test   rax,rax
    8cb4:	je     8cc1 <vmdk_close+0x31>
    8cb6:	mov    rdi,rax
    8cb9:	call   181a0 <bdrv_close>
    8cbe:	mov    rdi,QWORD PTR [rbx]
    8cc1:	pop    rbx
    8cc2:	jmp    18130 <bdrv_delete>
    8cc7:	nop    WORD PTR [rax+rax*1+0x0]

0000000000008cd0 <vmdk_probe>:
    8cd0:	xor    eax,eax
    8cd2:	cmp    esi,0x3
    8cd5:	jg     8ce0 <vmdk_probe+0x10>
    8cd7:	ret
    8cd8:	nop    DWORD PTR [rax+rax*1+0x0]
    8ce0:	mov    edx,DWORD PTR [rdi]
    8ce2:	bswap  edx
    8ce4:	cmp    edx,0x434f5744
    8cea:	je     8cf4 <vmdk_probe+0x24>
    8cec:	cmp    edx,0x4b444d56
    8cf2:	jne    8cd7 <vmdk_probe+0x7>
    8cf4:	mov    eax,0x64
    8cf9:	ret
    8cfa:	nop    WORD PTR [rax+rax*1+0x0]

0000000000008d00 <vmdk_read_cid.isra.2>:
    8d00:	push   r12
    8d02:	mov    ecx,0x2800
    8d07:	mov    r12d,esi
    8d0a:	mov    esi,0x200
    8d0f:	push   rbp
    8d10:	push   rbx
    8d11:	sub    rsp,0x2820
    8d18:	mov    rdi,QWORD PTR [rdi]
    8d1b:	mov    rax,QWORD PTR fs:0x28
    8d24:	mov    QWORD PTR [rsp+0x2818],rax
    8d2c:	xor    eax,eax
    8d2e:	lea    rbp,[rsp+0x10]
    8d33:	mov    rdx,rbp
    8d36:	call   18b00 <bdrv_pread>
    8d3b:	xor    edx,edx
    8d3d:	cmp    eax,0x2800
    8d42:	jne    8d90 <vmdk_read_cid.isra.2+0x90>
    8d44:	cmp    r12d,0x1
    8d48:	lea    rsi,[rip+0x17a54]        # 207a3 <Te0+0x403>
    8d4f:	lea    rax,[rip+0x17a53]        # 207a9 <Te0+0x409>
    8d56:	mov    rdi,rbp
    8d59:	sbb    rbx,rbx
    8d5c:	and    rbx,0xfffffffffffffffa
    8d60:	add    rbx,0xa
    8d64:	test   r12d,r12d
    8d67:	cmove  rsi,rax
    8d6b:	call   36b0 <strstr@plt>
    8d70:	test   rax,rax
    8d73:	je     8d8c <vmdk_read_cid.isra.2+0x8c>
    8d75:	lea    rdi,[rax+rbx*1]
    8d79:	lea    rdx,[rsp+0xc]
    8d7e:	xor    eax,eax
    8d80:	lea    rsi,[rip+0x17a19]        # 207a0 <Te0+0x400>
    8d87:	call   3480 <sscanf@plt>
    8d8c:	mov    edx,DWORD PTR [rsp+0xc]
    8d90:	mov    rcx,QWORD PTR [rsp+0x2818]
    8d98:	xor    rcx,QWORD PTR fs:0x28
    8da1:	mov    eax,edx
    8da3:	jne    8db1 <vmdk_read_cid.isra.2+0xb1>
    8da5:	add    rsp,0x2820
    8dac:	pop    rbx
    8dad:	pop    rbp
    8dae:	pop    r12
    8db0:	ret
    8db1:	call   31c0 <__stack_chk_fail@plt>
    8db6:	nop    WORD PTR cs:[rax+rax*1+0x0]

0000000000008dc0 <vmdk_is_cid_valid.isra.3>:
    8dc0:	mov    rax,QWORD PTR [rdi]
    8dc3:	mov    rdx,QWORD PTR [rax+0x850]
    8dca:	test   rdx,rdx
    8dcd:	je     8df0 <vmdk_is_cid_valid.isra.3+0x30>
    8dcf:	push   rbx
    8dd0:	mov    rbx,rdi
    8dd3:	mov    rdi,QWORD PTR [rdx+0x40]
    8dd7:	xor    esi,esi
    8dd9:	call   8d00 <vmdk_read_cid.isra.2>
    8dde:	cmp    DWORD PTR [rbx+0xc4],eax
    8de4:	pop    rbx
    8de5:	sete   al
    8de8:	movzx  eax,al
    8deb:	ret
    8dec:	nop    DWORD PTR [rax+0x0]
    8df0:	mov    eax,0x1
    8df5:	ret
    8df6:	nop    WORD PTR cs:[rax+rax*1+0x0]

00000000000091a0 <vmdk_is_allocated>:
    91a0:	push   r13
    91a2:	push   r12
    91a4:	mov    r12,rcx
    91a7:	xor    ecx,ecx
    91a9:	push   rbp
    91aa:	mov    ebp,edx
    91ac:	mov    rdx,rsi
    91af:	push   rbx
    91b0:	shl    rdx,0x9
    91b4:	mov    rbx,rsi
    91b7:	xor    esi,esi
    91b9:	sub    rsp,0x8
    91bd:	mov    r13,QWORD PTR [rdi+0x40]
    91c1:	call   8e00 <get_cluster_offset>
    91c6:	mov    rdi,rax
    91c9:	mov    esi,DWORD PTR [r13+0xc0]
    91d0:	mov    rax,rbx
    91d3:	cqo
    91d5:	idiv   rsi
    91d8:	mov    rcx,rsi
    91db:	sub    ecx,edx
    91dd:	cmp    ecx,ebp
    91df:	cmovg  ecx,ebp
    91e2:	xor    eax,eax
    91e4:	test   rdi,rdi
    91e7:	setne  al
    91ea:	mov    DWORD PTR [r12],ecx
    91ee:	add    rsp,0x8
    91f2:	pop    rbx
    91f3:	pop    rbp
    91f4:	pop    r12
    91f6:	pop    r13
    91f8:	ret
    91f9:	nop    DWORD PTR [rax+0x0]

0000000000009200 <vmdk_read>:
    9200:	push   r15
    9202:	push   r14
    9204:	push   r13
    9206:	push   r12
    9208:	push   rbp
    9209:	push   rbx
    920a:	sub    rsp,0x18
    920e:	mov    r14,QWORD PTR [rdi+0x40]
    9212:	test   ecx,ecx
    9214:	jle    9340 <vmdk_read+0x140>
    921a:	mov    r15,rdi
    921d:	mov    rbp,rsi
    9220:	mov    r13,rdx
    9223:	mov    r12d,ecx
    9226:	jmp    928e <vmdk_read+0x8e>
    9228:	nop    DWORD PTR [rax+rax*1+0x0]
    9230:	mov    rax,QWORD PTR [r14]
    9233:	cmp    QWORD PTR [rax+0x850],0x0
    923b:	je     9300 <vmdk_read+0x100>
    9241:	mov    rdi,QWORD PTR [r15+0x40]
    9245:	call   8dc0 <vmdk_is_cid_valid.isra.3>
    924a:	test   eax,eax
    924c:	je     9328 <vmdk_read+0x128>
    9252:	mov    rax,QWORD PTR [r14]
    9255:	mov    ecx,ebx
    9257:	mov    rdx,r13
    925a:	mov    rsi,rbp
    925d:	mov    rdi,QWORD PTR [rax+0x850]
    9264:	call   18210 <bdrv_read>
    9269:	test   eax,eax
    926b:	js     9328 <vmdk_read+0x128>
    9271:	mov    ecx,ebx
    9273:	shl    ecx,0x9
    9276:	movsxd rcx,ecx
    9279:	sub    r12d,ebx
    927c:	movsxd rbx,ebx
    927f:	add    r13,rcx
    9282:	add    rbp,rbx
    9285:	test   r12d,r12d
    9288:	jle    9340 <vmdk_read+0x140>
    928e:	mov    rdx,rbp
    9291:	xor    ecx,ecx
    9293:	xor    esi,esi
    9295:	mov    rdi,r15
    9298:	shl    rdx,0x9
    929c:	call   8e00 <get_cluster_offset>
    92a1:	mov    esi,DWORD PTR [r14+0xc0]
    92a8:	mov    rcx,rax
    92ab:	mov    rax,rbp
    92ae:	cqo
    92b0:	mov    rbx,rsi
    92b3:	idiv   rsi
    92b6:	sub    ebx,edx
    92b8:	cmp    ebx,r12d
    92bb:	cmovg  ebx,r12d
    92bf:	test   rcx,rcx
    92c2:	je     9230 <vmdk_read+0x30>
    92c8:	shl    edx,0x9
    92cb:	mov    r8d,ebx
    92ce:	mov    rdi,QWORD PTR [r14]
    92d1:	shl    r8d,0x9
    92d5:	movsxd rsi,edx
    92d8:	mov    rdx,r13
    92db:	add    rsi,rcx
    92de:	mov    ecx,r8d
    92e1:	mov    DWORD PTR [rsp+0x8],r8d
    92e6:	call   18b00 <bdrv_pread>
    92eb:	mov    r8d,DWORD PTR [rsp+0x8]
    92f0:	cmp    r8d,eax
    92f3:	jne    9328 <vmdk_read+0x128>
    92f5:	movsxd rcx,r8d
    92f8:	jmp    9279 <vmdk_read+0x79>
    92fd:	nop    DWORD PTR [rax]
    9300:	mov    ecx,ebx
    9302:	xor    esi,esi
    9304:	mov    rdi,r13
    9307:	shl    ecx,0x9
    930a:	movsxd rcx,ecx
    930d:	mov    rdx,rcx
    9310:	mov    QWORD PTR [rsp+0x8],rcx
    9315:	call   3250 <memset@plt>
    931a:	mov    rcx,QWORD PTR [rsp+0x8]
    931f:	jmp    9279 <vmdk_read+0x79>
    9324:	nop    DWORD PTR [rax+0x0]
    9328:	add    rsp,0x18
    932c:	mov    eax,0xffffffff
    9331:	pop    rbx
    9332:	pop    rbp
    9333:	pop    r12
    9335:	pop    r13
    9337:	pop    r14
    9339:	pop    r15
    933b:	ret
    933c:	nop    DWORD PTR [rax+0x0]
    9340:	add    rsp,0x18
    9344:	xor    eax,eax
    9346:	pop    rbx
    9347:	pop    rbp
    9348:	pop    r12
    934a:	pop    r13
    934c:	pop    r14
    934e:	pop    r15
    9350:	ret
    9351:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    935c:	nop    DWORD PTR [rax+0x0]

0000000000009360 <vmdk_write_cid.isra.7>:
    9360:	push   r13
    9362:	mov    ecx,0x2800
    9367:	mov    r13d,esi
    936a:	mov    esi,0x200
    936f:	push   r12
    9371:	push   rbp
    9372:	mov    rbp,rdi
    9375:	push   rbx
    9376:	sub    rsp,0x5018
    937d:	mov    rdi,QWORD PTR [rdi]
    9380:	mov    rax,QWORD PTR fs:0x28
    9389:	mov    QWORD PTR [rsp+0x5008],rax
    9391:	xor    eax,eax
    9393:	mov    rbx,rsp
    9396:	mov    rdx,rbx
    9399:	call   18b00 <bdrv_pread>
    939e:	cmp    eax,0x2800
    93a3:	jne    9470 <vmdk_write_cid.isra.7+0x110>
    93a9:	lea    rsi,[rip+0x173f3]        # 207a3 <Te0+0x403>
    93b0:	mov    rdi,rbx
    93b3:	lea    r12,[rsp+0x2800]
    93bb:	call   36b0 <strstr@plt>
    93c0:	mov    esi,0x2800
    93c5:	mov    rdi,r12
    93c8:	mov    rdx,rax
    93cb:	call   5560 <pstrcpy>
    93d0:	lea    rsi,[rip+0x173d2]        # 207a9 <Te0+0x409>
    93d7:	mov    rdi,rbx
    93da:	call   36b0 <strstr@plt>
    93df:	test   rax,rax
    93e2:	je     9422 <vmdk_write_cid.isra.7+0xc2>
    93e4:	lea    rdi,[rax+0x4]
    93e8:	mov    rax,rbx
    93eb:	mov    edx,0x1
    93f0:	mov    r9d,r13d
    93f3:	sub    rax,rdi
    93f6:	lea    r8,[rip+0x173b0]        # 207ad <Te0+0x40d>
    93fd:	mov    rcx,0xffffffffffffffff
    9404:	lea    rsi,[rax+0x2800]
    940b:	xor    eax,eax
    940d:	call   3060 <__snprintf_chk@plt>
    9412:	mov    rdx,r12
    9415:	mov    esi,0x2800
    941a:	mov    rdi,rbx
    941d:	call   55a0 <pstrcat>
    9422:	mov    rdi,QWORD PTR [rbp+0x0]
    9426:	mov    ecx,0x2800
    942b:	mov    rdx,rbx
    942e:	mov    esi,0x200
    9433:	call   19110 <bdrv_pwrite>
    9438:	cmp    eax,0x2800
    943d:	setne  al
    9440:	movzx  eax,al
    9443:	neg    eax
    9445:	mov    rcx,QWORD PTR [rsp+0x5008]
    944d:	xor    rcx,QWORD PTR fs:0x28
    9456:	jne    9477 <vmdk_write_cid.isra.7+0x117>
    9458:	add    rsp,0x5018
    945f:	pop    rbx
    9460:	pop    rbp
    9461:	pop    r12
    9463:	pop    r13
    9465:	ret
    9466:	nop    WORD PTR cs:[rax+rax*1+0x0]
    9470:	mov    eax,0xffffffff
    9475:	jmp    9445 <vmdk_write_cid.isra.7+0xe5>
    9477:	call   31c0 <__stack_chk_fail@plt>
    947c:	nop    DWORD PTR [rax+0x0]

0000000000009480 <vmdk_write>:
    9480:	push   r15
    9482:	push   r14
    9484:	push   r13
    9486:	push   r12
    9488:	mov    r12,rsi
    948b:	push   rbp
    948c:	mov    ebp,ecx
    948e:	push   rbx
    948f:	sub    rsp,0x48
    9493:	mov    r8,QWORD PTR [rdi]
    9496:	mov    r14,QWORD PTR [rdi+0x40]
    949a:	mov    QWORD PTR [rsp+0x10],rdi
    949f:	mov    rcx,QWORD PTR fs:0x28
    94a8:	mov    QWORD PTR [rsp+0x38],rcx
    94ad:	xor    ecx,ecx
    94af:	cmp    r8,rsi
    94b2:	jl     9642 <vmdk_write+0x1c2>
    94b8:	lea    rax,[rsp+0x20]
    94bd:	mov    r13,rdx
    94c0:	mov    QWORD PTR [rsp+0x18],rax
    94c5:	test   ebp,ebp
    94c7:	jg     94f4 <vmdk_write+0x74>
    94c9:	jmp    963e <vmdk_write+0x1be>
    94ce:	xchg   ax,ax
    94d0:	mov    eax,DWORD PTR [rip+0x20e8a]        # 2a360 <cid_update.13920>
    94d6:	sub    ebp,ebx
    94d8:	movsxd r9,r15d
    94db:	movsxd rbx,ebx
    94de:	add    r12,rbx
    94e1:	add    r13,r9
    94e4:	test   eax,eax
    94e6:	je     9618 <vmdk_write+0x198>
    94ec:	test   ebp,ebp
    94ee:	jle    963e <vmdk_write+0x1be>
    94f4:	mov    ebx,DWORD PTR [r14+0xc0]
    94fb:	mov    rdx,r12
    94fe:	mov    rsi,QWORD PTR [rsp+0x18]
    9503:	mov    ecx,0x1
    9508:	mov    rdi,QWORD PTR [rsp+0x10]
    950d:	lea    r8d,[rbx-0x1]
    9511:	and    r8d,r12d
    9514:	sub    ebx,r8d
    9517:	mov    DWORD PTR [rsp+0x8],r8d
    951c:	cmp    ebx,ebp
    951e:	cmovg  ebx,ebp
    9521:	shl    rdx,0x9
    9525:	call   8e00 <get_cluster_offset>
    952a:	mov    r8d,DWORD PTR [rsp+0x8]
    952f:	test   rax,rax
    9532:	je     95f0 <vmdk_write+0x170>
    9538:	shl    r8d,0x9
    953c:	mov    r15d,ebx
    953f:	mov    rdi,QWORD PTR [r14]
    9542:	mov    rdx,r13
    9545:	shl    r15d,0x9
    9549:	movsxd rsi,r8d
    954c:	add    rsi,rax
    954f:	mov    ecx,r15d
    9552:	call   19110 <bdrv_pwrite>
    9557:	cmp    r15d,eax
    955a:	jne    95f0 <vmdk_write+0x170>
    9560:	mov    edx,DWORD PTR [rsp+0x30]
    9564:	test   edx,edx
    9566:	je     94d0 <vmdk_write+0x50>
    956c:	mov    rax,QWORD PTR [rsp+0x10]
    9571:	mov    edx,DWORD PTR [rsp+0x28]
    9575:	mov    ecx,0x4
    957a:	mov    r8,QWORD PTR [rax+0x40]
    957e:	mov    eax,DWORD PTR [rsp+0x2c]
    9582:	shl    rax,0x9
    9586:	mov    rdi,QWORD PTR [r8]
    9589:	mov    QWORD PTR [rsp+0x8],r8
    958e:	lea    rsi,[rax+rdx*4]
    9592:	mov    rdx,QWORD PTR [rsp+0x18]
    9597:	call   19110 <bdrv_pwrite>
    959c:	cmp    eax,0x4
    959f:	jne    95f0 <vmdk_write+0x170>
    95a1:	mov    r8,QWORD PTR [rsp+0x8]
    95a6:	cmp    QWORD PTR [r8+0x10],0x0
    95ab:	je     94d0 <vmdk_write+0x50>
    95b1:	mov    edx,DWORD PTR [rsp+0x24]
    95b5:	mov    rax,QWORD PTR [r8+0x20]
    95b9:	mov    ecx,0x4
    95be:	mov    eax,DWORD PTR [rax+rdx*4]
    95c1:	mov    edx,DWORD PTR [rsp+0x28]
    95c5:	mov    DWORD PTR [rsp+0x2c],eax
    95c9:	shl    rax,0x9
    95cd:	mov    rdi,QWORD PTR [r8]
    95d0:	lea    rsi,[rax+rdx*4]
    95d4:	mov    rdx,QWORD PTR [rsp+0x18]
    95d9:	call   19110 <bdrv_pwrite>
    95de:	cmp    eax,0x4
    95e1:	je     94d0 <vmdk_write+0x50>
    95e7:	nop    WORD PTR [rax+rax*1+0x0]
    95f0:	mov    eax,0xffffffff
    95f5:	mov    rcx,QWORD PTR [rsp+0x38]
    95fa:	xor    rcx,QWORD PTR fs:0x28
    9603:	jne    9666 <vmdk_write+0x1e6>
    9605:	add    rsp,0x48
    9609:	pop    rbx
    960a:	pop    rbp
    960b:	pop    r12
    960d:	pop    r13
    960f:	pop    r14
    9611:	pop    r15
    9613:	ret
    9614:	nop    DWORD PTR [rax+0x0]
    9618:	xor    edi,edi
    961a:	call   33e0 <time@plt>
    961f:	mov    rcx,QWORD PTR [rsp+0x10]
    9624:	mov    esi,eax
    9626:	mov    rdi,QWORD PTR [rcx+0x40]
    962a:	call   9360 <vmdk_write_cid.isra.7>
    962f:	add    DWORD PTR [rip+0x20d2a],0x1        # 2a360 <cid_update.13920>
    9636:	test   ebp,ebp
    9638:	jg     94f4 <vmdk_write+0x74>
    963e:	xor    eax,eax
    9640:	jmp    95f5 <vmdk_write+0x175>
    9642:	mov    rdi,QWORD PTR [rip+0x20cb7]        # 2a300 <stderr@@GLIBC_2.2.5>
    9649:	mov    rcx,rsi
    964c:	lea    rdx,[rip+0x1717d]        # 207d0 <Te0+0x430>
    9653:	xor    eax,eax
    9655:	mov    esi,0x1
    965a:	call   3660 <__fprintf_chk@plt>
    965f:	mov    eax,0xffffffff
    9664:	jmp    95f5 <vmdk_write+0x175>
    9666:	call   31c0 <__stack_chk_fail@plt>
    966b:	nop    DWORD PTR [rax+rax*1+0x0]

0000000000009670 <vmdk_parent_open.isra.8>:
    9670:	push   r12
    9672:	mov    ecx,0x2800
    9677:	mov    r12,rsi
    967a:	mov    esi,0x200
    967f:	push   rbp
    9680:	mov    rbp,rdi
    9683:	push   rbx
    9684:	sub    rsp,0x2ca0
    968b:	mov    rdi,QWORD PTR [rdi]
    968e:	mov    rax,QWORD PTR fs:0x28
    9697:	mov    QWORD PTR [rsp+0x2c98],rax
    969f:	xor    eax,eax
    96a1:	lea    rbx,[rsp+0x490]
    96a9:	mov    rdx,rbx
    96ac:	call   18b00 <bdrv_pread>
    96b1:	cmp    eax,0x2800
    96b6:	jne    9800 <vmdk_parent_open.isra.8+0x190>
    96bc:	mov    rdi,rbx
    96bf:	lea    rsi,[rip+0x170eb]        # 207b1 <Te0+0x411>
    96c6:	call   36b0 <strstr@plt>
    96cb:	mov    rbx,rax
    96ce:	xor    eax,eax
    96d0:	test   rbx,rbx
    96d3:	je     97a5 <vmdk_parent_open.isra.8+0x135>
    96d9:	add    rbx,0x14
    96dd:	mov    esi,0x22
    96e2:	mov    rdi,rbx
    96e5:	call   31e0 <strchr@plt>
    96ea:	test   rax,rax
    96ed:	je     9800 <vmdk_parent_open.isra.8+0x190>
    96f3:	sub    rax,rbx
    96f6:	cmp    rax,0x3ff
    96fc:	ja     9800 <vmdk_parent_open.isra.8+0x190>
    9702:	lea    rsi,[rax+0x1]
    9706:	mov    rax,QWORD PTR [rbp+0x0]
    970a:	mov    rdx,rbx
    970d:	lea    rdi,[rax+0x448]
    9714:	call   5560 <pstrcpy>
    9719:	mov    rax,QWORD PTR [rbp+0x0]
    971d:	mov    rdx,rsp
    9720:	mov    edi,0x1
    9725:	lea    rsi,[rax+0x448]
    972c:	call   3180 <__xstat64@plt>
    9731:	test   eax,eax
    9733:	mov    rax,QWORD PTR [rbp+0x0]
    9737:	jne    97c8 <vmdk_parent_open.isra.8+0x158>
    973d:	lea    rbx,[rsp+0x90]
    9745:	lea    rdx,[rax+0x448]
    974c:	mov    esi,0x400
    9751:	mov    rdi,rbx
    9754:	call   5560 <pstrcpy>
    9759:	mov    r12,QWORD PTR [rbp+0x0]
    975d:	lea    rdi,[rip+0x174fe]        # 20c62 <desc_template.13939+0x382>
    9764:	call   17ff0 <bdrv_new>
    9769:	mov    QWORD PTR [r12+0x850],rax
    9771:	mov    rax,QWORD PTR [rbp+0x0]
    9775:	mov    rdi,QWORD PTR [rax+0x850]
    977c:	test   rdi,rdi
    977f:	je     97f0 <vmdk_parent_open.isra.8+0x180>
    9781:	mov    DWORD PTR [rip+0x20bd9],0x1        # 2a364 <parent_open>
    978b:	xor    edx,edx
    978d:	mov    rsi,rbx
    9790:	call   19100 <bdrv_open>
    9795:	test   eax,eax
    9797:	js     97ec <vmdk_parent_open.isra.8+0x17c>
    9799:	mov    DWORD PTR [rip+0x20bc1],0x0        # 2a364 <parent_open>
    97a3:	xor    eax,eax
    97a5:	mov    rcx,QWORD PTR [rsp+0x2c98]
    97ad:	xor    rcx,QWORD PTR fs:0x28
    97b6:	jne    9807 <vmdk_parent_open.isra.8+0x197>
    97b8:	add    rsp,0x2ca0
    97bf:	pop    rbx
    97c0:	pop    rbp
    97c1:	pop    r12
    97c3:	ret
    97c4:	nop    DWORD PTR [rax+0x0]
    97c8:	lea    rbx,[rsp+0x90]
    97d0:	lea    rcx,[rax+0x448]
    97d7:	mov    rdx,r12
    97da:	mov    esi,0x400
    97df:	mov    rdi,rbx
    97e2:	call   17ee0 <path_combine>
    97e7:	jmp    9759 <vmdk_parent_open.isra.8+0xe9>
    97ec:	mov    rax,QWORD PTR [rbp+0x0]
    97f0:	mov    rdi,rax
    97f3:	call   181a0 <bdrv_close>
    97f8:	nop    DWORD PTR [rax+rax*1+0x0]
    9800:	mov    eax,0xffffffff
    9805:	jmp    97a5 <vmdk_parent_open.isra.8+0x135>
    9807:	call   31c0 <__stack_chk_fail@plt>
    980c:	nop    DWORD PTR [rax+0x0]

0000000000009810 <vmdk_open>:
    9810:	push   r13
    9812:	push   r12
    9814:	mov    r12,rsi
    9817:	push   rbp
    9818:	mov    rbp,rdi
    981b:	push   rbx
    981c:	sub    rsp,0xa8
    9823:	mov    ecx,DWORD PTR [rip+0x20b3b]        # 2a364 <parent_open>
    9829:	mov    rbx,QWORD PTR [rdi+0x40]
    982d:	mov    rax,QWORD PTR fs:0x28
    9836:	mov    QWORD PTR [rsp+0x98],rax
    983e:	xor    eax,eax
    9840:	test   ecx,ecx
    9842:	mov    rdi,rbx
    9845:	cmovne edx,eax
    9848:	call   19080 <bdrv_file_open>
    984d:	test   eax,eax
    984f:	js     99bd <vmdk_open+0x1ad>
    9855:	mov    rdi,QWORD PTR [rbx]
    9858:	xor    esi,esi
    985a:	lea    rdx,[rsp+0xc]
    985f:	mov    ecx,0x4
    9864:	call   18b00 <bdrv_pread>
    9869:	cmp    eax,0x4
    986c:	jne    9a50 <vmdk_open+0x240>
    9872:	mov    eax,DWORD PTR [rsp+0xc]
    9876:	bswap  eax
    9878:	mov    DWORD PTR [rsp+0xc],eax
    987c:	cmp    eax,0x434f5744
    9881:	je     99e8 <vmdk_open+0x1d8>
    9887:	cmp    eax,0x4b444d56
    988c:	jne    9a50 <vmdk_open+0x240>
    9892:	mov    rdi,QWORD PTR [rbx]
    9895:	lea    rdx,[rsp+0x40]
    989a:	mov    ecx,0x49
    989f:	mov    esi,0x4
    98a4:	call   18b00 <bdrv_pread>
    98a9:	cmp    eax,0x49
    98ac:	jne    9a50 <vmdk_open+0x240>
    98b2:	mov    rax,QWORD PTR [rsp+0x48]
    98b7:	mov    rdx,QWORD PTR [rsp+0x50]
    98bc:	mov    QWORD PTR [rbp+0x0],rax
    98c0:	mov    eax,DWORD PTR [rsp+0x68]
    98c4:	mov    DWORD PTR [rbx+0xc0],edx
    98ca:	mov    DWORD PTR [rbx+0x30],eax
    98cd:	imul   eax,edx
    98d0:	mov    DWORD PTR [rbx+0x2c],eax
    98d3:	test   eax,eax
    98d5:	je     9a50 <vmdk_open+0x240>
    98db:	mov    ecx,eax
    98dd:	mov    rax,QWORD PTR [rbp+0x0]
    98e1:	mov    rsi,r12
    98e4:	add    rax,rcx
    98e7:	sub    rax,0x1
    98eb:	cqo
    98ed:	idiv   rcx
    98f0:	mov    edx,DWORD PTR [rip+0x20a6e]        # 2a364 <parent_open>
    98f6:	mov    DWORD PTR [rbx+0x28],eax
    98f9:	mov    rax,QWORD PTR [rsp+0x6c]
    98fe:	shl    rax,0x9
    9902:	mov    QWORD PTR [rbx+0x8],rax
    9906:	mov    rax,QWORD PTR [rsp+0x74]
    990b:	shl    rax,0x9
    990f:	mov    QWORD PTR [rbx+0x10],rax
    9913:	xor    eax,eax
    9915:	test   edx,edx
    9917:	setne  al
    991a:	mov    DWORD PTR [rbx+0xc8],eax
    9920:	mov    rdi,QWORD PTR [rbp+0x40]
    9924:	call   9670 <vmdk_parent_open.isra.8>
    9929:	test   eax,eax
    992b:	jne    9a50 <vmdk_open+0x240>
    9931:	mov    rdi,QWORD PTR [rbp+0x40]
    9935:	mov    esi,0x1
    993a:	call   8d00 <vmdk_read_cid.isra.2>
    993f:	mov    DWORD PTR [rbx+0xc4],eax
    9945:	mov    eax,DWORD PTR [rbx+0x28]
    9948:	lea    ebp,[rax*4+0x0]
    994f:	movsxd r13,ebp
    9952:	mov    rdi,r13
    9955:	call   5970 <qemu_malloc>
    995a:	mov    rsi,QWORD PTR [rbx+0x8]
    995e:	mov    rdi,QWORD PTR [rbx]
    9961:	mov    ecx,ebp
    9963:	mov    QWORD PTR [rbx+0x18],rax
    9967:	mov    rdx,rax
    996a:	call   18b00 <bdrv_pread>
    996f:	mov    r12d,eax
    9972:	cmp    eax,ebp
    9974:	jne    9a50 <vmdk_open+0x240>
    997a:	cmp    QWORD PTR [rbx+0x10],0x0
    997f:	je     99a8 <vmdk_open+0x198>
    9981:	mov    rdi,r13
    9984:	call   5970 <qemu_malloc>
    9989:	mov    rsi,QWORD PTR [rbx+0x10]
    998d:	mov    rdi,QWORD PTR [rbx]
    9990:	mov    ecx,r12d
    9993:	mov    QWORD PTR [rbx+0x20],rax
    9997:	mov    rdx,rax
    999a:	call   18b00 <bdrv_pread>
    999f:	cmp    eax,r12d
    99a2:	jne    9a50 <vmdk_open+0x240>
    99a8:	mov    edi,DWORD PTR [rbx+0x30]
    99ab:	shl    edi,0x4
    99ae:	shl    rdi,0x2
    99b2:	call   5970 <qemu_malloc>
    99b7:	mov    QWORD PTR [rbx+0x38],rax
    99bb:	xor    eax,eax
    99bd:	mov    rcx,QWORD PTR [rsp+0x98]
    99c5:	xor    rcx,QWORD PTR fs:0x28
    99ce:	jne    9a7d <vmdk_open+0x26d>
    99d4:	add    rsp,0xa8
    99db:	pop    rbx
    99dc:	pop    rbp
    99dd:	pop    r12
    99df:	pop    r13
    99e1:	ret
    99e2:	nop    WORD PTR [rax+rax*1+0x0]
    99e8:	mov    rdi,QWORD PTR [rbx]
    99eb:	lea    rdx,[rsp+0x10]
    99f0:	mov    ecx,0x28
    99f5:	mov    esi,0x4
    99fa:	call   18b00 <bdrv_pread>
    99ff:	cmp    eax,0x28
    9a02:	jne    9a50 <vmdk_open+0x240>
    9a04:	mov    eax,DWORD PTR [rsp+0x1c]
    9a08:	mov    DWORD PTR [rbx+0x30],0x200
    9a0f:	mov    DWORD PTR [rbx+0x28],0x40
    9a16:	mov    DWORD PTR [rbx+0xc0],eax
    9a1c:	mov    eax,DWORD PTR [rsp+0x18]
    9a20:	mov    QWORD PTR [rbp+0x0],rax
    9a24:	mov    eax,DWORD PTR [rsp+0x20]
    9a28:	mov    QWORD PTR [rbx+0x10],0x0
    9a30:	shl    eax,0x9
    9a33:	mov    QWORD PTR [rbx+0x8],rax
    9a37:	mov    eax,DWORD PTR [rbx+0x30]
    9a3a:	imul   eax,DWORD PTR [rbx+0xc0]
    9a41:	mov    DWORD PTR [rbx+0x2c],eax
    9a44:	jmp    9945 <vmdk_open+0x135>
    9a49:	nop    DWORD PTR [rax+0x0]
    9a50:	mov    rdi,QWORD PTR [rbx+0x20]
    9a54:	call   5960 <qemu_free>
    9a59:	mov    rdi,QWORD PTR [rbx+0x18]
    9a5d:	call   5960 <qemu_free>
    9a62:	mov    rdi,QWORD PTR [rbx+0x38]
    9a66:	call   5960 <qemu_free>
    9a6b:	mov    rdi,QWORD PTR [rbx]
    9a6e:	call   18130 <bdrv_delete>
    9a73:	mov    eax,0xffffffff
    9a78:	jmp    99bd <vmdk_open+0x1ad>
    9a7d:	call   31c0 <__stack_chk_fail@plt>
    9a82:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    9a8d:	nop    DWORD PTR [rax]

0000000000009a90 <vmdk_create.part.5>:
    9a90:	push   r15
    9a92:	mov    r15,rsi
    9a95:	mov    esi,0x241
    9a9a:	push   r14
    9a9c:	mov    r14,rdi
    9a9f:	push   r13
    9aa1:	push   r12
    9aa3:	push   rbp
    9aa4:	push   rbx
    9aa5:	sub    rsp,0x488
    9aac:	mov    DWORD PTR [rsp+0x4],edx
    9ab0:	mov    edx,0x1a4
    9ab5:	mov    rax,QWORD PTR fs:0x28
    9abe:	mov    QWORD PTR [rsp+0x478],rax
    9ac6:	xor    eax,eax
    9ac8:	call   3500 <open64@plt>
    9acd:	test   eax,eax
    9acf:	js     9dc3 <vmdk_create.part.5+0x333>
    9ad5:	mov    ebx,eax
    9ad7:	lea    rsi,[rsp+0x1c]
    9adc:	movabs rax,0x300000001
    9ae6:	mov    DWORD PTR [rsp+0x1c],0x564d444b
    9aee:	mov    QWORD PTR [rsp+0x20],rax
    9af3:	mov    rax,r15
    9af6:	mov    edi,ebx
    9af8:	lea    rbp,[rsp+0x20]
    9afd:	add    rax,0x7f
    9b01:	lea    r12,[r15+0xfe]
    9b08:	mov    BYTE PTR [rsp+0x64],0x0
    9b0d:	cmovns r12,rax
    9b11:	mov    QWORD PTR [rsp+0x28],r15
    9b16:	mov    QWORD PTR [rsp+0x30],0x80
    9b1f:	sar    r12,0x7
    9b23:	mov    DWORD PTR [rsp+0x48],0x200
    9b2b:	add    r12d,0x1ff
    9b32:	mov    QWORD PTR [rsp+0x38],0x1
    9b3b:	shr    r12d,0x9
    9b3f:	mov    DWORD PTR [rsp+0x65],0xa0d200a
    9b47:	mov    eax,r12d
    9b4a:	lea    edx,[r12*4+0x0]
    9b52:	mov    QWORD PTR [rsp+0x40],0x14
    9b5b:	lea    rax,[rax*4+0x1ff]
    9b63:	mov    QWORD PTR [rsp+0x4c],0x15
    9b6c:	mov    r13,rax
    9b6f:	shr    r13,0x9
    9b73:	lea    rax,[r13+rdx*1+0x15]
    9b78:	mov    QWORD PTR [rsp+0x8],r13
    9b7d:	mov    QWORD PTR [rsp+0x54],rax
    9b82:	add    rax,r13
    9b85:	lea    rax,[rdx+rax*1+0x7f]
    9b8a:	mov    edx,0x4
    9b8f:	and    eax,0x3fffff80
    9b94:	mov    QWORD PTR [rsp+0x5c],rax
    9b99:	call   3160 <write@plt>
    9b9e:	mov    edx,0x49
    9ba3:	mov    rsi,rbp
    9ba6:	mov    edi,ebx
    9ba8:	call   3160 <write@plt>
    9bad:	mov    rsi,QWORD PTR [rsp+0x5c]
    9bb2:	mov    edi,ebx
    9bb4:	shl    rsi,0x9
    9bb8:	call   34c0 <ftruncate64@plt>
    9bbd:	mov    rsi,QWORD PTR [rsp+0x4c]
    9bc2:	xor    edx,edx
    9bc4:	mov    edi,ebx
    9bc6:	shl    rsi,0x9
    9bca:	call   3650 <lseek64@plt>
    9bcf:	mov    eax,DWORD PTR [rsp+0x4c]
    9bd3:	add    eax,r13d
    9bd6:	mov    DWORD PTR [rsp+0x18],eax
    9bda:	test   r12d,r12d
    9bdd:	je     9da0 <vmdk_create.part.5+0x310>
    9be3:	xor    ebp,ebp
    9be5:	lea    r13,[rsp+0x18]
    9bea:	jmp    9bf2 <vmdk_create.part.5+0x162>
    9bec:	nop    DWORD PTR [rax+0x0]
    9bf0:	mov    ebp,eax
    9bf2:	mov    edx,0x4
    9bf7:	mov    rsi,r13
    9bfa:	mov    edi,ebx
    9bfc:	call   3160 <write@plt>
    9c01:	lea    eax,[rbp+0x1]
    9c04:	add    DWORD PTR [rsp+0x18],0x4
    9c09:	cmp    eax,r12d
    9c0c:	jne    9bf0 <vmdk_create.part.5+0x160>
    9c0e:	mov    rsi,QWORD PTR [rsp+0x54]
    9c13:	xor    edx,edx
    9c15:	mov    edi,ebx
    9c17:	xor    r12d,r12d
    9c1a:	shl    rsi,0x9
    9c1e:	call   3650 <lseek64@plt>
    9c23:	mov    eax,DWORD PTR [rsp+0x8]
    9c27:	add    eax,DWORD PTR [rsp+0x54]
    9c2b:	mov    DWORD PTR [rsp+0x18],eax
    9c2f:	jmp    9c3b <vmdk_create.part.5+0x1ab>
    9c31:	nop    DWORD PTR [rax+0x0]
    9c38:	mov    r12d,eax
    9c3b:	mov    edx,0x4
    9c40:	mov    rsi,r13
    9c43:	mov    edi,ebx
    9c45:	call   3160 <write@plt>
    9c4a:	lea    eax,[r12+0x1]
    9c4f:	add    DWORD PTR [rsp+0x18],0x4
    9c54:	cmp    r12d,ebp
    9c57:	jne    9c38 <vmdk_create.part.5+0x1a8>
    9c59:	mov    rdi,r14
    9c5c:	mov    esi,0x5c
    9c61:	lea    r12,[rsp+0x70]
    9c66:	call   3210 <strrchr@plt>
    9c6b:	mov    esi,0x2f
    9c70:	lea    rdx,[rax+0x1]
    9c74:	test   rax,rax
    9c77:	cmovne r14,rdx
    9c7b:	mov    rdi,r14
    9c7e:	call   3210 <strrchr@plt>
    9c83:	mov    esi,0x3a
    9c88:	lea    rdx,[rax+0x1]
    9c8c:	test   rax,rax
    9c8f:	cmovne r14,rdx
    9c93:	mov    rdi,r14
    9c96:	call   3210 <strrchr@plt>
    9c9b:	test   rax,rax
    9c9e:	lea    rdx,[rax+0x1]
    9ca2:	mov    rax,r15
    9ca5:	cmovne r14,rdx
    9ca9:	movabs rdx,0x8208208208208209
    9cb3:	imul   rdx
    9cb6:	mov    rax,r15
    9cb9:	sar    rax,0x3f
    9cbd:	lea    rbp,[rdx+r15*1]
    9cc1:	sar    rbp,0x9
    9cc5:	sub    rbp,rax
    9cc8:	mov    eax,DWORD PTR [rsp+0x4]
    9ccc:	and    eax,0x4
    9ccf:	cmp    eax,0x1
    9cd2:	sbb    r13d,r13d
    9cd5:	xor    edi,edi
    9cd7:	call   33e0 <time@plt>
    9cdc:	and    r13d,0xfffffffe
    9ce0:	push   rbp
    9ce1:	mov    ecx,0x400
    9ce6:	add    r13d,0x6
    9cea:	mov    r9d,eax
    9ced:	lea    r8,[rip+0x16bec]        # 208e0 <desc_template.13939>
    9cf4:	xor    eax,eax
    9cf6:	push   r13
    9cf8:	mov    edx,0x1
    9cfd:	mov    esi,0x400
    9d02:	mov    rdi,r12
    9d05:	push   r14
    9d07:	push   r15
    9d09:	call   3060 <__snprintf_chk@plt>
    9d0e:	add    rsp,0x20
    9d12:	mov    rsi,QWORD PTR [rsp+0x38]
    9d17:	xor    edx,edx
    9d19:	mov    edi,ebx
    9d1b:	shl    rsi,0x9
    9d1f:	call   3650 <lseek64@plt>
    9d24:	mov    rdx,r12
    9d27:	mov    ecx,DWORD PTR [rdx]
    9d29:	add    rdx,0x4
    9d2d:	lea    eax,[rcx-0x1010101]
    9d33:	not    ecx
    9d35:	and    eax,ecx
    9d37:	and    eax,0x80808080
    9d3c:	je     9d27 <vmdk_create.part.5+0x297>
    9d3e:	mov    ecx,eax
    9d40:	mov    rsi,r12
    9d43:	mov    edi,ebx
    9d45:	shr    ecx,0x10
    9d48:	test   eax,0x8080
    9d4d:	cmove  eax,ecx
    9d50:	lea    rcx,[rdx+0x2]
    9d54:	cmove  rdx,rcx
    9d58:	mov    ecx,eax
    9d5a:	add    cl,al
    9d5c:	sbb    rdx,0x3
    9d60:	sub    rdx,r12
    9d63:	call   3160 <write@plt>
    9d68:	mov    edi,ebx
    9d6a:	call   3270 <close@plt>
    9d6f:	xor    eax,eax
    9d71:	mov    rcx,QWORD PTR [rsp+0x478]
    9d79:	xor    rcx,QWORD PTR fs:0x28
    9d82:	jne    9dca <vmdk_create.part.5+0x33a>
    9d84:	add    rsp,0x488
    9d8b:	pop    rbx
    9d8c:	pop    rbp
    9d8d:	pop    r12
    9d8f:	pop    r13
    9d91:	pop    r14
    9d93:	pop    r15
    9d95:	ret
    9d96:	nop    WORD PTR cs:[rax+rax*1+0x0]
    9da0:	mov    rsi,QWORD PTR [rsp+0x54]
    9da5:	xor    edx,edx
    9da7:	mov    edi,ebx
    9da9:	shl    rsi,0x9
    9dad:	call   3650 <lseek64@plt>
    9db2:	mov    eax,DWORD PTR [rsp+0x8]
    9db6:	add    eax,DWORD PTR [rsp+0x54]
    9dba:	mov    DWORD PTR [rsp+0x18],eax
    9dbe:	jmp    9c59 <vmdk_create.part.5+0x1c9>
    9dc3:	mov    eax,0xffffffff
    9dc8:	jmp    9d71 <vmdk_create.part.5+0x2e1>
    9dca:	call   31c0 <__stack_chk_fail@plt>
    9dcf:	nop

0000000000009dd0 <vmdk_create>:
    9dd0:	test   rdx,rdx
    9dd3:	je     9de0 <vmdk_create+0x10>
    9dd5:	mov    rsi,rdx
    9dd8:	jmp    8870 <vmdk_snapshot_create>
    9ddd:	nop    DWORD PTR [rax]
    9de0:	mov    edx,ecx
    9de2:	jmp    9a90 <vmdk_create.part.5>
    9de7:	nop    WORD PTR [rax+rax*1+0x0]

0000000000009df0 <cloop_close>:
    9df0:	push   rbx
    9df1:	mov    rbx,QWORD PTR [rdi+0x40]
    9df5:	mov    edi,DWORD PTR [rbx]
    9df7:	call   3270 <close@plt>
    9dfc:	mov    eax,DWORD PTR [rbx+0x8]
    9dff:	test   eax,eax
    9e01:	jne    9e20 <cloop_close+0x30>
    9e03:	mov    rdi,QWORD PTR [rbx+0x20]
    9e07:	call   3070 <free@plt>
    9e0c:	mov    rdi,QWORD PTR [rbx+0x28]
    9e10:	call   3070 <free@plt>
    9e15:	lea    rdi,[rbx+0x30]
    9e19:	pop    rbx
    9e1a:	jmp    33c0 <inflateEnd@plt>
    9e1f:	nop
    9e20:	mov    rdi,QWORD PTR [rbx+0x10]
    9e24:	call   3070 <free@plt>
    9e29:	jmp    9e03 <cloop_close+0x13>
    9e2b:	nop    DWORD PTR [rax+rax*1+0x0]

0000000000009f90 <cloop_probe>:
    9f90:	sub    rsp,0x8
    9f94:	mov    eax,0x53
    9f99:	cmp    esi,0x53
    9f9c:	cmovge esi,eax
    9f9f:	movsxd rdx,esi
    9fa2:	mov    rsi,rdi
    9fa5:	lea    rdi,[rip+0x16a5c]        # 20a08 <desc_template.13939+0x128>
    9fac:	call   32f0 <memcmp@plt>
    9fb1:	test   eax,eax
    9fb3:	sete   al
    9fb6:	add    rsp,0x8
    9fba:	movzx  eax,al
    9fbd:	add    eax,eax
    9fbf:	ret

0000000000009fc0 <cloop_open>:
    9fc0:	push   r12
    9fc2:	xor    eax,eax
    9fc4:	push   rbp
    9fc5:	mov    rbp,rdi
    9fc8:	mov    rdi,rsi
    9fcb:	xor    esi,esi
    9fcd:	push   rbx
    9fce:	mov    rbx,QWORD PTR [rbp+0x40]
    9fd2:	call   3500 <open64@plt>
    9fd7:	mov    DWORD PTR [rbx],eax
    9fd9:	test   eax,eax
    9fdb:	js     a128 <cloop_open+0x168>
    9fe1:	mov    DWORD PTR [rbp+0x8],0x1
    9fe8:	mov    edi,DWORD PTR [rbx]
    9fea:	xor    edx,edx
    9fec:	mov    esi,0x80
    9ff1:	call   3650 <lseek64@plt>
    9ff6:	test   rax,rax
    9ff9:	js     a136 <cloop_open+0x176>
    9fff:	mov    edi,DWORD PTR [rbx]
    a001:	lea    rsi,[rbx+0x4]
    a005:	mov    edx,0x4
    a00a:	call   52c0 <qemu_read_ok>
    a00f:	test   eax,eax
    a011:	js     a136 <cloop_open+0x176>
    a017:	mov    eax,DWORD PTR [rbx+0x4]
    a01a:	mov    edi,DWORD PTR [rbx]
    a01c:	lea    rsi,[rbx+0x8]
    a020:	mov    edx,0x4
    a025:	bswap  eax
    a027:	mov    DWORD PTR [rbx+0x4],eax
    a02a:	call   52c0 <qemu_read_ok>
    a02f:	test   eax,eax
    a031:	js     a136 <cloop_open+0x176>
    a037:	mov    r12d,DWORD PTR [rbx+0x8]
    a03b:	bswap  r12d
    a03e:	mov    DWORD PTR [rbx+0x8],r12d
    a042:	shl    r12d,0x3
    a046:	mov    rdi,r12
    a049:	call   3450 <malloc@plt>
    a04e:	mov    edi,DWORD PTR [rbx]
    a050:	mov    QWORD PTR [rbx+0x10],rax
    a054:	test   rax,rax
    a057:	je     a138 <cloop_open+0x178>
    a05d:	mov    rdx,r12
    a060:	mov    rsi,rax
    a063:	call   32e0 <read@plt>
    a068:	cmp    r12,rax
    a06b:	jg     a136 <cloop_open+0x176>
    a071:	mov    eax,DWORD PTR [rbx+0x8]
    a074:	mov    edi,0x2
    a079:	test   eax,eax
    a07b:	je     a0d7 <cloop_open+0x117>
    a07d:	mov    rdx,QWORD PTR [rbx+0x10]
    a081:	xor    ecx,ecx
    a083:	mov    r8d,0x1
    a089:	mov    rax,QWORD PTR [rdx]
    a08c:	bswap  rax
    a08f:	mov    QWORD PTR [rdx],rax
    a092:	lea    eax,[rcx+0x1]
    a095:	cmp    DWORD PTR [rbx+0x8],eax
    a098:	jbe    a0d3 <cloop_open+0x113>
    a09a:	nop    WORD PTR [rax+rax*1+0x0]
    a0a0:	mov    rdx,QWORD PTR [rbx+0x10]
    a0a4:	mov    edi,eax
    a0a6:	lea    rsi,[rdx+rdi*8]
    a0aa:	mov    rdx,QWORD PTR [rsi]
    a0ad:	bswap  rdx
    a0b0:	mov    QWORD PTR [rsi],rdx
    a0b3:	test   eax,eax
    a0b5:	je     a0c9 <cloop_open+0x109>
    a0b7:	mov    rsi,QWORD PTR [rbx+0x10]
    a0bb:	mov    rdx,QWORD PTR [rsi+rdi*8]
    a0bf:	sub    edx,DWORD PTR [rsi+rcx*8]
    a0c2:	cmp    r8d,edx
    a0c5:	cmovb  r8d,edx
    a0c9:	mov    ecx,eax
    a0cb:	lea    eax,[rcx+0x1]
    a0ce:	cmp    DWORD PTR [rbx+0x8],eax
    a0d1:	ja     a0a0 <cloop_open+0xe0>
    a0d3:	lea    edi,[r8+0x1]
    a0d7:	call   5970 <qemu_malloc>
    a0dc:	mov    edi,DWORD PTR [rbx+0x4]
    a0df:	mov    QWORD PTR [rbx+0x20],rax
    a0e3:	call   5970 <qemu_malloc>
    a0e8:	lea    rdi,[rbx+0x30]
    a0ec:	mov    edx,0x70
    a0f1:	lea    rsi,[rip+0x13e47]        # 1df3f <__PRETTY_FUNCTION__.13430+0x8f>
    a0f8:	mov    QWORD PTR [rbx+0x28],rax
    a0fc:	call   34e0 <inflateInit_@plt>
    a101:	test   eax,eax
    a103:	jne    a136 <cloop_open+0x176>
    a105:	mov    ecx,DWORD PTR [rbx+0x4]
    a108:	mov    edx,DWORD PTR [rbx+0x8]
    a10b:	shr    ecx,0x9
    a10e:	mov    DWORD PTR [rbx+0x1c],edx
    a111:	imul   edx,ecx
    a114:	mov    DWORD PTR [rbx+0x18],ecx
    a117:	mov    ecx,edx
    a119:	mov    QWORD PTR [rbp+0x0],rcx
    a11d:	pop    rbx
    a11e:	pop    rbp
    a11f:	pop    r12
    a121:	ret
    a122:	nop    WORD PTR [rax+rax*1+0x0]
    a128:	call   30d0 <__errno_location@plt>
    a12d:	pop    rbx
    a12e:	pop    rbp
    a12f:	mov    eax,DWORD PTR [rax]
    a131:	pop    r12
    a133:	neg    eax
    a135:	ret
    a136:	mov    edi,DWORD PTR [rbx]
    a138:	call   3270 <close@plt>
    a13d:	mov    eax,0xffffffff
    a142:	jmp    a11d <cloop_open+0x15d>
    a144:	nop    WORD PTR cs:[rax+rax*1+0x0]
    a14e:	xchg   ax,ax

000000000000a150 <dmg_close>:
    a150:	push   rbx
    a151:	mov    rbx,QWORD PTR [rdi+0x40]
    a155:	mov    edi,DWORD PTR [rbx]
    a157:	call   3270 <close@plt>
    a15c:	mov    eax,DWORD PTR [rbx+0x4]
    a15f:	test   eax,eax
    a161:	jne    a180 <dmg_close+0x30>
    a163:	mov    rdi,QWORD PTR [rbx+0x38]
    a167:	call   3070 <free@plt>
    a16c:	mov    rdi,QWORD PTR [rbx+0x40]
    a170:	call   3070 <free@plt>
    a175:	lea    rdi,[rbx+0x48]
    a179:	pop    rbx
    a17a:	jmp    33c0 <inflateEnd@plt>
    a17f:	nop
    a180:	mov    rdi,QWORD PTR [rbx+0x8]
    a184:	call   3070 <free@plt>
    a189:	mov    rdi,QWORD PTR [rbx+0x10]
    a18d:	call   3070 <free@plt>
    a192:	mov    rdi,QWORD PTR [rbx+0x18]
    a196:	call   3070 <free@plt>
    a19b:	mov    rdi,QWORD PTR [rbx+0x20]
    a19f:	call   3070 <free@plt>
    a1a4:	mov    rdi,QWORD PTR [rbx+0x28]
    a1a8:	call   3070 <free@plt>
    a1ad:	jmp    a163 <dmg_close+0x13>
    a1af:	nop

000000000000a430 <read_uint32>:
    a430:	sub    rsp,0x18
    a434:	mov    edx,0x4
    a439:	mov    rax,QWORD PTR fs:0x28
    a442:	mov    QWORD PTR [rsp+0x8],rax
    a447:	xor    eax,eax
    a449:	lea    rsi,[rsp+0x4]
    a44e:	call   52c0 <qemu_read_ok>
    a453:	xor    edx,edx
    a455:	test   eax,eax
    a457:	js     a461 <read_uint32+0x31>
    a459:	mov    edx,DWORD PTR [rsp+0x4]
    a45d:	bswap  edx
    a45f:	mov    edx,edx
    a461:	mov    rcx,QWORD PTR [rsp+0x8]
    a466:	xor    rcx,QWORD PTR fs:0x28
    a46f:	mov    rax,rdx
    a472:	jne    a479 <read_uint32+0x49>
    a474:	add    rsp,0x18
    a478:	ret
    a479:	call   31c0 <__stack_chk_fail@plt>
    a47e:	xchg   ax,ax

000000000000a480 <read_off>:
    a480:	sub    rsp,0x18
    a484:	mov    edx,0x8
    a489:	mov    rax,QWORD PTR fs:0x28
    a492:	mov    QWORD PTR [rsp+0x8],rax
    a497:	xor    eax,eax
    a499:	mov    rsi,rsp
    a49c:	call   52c0 <qemu_read_ok>
    a4a1:	xor    edx,edx
    a4a3:	test   eax,eax
    a4a5:	js     a4ae <read_off+0x2e>
    a4a7:	mov    rdx,QWORD PTR [rsp]
    a4ab:	bswap  rdx
    a4ae:	mov    rcx,QWORD PTR [rsp+0x8]
    a4b3:	xor    rcx,QWORD PTR fs:0x28
    a4bc:	mov    rax,rdx
    a4bf:	jne    a4c6 <read_off+0x46>
    a4c1:	add    rsp,0x18
    a4c5:	ret
    a4c6:	call   31c0 <__stack_chk_fail@plt>
    a4cb:	nop    DWORD PTR [rax+rax*1+0x0]

000000000000a8f0 <bochs_close>:
    a8f0:	push   rbx
    a8f1:	mov    rbx,QWORD PTR [rdi+0x40]
    a8f5:	mov    rdi,QWORD PTR [rbx+0x8]
    a8f9:	call   5960 <qemu_free>
    a8fe:	mov    edi,DWORD PTR [rbx]
    a900:	pop    rbx
    a901:	jmp    3270 <close@plt>
    a906:	nop    WORD PTR cs:[rax+rax*1+0x0]

000000000000ad90 <vpc_close>:
    ad90:	push   rbx
    ad91:	mov    rbx,QWORD PTR [rdi+0x40]
    ad95:	mov    rdi,QWORD PTR [rbx+0x218]
    ad9c:	call   5960 <qemu_free>
    ada1:	mov    rdi,QWORD PTR [rbx]
    ada4:	pop    rbx
    ada5:	jmp    18130 <bdrv_delete>
    adaa:	nop    WORD PTR [rax+rax*1+0x0]

000000000000b940 <is_file>:
    b940:	movzx  eax,BYTE PTR [rdi+0xb]
    b944:	cmp    al,0x28
    b946:	je     b968 <is_file+0x28>
    b948:	cmp    al,0xf
    b94a:	je     b968 <is_file+0x28>
    b94c:	movzx  edx,BYTE PTR [rdi]
    b94f:	cmp    dl,0xe5
    b952:	je     b968 <is_file+0x28>
    b954:	test   dl,dl
    b956:	je     b968 <is_file+0x28>
    b958:	shr    al,0x4
    b95b:	xor    eax,0x1
    b95e:	and    eax,0x1
    b961:	ret
    b962:	nop    WORD PTR [rax+rax*1+0x0]
    b968:	xor    eax,eax
    b96a:	ret
    b96b:	nop    DWORD PTR [rax+rax*1+0x0]

000000000000b970 <adjust_dirindices>:
    b970:	mov    eax,DWORD PTR [rdi+0x804c]
    b976:	xor    ecx,ecx
    b978:	test   eax,eax
    b97a:	je     b9c1 <adjust_dirindices+0x51>
    b97c:	nop    DWORD PTR [rax+0x0]
    b980:	mov    eax,ecx
    b982:	imul   eax,DWORD PTR [rdi+0x8050]
    b989:	add    rax,QWORD PTR [rdi+0x8040]
    b990:	mov    r8d,DWORD PTR [rax+0x8]
    b994:	cmp    r8d,esi
    b997:	jb     b9a0 <adjust_dirindices+0x30>
    b999:	add    r8d,edx
    b99c:	mov    DWORD PTR [rax+0x8],r8d
    b9a0:	test   BYTE PTR [rax+0x20],0x4
    b9a4:	je     b9b6 <adjust_dirindices+0x46>
    b9a6:	mov    r8d,DWORD PTR [rax+0x14]
    b9aa:	cmp    r8d,esi
    b9ad:	jl     b9b6 <adjust_dirindices+0x46>
    b9af:	add    r8d,edx
    b9b2:	mov    DWORD PTR [rax+0x14],r8d
    b9b6:	add    ecx,0x1
    b9b9:	cmp    DWORD PTR [rdi+0x804c],ecx
    b9bf:	ja     b980 <adjust_dirindices+0x10>
    b9c1:	ret
    b9c2:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    b9cd:	nop    DWORD PTR [rax]

000000000000b9d0 <vvfat_is_allocated>:
    b9d0:	mov    rax,QWORD PTR [rdi+0x40]
    b9d4:	mov    eax,DWORD PTR [rax+0x8070]
    b9da:	sub    eax,esi
    b9dc:	cmp    eax,edx
    b9de:	jle    b9f0 <vvfat_is_allocated+0x20>
    b9e0:	mov    DWORD PTR [rcx],edx
    b9e2:	mov    eax,0x1
    b9e7:	ret
    b9e8:	nop    DWORD PTR [rax+rax*1+0x0]
    b9f0:	mov    DWORD PTR [rcx],eax
    b9f2:	not    eax
    b9f4:	shr    eax,0x1f
    b9f7:	ret
    b9f8:	nop    DWORD PTR [rax+rax*1+0x0]

000000000000ba00 <vvfat_close>:
    ba00:	push   rbx
    ba01:	mov    rbx,QWORD PTR [rdi+0x40]
    ba05:	cmp    QWORD PTR [rbx+0x8080],0x0
    ba0d:	je     ba24 <vvfat_close+0x24>
    ba0f:	mov    edi,DWORD PTR [rbx+0x807c]
    ba15:	mov    QWORD PTR [rbx+0x8080],0x0
    ba20:	test   edi,edi
    ba22:	jne    ba98 <vvfat_close+0x98>
    ba24:	mov    rdi,QWORD PTR [rbx+0x8010]
    ba2b:	mov    DWORD PTR [rbx+0x8098],0xffffffff
    ba35:	test   rdi,rdi
    ba38:	je     ba3f <vvfat_close+0x3f>
    ba3a:	call   3070 <free@plt>
    ba3f:	mov    rdi,QWORD PTR [rbx+0x8028]
    ba46:	mov    QWORD PTR [rbx+0x8018],0x0
    ba51:	test   rdi,rdi
    ba54:	je     ba5b <vvfat_close+0x5b>
    ba56:	call   3070 <free@plt>
    ba5b:	mov    rdi,QWORD PTR [rbx+0x8040]
    ba62:	mov    QWORD PTR [rbx+0x8030],0x0
    ba6d:	test   rdi,rdi
    ba70:	je     ba77 <vvfat_close+0x77>
    ba72:	call   3070 <free@plt>
    ba77:	mov    rdi,QWORD PTR [rbx+0x8090]
    ba7e:	mov    QWORD PTR [rbx+0x8048],0x0
    ba89:	test   rdi,rdi
    ba8c:	je     bab0 <vvfat_close+0xb0>
    ba8e:	pop    rbx
    ba8f:	jmp    3070 <free@plt>
    ba94:	nop    DWORD PTR [rax+0x0]
    ba98:	call   3270 <close@plt>
    ba9d:	mov    DWORD PTR [rbx+0x807c],0x0
    baa7:	jmp    ba24 <vvfat_close+0x24>
    baac:	nop    DWORD PTR [rax+0x0]
    bab0:	pop    rbx
    bab1:	ret
    bab2:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    babd:	nop    DWORD PTR [rax]

000000000000bac0 <array_remove>:
    bac0:	push   r15
    bac2:	push   r14
    bac4:	push   r13
    bac6:	push   r12
    bac8:	push   rbp
    bac9:	push   rbx
    baca:	sub    rsp,0x28
    bace:	test   esi,esi
    bad0:	js     bbe6 <array_remove+0x126>
    bad6:	mov    eax,DWORD PTR [rdi+0xc]
    bad9:	lea    edx,[rsi+0x1]
    badc:	mov    r15,rdi
    badf:	mov    ebx,esi
    bae1:	cmp    edx,eax
    bae3:	ja     bbc7 <array_remove+0x107>
    bae9:	mov    ebp,eax
    baeb:	sub    ebp,0x1
    baee:	js     bbc0 <array_remove+0x100>
    baf4:	cmp    eax,esi
    baf6:	jbe    bbc0 <array_remove+0x100>
    bafc:	cmp    esi,ebp
    bafe:	je     bb90 <array_remove+0xd0>
    bb04:	movsxd r12,DWORD PTR [rdi+0x10]
    bb08:	mov    r9d,esi
    bb0b:	mov    r8d,ebp
    bb0e:	mov    r13,QWORD PTR [rdi]
    bb11:	imul   r9d,r12d
    bb15:	mov    rdi,r12
    bb18:	imul   r8d,r12d
    bb1c:	movsxd r9,r9d
    bb1f:	lea    rax,[r13+r9*1+0x0]
    bb24:	movsxd r8,r8d
    bb27:	mov    QWORD PTR [rsp+0x18],r9
    bb2c:	add    r13,r8
    bb2f:	mov    QWORD PTR [rsp+0x10],r8
    bb34:	mov    QWORD PTR [rsp+0x8],rax
    bb39:	call   5970 <qemu_malloc>
    bb3e:	mov    rsi,QWORD PTR [rsp+0x8]
    bb43:	mov    rdx,r12
    bb46:	mov    rdi,rax
    bb49:	mov    r14,rax
    bb4c:	call   33b0 <memcpy@plt>
    bb51:	cmp    ebx,ebp
    bb53:	mov    r8,QWORD PTR [rsp+0x10]
    bb58:	mov    r9,QWORD PTR [rsp+0x18]
    bb5d:	jg     bba8 <array_remove+0xe8>
    bb5f:	mov    rdi,QWORD PTR [rsp+0x8]
    bb64:	mov    rdx,r8
    bb67:	sub    rdx,r9
    bb6a:	lea    rsi,[rdi+r12*1]
    bb6e:	call   3530 <memmove@plt>
    bb73:	mov    rdx,r12
    bb76:	mov    rsi,r14
    bb79:	mov    rdi,r13
    bb7c:	call   33b0 <memcpy@plt>
    bb81:	mov    rdi,r14
    bb84:	call   3070 <free@plt>
    bb89:	mov    eax,DWORD PTR [r15+0xc]
    bb8d:	lea    ebp,[rax-0x1]
    bb90:	mov    DWORD PTR [r15+0xc],ebp
    bb94:	xor    eax,eax
    bb96:	add    rsp,0x28
    bb9a:	pop    rbx
    bb9b:	pop    rbp
    bb9c:	pop    r12
    bb9e:	pop    r13
    bba0:	pop    r14
    bba2:	pop    r15
    bba4:	ret
    bba5:	nop    DWORD PTR [rax]
    bba8:	mov    rdx,r9
    bbab:	lea    rdi,[r13+r12*1+0x0]
    bbb0:	mov    rsi,r13
    bbb3:	sub    rdx,r8
    bbb6:	call   3530 <memmove@plt>
    bbbb:	jmp    bb73 <array_remove+0xb3>
    bbbd:	nop    DWORD PTR [rax]
    bbc0:	mov    eax,0xffffffff
    bbc5:	jmp    bb96 <array_remove+0xd6>
    bbc7:	lea    rcx,[rip+0x157e2]        # 213b0 <__PRETTY_FUNCTION__.13862>
    bbce:	mov    edx,0xb5
    bbd3:	lea    rsi,[rip+0x14f0c]        # 20ae6 <desc_template.13939+0x206>
    bbda:	lea    rdi,[rip+0x14f1d]        # 20afe <desc_template.13939+0x21e>
    bbe1:	call   3230 <__assert_fail@plt>
    bbe6:	lea    rcx,[rip+0x157c3]        # 213b0 <__PRETTY_FUNCTION__.13862>
    bbed:	mov    edx,0xb3
    bbf2:	lea    rsi,[rip+0x14eed]        # 20ae6 <desc_template.13939+0x206>
    bbf9:	lea    rdi,[rip+0x14ef4]        # 20af4 <desc_template.13939+0x214>
    bc00:	call   3230 <__assert_fail@plt>
    bc05:	data16 nop WORD PTR cs:[rax+rax*1+0x0]

000000000000bc10 <remove_mapping>:
    bc10:	push   r12
    bc12:	push   rbp
    bc13:	push   rbx
    bc14:	cmp    esi,DWORD PTR [rdi+0x804c]
    bc1a:	jae    bcfe <remove_mapping+0xee>
    bc20:	mov    eax,esi
    bc22:	imul   eax,DWORD PTR [rdi+0x8050]
    bc29:	mov    rbx,rdi
    bc2c:	mov    ebp,esi
    bc2e:	mov    r12,QWORD PTR [rdi+0x8040]
    bc35:	add    rax,r12
    bc38:	mov    edx,DWORD PTR [rax+0xc]
    bc3b:	test   edx,edx
    bc3d:	js     bcf0 <remove_mapping+0xe0>
    bc43:	lea    rdi,[rbx+0x8040]
    bc4a:	mov    esi,ebp
    bc4c:	call   bac0 <array_remove>
    bc51:	mov    eax,DWORD PTR [rbx+0x804c]
    bc57:	test   eax,eax
    bc59:	je     bc9d <remove_mapping+0x8d>
    bc5b:	xor    edx,edx
    bc5d:	nop    DWORD PTR [rax]
    bc60:	mov    eax,edx
    bc62:	imul   eax,DWORD PTR [rbx+0x8050]
    bc69:	add    rax,QWORD PTR [rbx+0x8040]
    bc70:	mov    ecx,DWORD PTR [rax+0xc]
    bc73:	cmp    ebp,ecx
    bc75:	jg     bc7d <remove_mapping+0x6d>
    bc77:	sub    ecx,0x1
    bc7a:	mov    DWORD PTR [rax+0xc],ecx
    bc7d:	test   BYTE PTR [rax+0x20],0x4
    bc81:	je     bc90 <remove_mapping+0x80>
    bc83:	mov    ecx,DWORD PTR [rax+0x10]
    bc86:	cmp    ebp,ecx
    bc88:	jg     bc90 <remove_mapping+0x80>
    bc8a:	sub    ecx,0x1
    bc8d:	mov    DWORD PTR [rax+0x10],ecx
    bc90:	mov    eax,DWORD PTR [rbx+0x804c]
    bc96:	add    edx,0x1
    bc99:	cmp    eax,edx
    bc9b:	ja     bc60 <remove_mapping+0x50>
    bc9d:	mov    rdx,QWORD PTR [rbx+0x8080]
    bca4:	test   rdx,rdx
    bca7:	je     bcdf <remove_mapping+0xcf>
    bca9:	mov    rcx,QWORD PTR [rbx+0x8040]
    bcb0:	cmp    rcx,r12
    bcb3:	je     bcdf <remove_mapping+0xcf>
    bcb5:	movabs rsi,0xcccccccccccccccd
    bcbf:	sub    rdx,r12
    bcc2:	sar    rdx,0x3
    bcc6:	imul   rdx,rsi
    bcca:	cmp    edx,eax
    bccc:	jae    bcfe <remove_mapping+0xee>
    bcce:	imul   edx,DWORD PTR [rbx+0x8050]
    bcd5:	add    rdx,rcx
    bcd8:	mov    QWORD PTR [rbx+0x8080],rdx
    bcdf:	pop    rbx
    bce0:	xor    eax,eax
    bce2:	pop    rbp
    bce3:	pop    r12
    bce5:	ret
    bce6:	nop    WORD PTR cs:[rax+rax*1+0x0]
    bcf0:	mov    rdi,QWORD PTR [rax+0x18]
    bcf4:	call   3070 <free@plt>
    bcf9:	jmp    bc43 <remove_mapping+0x33>
    bcfe:	lea    rcx,[rip+0x1576b]        # 21470 <__PRETTY_FUNCTION__.13830>
    bd05:	mov    edx,0x60
    bd0a:	lea    rsi,[rip+0x14dd5]        # 20ae6 <desc_template.13939+0x206>
    bd11:	lea    rdi,[rip+0x14e03]        # 20b1b <desc_template.13939+0x23b>
    bd18:	call   3230 <__assert_fail@plt>
    bd1d:	nop    DWORD PTR [rax]

000000000000bd20 <insert_mapping>:
    bd20:	push   r15
    bd22:	push   r14
    bd24:	push   r13
    bd26:	mov    r13d,esi
    bd29:	push   r12
    bd2b:	mov    r12,rdi
    bd2e:	push   rbp
    bd2f:	xor    ebp,ebp
    bd31:	push   rbx
    bd32:	mov    ebx,edx
    bd34:	sub    rsp,0x18
    bd38:	mov    r9d,DWORD PTR [rdi+0x804c]
    bd3f:	mov    ecx,r9d
    bd42:	jmp    bd62 <insert_mapping+0x42>
    bd44:	nop    DWORD PTR [rax+0x0]
    bd48:	cmp    ecx,edx
    bd4a:	jne    bd54 <insert_mapping+0x34>
    bd4c:	test   ecx,ecx
    bd4e:	jne    c003 <insert_mapping+0x2e3>
    bd54:	cmp    ecx,edx
    bd56:	je     bdbe <insert_mapping+0x9e>
    bd58:	mov    ecx,edx
    bd5a:	cmp    ebp,ecx
    bd5c:	jg     bfc5 <insert_mapping+0x2a5>
    bd62:	lea    eax,[rbp+rcx*1+0x0]
    bd66:	mov    edx,eax
    bd68:	shr    edx,0x1f
    bd6b:	add    edx,eax
    bd6d:	sar    edx,1
    bd6f:	mov    r10d,edx
    bd72:	cmp    r9d,edx
    bd75:	jbe    bfa6 <insert_mapping+0x286>
    bd7b:	mov    r14d,DWORD PTR [r12+0x8050]
    bd83:	mov    eax,edx
    bd85:	mov    rdi,QWORD PTR [r12+0x8040]
    bd8d:	imul   eax,r14d
    bd91:	mov    r15,rdi
    bd94:	add    rax,rdi
    bd97:	mov    esi,DWORD PTR [rax]
    bd99:	mov    r8d,DWORD PTR [rax+0x4]
    bd9d:	cmp    esi,r8d
    bda0:	jae    bfe4 <insert_mapping+0x2c4>
    bda6:	cmp    r13d,esi
    bda9:	jbe    bd48 <insert_mapping+0x28>
    bdab:	cmp    ebp,edx
    bdad:	je     bdb3 <insert_mapping+0x93>
    bdaf:	mov    ebp,edx
    bdb1:	jmp    bd5a <insert_mapping+0x3a>
    bdb3:	cmp    r13d,r8d
    bdb6:	jb     bf62 <insert_mapping+0x242>
    bdbc:	mov    ebp,ecx
    bdbe:	test   r9d,r9d
    bdc1:	je     bfa6 <insert_mapping+0x286>
    bdc7:	mov    ecx,ebp
    bdc9:	mov    rax,rdi
    bdcc:	cmp    r9d,ebp
    bdcf:	ja     bf2d <insert_mapping+0x20d>
    bdd5:	add    r9d,0x1
    bdd9:	mov    edx,DWORD PTR [r12+0x8048]
    bde1:	imul   r9d,r14d
    bde5:	cmp    r9d,edx
    bde8:	ja     bef6 <insert_mapping+0x1d6>
    bdee:	mov    edi,ecx
    bdf0:	mov    edx,DWORD PTR [r12+0x804c]
    bdf8:	mov    DWORD PTR [rsp+0xc],ecx
    bdfc:	imul   edi,r14d
    be00:	sub    edx,ecx
    be02:	imul   edx,r14d
    be06:	mov    esi,edi
    be08:	add    edi,r14d
    be0b:	add    rsi,rax
    be0e:	add    rdi,rax
    be11:	call   3530 <memmove@plt>
    be16:	mov    ecx,DWORD PTR [rsp+0xc]
    be1a:	imul   ecx,DWORD PTR [r12+0x8050]
    be23:	mov    rax,QWORD PTR [r12+0x8040]
    be2b:	add    DWORD PTR [r12+0x804c],0x1
    be34:	add    rax,rcx
    be37:	mov    QWORD PTR [rax+0x18],0x0
    be3f:	mov    edx,DWORD PTR [r12+0x804c]
    be47:	test   edx,edx
    be49:	je     be90 <insert_mapping+0x170>
    be4b:	xor    ecx,ecx
    be4d:	nop    DWORD PTR [rax]
    be50:	mov    edx,ecx
    be52:	imul   edx,DWORD PTR [r12+0x8050]
    be5b:	add    rdx,QWORD PTR [r12+0x8040]
    be63:	mov    esi,DWORD PTR [rdx+0xc]
    be66:	cmp    esi,ebp
    be68:	jl     be70 <insert_mapping+0x150>
    be6a:	add    esi,0x1
    be6d:	mov    DWORD PTR [rdx+0xc],esi
    be70:	test   BYTE PTR [rdx+0x20],0x4
    be74:	je     be83 <insert_mapping+0x163>
    be76:	mov    esi,DWORD PTR [rdx+0x10]
    be79:	cmp    esi,ebp
    be7b:	jl     be83 <insert_mapping+0x163>
    be7d:	add    esi,0x1
    be80:	mov    DWORD PTR [rdx+0x10],esi
    be83:	add    ecx,0x1
    be86:	cmp    DWORD PTR [r12+0x804c],ecx
    be8e:	ja     be50 <insert_mapping+0x130>
    be90:	mov    DWORD PTR [rax],r13d
    be93:	mov    DWORD PTR [rax+0x4],ebx
    be96:	mov    rdx,QWORD PTR [r12+0x8080]
    be9e:	test   rdx,rdx
    bea1:	je     bee7 <insert_mapping+0x1c7>
    bea3:	mov    rcx,QWORD PTR [r12+0x8040]
    beab:	cmp    rcx,r15
    beae:	je     bee7 <insert_mapping+0x1c7>
    beb0:	movabs rsi,0xcccccccccccccccd
    beba:	sub    rdx,r15
    bebd:	sar    rdx,0x3
    bec1:	imul   rdx,rsi
    bec5:	cmp    edx,DWORD PTR [r12+0x804c]
    becd:	jae    bfa6 <insert_mapping+0x286>
    bed3:	imul   edx,DWORD PTR [r12+0x8050]
    bedc:	add    rdx,rcx
    bedf:	mov    QWORD PTR [r12+0x8080],rdx
    bee7:	add    rsp,0x18
    beeb:	pop    rbx
    beec:	pop    rbp
    beed:	pop    r12
    beef:	pop    r13
    bef1:	pop    r14
    bef3:	pop    r15
    bef5:	ret
    bef6:	lea    esi,[rdx+r14*1]
    befa:	mov    DWORD PTR [rsp+0xc],ecx
    befe:	call   5990 <qemu_realloc>
    bf03:	mov    QWORD PTR [r12+0x8040],rax
    bf0b:	test   rax,rax
    bf0e:	je     3729 <insert_mapping.cold.9>
    bf14:	add    DWORD PTR [r12+0x8048],r14d
    bf1c:	mov    ecx,DWORD PTR [rsp+0xc]
    bf20:	mov    r14d,DWORD PTR [r12+0x8050]
    bf28:	jmp    bdee <insert_mapping+0xce>
    bf2d:	imul   r14d,ebp
    bf31:	mov    rax,r14
    bf34:	add    rax,rdi
    bf37:	jne    bfa1 <insert_mapping+0x281>
    bf39:	mov    edx,DWORD PTR ds:0x0
    bf40:	mov    r10d,ebp
    bf43:	mov    ecx,r10d
    bf46:	cmp    r13d,edx
    bf49:	jae    be90 <insert_mapping+0x170>
    bf4f:	mov    r14d,DWORD PTR [r12+0x8050]
    bf57:	mov    rax,rdi
    bf5a:	mov    ebp,r10d
    bf5d:	jmp    bdd5 <insert_mapping+0xb5>
    bf62:	test   r9d,r9d
    bf65:	je     bfa6 <insert_mapping+0x286>
    bf67:	mov    edx,DWORD PTR [rax]
    bf69:	cmp    edx,r13d
    bf6c:	jae    bf43 <insert_mapping+0x223>
    bf6e:	mov    DWORD PTR [rax+0x4],r13d
    bf72:	mov    r9d,DWORD PTR [r12+0x804c]
    bf7a:	add    r10d,0x1
    bf7e:	mov    ecx,r10d
    bf81:	cmp    r10d,r9d
    bf84:	jae    bfa6 <insert_mapping+0x286>
    bf86:	mov    eax,r10d
    bf89:	mov    rdi,QWORD PTR [r12+0x8040]
    bf91:	imul   eax,DWORD PTR [r12+0x8050]
    bf9a:	add    rax,rdi
    bf9d:	mov    edx,DWORD PTR [rax]
    bf9f:	jmp    bf46 <insert_mapping+0x226>
    bfa1:	mov    r10d,ebp
    bfa4:	jmp    bf67 <insert_mapping+0x247>
    bfa6:	lea    rcx,[rip+0x154c3]        # 21470 <__PRETTY_FUNCTION__.13830>
    bfad:	mov    edx,0x60
    bfb2:	lea    rsi,[rip+0x14b2d]        # 20ae6 <desc_template.13939+0x206>
    bfb9:	lea    rdi,[rip+0x14b5b]        # 20b1b <desc_template.13939+0x23b>
    bfc0:	call   3230 <__assert_fail@plt>
    bfc5:	lea    rcx,[rip+0x154b4]        # 21480 <__PRETTY_FUNCTION__.14249>
    bfcc:	mov    edx,0x465
    bfd1:	lea    rsi,[rip+0x14b0e]        # 20ae6 <desc_template.13939+0x206>
    bfd8:	lea    rdi,[rip+0x14b8a]        # 20b69 <desc_template.13939+0x289>
    bfdf:	call   3230 <__assert_fail@plt>
    bfe4:	lea    rcx,[rip+0x15495]        # 21480 <__PRETTY_FUNCTION__.14249>
    bfeb:	mov    edx,0x45a
    bff0:	lea    rsi,[rip+0x14aef]        # 20ae6 <desc_template.13939+0x206>
    bff7:	lea    rdi,[rip+0x14b31]        # 20b2f <desc_template.13939+0x24f>
    bffe:	call   3230 <__assert_fail@plt>
    c003:	lea    rcx,[rip+0x15476]        # 21480 <__PRETTY_FUNCTION__.14249>
    c00a:	mov    edx,0x45c
    c00f:	lea    rsi,[rip+0x14ad0]        # 20ae6 <desc_template.13939+0x206>
    c016:	lea    rdi,[rip+0x14b30]        # 20b4d <desc_template.13939+0x26d>
    c01d:	call   3230 <__assert_fail@plt>
    c022:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    c02d:	nop    DWORD PTR [rax]

000000000000c030 <insert_direntries>:
    c030:	push   r13
    c032:	mov    r13d,edx
    c035:	push   r12
    c037:	mov    r12d,esi
    c03a:	push   rbp
    c03b:	push   rbx
    c03c:	mov    rbx,rdi
    c03f:	sub    rsp,0x8
    c043:	mov    edx,DWORD PTR [rdi+0x8034]
    c049:	mov    ecx,DWORD PTR [rdi+0x8038]
    c04f:	mov    edi,DWORD PTR [rdi+0x8030]
    c055:	mov    rax,QWORD PTR [rbx+0x8028]
    c05c:	lea    esi,[r13+rdx*1+0x0]
    c061:	imul   esi,ecx
    c064:	cmp    esi,edi
    c066:	jbe    c097 <insert_direntries+0x67>
    c068:	imul   ecx,r13d
    c06c:	lea    esi,[rdi+rcx*1]
    c06f:	mov    rdi,rax
    c072:	mov    ebp,ecx
    c074:	call   5990 <qemu_realloc>
    c079:	mov    QWORD PTR [rbx+0x8028],rax
    c080:	test   rax,rax
    c083:	je     c0f0 <insert_direntries+0xc0>
    c085:	add    DWORD PTR [rbx+0x8030],ebp
    c08b:	mov    edx,DWORD PTR [rbx+0x8034]
    c091:	mov    ecx,DWORD PTR [rbx+0x8038]
    c097:	sub    edx,r12d
    c09a:	lea    edi,[r13+r12*1+0x0]
    c09f:	mov    esi,r12d
    c0a2:	imul   edx,ecx
    c0a5:	imul   esi,ecx
    c0a8:	imul   ecx,edi
    c0ab:	add    rsi,rax
    c0ae:	lea    rdi,[rax+rcx*1]
    c0b2:	call   3530 <memmove@plt>
    c0b7:	add    DWORD PTR [rbx+0x8034],r13d
    c0be:	mov    eax,r12d
    c0c1:	imul   eax,DWORD PTR [rbx+0x8038]
    c0c8:	add    rax,QWORD PTR [rbx+0x8028]
    c0cf:	mov    r9,rax
    c0d2:	je     c0e2 <insert_direntries+0xb2>
    c0d4:	mov    edx,r13d
    c0d7:	mov    esi,r12d
    c0da:	mov    rdi,rbx
    c0dd:	call   b970 <adjust_dirindices>
    c0e2:	add    rsp,0x8
    c0e6:	mov    rax,r9
    c0e9:	pop    rbx
    c0ea:	pop    rbp
    c0eb:	pop    r12
    c0ed:	pop    r13
    c0ef:	ret
    c0f0:	xor    r9d,r9d
    c0f3:	jmp    c0e2 <insert_direntries+0xb2>
    c0f5:	data16 nop WORD PTR cs:[rax+rax*1+0x0]

000000000000c100 <remove_direntries>:
    c100:	push   r15
    c102:	push   r14
    c104:	push   r13
    c106:	push   r12
    c108:	push   rbp
    c109:	push   rbx
    c10a:	sub    rsp,0x28
    c10e:	test   esi,esi
    c110:	js     c27d <remove_direntries+0x17d>
    c116:	mov    ebx,edx
    c118:	test   edx,edx
    c11a:	jle    c25e <remove_direntries+0x15e>
    c120:	mov    eax,DWORD PTR [rdi+0x8034]
    c126:	lea    edx,[rsi+rdx*1]
    c129:	mov    r15,rdi
    c12c:	mov    ebp,esi
    c12e:	cmp    edx,eax
    c130:	ja     c23f <remove_direntries+0x13f>
    c136:	mov    r9d,eax
    c139:	sub    r9d,0x1
    c13d:	js     c238 <remove_direntries+0x138>
    c143:	cmp    eax,esi
    c145:	jbe    c238 <remove_direntries+0x138>
    c14b:	cmp    esi,r9d
    c14e:	je     c1f6 <remove_direntries+0xf6>
    c154:	mov    r12d,DWORD PTR [rdi+0x8038]
    c15b:	mov    r8d,r9d
    c15e:	mov    r10d,esi
    c161:	mov    r13,QWORD PTR [rdi+0x8028]
    c168:	mov    DWORD PTR [rsp+0x14],r9d
    c16d:	imul   r10d,r12d
    c171:	imul   r8d,r12d
    c175:	imul   r12d,ebx
    c179:	movsxd r10,r10d
    c17c:	lea    rax,[r13+r10*1+0x0]
    c181:	movsxd r8,r8d
    c184:	mov    QWORD PTR [rsp+0x18],r10
    c189:	movsxd r12,r12d
    c18c:	add    r13,r8
    c18f:	mov    QWORD PTR [rsp+0x8],r8
    c194:	mov    rdi,r12
    c197:	mov    QWORD PTR [rsp],rax
    c19b:	call   5970 <qemu_malloc>
    c1a0:	mov    rsi,QWORD PTR [rsp]
    c1a4:	mov    rdx,r12
    c1a7:	mov    rdi,rax
    c1aa:	mov    r14,rax
    c1ad:	call   33b0 <memcpy@plt>
    c1b2:	mov    r9d,DWORD PTR [rsp+0x14]
    c1b7:	mov    r8,QWORD PTR [rsp+0x8]
    c1bc:	mov    r10,QWORD PTR [rsp+0x18]
    c1c1:	cmp    ebp,r9d
    c1c4:	jg     c220 <remove_direntries+0x120>
    c1c6:	mov    rdi,QWORD PTR [rsp]
    c1ca:	mov    rdx,r8
    c1cd:	sub    rdx,r10
    c1d0:	lea    rsi,[rdi+r12*1]
    c1d4:	call   3530 <memmove@plt>
    c1d9:	mov    rdx,r12
    c1dc:	mov    rsi,r14
    c1df:	mov    rdi,r13
    c1e2:	call   33b0 <memcpy@plt>
    c1e7:	mov    rdi,r14
    c1ea:	call   3070 <free@plt>
    c1ef:	mov    eax,DWORD PTR [r15+0x8034]
    c1f6:	sub    eax,ebx
    c1f8:	neg    ebx
    c1fa:	mov    esi,ebp
    c1fc:	mov    rdi,r15
    c1ff:	mov    DWORD PTR [r15+0x8034],eax
    c206:	mov    edx,ebx
    c208:	call   b970 <adjust_dirindices>
    c20d:	xor    eax,eax
    c20f:	add    rsp,0x28
    c213:	pop    rbx
    c214:	pop    rbp
    c215:	pop    r12
    c217:	pop    r13
    c219:	pop    r14
    c21b:	pop    r15
    c21d:	ret
    c21e:	xchg   ax,ax
    c220:	mov    rdx,r10
    c223:	lea    rdi,[r13+r12*1+0x0]
    c228:	mov    rsi,r13
    c22b:	sub    rdx,r8
    c22e:	call   3530 <memmove@plt>
    c233:	jmp    c1d9 <remove_direntries+0xd9>
    c235:	nop    DWORD PTR [rax]
    c238:	mov    eax,0xffffffff
    c23d:	jmp    c20f <remove_direntries+0x10f>
    c23f:	lea    rcx,[rip+0x1516a]        # 213b0 <__PRETTY_FUNCTION__.13862>
    c246:	mov    edx,0xb5
    c24b:	lea    rsi,[rip+0x14894]        # 20ae6 <desc_template.13939+0x206>
    c252:	lea    rdi,[rip+0x148a5]        # 20afe <desc_template.13939+0x21e>
    c259:	call   3230 <__assert_fail@plt>
    c25e:	lea    rcx,[rip+0x1514b]        # 213b0 <__PRETTY_FUNCTION__.13862>
    c265:	mov    edx,0xb4
    c26a:	lea    rsi,[rip+0x14875]        # 20ae6 <desc_template.13939+0x206>
    c271:	lea    rdi,[rip+0x14900]        # 20b78 <desc_template.13939+0x298>
    c278:	call   3230 <__assert_fail@plt>
    c27d:	lea    rcx,[rip+0x1512c]        # 213b0 <__PRETTY_FUNCTION__.13862>
    c284:	mov    edx,0xb3
    c289:	lea    rsi,[rip+0x14856]        # 20ae6 <desc_template.13939+0x206>
    c290:	lea    rdi,[rip+0x1485d]        # 20af4 <desc_template.13939+0x214>
    c297:	call   3230 <__assert_fail@plt>
    c29c:	nop    DWORD PTR [rax+0x0]

000000000000c930 <write_target_close>:
    c930:	push   rbx
    c931:	mov    rbx,QWORD PTR [rdi+0x40]
    c935:	mov    rdi,QWORD PTR [rbx+0x80b0]
    c93c:	call   18130 <bdrv_delete>
    c941:	mov    rdi,QWORD PTR [rbx+0x80a8]
    c948:	pop    rbx
    c949:	jmp    3070 <free@plt>
    c94e:	xchg   ax,ax

000000000000ca20 <array_index>:
    ca20:	sub    rsp,0x8
    ca24:	mov    ecx,DWORD PTR [rdi+0x10]
    ca27:	mov    rax,rsi
    ca2a:	xor    edx,edx
    ca2c:	sub    rax,QWORD PTR [rdi]
    ca2f:	div    rcx
    ca32:	test   rdx,rdx
    ca35:	jne    ca44 <array_index+0x24>
    ca37:	mov    edx,DWORD PTR [rdi+0xc]
    ca3a:	cmp    rax,rdx
    ca3d:	jae    ca63 <array_index+0x43>
    ca3f:	add    rsp,0x8
    ca43:	ret
    ca44:	lea    rcx,[rip+0x149b5]        # 21400 <__PRETTY_FUNCTION__.13872>
    ca4b:	mov    edx,0xc5
    ca50:	lea    rsi,[rip+0x1408f]        # 20ae6 <desc_template.13939+0x206>
    ca57:	lea    rdi,[rip+0x144ca]        # 20f28 <desc_template.13939+0x648>
    ca5e:	call   3230 <__assert_fail@plt>
    ca63:	lea    rcx,[rip+0x14996]        # 21400 <__PRETTY_FUNCTION__.13872>
    ca6a:	mov    edx,0xc6
    ca6f:	lea    rsi,[rip+0x14070]        # 20ae6 <desc_template.13939+0x206>
    ca76:	lea    rdi,[rip+0x144d3]        # 20f50 <desc_template.13939+0x670>
    ca7d:	call   3230 <__assert_fail@plt>
    ca82:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    ca8d:	nop    DWORD PTR [rax]

000000000000dd00 <parse_long_name>:
    dd00:	cmp    BYTE PTR [rsi+0xb],0xf
    dd04:	push   r12
    dd06:	mov    r12d,0x1
    dd0c:	push   rbp
    dd0d:	push   rbx
    dd0e:	jne    ddfa <parse_long_name+0xfa>
    dd14:	movzx  edx,BYTE PTR [rsi]
    dd17:	mov    eax,edx
    dd19:	and    eax,0x3f
    dd1c:	and    edx,0x40
    dd1f:	jne    de08 <parse_long_name+0x108>
    dd25:	mov    ebx,DWORD PTR [rdi+0x33c]
    dd2b:	lea    edx,[rbx-0x1]
    dd2e:	mov    DWORD PTR [rdi+0x33c],edx
    dd34:	cmp    edx,eax
    dd36:	jne    de76 <parse_long_name+0x176>
    dd3c:	movzx  edx,BYTE PTR [rsi+0xd]
    dd40:	cmp    edx,DWORD PTR [rdi+0x334]
    dd46:	jne    de81 <parse_long_name+0x181>
    dd4c:	cmp    BYTE PTR [rsi+0xc],0x0
    dd50:	jne    de6e <parse_long_name+0x16e>
    dd56:	cmp    BYTE PTR [rsi+0x1a],0x0
    dd5a:	jne    de6e <parse_long_name+0x16e>
    dd60:	cmp    BYTE PTR [rsi+0x1b],0x0
    dd64:	jne    de6e <parse_long_name+0x16e>
    dd6a:	sub    eax,0x1
    dd6d:	lea    edx,[rax+rax*2]
    dd70:	lea    ebp,[rax+rdx*4]
    dd73:	mov    eax,0x1
    dd78:	lea    r9d,[rbp+0xd]
    dd7c:	mov    edx,ebp
    dd7e:	jmp    dd97 <parse_long_name+0x97>
    dd80:	movzx  r8d,BYTE PTR [rsi+r8*1]
    dd85:	movsxd rcx,edx
    dd88:	add    edx,0x1
    dd8b:	add    eax,0x2
    dd8e:	mov    BYTE PTR [rdi+rcx*1],r8b
    dd92:	cmp    r9d,edx
    dd95:	je     dddc <parse_long_name+0xdc>
    dd97:	cmp    eax,0xb
    dd9a:	je     de30 <parse_long_name+0x130>
    dda0:	cmp    eax,0x1a
    dda3:	je     de48 <parse_long_name+0x148>
    dda9:	movsxd r8,eax
    ddac:	lea    rcx,[r8+0x1]
    ddb0:	movzx  ecx,BYTE PTR [rsi+rcx*1]
    ddb4:	test   cl,cl
    ddb6:	je     dd80 <parse_long_name+0x80>
    ddb8:	cmp    cl,0xff
    ddbb:	jne    de60 <parse_long_name+0x160>
    ddc1:	test   BYTE PTR [rsi],0x40
    ddc4:	je     de60 <parse_long_name+0x160>
    ddca:	movsxd rcx,edx
    ddcd:	add    edx,0x1
    ddd0:	add    eax,0x2
    ddd3:	mov    BYTE PTR [rdi+rcx*1],0x0
    ddd7:	cmp    r9d,edx
    ddda:	jne    dd97 <parse_long_name+0x97>
    dddc:	xor    r12d,r12d
    dddf:	test   BYTE PTR [rsi],0x40
    dde2:	je     ddfa <parse_long_name+0xfa>
    dde4:	mov    rbx,rdi
    dde7:	movsxd rdi,ebp
    ddea:	add    rdi,rbx
    dded:	call   31b0 <strlen@plt>
    ddf2:	add    ebp,eax
    ddf4:	mov    DWORD PTR [rbx+0x338],ebp
    ddfa:	mov    eax,r12d
    ddfd:	pop    rbx
    ddfe:	pop    rbp
    ddff:	pop    r12
    de01:	ret
    de02:	nop    WORD PTR [rax+rax*1+0x0]
    de08:	mov    DWORD PTR [rdi+0x33c],eax
    de0e:	movzx  edx,BYTE PTR [rsi+0xd]
    de12:	mov    BYTE PTR [rdi],0x0
    de15:	mov    DWORD PTR [rdi+0x334],edx
    de1b:	lea    edx,[rax+rax*2]
    de1e:	lea    edx,[rax+rdx*4]
    de21:	movsxd rdx,edx
    de24:	mov    BYTE PTR [rdi+rdx*1],0x0
    de28:	jmp    dd6a <parse_long_name+0x6a>
    de2d:	nop    DWORD PTR [rax]
    de30:	mov    ecx,0xf
    de35:	mov    r8d,0xe
    de3b:	mov    eax,0xe
    de40:	jmp    ddb0 <parse_long_name+0xb0>
    de45:	nop    DWORD PTR [rax]
    de48:	mov    ecx,0x1d
    de4d:	mov    r8d,0x1c
    de53:	mov    eax,0x1c
    de58:	jmp    ddb0 <parse_long_name+0xb0>
    de5d:	nop    DWORD PTR [rax]
    de60:	mov    r12d,0xfffffffc
    de66:	pop    rbx
    de67:	pop    rbp
    de68:	mov    eax,r12d
    de6b:	pop    r12
    de6d:	ret
    de6e:	mov    r12d,0xfffffffd
    de74:	jmp    ddfa <parse_long_name+0xfa>
    de76:	mov    r12d,0xffffffff
    de7c:	jmp    ddfa <parse_long_name+0xfa>
    de81:	mov    r12d,0xfffffffe
    de87:	jmp    ddfa <parse_long_name+0xfa>
    de8c:	nop    DWORD PTR [rax+0x0]

0000000000010880 <write_target_commit>:
   10880:	mov    rdi,QWORD PTR [rdi+0x40]
   10884:	jmp    f0a0 <try_commit>
   10889:	nop    DWORD PTR [rax+0x0]

0000000000010890 <fat_datetime.constprop.8>:
   10890:	sub    rsp,0x58
   10894:	mov    QWORD PTR [rsp+0x8],rdi
   10899:	lea    rsi,[rsp+0x10]
   1089e:	lea    rdi,[rsp+0x8]
   108a3:	mov    rax,QWORD PTR fs:0x28
   108ac:	mov    QWORD PTR [rsp+0x48],rax
   108b1:	xor    eax,eax
   108b3:	call   3100 <localtime_r@plt>
   108b8:	mov    ecx,DWORD PTR [rsp+0x24]
   108bc:	mov    eax,DWORD PTR [rsp+0x20]
   108c0:	lea    edx,[rcx-0x50]
   108c3:	add    eax,0x1
   108c6:	shl    eax,0x5
   108c9:	shl    edx,0x9
   108cc:	or     eax,edx
   108ce:	or     ax,WORD PTR [rsp+0x1c]
   108d3:	mov    rcx,QWORD PTR [rsp+0x48]
   108d8:	xor    rcx,QWORD PTR fs:0x28
   108e1:	jne    108e8 <fat_datetime.constprop.8+0x58>
   108e3:	add    rsp,0x58
   108e7:	ret
   108e8:	call   31c0 <__stack_chk_fail@plt>
   108ed:	nop    DWORD PTR [rax]

0000000000012810 <qcow_make_empty>:
   12810:	xor    eax,eax
   12812:	ret
   12813:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   1281e:	xchg   ax,ax

0000000000012820 <qcow_get_info>:
   12820:	mov    rax,QWORD PTR [rdi+0x40]
   12824:	mov    edx,DWORD PTR [rax+0xc]
   12827:	mov    DWORD PTR [rsi],edx
   12829:	movsxd rdx,DWORD PTR [rax+0x20]
   1282d:	mov    ecx,DWORD PTR [rax+0x14]
   12830:	add    ecx,DWORD PTR [rax+0x8]
   12833:	xor    eax,eax
   12835:	shl    rdx,cl
   12838:	mov    QWORD PTR [rsi+0x8],rdx
   1283c:	ret
   1283d:	nop    DWORD PTR [rax]

0000000000012840 <qcow_get_buffer>:
   12840:	push   rbp
   12841:	mov    rax,rsi
   12844:	mov    rsi,rdx
   12847:	push   rbx
   12848:	mov    rdx,rax
   1284b:	mov    rbx,rdi
   1284e:	sub    rsp,0x8
   12852:	mov    ebp,DWORD PTR [rdi+0x880]
   12858:	mov    DWORD PTR [rdi+0x880],0x1
   12862:	call   18b00 <bdrv_pread>
   12867:	mov    DWORD PTR [rbx+0x880],ebp
   1286d:	add    rsp,0x8
   12871:	pop    rbx
   12872:	pop    rbp
   12873:	ret
   12874:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   1287f:	nop

0000000000012880 <qcow_put_buffer>:
   12880:	push   r12
   12882:	mov    r12d,DWORD PTR [rdi+0x880]
   12889:	mov    rax,rsi
   1288c:	mov    rsi,rdx
   1288f:	push   rbp
   12890:	mov    rdx,rax
   12893:	mov    ebp,ecx
   12895:	push   rbx
   12896:	mov    rbx,rdi
   12899:	mov    DWORD PTR [rdi+0x880],0x1
   128a3:	call   19110 <bdrv_pwrite>
   128a8:	mov    DWORD PTR [rbx+0x880],r12d
   128af:	mov    eax,ebp
   128b1:	pop    rbx
   128b2:	pop    rbp
   128b3:	pop    r12
   128b5:	ret
   128b6:	nop    WORD PTR cs:[rax+rax*1+0x0]

00000000000128c0 <qcow_snapshot_list>:
   128c0:	push   r15
   128c2:	push   r14
   128c4:	push   r13
   128c6:	push   r12
   128c8:	push   rbp
   128c9:	push   rbx
   128ca:	sub    rsp,0x18
   128ce:	mov    r15,QWORD PTR [rdi+0x40]
   128d2:	mov    QWORD PTR [rsp+0x8],rsi
   128d7:	movsxd rdi,DWORD PTR [r15+0x35c]
   128de:	imul   rdi,rdi,0x198
   128e5:	call   59c0 <qemu_mallocz>
   128ea:	mov    r14,rax
   128ed:	mov    eax,DWORD PTR [r15+0x35c]
   128f4:	test   eax,eax
   128f6:	jle    1296a <qcow_snapshot_list+0xaa>
   128f8:	mov    rbx,r14
   128fb:	xor    r13d,r13d
   128fe:	xor    r12d,r12d
   12901:	nop    DWORD PTR [rax+0x0]
   12908:	mov    rbp,QWORD PTR [r15+0x360]
   1290f:	mov    rdi,rbx
   12912:	mov    esi,0x80
   12917:	add    r12d,0x1
   1291b:	add    rbp,r13
   1291e:	add    r13,0x38
   12922:	mov    rdx,QWORD PTR [rbp+0x10]
   12926:	call   5560 <pstrcpy>
   1292b:	mov    rdx,QWORD PTR [rbp+0x18]
   1292f:	mov    esi,0x100
   12934:	lea    rdi,[rbx+0x80]
   1293b:	add    rbx,0x198
   12942:	call   5560 <pstrcpy>
   12947:	mov    eax,DWORD PTR [rbp+0x20]
   1294a:	mov    DWORD PTR [rbx-0x18],eax
   1294d:	mov    eax,DWORD PTR [rbp+0x24]
   12950:	mov    DWORD PTR [rbx-0x14],eax
   12953:	mov    eax,DWORD PTR [rbp+0x28]
   12956:	mov    DWORD PTR [rbx-0x10],eax
   12959:	mov    rax,QWORD PTR [rbp+0x30]
   1295d:	mov    QWORD PTR [rbx-0x8],rax
   12961:	cmp    DWORD PTR [r15+0x35c],r12d
   12968:	jg     12908 <qcow_snapshot_list+0x48>
   1296a:	mov    rax,QWORD PTR [rsp+0x8]
   1296f:	mov    QWORD PTR [rax],r14
   12972:	mov    eax,DWORD PTR [r15+0x35c]
   12979:	add    rsp,0x18
   1297d:	pop    rbx
   1297e:	pop    rbp
   1297f:	pop    r12
   12981:	pop    r13
   12983:	pop    r14
   12985:	pop    r15
   12987:	ret
   12988:	nop    DWORD PTR [rax+rax*1+0x0]

0000000000012990 <qcow_aio_flush>:
   12990:	mov    rax,QWORD PTR [rdi+0x40]
   12994:	mov    rdi,QWORD PTR [rax]
   12997:	jmp    1a530 <bdrv_aio_flush>
   1299c:	nop    DWORD PTR [rax+0x0]

00000000000129a0 <qcow_aio_cancel>:
   129a0:	push   rbx
   129a1:	mov    rbx,rdi
   129a4:	mov    rdi,QWORD PTR [rdi+0x50]
   129a8:	test   rdi,rdi
   129ab:	je     129b2 <qcow_aio_cancel+0x12>
   129ad:	call   1a520 <bdrv_aio_cancel>
   129b2:	mov    rdi,rbx
   129b5:	pop    rbx
   129b6:	jmp    1a860 <qemu_aio_release>
   129bb:	nop    DWORD PTR [rax+rax*1+0x0]

00000000000129c0 <qcow_flush>:
   129c0:	mov    rax,QWORD PTR [rdi+0x40]
   129c4:	mov    rdi,QWORD PTR [rax]
   129c7:	jmp    19700 <bdrv_flush>
   129cc:	nop    DWORD PTR [rax+0x0]

0000000000012ae0 <alloc_clusters_noref>:
   12ae0:	push   r14
   12ae2:	mov    r14,rdi
   12ae5:	push   r13
   12ae7:	push   r12
   12ae9:	push   rbp
   12aea:	push   rbx
   12aeb:	mov    rbp,QWORD PTR [rdi+0x40]
   12aef:	mov    eax,DWORD PTR [rbp+0xc]
   12af2:	mov    ecx,DWORD PTR [rbp+0x8]
   12af5:	lea    r13d,[rax-0x1]
   12af9:	movsxd r13,r13d
   12afc:	add    r13,rsi
   12aff:	sar    r13,cl
   12b02:	mov    r12d,r13d
   12b05:	test   r12d,r12d
   12b08:	jle    12b37 <alloc_clusters_noref+0x57>
   12b0a:	xor    ebx,ebx
   12b0c:	nop    DWORD PTR [rax+0x0]
   12b10:	mov    rsi,QWORD PTR [rbp+0x150]
   12b17:	lea    rax,[rsi+0x1]
   12b1b:	mov    QWORD PTR [rbp+0x150],rax
   12b22:	mov    rdi,QWORD PTR [r14+0x40]
   12b26:	call   12a40 <get_refcount.isra.4>
   12b2b:	test   eax,eax
   12b2d:	jne    12b05 <alloc_clusters_noref+0x25>
   12b2f:	add    ebx,0x1
   12b32:	cmp    ebx,r12d
   12b35:	jne    12b10 <alloc_clusters_noref+0x30>
   12b37:	mov    rax,QWORD PTR [rbp+0x150]
   12b3e:	movsxd r13,r13d
   12b41:	mov    ecx,DWORD PTR [rbp+0x8]
   12b44:	pop    rbx
   12b45:	pop    rbp
   12b46:	sub    rax,r13
   12b49:	pop    r12
   12b4b:	pop    r13
   12b4d:	shl    rax,cl
   12b50:	pop    r14
   12b52:	ret
   12b53:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   12b5e:	xchg   ax,ax

0000000000012b60 <l2_load.isra.5>:
   12b60:	push   r13
   12b62:	xor    eax,eax
   12b64:	push   r12
   12b66:	push   rbp
   12b67:	push   rbx
   12b68:	sub    rsp,0x8
   12b6c:	mov    rbx,QWORD PTR [rdi]
   12b6f:	nop
   12b70:	mov    edx,eax
   12b72:	cmp    rsi,QWORD PTR [rbx+rax*8+0x50]
   12b77:	je     12c10 <l2_load.isra.5+0xb0>
   12b7d:	add    rax,0x1
   12b81:	cmp    rax,0x10
   12b85:	jne    12b70 <l2_load.isra.5+0x10>
   12b87:	mov    ecx,DWORD PTR [rbx+0x14]
   12b8a:	mov    r9,QWORD PTR [rbx+0x48]
   12b8e:	mov    r8,rbx
   12b91:	xor    eax,eax
   12b93:	xor    ebp,ebp
   12b95:	mov    edi,0xffffffff
   12b9a:	nop    WORD PTR [rax+rax*1+0x0]
   12ba0:	mov    edx,DWORD PTR [r8+rax*4+0xd0]
   12ba8:	cmp    edx,edi
   12baa:	jae    12bb1 <l2_load.isra.5+0x51>
   12bac:	movsxd rbp,eax
   12baf:	mov    edi,edx
   12bb1:	add    rax,0x1
   12bb5:	cmp    rax,0x10
   12bb9:	jne    12ba0 <l2_load.isra.5+0x40>
   12bbb:	mov    eax,ebp
   12bbd:	mov    rdi,QWORD PTR [rbx]
   12bc0:	mov    r13,rsi
   12bc3:	shl    eax,cl
   12bc5:	cdqe
   12bc7:	lea    r12,[r9+rax*8]
   12bcb:	mov    eax,DWORD PTR [rbx+0x18]
   12bce:	mov    rdx,r12
   12bd1:	lea    ecx,[rax*8+0x0]
   12bd8:	call   18b00 <bdrv_pread>
   12bdd:	movsxd rdx,DWORD PTR [rbx+0x18]
   12be1:	cdqe
   12be3:	shl    rdx,0x3
   12be7:	cmp    rax,rdx
   12bea:	jne    12c70 <l2_load.isra.5+0x110>
   12bf0:	mov    QWORD PTR [rbx+rbp*8+0x50],r13
   12bf5:	mov    DWORD PTR [rbx+rbp*4+0xd0],0x1
   12c00:	add    rsp,0x8
   12c04:	mov    rax,r12
   12c07:	pop    rbx
   12c08:	pop    rbp
   12c09:	pop    r12
   12c0b:	pop    r13
   12c0d:	ret
   12c0e:	xchg   ax,ax
   12c10:	cdqe
   12c12:	lea    rcx,[rbx+rax*4]
   12c16:	mov    eax,DWORD PTR [rcx+0xd0]
   12c1c:	add    eax,0x1
   12c1f:	mov    DWORD PTR [rcx+0xd0],eax
   12c25:	cmp    eax,0xffffffff
   12c28:	je     12c50 <l2_load.isra.5+0xf0>
   12c2a:	mov    ecx,DWORD PTR [rbx+0x14]
   12c2d:	mov    r9,QWORD PTR [rbx+0x48]
   12c31:	shl    edx,cl
   12c33:	movsxd rdx,edx
   12c36:	lea    r12,[r9+rdx*8]
   12c3a:	test   r12,r12
   12c3d:	jne    12c00 <l2_load.isra.5+0xa0>
   12c3f:	mov    r8,QWORD PTR [rdi]
   12c42:	jmp    12b91 <l2_load.isra.5+0x31>
   12c47:	nop    WORD PTR [rax+rax*1+0x0]
   12c50:	lea    rax,[rbx+0xd0]
   12c57:	lea    rcx,[rbx+0x110]
   12c5e:	xchg   ax,ax
   12c60:	shr    DWORD PTR [rax],1
   12c62:	add    rax,0x4
   12c66:	cmp    rax,rcx
   12c69:	jne    12c60 <l2_load.isra.5+0x100>
   12c6b:	jmp    12c2a <l2_load.isra.5+0xca>
   12c6d:	nop    DWORD PTR [rax]
   12c70:	add    rsp,0x8
   12c74:	xor    r12d,r12d
   12c77:	pop    rbx
   12c78:	mov    rax,r12
   12c7b:	pop    rbp
   12c7c:	pop    r12
   12c7e:	pop    r13
   12c80:	ret
   12c81:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   12c8c:	nop    DWORD PTR [rax+0x0]

0000000000012c90 <qcow_free_snapshots.isra.7>:
   12c90:	push   r12
   12c92:	mov    r12,rdi
   12c95:	push   rbp
   12c96:	push   rbx
   12c97:	mov    eax,DWORD PTR [rdi+0x35c]
   12c9d:	test   eax,eax
   12c9f:	jle    12ce9 <qcow_free_snapshots.isra.7+0x59>
   12ca1:	xor    ebp,ebp
   12ca3:	nop    DWORD PTR [rax+rax*1+0x0]
   12ca8:	lea    rbx,[rbp*8+0x0]
   12cb0:	mov    rax,QWORD PTR [r12+0x360]
   12cb8:	sub    rbx,rbp
   12cbb:	add    rbp,0x1
   12cbf:	shl    rbx,0x3
   12cc3:	mov    rdi,QWORD PTR [rax+rbx*1+0x18]
   12cc8:	call   5960 <qemu_free>
   12ccd:	mov    rax,QWORD PTR [r12+0x360]
   12cd5:	mov    rdi,QWORD PTR [rax+rbx*1+0x10]
   12cda:	call   5960 <qemu_free>
   12cdf:	cmp    DWORD PTR [r12+0x35c],ebp
   12ce7:	jg     12ca8 <qcow_free_snapshots.isra.7+0x18>
   12ce9:	mov    rdi,QWORD PTR [r12+0x360]
   12cf1:	call   5960 <qemu_free>
   12cf6:	pop    rbx
   12cf7:	pop    rbp
   12cf8:	mov    QWORD PTR [r12+0x360],0x0
   12d04:	mov    DWORD PTR [r12+0x35c],0x0
   12d10:	pop    r12
   12d12:	ret
   12d13:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   12d1e:	xchg   ax,ax

0000000000012d20 <find_snapshot_by_id.isra.8>:
   12d20:	push   r13
   12d22:	push   r12
   12d24:	push   rbp
   12d25:	push   rbx
   12d26:	mov    ebx,0xffffffff
   12d2b:	sub    rsp,0x8
   12d2f:	mov    r13d,DWORD PTR [rdi+0x35c]
   12d36:	test   r13d,r13d
   12d39:	jle    12d6c <find_snapshot_by_id.isra.8+0x4c>
   12d3b:	mov    rbp,QWORD PTR [rdi+0x360]
   12d42:	mov    r12,rsi
   12d45:	xor    ebx,ebx
   12d47:	add    rbp,0x10
   12d4b:	jmp    12d5c <find_snapshot_by_id.isra.8+0x3c>
   12d4d:	nop    DWORD PTR [rax]
   12d50:	add    ebx,0x1
   12d53:	add    rbp,0x38
   12d57:	cmp    ebx,r13d
   12d5a:	je     12d80 <find_snapshot_by_id.isra.8+0x60>
   12d5c:	mov    rdi,QWORD PTR [rbp+0x0]
   12d60:	mov    rsi,r12
   12d63:	call   3350 <strcmp@plt>
   12d68:	test   eax,eax
   12d6a:	jne    12d50 <find_snapshot_by_id.isra.8+0x30>
   12d6c:	add    rsp,0x8
   12d70:	mov    eax,ebx
   12d72:	pop    rbx
   12d73:	pop    rbp
   12d74:	pop    r12
   12d76:	pop    r13
   12d78:	ret
   12d79:	nop    DWORD PTR [rax+0x0]
   12d80:	add    rsp,0x8
   12d84:	mov    ebx,0xffffffff
   12d89:	mov    eax,ebx
   12d8b:	pop    rbx
   12d8c:	pop    rbp
   12d8d:	pop    r12
   12d8f:	pop    r13
   12d91:	ret
   12d92:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   12d9d:	nop    DWORD PTR [rax]

0000000000012da0 <find_snapshot_by_id_or_name.isra.9>:
   12da0:	push   r13
   12da2:	push   r12
   12da4:	mov    r12,rsi
   12da7:	push   rbp
   12da8:	mov    rbp,rdi
   12dab:	push   rbx
   12dac:	sub    rsp,0x8
   12db0:	call   12d20 <find_snapshot_by_id.isra.8>
   12db5:	mov    ebx,eax
   12db7:	test   eax,eax
   12db9:	jns    12dfc <find_snapshot_by_id_or_name.isra.9+0x5c>
   12dbb:	mov    r13d,DWORD PTR [rbp+0x35c]
   12dc2:	mov    ebx,0xffffffff
   12dc7:	test   r13d,r13d
   12dca:	jle    12dfc <find_snapshot_by_id_or_name.isra.9+0x5c>
   12dcc:	mov    rbp,QWORD PTR [rbp+0x360]
   12dd3:	xor    ebx,ebx
   12dd5:	add    rbp,0x18
   12dd9:	jmp    12dec <find_snapshot_by_id_or_name.isra.9+0x4c>
   12ddb:	nop    DWORD PTR [rax+rax*1+0x0]
   12de0:	add    ebx,0x1
   12de3:	add    rbp,0x38
   12de7:	cmp    ebx,r13d
   12dea:	je     12e10 <find_snapshot_by_id_or_name.isra.9+0x70>
   12dec:	mov    rdi,QWORD PTR [rbp+0x0]
   12df0:	mov    rsi,r12
   12df3:	call   3350 <strcmp@plt>
   12df8:	test   eax,eax
   12dfa:	jne    12de0 <find_snapshot_by_id_or_name.isra.9+0x40>
   12dfc:	add    rsp,0x8
   12e00:	mov    eax,ebx
   12e02:	pop    rbx
   12e03:	pop    rbp
   12e04:	pop    r12
   12e06:	pop    r13
   12e08:	ret
   12e09:	nop    DWORD PTR [rax+0x0]
   12e10:	add    rsp,0x8
   12e14:	mov    ebx,0xffffffff
   12e19:	mov    eax,ebx
   12e1b:	pop    rbx
   12e1c:	pop    rbp
   12e1d:	pop    r12
   12e1f:	pop    r13
   12e21:	ret
   12e22:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   12e2d:	nop    DWORD PTR [rax]

0000000000012e30 <decompress_cluster>:
   12e30:	push   r15
   12e32:	push   r14
   12e34:	push   r13
   12e36:	push   r12
   12e38:	xor    r12d,r12d
   12e3b:	push   rbp
   12e3c:	push   rbx
   12e3d:	sub    rsp,0x98
   12e44:	mov    rbp,QWORD PTR [rdi+0x30]
   12e48:	mov    rax,QWORD PTR fs:0x28
   12e51:	mov    QWORD PTR [rsp+0x88],rax
   12e59:	xor    eax,eax
   12e5b:	and    rbp,rsi
   12e5e:	cmp    QWORD PTR [rdi+0x120],rbp
   12e65:	jne    12e98 <decompress_cluster+0x68>
   12e67:	mov    rdi,QWORD PTR [rsp+0x88]
   12e6f:	xor    rdi,QWORD PTR fs:0x28
   12e78:	mov    eax,r12d
   12e7b:	jne    12fab <decompress_cluster+0x17b>
   12e81:	add    rsp,0x98
   12e88:	pop    rbx
   12e89:	pop    rbp
   12e8a:	pop    r12
   12e8c:	pop    r13
   12e8e:	pop    r14
   12e90:	pop    r15
   12e92:	ret
   12e93:	nop    DWORD PTR [rax+rax*1+0x0]
   12e98:	mov    ecx,DWORD PTR [rdi+0x24]
   12e9b:	mov    r12d,ebp
   12e9e:	mov    rbx,rdi
   12ea1:	mov    rdx,QWORD PTR [rdi+0x118]
   12ea8:	and    r12d,0x1ff
   12eaf:	shr    rsi,cl
   12eb2:	and    esi,DWORD PTR [rdi+0x28]
   12eb5:	mov    rdi,QWORD PTR [rdi]
   12eb8:	lea    ecx,[rsi+0x1]
   12ebb:	mov    rsi,rbp
   12ebe:	mov    r13d,ecx
   12ec1:	shr    rsi,0x9
   12ec5:	shl    r13d,0x9
   12ec9:	sub    r13d,r12d
   12ecc:	mov    DWORD PTR [rsp+0xc],r13d
   12ed1:	call   18210 <bdrv_read>
   12ed6:	test   eax,eax
   12ed8:	js     12fa0 <decompress_cluster+0x170>
   12ede:	lea    r13,[rsp+0x10]
   12ee3:	xor    eax,eax
   12ee5:	mov    ecx,0xc
   12eea:	mov    r14d,DWORD PTR [rbx+0xc]
   12eee:	lea    rdi,[r13+0x10]
   12ef2:	movsxd r12,r12d
   12ef5:	mov    r15,QWORD PTR [rbx+0x110]
   12efc:	add    r12,QWORD PTR [rbx+0x118]
   12f03:	mov    QWORD PTR [rsp+0x1c],0x0
   12f0c:	lea    rdx,[rip+0xb02c]        # 1df3f <__PRETTY_FUNCTION__.13430+0x8f>
   12f13:	mov    esi,0xfffffff4
   12f18:	mov    QWORD PTR [r13+0x68],0x0
   12f20:	rep stos QWORD PTR es:[rdi],rax
   12f23:	mov    ecx,0x70
   12f28:	mov    rdi,r13
   12f2b:	mov    QWORD PTR [rsp+0x10],r12
   12f30:	mov    QWORD PTR [rsp+0x28],r15
   12f35:	mov    eax,DWORD PTR [rsp+0xc]
   12f39:	mov    DWORD PTR [rsp+0x30],r14d
   12f3e:	mov    DWORD PTR [rsp+0x18],eax
   12f42:	call   35a0 <inflateInit2_@plt>
   12f47:	mov    r12d,eax
   12f4a:	test   eax,eax
   12f4c:	jne    12fa0 <decompress_cluster+0x170>
   12f4e:	mov    rdi,r13
   12f51:	mov    esi,0x4
   12f56:	call   3110 <inflate@plt>
   12f5b:	mov    rdx,QWORD PTR [rsp+0x28]
   12f60:	mov    rdi,r13
   12f63:	sub    rdx,r15
   12f66:	cmp    r14d,edx
   12f69:	jne    12f90 <decompress_cluster+0x160>
   12f6b:	cmp    eax,0x1
   12f6e:	setne  dl
   12f71:	cmp    eax,0xfffffffb
   12f74:	setne  al
   12f77:	test   dl,al
   12f79:	jne    12f90 <decompress_cluster+0x160>
   12f7b:	call   33c0 <inflateEnd@plt>
   12f80:	mov    QWORD PTR [rbx+0x120],rbp
   12f87:	jmp    12e67 <decompress_cluster+0x37>
   12f8c:	nop    DWORD PTR [rax+0x0]
   12f90:	call   33c0 <inflateEnd@plt>
   12f95:	mov    r12d,0xffffffff
   12f9b:	jmp    12e67 <decompress_cluster+0x37>
   12fa0:	mov    r12d,0xffffffff
   12fa6:	jmp    12e67 <decompress_cluster+0x37>
   12fab:	call   31c0 <__stack_chk_fail@plt>

0000000000012fb0 <qcow_set_key>:
   12fb0:	push   r12
   12fb2:	pxor   xmm0,xmm0
   12fb6:	push   rbp
   12fb7:	mov    rbp,rsi
   12fba:	push   rbx
   12fbb:	sub    rsp,0x20
   12fbf:	mov    r12,QWORD PTR [rdi+0x40]
   12fc3:	mov    rdi,rsi
   12fc6:	mov    rax,QWORD PTR fs:0x28
   12fcf:	mov    QWORD PTR [rsp+0x18],rax
   12fd4:	xor    eax,eax
   12fd6:	movaps XMMWORD PTR [rsp],xmm0
   12fda:	mov    rbx,rsp
   12fdd:	call   31b0 <strlen@plt>
   12fe2:	mov    edi,0x10
   12fe7:	cmp    eax,0x10
   12fea:	cmovle edi,eax
   12fed:	test   eax,eax
   12fef:	jle    13010 <qcow_set_key+0x60>
   12ff1:	xor    eax,eax
   12ff3:	mov    rbx,rsp
   12ff6:	nop    WORD PTR cs:[rax+rax*1+0x0]
   13000:	movzx  ecx,BYTE PTR [rbp+rax*1+0x0]
   13005:	mov    BYTE PTR [rbx+rax*1],cl
   13008:	add    rax,0x1
   1300c:	cmp    edi,eax
   1300e:	jg     13000 <qcow_set_key+0x50>
   13010:	mov    eax,DWORD PTR [r12+0x164]
   13018:	lea    rdx,[r12+0x168]
   13020:	mov    esi,0x80
   13025:	mov    rdi,rbx
   13028:	mov    DWORD PTR [r12+0x160],eax
   13030:	call   7880 <AES_set_encrypt_key>
   13035:	test   eax,eax
   13037:	jne    13071 <qcow_set_key+0xc1>
   13039:	lea    rdx,[r12+0x25c]
   13041:	mov    esi,0x80
   13046:	mov    rdi,rbx
   13049:	call   7cb0 <AES_set_decrypt_key>
   1304e:	test   eax,eax
   13050:	setne  al
   13053:	movzx  eax,al
   13056:	neg    eax
   13058:	mov    rsi,QWORD PTR [rsp+0x18]
   1305d:	xor    rsi,QWORD PTR fs:0x28
   13066:	jne    13078 <qcow_set_key+0xc8>
   13068:	add    rsp,0x20
   1306c:	pop    rbx
   1306d:	pop    rbp
   1306e:	pop    r12
   13070:	ret
   13071:	mov    eax,0xffffffff
   13076:	jmp    13058 <qcow_set_key+0xa8>
   13078:	call   31c0 <__stack_chk_fail@plt>
   1307d:	nop    DWORD PTR [rax]

0000000000013080 <encrypt_sectors.isra.12>:
   13080:	push   r15
   13082:	push   r14
   13084:	push   r13
   13086:	push   r12
   13088:	push   rbp
   13089:	push   rbx
   1308a:	sub    rsp,0x38
   1308e:	mov    rax,QWORD PTR fs:0x28
   13097:	mov    QWORD PTR [rsp+0x28],rax
   1309c:	xor    eax,eax
   1309e:	test   ecx,ecx
   130a0:	jle    1310b <encrypt_sectors.isra.12+0x8b>
   130a2:	lea    r12d,[rcx-0x1]
   130a6:	lea    rbx,[rdi+0x1]
   130aa:	mov    rbp,rsi
   130ad:	mov    r15,rdx
   130b0:	lea    rax,[rsp+0x10]
   130b5:	mov    r13d,r8d
   130b8:	mov    r14,r9
   130bb:	add    r12,rbx
   130be:	mov    QWORD PTR [rsp+0x8],rax
   130c3:	jmp    130cc <encrypt_sectors.isra.12+0x4c>
   130c5:	nop    DWORD PTR [rax]
   130c8:	add    rbx,0x1
   130cc:	mov    r8,QWORD PTR [rsp+0x8]
   130d1:	mov    QWORD PTR [rsp+0x10],rdi
   130d6:	mov    rsi,rbp
   130d9:	mov    rdi,r15
   130dc:	mov    r9d,r13d
   130df:	mov    rcx,r14
   130e2:	mov    edx,0x200
   130e7:	mov    QWORD PTR [rsp+0x18],0x0
   130f0:	add    r15,0x200
   130f7:	add    rbp,0x200
   130fe:	call   8630 <AES_cbc_encrypt>
   13103:	mov    rdi,rbx
   13106:	cmp    rbx,r12
   13109:	jne    130c8 <encrypt_sectors.isra.12+0x48>
   1310b:	mov    rax,QWORD PTR [rsp+0x28]
   13110:	xor    rax,QWORD PTR fs:0x28
   13119:	jne    1312a <encrypt_sectors.isra.12+0xaa>
   1311b:	add    rsp,0x38
   1311f:	pop    rbx
   13120:	pop    rbp
   13121:	pop    r12
   13123:	pop    r13
   13125:	pop    r14
   13127:	pop    r15
   13129:	ret
   1312a:	call   31c0 <__stack_chk_fail@plt>
   1312f:	nop

0000000000013130 <qcow_schedule_bh.constprop.13>:
   13130:	cmp    QWORD PTR [rdi+0x58],0x0
   13135:	jne    13170 <qcow_schedule_bh.constprop.13+0x40>
   13137:	push   rbx
   13138:	mov    rsi,rdi
   1313b:	mov    rbx,rdi
   1313e:	lea    rdi,[rip+0x53b]        # 13680 <qcow_aio_read_bh>
   13145:	call   5120 <qemu_bh_new>
   1314a:	mov    QWORD PTR [rbx+0x58],rax
   1314e:	test   rax,rax
   13151:	je     1315f <qcow_schedule_bh.constprop.13+0x2f>
   13153:	mov    rdi,rax
   13156:	call   5160 <qemu_bh_schedule>
   1315b:	xor    eax,eax
   1315d:	pop    rbx
   1315e:	ret
   1315f:	mov    eax,0xfffffffb
   13164:	pop    rbx
   13165:	ret
   13166:	nop    WORD PTR cs:[rax+rax*1+0x0]
   13170:	mov    eax,0xfffffffb
   13175:	ret
   13176:	nop    WORD PTR cs:[rax+rax*1+0x0]

0000000000007630 <qcow_probe>:
    7630:   xor    eax,eax
    7632:   cmp    esi,0x2f
    7635:   ja     7640 <qcow_probe+0x10>
    7637:   ret
    7638:   nop    DWORD PTR [rax+rax*1+0x0]
    7640:   cmp    DWORD PTR [rdi],0xfb494651
    7646:   jne    7637 <qcow_probe+0x7>
    7648:   cmp    DWORD PTR [rdi+0x4],0x1000000
    764f:   mov    edx,0x64
    7654:   cmove  eax,edx
    7657:   ret
    7658:   nop    DWORD PTR [rax+rax*1+0x0]

0000000000013180 <qcow_probe>:
   13180:	xor    eax,eax
   13182:	cmp    esi,0x47
   13185:	ja     13190 <qcow_probe+0x10>
   13187:	ret
   13188:	nop    DWORD PTR [rax+rax*1+0x0]
   13190:	cmp    DWORD PTR [rdi],0xfb494651
   13196:	jne    13187 <qcow_probe+0x7>
   13198:	cmp    DWORD PTR [rdi+0x4],0x2000000
   1319f:	mov    edx,0x64
   131a4:	cmove  eax,edx
   131a7:	ret
   131a8:	nop    DWORD PTR [rax+rax*1+0x0]

00000000000131b0 <count_contiguous_clusters>:
   131b0:	mov    r10,QWORD PTR [rdx]
   131b3:	not    r8
   131b6:	bswap  r10
   131b9:	and    r10,r8
   131bc:	je     13230 <count_contiguous_clusters+0x80>
   131be:	movsxd r9,ecx
   131c1:	add    rdi,rcx
   131c4:	mov    eax,ecx
   131c6:	cmp    rdi,r9
   131c9:	jbe    13238 <count_contiguous_clusters+0x88>
   131cb:	mov    r11d,esi
   131ce:	mov    r9,QWORD PTR [rdx+r9*8]
   131d2:	imul   r11d,ecx
   131d6:	bswap  r9
   131d9:	and    r9,r8
   131dc:	movsxd r11,r11d
   131df:	add    r11,r10
   131e2:	cmp    r11,r9
   131e5:	jne    13238 <count_contiguous_clusters+0x88>
   131e7:	lea    eax,[rcx+0x1]
   131ea:	push   rbx
   131eb:	movsxd rbx,esi
   131ee:	movsxd r9,eax
   131f1:	imul   eax,esi
   131f4:	movsxd rsi,eax
   131f7:	add    r10,rsi
   131fa:	jmp    1321a <count_contiguous_clusters+0x6a>
   131fc:	nop    DWORD PTR [rax+0x0]
   13200:	mov    rsi,QWORD PTR [rdx+r9*8]
   13204:	lea    r11,[rbx+r10*1]
   13208:	add    r9,0x1
   1320c:	bswap  rsi
   1320f:	and    rsi,r8
   13212:	cmp    rsi,r10
   13215:	jne    13222 <count_contiguous_clusters+0x72>
   13217:	mov    r10,r11
   1321a:	mov    eax,r9d
   1321d:	cmp    rdi,r9
   13220:	jne    13200 <count_contiguous_clusters+0x50>
   13222:	sub    eax,ecx
   13224:	pop    rbx
   13225:	ret
   13226:	nop    WORD PTR cs:[rax+rax*1+0x0]
   13230:	xor    eax,eax
   13232:	ret
   13233:	nop    DWORD PTR [rax+rax*1+0x0]
   13238:	sub    eax,ecx
   1323a:	ret
   1323b:	nop    DWORD PTR [rax+rax*1+0x0]

0000000000013240 <get_cluster_offset>:
   13240:	push   r14
   13242:	mov    r14,rsi
   13245:	push   r13
   13247:	mov    r13,rdx
   1324a:	push   r12
   1324c:	push   rbp
   1324d:	push   rbx
   1324e:	mov    r12,QWORD PTR [rdi+0x40]
   13252:	mov    ebx,DWORD PTR [rdx]
   13254:	mov    edx,0x1
   13259:	mov    eax,DWORD PTR [r12+0x10]
   1325e:	mov    ecx,DWORD PTR [r12+0x8]
   13263:	add    ecx,DWORD PTR [r12+0x14]
   13268:	mov    r8d,DWORD PTR [r12+0x1c]
   1326d:	lea    ebp,[rax-0x1]
   13270:	mov    rax,rsi
   13273:	shl    edx,cl
   13275:	shr    rax,0x9
   13279:	and    ebp,eax
   1327b:	lea    eax,[rdx-0x1]
   1327e:	and    eax,esi
   13280:	sub    edx,eax
   13282:	mov    rax,r14
   13285:	sar    edx,0x9
   13288:	shr    rax,cl
   1328b:	lea    esi,[rdx+rbp*1]
   1328e:	cmp    ebx,edx
   13290:	jg     132c8 <get_cluster_offset+0x88>
   13292:	add    ebx,ebp
   13294:	cmp    r8d,eax
   13297:	jle    13368 <get_cluster_offset+0x128>
   1329d:	mov    rdx,QWORD PTR [r12+0x40]
   132a2:	cdqe
   132a4:	mov    rax,QWORD PTR [rdx+rax*8]
   132a8:	test   rax,rax
   132ab:	jne    132d8 <get_cluster_offset+0x98>
   132ad:	cmp    esi,ebx
   132af:	cmovle ebx,esi
   132b2:	mov    edx,ebx
   132b4:	sub    edx,ebp
   132b6:	mov    DWORD PTR [r13+0x0],edx
   132ba:	pop    rbx
   132bb:	pop    rbp
   132bc:	pop    r12
   132be:	pop    r13
   132c0:	pop    r14
   132c2:	ret
   132c3:	nop    DWORD PTR [rax+rax*1+0x0]
   132c8:	mov    ebx,esi
   132ca:	cmp    r8d,eax
   132cd:	jg     1329d <get_cluster_offset+0x5d>
   132cf:	xor    eax,eax
   132d1:	jmp    132b6 <get_cluster_offset+0x76>
   132d3:	nop    DWORD PTR [rax+rax*1+0x0]
   132d8:	btr    rax,0x3f
   132dd:	add    rdi,0x40
   132e1:	mov    rsi,rax
   132e4:	call   12b60 <l2_load.isra.5>
   132e9:	mov    rsi,rax
   132ec:	xor    eax,eax
   132ee:	test   rsi,rsi
   132f1:	je     132ba <get_cluster_offset+0x7a>
   132f3:	mov    ecx,DWORD PTR [r12+0x8]
   132f8:	mov    eax,DWORD PTR [r12+0x18]
   132fd:	mov    edi,ebx
   132ff:	shl    edi,0x9
   13302:	lea    edx,[rax-0x1]
   13305:	shr    r14,cl
   13308:	movsxd rdi,edi
   1330b:	and    edx,r14d
   1330e:	movsxd rdx,edx
   13311:	lea    r9,[rsi+rdx*8]
   13315:	mov    esi,DWORD PTR [r12+0xc]
   1331a:	mov    rax,QWORD PTR [r9]
   1331d:	lea    edx,[rsi-0x1]
   13320:	movsxd rdx,edx
   13323:	mov    r14,rax
   13326:	add    rdi,rdx
   13329:	bswap  r14
   1332c:	sar    rdi,cl
   1332f:	movsxd rdi,edi
   13332:	test   r14,r14
   13335:	jne    13370 <get_cluster_offset+0x130>
   13337:	test   rdi,rdi
   1333a:	je     133a0 <get_cluster_offset+0x160>
   1333c:	test   rax,rax
   1333f:	jne    133a0 <get_cluster_offset+0x160>
   13341:	mov    ecx,0x1
   13346:	jmp    1335c <get_cluster_offset+0x11c>
   13348:	nop    DWORD PTR [rax+rax*1+0x0]
   13350:	add    rcx,0x1
   13354:	cmp    QWORD PTR [r9+rcx*8-0x8],0x0
   1335a:	jne    13386 <get_cluster_offset+0x146>
   1335c:	mov    esi,ecx
   1335e:	cmp    rcx,rdi
   13361:	jne    13350 <get_cluster_offset+0x110>
   13363:	jmp    13386 <get_cluster_offset+0x146>
   13365:	nop    DWORD PTR [rax]
   13368:	xor    eax,eax
   1336a:	jmp    132ad <get_cluster_offset+0x6d>
   1336f:	nop
   13370:	movabs r8,0x8000000000000000
   1337a:	xor    ecx,ecx
   1337c:	mov    rdx,r9
   1337f:	call   131b0 <count_contiguous_clusters>
   13384:	mov    esi,eax
   13386:	mov    rax,r14
   13389:	imul   esi,DWORD PTR [r12+0x10]
   1338f:	btr    rax,0x3f
   13394:	jmp    132ad <get_cluster_offset+0x6d>
   13399:	nop    DWORD PTR [rax+0x0]
   133a0:	xor    esi,esi
   133a2:	jmp    13386 <get_cluster_offset+0x146>
   133a4:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   133af:	nop

00000000000133b0 <qcow_is_allocated>:
   133b0:	sub    rsp,0x8
   133b4:	mov    DWORD PTR [rcx],edx
   133b6:	shl    rsi,0x9
   133ba:	mov    rdx,rcx
   133bd:	call   13240 <get_cluster_offset>
   133c2:	test   rax,rax
   133c5:	setne  al
   133c8:	add    rsp,0x8
   133cc:	movzx  eax,al
   133cf:	ret

0000000000007170 <qcow_is_allocated>:
    7170:   push   r13
    7172:   xor    r9d,r9d
    7175:   xor    r8d,r8d
    7178:   push   r12
    717a:   mov    r12,rcx
    717d:   xor    ecx,ecx
    717f:   push   rbp
    7180:   mov    rbp,rsi
    7183:   shl    rsi,0x9
    7187:   push   rbx
    7188:   mov    ebx,edx
    718a:   xor    edx,edx
    718c:   sub    rsp,0x8
    7190:   mov    r13,QWORD PTR [rdi+0x40]
    7194:   mov    rdi,r13
    7197:   call   69c0 <get_cluster_offset.isra.1>
    719c:   mov    edx,DWORD PTR [r13+0x10]
    71a0:   lea    esi,[rdx-0x1]
    71a3:   and    esi,ebp
    71a5:   sub    edx,esi
    71a7:   cmp    edx,ebx
    71a9:   cmovg  edx,ebx
    71ac:   test   rax,rax
    71af:   setne  al
    71b2:   mov    DWORD PTR [r12],edx
    71b6:   add    rsp,0x8
    71ba:   movzx  eax,al
    71bd:   pop    rbx
    71be:   pop    rbp
    71bf:   pop    r12
    71c1:   pop    r13
    71c3:   ret
    71c4:   data16 nop WORD PTR cs:[rax+rax*1+0x0]
    71cf:   nop

00000000000133d0 <qcow_aio_read_cb>:
   133d0:	push   r13
   133d2:	push   r12
   133d4:	push   rbp
   133d5:	mov    ebp,esi
   133d7:	push   rbx
   133d8:	mov    rbx,rdi
   133db:	sub    rsp,0x8
   133df:	mov    r12,QWORD PTR [rdi+0x8]
   133e3:	mov    r13,QWORD PTR [r12+0x40]
   133e8:	mov    QWORD PTR [rdi+0x50],0x0
   133f0:	test   esi,esi
   133f2:	js     13508 <qcow_aio_read_cb+0x138>
   133f8:	mov    rax,QWORD PTR [rdi+0x40]
   133fc:	mov    ecx,DWORD PTR [rdi+0x3c]
   133ff:	mov    r10,QWORD PTR [rdi+0x30]
   13403:	mov    rdi,QWORD PTR [rdi+0x28]
   13407:	test   rax,rax
   1340a:	jne    13450 <qcow_aio_read_cb+0x80>
   1340c:	mov    eax,DWORD PTR [rbx+0x38]
   1340f:	movsxd rsi,ecx
   13412:	add    rsi,rdi
   13415:	sub    eax,ecx
   13417:	shl    ecx,0x9
   1341a:	mov    QWORD PTR [rbx+0x28],rsi
   1341e:	movsxd rcx,ecx
   13421:	mov    DWORD PTR [rbx+0x38],eax
   13424:	add    rcx,r10
   13427:	mov    QWORD PTR [rbx+0x30],rcx
   1342b:	test   eax,eax
   1342d:	jne    13488 <qcow_aio_read_cb+0xb8>
   1342f:	mov    rdi,QWORD PTR [rbx+0x18]
   13433:	xor    esi,esi
   13435:	call   QWORD PTR [rbx+0x10]
   13438:	add    rsp,0x8
   1343c:	mov    rdi,rbx
   1343f:	pop    rbx
   13440:	pop    rbp
   13441:	pop    r12
   13443:	pop    r13
   13445:	jmp    1a860 <qemu_aio_release>
   1344a:	nop    WORD PTR [rax+rax*1+0x0]
   13450:	bt     rax,0x3e
   13455:	jb     1340c <qcow_aio_read_cb+0x3c>
   13457:	mov    eax,DWORD PTR [r13+0x160]
   1345e:	test   eax,eax
   13460:	je     1340c <qcow_aio_read_cb+0x3c>
   13462:	mov    rdx,r10
   13465:	mov    rsi,r10
   13468:	lea    r9,[r13+0x25c]
   1346f:	xor    r8d,r8d
   13472:	call   13080 <encrypt_sectors.isra.12>
   13477:	mov    ecx,DWORD PTR [rbx+0x3c]
   1347a:	mov    rdi,QWORD PTR [rbx+0x28]
   1347e:	mov    r10,QWORD PTR [rbx+0x30]
   13482:	jmp    1340c <qcow_aio_read_cb+0x3c>
   13484:	nop    DWORD PTR [rax+0x0]
   13488:	mov    DWORD PTR [rbx+0x3c],eax
   1348b:	lea    rdx,[rbx+0x3c]
   1348f:	shl    rsi,0x9
   13493:	mov    rdi,r12
   13496:	call   13240 <get_cluster_offset>
   1349b:	mov    rcx,QWORD PTR [rbx+0x28]
   1349f:	mov    QWORD PTR [rbx+0x40],rax
   134a3:	test   rax,rax
   134a6:	je     13518 <qcow_aio_read_cb+0x148>
   134a8:	mov    edx,DWORD PTR [r13+0x10]
   134ac:	lea    esi,[rdx-0x1]
   134af:	and    esi,ecx
   134b1:	bt     rax,0x3e
   134b6:	mov    r12d,esi
   134b9:	jb     135c8 <qcow_aio_read_cb+0x1f8>
   134bf:	test   eax,0x1ff
   134c4:	jne    13500 <qcow_aio_read_cb+0x130>
   134c6:	shr    rax,0x9
   134ca:	mov    ecx,DWORD PTR [rbx+0x3c]
   134cd:	mov    rdx,QWORD PTR [rbx+0x30]
   134d1:	movsxd rsi,esi
   134d4:	mov    rdi,QWORD PTR [r13+0x0]
   134d8:	add    rsi,rax
   134db:	mov    r9,rbx
   134de:	lea    r8,[rip+0xfffffffffffffeeb]        # 133d0 <qcow_aio_read_cb>
   134e5:	call   1a070 <bdrv_aio_read>
   134ea:	mov    QWORD PTR [rbx+0x50],rax
   134ee:	test   rax,rax
   134f1:	je     13508 <qcow_aio_read_cb+0x138>
   134f3:	add    rsp,0x8
   134f7:	pop    rbx
   134f8:	pop    rbp
   134f9:	pop    r12
   134fb:	pop    r13
   134fd:	ret
   134fe:	xchg   ax,ax
   13500:	mov    ebp,0xfffffffb
   13505:	nop    DWORD PTR [rax]
   13508:	mov    rdi,QWORD PTR [rbx+0x18]
   1350c:	mov    esi,ebp
   1350e:	jmp    13435 <qcow_aio_read_cb+0x65>
   13513:	nop    DWORD PTR [rax+rax*1+0x0]
   13518:	mov    rax,QWORD PTR [r12+0x850]
   13520:	mov    edx,DWORD PTR [rbx+0x3c]
   13523:	mov    rdi,QWORD PTR [rbx+0x30]
   13527:	test   rax,rax
   1352a:	je     1353f <qcow_aio_read_cb+0x16f>
   1352c:	mov    rsi,QWORD PTR [rax]
   1352f:	movsxd rax,edx
   13532:	add    rax,rcx
   13535:	cmp    rsi,rax
   13538:	jge    1358c <qcow_aio_read_cb+0x1bc>
   1353a:	cmp    rcx,rsi
   1353d:	jl     13568 <qcow_aio_read_cb+0x198>
   1353f:	shl    edx,0x9
   13542:	xor    esi,esi
   13544:	movsxd rdx,edx
   13547:	call   3250 <memset@plt>
   1354c:	mov    rdi,rbx
   1354f:	call   13130 <qcow_schedule_bh.constprop.13>
   13554:	mov    ebp,eax
   13556:	test   eax,eax
   13558:	js     13508 <qcow_aio_read_cb+0x138>
   1355a:	add    rsp,0x8
   1355e:	pop    rbx
   1355f:	pop    rbp
   13560:	pop    r12
   13562:	pop    r13
   13564:	ret
   13565:	nop    DWORD PTR [rax]
   13568:	mov    r13d,esi
   1356b:	xor    esi,esi
   1356d:	sub    r13d,ecx
   13570:	mov    eax,r13d
   13573:	sub    edx,r13d
   13576:	shl    eax,0x9
   13579:	shl    edx,0x9
   1357c:	cdqe
   1357e:	movsxd rdx,edx
   13581:	add    rdi,rax
   13584:	call   3250 <memset@plt>
   13589:	mov    edx,r13d
   1358c:	test   edx,edx
   1358e:	jle    1354c <qcow_aio_read_cb+0x17c>
   13590:	mov    ecx,DWORD PTR [rbx+0x3c]
   13593:	mov    rdx,QWORD PTR [rbx+0x30]
   13597:	mov    r9,rbx
   1359a:	lea    r8,[rip+0xfffffffffffffe2f]        # 133d0 <qcow_aio_read_cb>
   135a1:	mov    rsi,QWORD PTR [rbx+0x28]
   135a5:	mov    rdi,QWORD PTR [r12+0x850]
   135ad:	call   1a070 <bdrv_aio_read>
   135b2:	mov    QWORD PTR [rbx+0x50],rax
   135b6:	test   rax,rax
   135b9:	jne    134f3 <qcow_aio_read_cb+0x123>
   135bf:	jmp    13508 <qcow_aio_read_cb+0x138>
   135c4:	nop    DWORD PTR [rax+0x0]
   135c8:	mov    rsi,rax
   135cb:	mov    rdi,r13
   135ce:	call   12e30 <decompress_cluster>
   135d3:	test   eax,eax
   135d5:	js     13508 <qcow_aio_read_cb+0x138>
   135db:	mov    edx,DWORD PTR [rbx+0x3c]
   135de:	mov    esi,r12d
   135e1:	mov    rdi,QWORD PTR [rbx+0x30]
   135e5:	shl    esi,0x9
   135e8:	shl    edx,0x9
   135eb:	movsxd rsi,esi
   135ee:	add    rsi,QWORD PTR [r13+0x110]
   135f5:	movsxd rdx,edx
   135f8:	call   33b0 <memcpy@plt>
   135fd:	jmp    1354c <qcow_aio_read_cb+0x17c>
   13602:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   1360d:	nop    DWORD PTR [rax]

00000000000140f0 <copy_sectors>:
   140f0:	push   r15
   140f2:	sub    r8d,ecx
   140f5:	push   r14
   140f7:	push   r13
   140f9:	push   r12
   140fb:	push   rbp
   140fc:	push   rbx
   140fd:	sub    rsp,0x48
   14101:	mov    QWORD PTR [rsp+0x10],rdx
   14106:	mov    rax,QWORD PTR fs:0x28
   1410f:	mov    QWORD PTR [rsp+0x38],rax
   14114:	xor    eax,eax
   14116:	test   r8d,r8d
   14119:	jle    142ac <copy_sectors+0x1bc>
   1411f:	movsxd rax,ecx
   14122:	mov    r12,QWORD PTR [rdi+0x40]
   14126:	mov    r15,rdi
   14129:	mov    r14d,r8d
   1412c:	add    rsi,rax
   1412f:	mov    QWORD PTR [rsp+0x18],rax
   14134:	lea    rax,[rsp+0x34]
   14139:	mov    rbx,QWORD PTR [r12+0x118]
   14141:	mov    QWORD PTR [rsp+0x28],rsi
   14146:	mov    rbp,rsi
   14149:	mov    QWORD PTR [rsp+0x8],rax
   1414e:	mov    DWORD PTR [rsp+0x24],r8d
   14153:	jmp    141b4 <copy_sectors+0xc4>
   14155:	nop    DWORD PTR [rax]
   14158:	mov    rax,QWORD PTR [r15+0x850]
   1415f:	mov    ecx,DWORD PTR [rsp+0x34]
   14163:	test   rax,rax
   14166:	je     14320 <copy_sectors+0x230>
   1416c:	mov    r8,QWORD PTR [rax]
   1416f:	movsxd rax,ecx
   14172:	add    rax,rbp
   14175:	cmp    r8,rax
   14178:	jge    142f5 <copy_sectors+0x205>
   1417e:	cmp    r8,rbp
   14181:	jg     142d0 <copy_sectors+0x1e0>
   14187:	shl    ecx,0x9
   1418a:	mov    rdi,rbx
   1418d:	movsxd rdx,ecx
   14190:	call   3250 <memset@plt>
   14195:	movsxd rcx,DWORD PTR [rsp+0x34]
   1419a:	mov    edx,ecx
   1419c:	shl    edx,0x9
   1419f:	movsxd rdx,edx
   141a2:	sub    r14d,ecx
   141a5:	add    rbp,rcx
   141a8:	add    rbx,rdx
   141ab:	test   r14d,r14d
   141ae:	jle    14240 <copy_sectors+0x150>
   141b4:	mov    rsi,rbp
   141b7:	mov    rdx,QWORD PTR [rsp+0x8]
   141bc:	mov    rdi,r15
   141bf:	mov    DWORD PTR [rsp+0x34],r14d
   141c4:	shl    rsi,0x9
   141c8:	call   13240 <get_cluster_offset>
   141cd:	mov    rsi,rax
   141d0:	test   rax,rax
   141d3:	je     14158 <copy_sectors+0x68>
   141d5:	mov    eax,DWORD PTR [r12+0x10]
   141da:	lea    r8d,[rax-0x1]
   141de:	movabs rax,0x4000000000000000
   141e8:	and    r8d,ebp
   141eb:	mov    r13d,r8d
   141ee:	test   rsi,rax
   141f1:	je     14340 <copy_sectors+0x250>
   141f7:	mov    rdi,r12
   141fa:	call   12e30 <decompress_cluster>
   141ff:	test   eax,eax
   14201:	js     14317 <copy_sectors+0x227>
   14207:	mov    edx,DWORD PTR [rsp+0x34]
   1420b:	mov    r8d,r13d
   1420e:	mov    rdi,rbx
   14211:	shl    r8d,0x9
   14215:	shl    edx,0x9
   14218:	movsxd rsi,r8d
   1421b:	add    rsi,QWORD PTR [r12+0x110]
   14223:	movsxd rdx,edx
   14226:	call   33b0 <memcpy@plt>
   1422b:	movsxd rcx,DWORD PTR [rsp+0x34]
   14230:	mov    edx,ecx
   14232:	shl    edx,0x9
   14235:	jmp    1419f <copy_sectors+0xaf>
   1423a:	nop    WORD PTR [rax+rax*1+0x0]
   14240:	mov    edx,DWORD PTR [r12+0x160]
   14248:	mov    r13d,DWORD PTR [rsp+0x24]
   1424d:	mov    rax,QWORD PTR [r12+0x118]
   14255:	test   edx,edx
   14257:	je     14282 <copy_sectors+0x192>
   14259:	mov    rdi,QWORD PTR [rsp+0x28]
   1425e:	mov    rdx,rax
   14261:	mov    rsi,rax
   14264:	mov    ecx,r13d
   14267:	lea    r9,[r12+0x168]
   1426f:	mov    r8d,0x1
   14275:	call   13080 <encrypt_sectors.isra.12>
   1427a:	mov    rax,QWORD PTR [r12+0x118]
   14282:	mov    rcx,QWORD PTR [rsp+0x10]
   14287:	mov    rsi,QWORD PTR [rsp+0x18]
   1428c:	mov    rdx,rax
   1428f:	mov    rdi,QWORD PTR [r12]
   14293:	shr    rcx,0x9
   14297:	add    rsi,rcx
   1429a:	mov    ecx,r13d
   1429d:	call   18650 <bdrv_write>
   142a2:	mov    edx,0x0
   142a7:	test   eax,eax
   142a9:	cmovg  eax,edx
   142ac:	mov    rbx,QWORD PTR [rsp+0x38]
   142b1:	xor    rbx,QWORD PTR fs:0x28
   142ba:	jne    14399 <copy_sectors+0x2a9>
   142c0:	add    rsp,0x48
   142c4:	pop    rbx
   142c5:	pop    rbp
   142c6:	pop    r12
   142c8:	pop    r13
   142ca:	pop    r14
   142cc:	pop    r15
   142ce:	ret
   142cf:	nop
   142d0:	mov    r13d,r8d
   142d3:	xor    esi,esi
   142d5:	sub    r13d,ebp
   142d8:	mov    edi,r13d
   142db:	sub    ecx,r13d
   142de:	shl    edi,0x9
   142e1:	shl    ecx,0x9
   142e4:	movsxd rdi,edi
   142e7:	movsxd rdx,ecx
   142ea:	add    rdi,rbx
   142ed:	call   3250 <memset@plt>
   142f2:	mov    ecx,r13d
   142f5:	test   ecx,ecx
   142f7:	jle    14195 <copy_sectors+0xa5>
   142fd:	mov    rdi,QWORD PTR [r15+0x850]
   14304:	mov    rdx,rbx
   14307:	mov    rsi,rbp
   1430a:	call   18210 <bdrv_read>
   1430f:	test   eax,eax
   14311:	jns    14195 <copy_sectors+0xa5>
   14317:	mov    eax,0xffffffff
   1431c:	jmp    142ac <copy_sectors+0x1bc>
   1431e:	xchg   ax,ax
   14320:	shl    ecx,0x9
   14323:	xor    esi,esi
   14325:	mov    rdi,rbx
   14328:	movsxd rdx,ecx
   1432b:	call   3250 <memset@plt>
   14330:	movsxd rcx,DWORD PTR [rsp+0x34]
   14335:	mov    edx,ecx
   14337:	shl    edx,0x9
   1433a:	jmp    1419f <copy_sectors+0xaf>
   1433f:	nop
   14340:	mov    ecx,DWORD PTR [rsp+0x34]
   14344:	shl    r8d,0x9
   14348:	mov    rdi,QWORD PTR [r12]
   1434c:	mov    rdx,rbx
   1434f:	movsxd r8,r8d
   14352:	shl    ecx,0x9
   14355:	add    rsi,r8
   14358:	call   18b00 <bdrv_pread>
   1435d:	movsxd rcx,DWORD PTR [rsp+0x34]
   14362:	mov    edx,ecx
   14364:	shl    edx,0x9
   14367:	cmp    eax,edx
   14369:	jne    14317 <copy_sectors+0x227>
   1436b:	mov    esi,DWORD PTR [r12+0x160]
   14373:	test   esi,esi
   14375:	je     1419f <copy_sectors+0xaf>
   1437b:	xor    r8d,r8d
   1437e:	mov    rdx,rbx
   14381:	mov    rsi,rbx
   14384:	mov    rdi,rbp
   14387:	lea    r9,[r12+0x25c]
   1438f:	call   13080 <encrypt_sectors.isra.12>
   14394:	jmp    14195 <copy_sectors+0xa5>
   14399:	call   31c0 <__stack_chk_fail@plt>
   1439e:	xchg   ax,ax

00000000000147f0 <update_refcount>:
   147f0:	test   rdx,rdx
   147f3:	jle    14858 <update_refcount+0x68>
   147f5:	push   r14
   147f7:	mov    r14d,ecx
   147fa:	push   r13
   147fc:	push   r12
   147fe:	mov    r12,rdi
   14801:	push   rbp
   14802:	push   rbx
   14803:	mov    rbp,QWORD PTR [rdi+0x40]
   14807:	mov    r13d,DWORD PTR [rbp+0xc]
   1480b:	neg    r13d
   1480e:	movsxd rax,r13d
   14811:	lea    r13,[rsi+rdx*1-0x1]
   14816:	mov    rbx,rax
   14819:	and    r13,rax
   1481c:	and    rbx,rsi
   1481f:	cmp    rbx,r13
   14822:	jg     14848 <update_refcount+0x58>
   14824:	nop    DWORD PTR [rax+0x0]
   14828:	mov    ecx,DWORD PTR [rbp+0x8]
   1482b:	mov    rsi,rbx
   1482e:	mov    edx,r14d
   14831:	mov    rdi,r12
   14834:	sar    rsi,cl
   14837:	call   143a0 <update_cluster_refcount>
   1483c:	movsxd rax,DWORD PTR [rbp+0xc]
   14840:	add    rbx,rax
   14843:	cmp    r13,rbx
   14846:	jge    14828 <update_refcount+0x38>
   14848:	pop    rbx
   14849:	pop    rbp
   1484a:	pop    r12
   1484c:	pop    r13
   1484e:	pop    r14
   14850:	ret
   14851:	nop    DWORD PTR [rax+0x0]
   14858:	ret
   14859:	nop    DWORD PTR [rax+0x0]

0000000000014860 <free_any_clusters>:
   14860:	bt     rsi,0x3e
   14865:	mov    rax,QWORD PTR [rdi+0x40]
   14869:	jb     14880 <free_any_clusters+0x20>
   1486b:	mov    ecx,DWORD PTR [rax+0x8]
   1486e:	shl    edx,cl
   14870:	mov    ecx,0xffffffff
   14875:	movsxd rdx,edx
   14878:	jmp    147f0 <update_refcount>
   1487d:	nop    DWORD PTR [rax]
   14880:	mov    ecx,DWORD PTR [rax+0x24]
   14883:	mov    rdx,rsi
   14886:	and    rsi,QWORD PTR [rax+0x30]
   1488a:	and    rsi,0xfffffffffffffe00
   14891:	shr    rdx,cl
   14894:	and    edx,DWORD PTR [rax+0x28]
   14897:	mov    ecx,0xffffffff
   1489c:	add    edx,0x1
   1489f:	shl    edx,0x9
   148a2:	movsxd rdx,edx
   148a5:	jmp    147f0 <update_refcount>
   148aa:	nop    WORD PTR [rax+rax*1+0x0]

00000000000148b0 <alloc_clusters>:
   148b0:	push   r12
   148b2:	mov    r12,rsi
   148b5:	push   rbp
   148b6:	mov    rbp,rdi
   148b9:	push   rbx
   148ba:	call   12ae0 <alloc_clusters_noref>
   148bf:	mov    rdx,r12
   148c2:	mov    rdi,rbp
   148c5:	mov    ecx,0x1
   148ca:	mov    rbx,rax
   148cd:	mov    rsi,rax
   148d0:	call   147f0 <update_refcount>
   148d5:	mov    rax,rbx
   148d8:	pop    rbx
   148d9:	pop    rbp
   148da:	pop    r12
   148dc:	ret
   148dd:	nop    DWORD PTR [rax]

00000000000148e0 <grow_l1_table>:
   148e0:	push   r15
   148e2:	push   r14
   148e4:	push   r13
   148e6:	push   r12
   148e8:	push   rbp
   148e9:	push   rbx
   148ea:	sub    rsp,0x28
   148ee:	mov    r15,QWORD PTR [rdi+0x40]
   148f2:	mov    rax,QWORD PTR fs:0x28
   148fb:	mov    QWORD PTR [rsp+0x18],rax
   14900:	xor    eax,eax
   14902:	mov    ecx,DWORD PTR [r15+0x1c]
   14906:	cmp    ecx,esi
   14908:	jge    14a24 <grow_l1_table+0x144>
   1490e:	mov    r12,rdi
   14911:	nop    DWORD PTR [rax+0x0]
   14918:	lea    eax,[rcx+rcx*2+0x1]
   1491c:	mov    ebx,eax
   1491e:	shr    ebx,0x1f
   14921:	add    ebx,eax
   14923:	sar    ebx,1
   14925:	mov    ecx,ebx
   14927:	cmp    esi,ebx
   14929:	jg     14918 <grow_l1_table+0x38>
   1492b:	lea    ebp,[rbx*8+0x0]
   14932:	movsxd r13,ebp
   14935:	mov    rdi,r13
   14938:	call   59c0 <qemu_mallocz>
   1493d:	movsxd rdx,DWORD PTR [r15+0x1c]
   14941:	mov    rsi,QWORD PTR [r15+0x40]
   14945:	mov    rdi,rax
   14948:	mov    r14,rax
   1494b:	shl    rdx,0x3
   1494f:	call   33b0 <memcpy@plt>
   14954:	mov    rsi,r13
   14957:	mov    rdi,r12
   1495a:	call   148b0 <alloc_clusters>
   1495f:	mov    edx,DWORD PTR [r15+0x1c]
   14963:	mov    r13,rax
   14966:	test   edx,edx
   14968:	jle    14985 <grow_l1_table+0xa5>
   1496a:	xor    eax,eax
   1496c:	nop    DWORD PTR [rax+0x0]
   14970:	mov    rdx,QWORD PTR [r14+rax*8]
   14974:	bswap  rdx
   14977:	mov    QWORD PTR [r14+rax*8],rdx
   1497b:	add    rax,0x1
   1497f:	cmp    DWORD PTR [r15+0x1c],eax
   14983:	jg     14970 <grow_l1_table+0x90>
   14985:	mov    rdi,QWORD PTR [r15]
   14988:	mov    ecx,ebp
   1498a:	mov    rdx,r14
   1498d:	mov    rsi,r13
   14990:	call   19110 <bdrv_pwrite>
   14995:	cmp    ebp,eax
   14997:	jne    14a43 <grow_l1_table+0x163>
   1499d:	mov    eax,DWORD PTR [r15+0x1c]
   149a1:	test   eax,eax
   149a3:	jle    149c5 <grow_l1_table+0xe5>
   149a5:	xor    eax,eax
   149a7:	nop    WORD PTR [rax+rax*1+0x0]
   149b0:	mov    rdx,QWORD PTR [r14+rax*8]
   149b4:	bswap  rdx
   149b7:	mov    QWORD PTR [r14+rax*8],rdx
   149bb:	add    rax,0x1
   149bf:	cmp    DWORD PTR [r15+0x1c],eax
   149c3:	jg     149b0 <grow_l1_table+0xd0>
   149c5:	mov    eax,ebx
   149c7:	lea    rdx,[rsp+0xc]
   149cc:	mov    ecx,0xc
   149d1:	mov    esi,0x24
   149d6:	bswap  eax
   149d8:	mov    DWORD PTR [rsp+0xc],eax
   149dc:	mov    rax,r13
   149df:	bswap  rax
   149e2:	mov    QWORD PTR [rsp+0x10],rax
   149e7:	mov    rdi,QWORD PTR [r15]
   149ea:	call   19110 <bdrv_pwrite>
   149ef:	cmp    eax,0xc
   149f2:	jne    14a43 <grow_l1_table+0x163>
   149f4:	mov    rdi,QWORD PTR [r15+0x40]
   149f8:	call   5960 <qemu_free>
   149fd:	movsxd rdx,DWORD PTR [r15+0x1c]
   14a01:	mov    rsi,QWORD PTR [r15+0x38]
   14a05:	mov    rdi,r12
   14a08:	mov    ecx,0xffffffff
   14a0d:	shl    rdx,0x3
   14a11:	call   147f0 <update_refcount>
   14a16:	mov    QWORD PTR [r15+0x38],r13
   14a1a:	xor    eax,eax
   14a1c:	mov    QWORD PTR [r15+0x40],r14
   14a20:	mov    DWORD PTR [r15+0x1c],ebx
   14a24:	mov    rdi,QWORD PTR [rsp+0x18]
   14a29:	xor    rdi,QWORD PTR fs:0x28
   14a32:	jne    14a53 <grow_l1_table+0x173>
   14a34:	add    rsp,0x28
   14a38:	pop    rbx
   14a39:	pop    rbp
   14a3a:	pop    r12
   14a3c:	pop    r13
   14a3e:	pop    r14
   14a40:	pop    r15
   14a42:	ret
   14a43:	mov    rdi,QWORD PTR [r15+0x40]
   14a47:	call   5960 <qemu_free>
   14a4c:	mov    eax,0xfffffffb
   14a51:	jmp    14a24 <grow_l1_table+0x144>
   14a53:	call   31c0 <__stack_chk_fail@plt>
   14a58:	nop    DWORD PTR [rax+rax*1+0x0]

0000000000014d20 <alloc_cluster_offset>:
   14d20:	push   r15
   14d22:	push   r14
   14d24:	mov    r14d,ecx
   14d27:	push   r13
   14d29:	xor    r13d,r13d
   14d2c:	push   r12
   14d2e:	push   rbp
   14d2f:	push   rbx
   14d30:	sub    rsp,0x68
   14d34:	mov    rbx,QWORD PTR [rdi+0x40]
   14d38:	mov    DWORD PTR [rsp+0x14],edx
   14d3c:	lea    rdx,[rsp+0x50]
   14d41:	mov    DWORD PTR [rsp+0x38],ecx
   14d45:	lea    rcx,[rsp+0x48]
   14d4a:	mov    QWORD PTR [rsp+0x20],r8
   14d4f:	lea    r8,[rsp+0x44]
   14d54:	mov    QWORD PTR [rsp+0x28],rdi
   14d59:	mov    QWORD PTR [rsp+0x30],rsi
   14d5e:	mov    QWORD PTR [rsp+0x8],r9
   14d63:	mov    rax,QWORD PTR fs:0x28
   14d6c:	mov    QWORD PTR [rsp+0x58],rax
   14d71:	xor    eax,eax
   14d73:	mov    QWORD PTR [rsp+0x18],rbx
   14d78:	call   14a60 <get_cluster_table>
   14d7d:	test   eax,eax
   14d7f:	jne    14db0 <alloc_cluster_offset+0x90>
   14d81:	mov    rdi,QWORD PTR [rsp+0x58]
   14d86:	xor    rdi,QWORD PTR fs:0x28
   14d8f:	mov    rax,r13
   14d92:	jne    14f48 <alloc_cluster_offset+0x228>
   14d98:	add    rsp,0x68
   14d9c:	pop    rbx
   14d9d:	pop    rbp
   14d9e:	pop    r12
   14da0:	pop    r13
   14da2:	pop    r14
   14da4:	pop    r15
   14da6:	ret
   14da7:	nop    WORD PTR [rax+rax*1+0x0]
   14db0:	mov    esi,DWORD PTR [rbx+0xc]
   14db3:	mov    eax,r14d
   14db6:	mov    edi,DWORD PTR [rbx+0x18]
   14db9:	shl    eax,0x9
   14dbc:	mov    r15d,DWORD PTR [rsp+0x44]
   14dc1:	mov    ecx,DWORD PTR [rbx+0x8]
   14dc4:	lea    r9d,[rsi-0x1]
   14dc8:	cdqe
   14dca:	mov    rbp,QWORD PTR [rsp+0x50]
   14dcf:	mov    DWORD PTR [rsp+0x10],esi
   14dd3:	movsxd r9,r9d
   14dd6:	mov    DWORD PTR [rsp+0x3c],edi
   14dda:	add    r9,rax
   14ddd:	mov    rax,r9
   14de0:	mov    r9d,edi
   14de3:	sar    rax,cl
   14de6:	sub    r9d,r15d
   14de9:	cmp    r9d,eax
   14dec:	mov    r14d,eax
   14def:	movsxd rax,r15d
   14df2:	lea    r12,[rbp+rax*8+0x0]
   14df7:	cmovl  r14d,r9d
   14dfb:	mov    r13,QWORD PTR [r12]
   14dff:	bswap  r13
   14e02:	test   r13,r13
   14e05:	js     14f23 <alloc_cluster_offset+0x203>
   14e0b:	bt     r13,0x3e
   14e10:	jae    14f14 <alloc_cluster_offset+0x1f4>
   14e16:	mov    r14d,0x1
   14e1c:	movabs r13,0x4000000000000000
   14e26:	xor    ebx,ebx
   14e28:	nop    DWORD PTR [rax+rax*1+0x0]
   14e30:	mov    edi,r14d
   14e33:	mov    esi,DWORD PTR [rsp+0x10]
   14e37:	movsxd rcx,ebx
   14e3a:	xor    r8d,r8d
   14e3d:	sub    edi,ebx
   14e3f:	mov    rdx,r12
   14e42:	movsxd rdi,edi
   14e45:	call   131b0 <count_contiguous_clusters>
   14e4a:	add    ebx,eax
   14e4c:	lea    eax,[r15+rbx*1]
   14e50:	cdqe
   14e52:	lea    rcx,[rbp+rax*8+0x0]
   14e57:	mov    rax,QWORD PTR [rcx]
   14e5a:	test   rax,rax
   14e5d:	jne    14eb6 <alloc_cluster_offset+0x196>
   14e5f:	mov    edx,r14d
   14e62:	sub    edx,ebx
   14e64:	movsxd rdx,edx
   14e67:	test   rdx,rdx
   14e6a:	je     14ead <alloc_cluster_offset+0x18d>
   14e6c:	test   rax,rax
   14e6f:	jne    14ead <alloc_cluster_offset+0x18d>
   14e71:	mov    eax,0x1
   14e76:	jmp    14e8c <alloc_cluster_offset+0x16c>
   14e78:	nop    DWORD PTR [rax+rax*1+0x0]
   14e80:	add    rax,0x1
   14e84:	cmp    QWORD PTR [rcx+rax*8-0x8],0x0
   14e8a:	jne    14e93 <alloc_cluster_offset+0x173>
   14e8c:	mov    esi,eax
   14e8e:	cmp    rdx,rax
   14e91:	jne    14e80 <alloc_cluster_offset+0x160>
   14e93:	add    ebx,esi
   14e95:	lea    eax,[r15+rbx*1]
   14e99:	cdqe
   14e9b:	mov    rax,QWORD PTR [rbp+rax*8+0x0]
   14ea0:	bswap  rax
   14ea3:	test   rax,rax
   14ea6:	js     14eb6 <alloc_cluster_offset+0x196>
   14ea8:	test   rax,r13
   14eab:	jne    14eb6 <alloc_cluster_offset+0x196>
   14ead:	cmp    ebx,r14d
   14eb0:	jl     14e30 <alloc_cluster_offset+0x110>
   14eb6:	mov    ebp,DWORD PTR [rsp+0x10]
   14eba:	imul   ebp,ebx
   14ebd:	movsxd rsi,ebp
   14ec0:	mov    rdi,QWORD PTR [rsp+0x28]
   14ec5:	call   148b0 <alloc_clusters>
   14eca:	mov    rdi,QWORD PTR [rsp+0x30]
   14ecf:	mov    r13,rax
   14ed2:	mov    rax,QWORD PTR [rsp+0x8]
   14ed7:	mov    QWORD PTR [rax],rdi
   14eda:	mov    edi,DWORD PTR [rsp+0x14]
   14ede:	mov    DWORD PTR [rax+0x10],ebx
   14ee1:	mov    DWORD PTR [rax+0x8],edi
   14ee4:	mov    rax,QWORD PTR [rsp+0x18]
   14ee9:	mov    ecx,DWORD PTR [rax+0x8]
   14eec:	mov    eax,DWORD PTR [rsp+0x38]
   14ef0:	sub    ecx,0x9
   14ef3:	mov    edx,eax
   14ef5:	shl    ebx,cl
   14ef7:	cmp    ebx,eax
   14ef9:	mov    rax,QWORD PTR [rsp+0x8]
   14efe:	cmovle edx,ebx
   14f01:	mov    DWORD PTR [rax+0xc],edx
   14f04:	mov    rax,QWORD PTR [rsp+0x20]
   14f09:	sub    edx,DWORD PTR [rsp+0x14]
   14f0d:	mov    DWORD PTR [rax],edx
   14f0f:	jmp    14d81 <alloc_cluster_offset+0x61>
   14f14:	xor    esi,esi
   14f16:	xor    ebx,ebx
   14f18:	test   r14d,r14d
   14f1b:	jg     14e1c <alloc_cluster_offset+0xfc>
   14f21:	jmp    14ec0 <alloc_cluster_offset+0x1a0>
   14f23:	movsxd rdi,r14d
   14f26:	xor    r8d,r8d
   14f29:	xor    ecx,ecx
   14f2b:	mov    rdx,r12
   14f2e:	call   131b0 <count_contiguous_clusters>
   14f33:	btr    r13,0x3f
   14f38:	mov    ebx,eax
   14f3a:	mov    rax,QWORD PTR [rsp+0x8]
   14f3f:	mov    DWORD PTR [rax+0x10],0x0
   14f46:	jmp    14ee4 <alloc_cluster_offset+0x1c4>
   14f48:	call   31c0 <__stack_chk_fail@plt>
   14f4d:	nop    DWORD PTR [rax]

0000000000014f50 <alloc_cluster_link_l2>:
   14f50:	push   r15
   14f52:	push   r14
   14f54:	push   r13
   14f56:	push   r12
   14f58:	push   rbp
   14f59:	push   rbx
   14f5a:	sub    rsp,0x38
   14f5e:	mov    r15d,DWORD PTR [rdx+0x10]
   14f62:	mov    rax,QWORD PTR fs:0x28
   14f6b:	mov    QWORD PTR [rsp+0x28],rax
   14f70:	xor    eax,eax
   14f72:	test   r15d,r15d
   14f75:	jne    14fa0 <alloc_cluster_link_l2+0x50>
   14f77:	mov    rbx,QWORD PTR [rsp+0x28]
   14f7c:	xor    rbx,QWORD PTR fs:0x28
   14f85:	mov    eax,r15d
   14f88:	jne    1519c <alloc_cluster_link_l2+0x24c>
   14f8e:	add    rsp,0x38
   14f92:	pop    rbx
   14f93:	pop    rbp
   14f94:	pop    r12
   14f96:	pop    r13
   14f98:	pop    r14
   14f9a:	pop    r15
   14f9c:	ret
   14f9d:	nop    DWORD PTR [rax]
   14fa0:	mov    r13,QWORD PTR [rdi+0x40]
   14fa4:	mov    rbx,rdi
   14fa7:	movsxd rdi,r15d
   14faa:	mov    r12,rdx
   14fad:	shl    rdi,0x3
   14fb1:	mov    r14,rsi
   14fb4:	call   5970 <qemu_malloc>
   14fb9:	mov    esi,DWORD PTR [r13+0xc]
   14fbd:	mov    r8d,DWORD PTR [r12+0x8]
   14fc2:	mov    rbp,rax
   14fc5:	neg    esi
   14fc7:	movsxd rsi,esi
   14fca:	and    rsi,QWORD PTR [r12]
   14fce:	shr    rsi,0x9
   14fd2:	mov    r9,rsi
   14fd5:	test   r8d,r8d
   14fd8:	jne    15178 <alloc_cluster_link_l2+0x228>
   14fde:	mov    r8d,DWORD PTR [r13+0x10]
   14fe2:	mov    ecx,DWORD PTR [r12+0xc]
   14fe7:	lea    eax,[r8-0x1]
   14feb:	test   eax,ecx
   14fed:	je     1501b <alloc_cluster_link_l2+0xcb>
   14fef:	mov    eax,r8d
   14ff2:	mov    rdi,rbx
   14ff5:	neg    eax
   14ff7:	and    eax,ecx
   14ff9:	movsxd rsi,eax
   14ffc:	sub    ecx,eax
   14ffe:	mov    rdx,rsi
   15001:	add    rsi,r9
   15004:	shl    rdx,0x9
   15008:	add    rdx,r14
   1500b:	call   140f0 <copy_sectors>
   15010:	mov    r15d,eax
   15013:	test   eax,eax
   15015:	js     15166 <alloc_cluster_link_l2+0x216>
   1501b:	mov    rsi,QWORD PTR [r12]
   1501f:	lea    rcx,[rsp+0x18]
   15024:	lea    rdx,[rsp+0x20]
   15029:	mov    rdi,rbx
   1502c:	lea    r8,[rsp+0x14]
   15031:	call   14a60 <get_cluster_table>
   15036:	test   eax,eax
   15038:	je     15160 <alloc_cluster_link_l2+0x210>
   1503e:	mov    eax,DWORD PTR [r12+0x10]
   15043:	test   eax,eax
   15045:	jle    15120 <alloc_cluster_link_l2+0x1d0>
   1504b:	movabs rsi,0x8000000000000000
   15055:	xor    r15d,r15d
   15058:	xor    edx,edx
   1505a:	nop    WORD PTR [rax+rax*1+0x0]
   15060:	mov    eax,DWORD PTR [rsp+0x14]
   15064:	mov    rcx,QWORD PTR [rsp+0x20]
   15069:	add    eax,edx
   1506b:	cdqe
   1506d:	lea    rdi,[rcx+rax*8]
   15071:	mov    rax,QWORD PTR [rdi]
   15074:	test   rax,rax
   15077:	je     15096 <alloc_cluster_link_l2+0x146>
   15079:	movsxd rcx,r15d
   1507c:	add    r15d,0x1
   15080:	mov    QWORD PTR [rbp+rcx*8+0x0],rax
   15085:	mov    eax,DWORD PTR [rsp+0x14]
   15089:	mov    rcx,QWORD PTR [rsp+0x20]
   1508e:	add    eax,edx
   15090:	cdqe
   15092:	lea    rdi,[rcx+rax*8]
   15096:	mov    ecx,DWORD PTR [r13+0x8]
   1509a:	mov    eax,edx
   1509c:	add    edx,0x1
   1509f:	shl    eax,cl
   150a1:	cdqe
   150a3:	add    rax,r14
   150a6:	or     rax,rsi
   150a9:	bswap  rax
   150ac:	mov    QWORD PTR [rdi],rax
   150af:	mov    ecx,DWORD PTR [r12+0x10]
   150b4:	cmp    ecx,edx
   150b6:	jg     15060 <alloc_cluster_link_l2+0x110>
   150b8:	movsxd rsi,DWORD PTR [rsp+0x14]
   150bd:	mov    rdx,QWORD PTR [rsp+0x20]
   150c2:	shl    ecx,0x3
   150c5:	mov    rdi,QWORD PTR [r13+0x0]
   150c9:	shl    rsi,0x3
   150cd:	add    rdx,rsi
   150d0:	add    rsi,QWORD PTR [rsp+0x18]
   150d5:	call   19110 <bdrv_pwrite>
   150da:	movsxd rdx,DWORD PTR [r12+0x10]
   150df:	cdqe
   150e1:	shl    rdx,0x3
   150e5:	cmp    rax,rdx
   150e8:	jne    15160 <alloc_cluster_link_l2+0x210>
   150ea:	test   r15d,r15d
   150ed:	je     1511a <alloc_cluster_link_l2+0x1ca>
   150ef:	lea    eax,[r15-0x1]
   150f3:	mov    r12,rbp
   150f6:	lea    r13,[rbp+rax*8+0x8]
   150fb:	nop    DWORD PTR [rax+rax*1+0x0]
   15100:	mov    rsi,QWORD PTR [r12]
   15104:	mov    edx,0x1
   15109:	mov    rdi,rbx
   1510c:	add    r12,0x8
   15110:	call   14860 <free_any_clusters>
   15115:	cmp    r13,r12
   15118:	jne    15100 <alloc_cluster_link_l2+0x1b0>
   1511a:	xor    r15d,r15d
   1511d:	jmp    15166 <alloc_cluster_link_l2+0x216>
   1511f:	nop
   15120:	movsxd rsi,DWORD PTR [rsp+0x14]
   15125:	mov    rdx,QWORD PTR [rsp+0x20]
   1512a:	lea    ecx,[rax*8+0x0]
   15131:	mov    rdi,QWORD PTR [r13+0x0]
   15135:	shl    rsi,0x3
   15139:	add    rdx,rsi
   1513c:	add    rsi,QWORD PTR [rsp+0x18]
   15141:	call   19110 <bdrv_pwrite>
   15146:	movsxd rdx,DWORD PTR [r12+0x10]
   1514b:	cdqe
   1514d:	shl    rdx,0x3
   15151:	cmp    rdx,rax
   15154:	je     1511a <alloc_cluster_link_l2+0x1ca>
   15156:	nop    WORD PTR cs:[rax+rax*1+0x0]
   15160:	mov    r15d,0xfffffffb
   15166:	mov    rdi,rbp
   15169:	call   5960 <qemu_free>
   1516e:	jmp    14f77 <alloc_cluster_link_l2+0x27>
   15173:	nop    DWORD PTR [rax+rax*1+0x0]
   15178:	xor    ecx,ecx
   1517a:	mov    rdx,r14
   1517d:	mov    rdi,rbx
   15180:	mov    QWORD PTR [rsp+0x8],rsi
   15185:	call   140f0 <copy_sectors>
   1518a:	mov    r9,QWORD PTR [rsp+0x8]
   1518f:	test   eax,eax
   15191:	mov    r15d,eax
   15194:	jns    14fde <alloc_cluster_link_l2+0x8e>
   1519a:	jmp    15166 <alloc_cluster_link_l2+0x216>
   1519c:	call   31c0 <__stack_chk_fail@plt>
   151a1:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   151ac:	nop    DWORD PTR [rax+0x0]

00000000000151b0 <qcow_aio_write_cb>:
   151b0:	push   r15
   151b2:	push   r14
   151b4:	push   r13
   151b6:	push   r12
   151b8:	mov    r12d,esi
   151bb:	push   rbp
   151bc:	push   rbx
   151bd:	mov    rbx,rdi
   151c0:	sub    rsp,0x8
   151c4:	mov    rbp,QWORD PTR [rdi+0x8]
   151c8:	mov    r13,QWORD PTR [rbp+0x40]
   151cc:	mov    QWORD PTR [rdi+0x50],0x0
   151d4:	test   esi,esi
   151d6:	js     152d0 <qcow_aio_write_cb+0x120>
   151dc:	lea    r15,[rdi+0x60]
   151e0:	mov    rsi,QWORD PTR [rdi+0x40]
   151e4:	mov    rdi,rbp
   151e7:	mov    rdx,r15
   151ea:	call   14f50 <alloc_cluster_link_l2>
   151ef:	test   eax,eax
   151f1:	js     152b8 <qcow_aio_write_cb+0x108>
   151f7:	movsxd rsi,DWORD PTR [rbx+0x3c]
   151fb:	mov    ecx,DWORD PTR [rbx+0x38]
   151fe:	mov    rax,rsi
   15201:	sub    ecx,esi
   15203:	add    rsi,QWORD PTR [rbx+0x28]
   15207:	shl    eax,0x9
   1520a:	mov    DWORD PTR [rbx+0x38],ecx
   1520d:	cdqe
   1520f:	mov    QWORD PTR [rbx+0x28],rsi
   15213:	add    QWORD PTR [rbx+0x30],rax
   15217:	test   ecx,ecx
   15219:	je     152f0 <qcow_aio_write_cb+0x140>
   1521f:	mov    eax,DWORD PTR [r13+0x10]
   15223:	mov    edi,DWORD PTR [r13+0x160]
   1522a:	lea    r14d,[rax-0x1]
   1522e:	and    r14d,esi
   15231:	add    ecx,r14d
   15234:	test   edi,edi
   15236:	jne    15300 <qcow_aio_write_cb+0x150>
   1523c:	shl    rsi,0x9
   15240:	mov    r9,r15
   15243:	lea    r8,[rbx+0x3c]
   15247:	mov    edx,r14d
   1524a:	mov    rdi,rbp
   1524d:	call   14d20 <alloc_cluster_offset>
   15252:	mov    QWORD PTR [rbx+0x40],rax
   15256:	test   rax,rax
   15259:	je     15348 <qcow_aio_write_cb+0x198>
   1525f:	test   eax,0x1ff
   15264:	jne    15348 <qcow_aio_write_cb+0x198>
   1526a:	mov    edx,DWORD PTR [r13+0x160]
   15271:	test   edx,edx
   15273:	jne    15310 <qcow_aio_write_cb+0x160>
   15279:	mov    rdx,QWORD PTR [rbx+0x30]
   1527d:	shr    rax,0x9
   15281:	mov    ecx,DWORD PTR [rbx+0x3c]
   15284:	movsxd rsi,r14d
   15287:	mov    rdi,QWORD PTR [r13+0x0]
   1528b:	add    rsi,rax
   1528e:	mov    r9,rbx
   15291:	lea    r8,[rip+0xffffffffffffff18]        # 151b0 <qcow_aio_write_cb>
   15298:	call   1a1a0 <bdrv_aio_write>
   1529d:	mov    QWORD PTR [rbx+0x50],rax
   152a1:	test   rax,rax
   152a4:	je     152d0 <qcow_aio_write_cb+0x120>
   152a6:	add    rsp,0x8
   152aa:	pop    rbx
   152ab:	pop    rbp
   152ac:	pop    r12
   152ae:	pop    r13
   152b0:	pop    r14
   152b2:	pop    r15
   152b4:	ret
   152b5:	nop    DWORD PTR [rax]
   152b8:	mov    edx,DWORD PTR [rbx+0x70]
   152bb:	mov    rsi,QWORD PTR [rbx+0x40]
   152bf:	mov    rdi,rbp
   152c2:	call   14860 <free_any_clusters>
   152c7:	nop    WORD PTR [rax+rax*1+0x0]
   152d0:	mov    rdi,QWORD PTR [rbx+0x18]
   152d4:	mov    esi,r12d
   152d7:	call   QWORD PTR [rbx+0x10]
   152da:	add    rsp,0x8
   152de:	mov    rdi,rbx
   152e1:	pop    rbx
   152e2:	pop    rbp
   152e3:	pop    r12
   152e5:	pop    r13
   152e7:	pop    r14
   152e9:	pop    r15
   152eb:	jmp    1a860 <qemu_aio_release>
   152f0:	mov    rdi,QWORD PTR [rbx+0x18]
   152f4:	xor    esi,esi
   152f6:	jmp    152d7 <qcow_aio_write_cb+0x127>
   152f8:	nop    DWORD PTR [rax+rax*1+0x0]
   15300:	shl    eax,0x5
   15303:	cmp    ecx,eax
   15305:	cmovg  ecx,eax
   15308:	jmp    1523c <qcow_aio_write_cb+0x8c>
   1530d:	nop    DWORD PTR [rax]
   15310:	mov    rsi,QWORD PTR [rbx+0x48]
   15314:	test   rsi,rsi
   15317:	je     15350 <qcow_aio_write_cb+0x1a0>
   15319:	mov    rdx,QWORD PTR [rbx+0x30]
   1531d:	mov    ecx,DWORD PTR [rbx+0x3c]
   15320:	lea    r9,[r13+0x168]
   15327:	mov    r8d,0x1
   1532d:	mov    rdi,QWORD PTR [rbx+0x28]
   15331:	call   13080 <encrypt_sectors.isra.12>
   15336:	mov    rdx,QWORD PTR [rbx+0x48]
   1533a:	mov    rax,QWORD PTR [rbx+0x40]
   1533e:	jmp    1527d <qcow_aio_write_cb+0xcd>
   15343:	nop    DWORD PTR [rax+rax*1+0x0]
   15348:	mov    r12d,0xfffffffb
   1534e:	jmp    152d0 <qcow_aio_write_cb+0x120>
   15350:	mov    edi,DWORD PTR [r13+0xc]
   15354:	shl    edi,0x5
   15357:	movsxd rdi,edi
   1535a:	call   59c0 <qemu_mallocz>
   1535f:	mov    rsi,rax
   15362:	mov    QWORD PTR [rbx+0x48],rax
   15366:	jmp    15319 <qcow_aio_write_cb+0x169>
   15368:	nop    DWORD PTR [rax+rax*1+0x0]

0000000000007350 <qcow_aio_write>:
    7350:   push   r13
    7352:   mov    r13d,ecx
    7355:   push   r12
    7357:   mov    r12,rsi
    735a:   mov    rsi,r8
    735d:   push   rbp
    735e:   mov    rbp,rdx
    7361:   mov    rdx,r9
    7364:   push   rbx
    7365:   sub    rsp,0x8
    7369:   mov    rax,QWORD PTR [rdi+0x40]
    736d:   mov    QWORD PTR [rax+0x110],0xffffffffffffffff
    7378:   call   1a680 <qemu_aio_get>
    737d:   mov    rbx,rax
    7380:   test   rax,rax
    7383:   je     73aa <qcow_aio_write+0x5a>
    7385:   mov    QWORD PTR [rax+0x50],0x0
    738d:   xor    esi,esi
    738f:   mov    rdi,rax
    7392:   mov    QWORD PTR [rax+0x28],r12
    7396:   mov    QWORD PTR [rax+0x30],rbp
    739a:   mov    DWORD PTR [rax+0x38],r13d
    739e:   mov    DWORD PTR [rax+0x3c],0x0
    73a5:   call   71d0 <qcow_aio_write_cb>
    73aa:   add    rsp,0x8
    73ae:   mov    rax,rbx
    73b1:   pop    rbx
    73b2:   pop    rbp
    73b3:   pop    r12
    73b5:   pop    r13
    73b7:   ret
    73b8:   nop    DWORD PTR [rax+rax*1+0x0]

0000000000015370 <qcow_aio_write>:
   15370:	push   r13
   15372:	mov    r13d,ecx
   15375:	push   r12
   15377:	mov    r12,rsi
   1537a:	mov    rsi,r8
   1537d:	push   rbp
   1537e:	mov    rbp,rdx
   15381:	mov    rdx,r9
   15384:	push   rbx
   15385:	sub    rsp,0x8
   15389:	mov    rax,QWORD PTR [rdi+0x40]
   1538d:	mov    QWORD PTR [rax+0x120],0xffffffffffffffff
   15398:	call   1a680 <qemu_aio_get>
   1539d:	mov    rbx,rax
   153a0:	test   rax,rax
   153a3:	je     153d9 <qcow_aio_write+0x69>
   153a5:	mov    QWORD PTR [rax+0x50],0x0
   153ad:	xor    esi,esi
   153af:	mov    rdi,rax
   153b2:	mov    QWORD PTR [rax+0x28],r12
   153b6:	mov    QWORD PTR [rax+0x30],rbp
   153ba:	mov    DWORD PTR [rax+0x38],r13d
   153be:	mov    DWORD PTR [rax+0x3c],0x0
   153c5:	mov    QWORD PTR [rax+0x40],0x0
   153cd:	mov    DWORD PTR [rax+0x70],0x0
   153d4:	call   151b0 <qcow_aio_write_cb>
   153d9:	add    rsp,0x8
   153dd:	mov    rax,rbx
   153e0:	pop    rbx
   153e1:	pop    rbp
   153e2:	pop    r12
   153e4:	pop    r13
   153e6:	ret
   153e7:	nop    WORD PTR [rax+rax*1+0x0]

0000000000015bd0 <qcow_snapshot_goto>:
   15bd0:	push   r13
   15bd2:	push   r12
   15bd4:	push   rbp
   15bd5:	mov    rbp,rdi
   15bd8:	push   rbx
   15bd9:	sub    rsp,0x8
   15bdd:	mov    rbx,QWORD PTR [rdi+0x40]
   15be1:	mov    rdi,rbx
   15be4:	call   12da0 <find_snapshot_by_id_or_name.isra.9>
   15be9:	test   eax,eax
   15beb:	js     15cd7 <qcow_snapshot_goto+0x107>
   15bf1:	cdqe
   15bf3:	mov    rsi,QWORD PTR [rbx+0x38]
   15bf7:	mov    ecx,0xffffffff
   15bfc:	mov    rdi,rbp
   15bff:	lea    rdx,[rax*8+0x0]
   15c07:	sub    rdx,rax
   15c0a:	mov    rax,rdx
   15c0d:	mov    rdx,QWORD PTR [rbx+0x360]
   15c14:	lea    r13,[rdx+rax*8]
   15c18:	mov    edx,DWORD PTR [rbx+0x1c]
   15c1b:	call   156c0 <update_snapshot_refcount>
   15c20:	test   eax,eax
   15c22:	js     15cd0 <qcow_snapshot_goto+0x100>
   15c28:	mov    esi,DWORD PTR [r13+0x8]
   15c2c:	mov    rdi,rbp
   15c2f:	call   148e0 <grow_l1_table>
   15c34:	test   eax,eax
   15c36:	js     15cd0 <qcow_snapshot_goto+0x100>
   15c3c:	mov    r12d,DWORD PTR [r13+0x8]
   15c40:	mov    rdx,QWORD PTR [rbx+0x40]
   15c44:	mov    rdi,QWORD PTR [rbx]
   15c47:	mov    DWORD PTR [rbx+0x1c],r12d
   15c4b:	shl    r12d,0x3
   15c4f:	mov    rsi,QWORD PTR [r13+0x0]
   15c53:	mov    ecx,r12d
   15c56:	call   18b00 <bdrv_pread>
   15c5b:	mov    r13d,eax
   15c5e:	cmp    eax,r12d
   15c61:	jne    15cd0 <qcow_snapshot_goto+0x100>
   15c63:	mov    rdx,QWORD PTR [rbx+0x40]
   15c67:	mov    rsi,QWORD PTR [rbx+0x38]
   15c6b:	mov    ecx,eax
   15c6d:	mov    rdi,QWORD PTR [rbx]
   15c70:	call   19110 <bdrv_pwrite>
   15c75:	cmp    eax,r13d
   15c78:	jne    15cd0 <qcow_snapshot_goto+0x100>
   15c7a:	mov    edx,DWORD PTR [rbx+0x1c]
   15c7d:	test   edx,edx
   15c7f:	jle    15ca4 <qcow_snapshot_goto+0xd4>
   15c81:	xor    eax,eax
   15c83:	nop    DWORD PTR [rax+rax*1+0x0]
   15c88:	mov    rdx,QWORD PTR [rbx+0x40]
   15c8c:	lea    rcx,[rdx+rax*8]
   15c90:	add    rax,0x1
   15c94:	mov    rdx,QWORD PTR [rcx]
   15c97:	bswap  rdx
   15c9a:	mov    QWORD PTR [rcx],rdx
   15c9d:	mov    edx,DWORD PTR [rbx+0x1c]
   15ca0:	cmp    edx,eax
   15ca2:	jg     15c88 <qcow_snapshot_goto+0xb8>
   15ca4:	mov    rsi,QWORD PTR [rbx+0x38]
   15ca8:	mov    ecx,0x1
   15cad:	mov    rdi,rbp
   15cb0:	call   156c0 <update_snapshot_refcount>
   15cb5:	test   eax,eax
   15cb7:	js     15cd0 <qcow_snapshot_goto+0x100>
   15cb9:	xor    eax,eax
   15cbb:	add    rsp,0x8
   15cbf:	pop    rbx
   15cc0:	pop    rbp
   15cc1:	pop    r12
   15cc3:	pop    r13
   15cc5:	ret
   15cc6:	nop    WORD PTR cs:[rax+rax*1+0x0]
   15cd0:	mov    eax,0xfffffffb
   15cd5:	jmp    15cbb <qcow_snapshot_goto+0xeb>
   15cd7:	mov    eax,0xfffffffe
   15cdc:	jmp    15cbb <qcow_snapshot_goto+0xeb>
   15cde:	xchg   ax,ax

0000000000015ce0 <qcow_snapshot_delete>:
   15ce0:	push   r13
   15ce2:	push   r12
   15ce4:	push   rbp
   15ce5:	mov    rbp,rdi
   15ce8:	push   rbx
   15ce9:	sub    rsp,0x8
   15ced:	mov    r12,QWORD PTR [rdi+0x40]
   15cf1:	mov    rdi,r12
   15cf4:	call   12da0 <find_snapshot_by_id_or_name.isra.9>
   15cf9:	test   eax,eax
   15cfb:	js     15dd0 <qcow_snapshot_delete+0xf0>
   15d01:	movsxd rdx,eax
   15d04:	mov    ebx,eax
   15d06:	mov    ecx,0xffffffff
   15d0b:	mov    rdi,rbp
   15d0e:	lea    rax,[rdx*8+0x0]
   15d16:	sub    rax,rdx
   15d19:	mov    rdx,QWORD PTR [r12+0x360]
   15d21:	lea    r13,[rdx+rax*8]
   15d25:	mov    edx,DWORD PTR [r13+0x8]
   15d29:	mov    rsi,QWORD PTR [r13+0x0]
   15d2d:	call   156c0 <update_snapshot_refcount>
   15d32:	test   eax,eax
   15d34:	js     15dc0 <qcow_snapshot_delete+0xe0>
   15d3a:	mov    edx,DWORD PTR [r12+0x1c]
   15d3f:	mov    rsi,QWORD PTR [r12+0x38]
   15d44:	xor    ecx,ecx
   15d46:	mov    rdi,rbp
   15d49:	call   156c0 <update_snapshot_refcount>
   15d4e:	test   eax,eax
   15d50:	js     15dc0 <qcow_snapshot_delete+0xe0>
   15d52:	mov    edx,DWORD PTR [r13+0x8]
   15d56:	mov    rsi,QWORD PTR [r13+0x0]
   15d5a:	mov    ecx,0xffffffff
   15d5f:	mov    rdi,rbp
   15d62:	not    ebx
   15d64:	shl    rdx,0x3
   15d68:	call   147f0 <update_refcount>
   15d6d:	mov    rdi,QWORD PTR [r13+0x10]
   15d71:	call   5960 <qemu_free>
   15d76:	mov    rdi,QWORD PTR [r13+0x18]
   15d7a:	call   5960 <qemu_free>
   15d7f:	add    ebx,DWORD PTR [r12+0x35c]
   15d87:	lea    rsi,[r13+0x38]
   15d8b:	mov    rdi,r13
   15d8e:	movsxd rbx,ebx
   15d91:	lea    rdx,[rbx*8+0x0]
   15d99:	sub    rdx,rbx
   15d9c:	shl    rdx,0x3
   15da0:	call   3530 <memmove@plt>
   15da5:	mov    rdi,rbp
   15da8:	sub    DWORD PTR [r12+0x35c],0x1
   15db1:	call   153f0 <qcow_write_snapshots>
   15db6:	mov    edx,0x0
   15dbb:	test   eax,eax
   15dbd:	cmovg  eax,edx
   15dc0:	add    rsp,0x8
   15dc4:	pop    rbx
   15dc5:	pop    rbp
   15dc6:	pop    r12
   15dc8:	pop    r13
   15dca:	ret
   15dcb:	nop    DWORD PTR [rax+rax*1+0x0]
   15dd0:	mov    eax,0xfffffffe
   15dd5:	jmp    15dc0 <qcow_snapshot_delete+0xe0>
   15dd7:	nop    WORD PTR [rax+rax*1+0x0]

0000000000015de0 <qcow_snapshot_create>:
   15de0:	push   r15
   15de2:	pxor   xmm0,xmm0
   15de6:	push   r14
   15de8:	push   r13
   15dea:	mov    r13,rsi
   15ded:	push   r12
   15def:	mov    r12,rdi
   15df2:	push   rbp
   15df3:	push   rbx
   15df4:	sub    rsp,0x48
   15df8:	mov    rbx,QWORD PTR [rdi+0x40]
   15dfc:	mov    rax,QWORD PTR fs:0x28
   15e05:	mov    QWORD PTR [rsp+0x38],rax
   15e0a:	xor    eax,eax
   15e0c:	cmp    BYTE PTR [rsi],0x0
   15e0f:	movaps XMMWORD PTR [rsp],xmm0
   15e13:	movaps XMMWORD PTR [rsp+0x10],xmm0
   15e18:	mov    rdi,rbx
   15e1b:	movaps XMMWORD PTR [rsp+0x20],xmm0
   15e20:	mov    QWORD PTR [rsp+0x30],0x0
   15e29:	je     16010 <qcow_snapshot_create+0x230>
   15e2f:	mov    rsi,r13
   15e32:	call   12d20 <find_snapshot_by_id.isra.8>
   15e37:	test   eax,eax
   15e39:	jns    160b1 <qcow_snapshot_create+0x2d1>
   15e3f:	mov    rdi,r13
   15e42:	call   59e0 <qemu_strdup>
   15e47:	mov    rbp,rax
   15e4a:	mov    QWORD PTR [rsp+0x10],rax
   15e4f:	test   rax,rax
   15e52:	je     1608c <qcow_snapshot_create+0x2ac>
   15e58:	lea    rdi,[r13+0x80]
   15e5f:	call   59e0 <qemu_strdup>
   15e64:	mov    rbp,rax
   15e67:	mov    QWORD PTR [rsp+0x18],rax
   15e6c:	test   rax,rax
   15e6f:	je     1608c <qcow_snapshot_create+0x2ac>
   15e75:	mov    eax,DWORD PTR [r13+0x188]
   15e7c:	mov    rdx,QWORD PTR [r13+0x180]
   15e83:	mov    ecx,0x1
   15e88:	mov    rdi,r12
   15e8b:	mov    rsi,QWORD PTR [rbx+0x38]
   15e8f:	mov    QWORD PTR [rsp+0x20],rdx
   15e94:	mov    edx,DWORD PTR [rbx+0x1c]
   15e97:	mov    DWORD PTR [rsp+0x28],eax
   15e9b:	mov    rax,QWORD PTR [r13+0x190]
   15ea2:	mov    QWORD PTR [rsp+0x30],rax
   15ea7:	call   156c0 <update_snapshot_refcount>
   15eac:	test   eax,eax
   15eae:	js     1608c <qcow_snapshot_create+0x2ac>
   15eb4:	movsxd rsi,DWORD PTR [rbx+0x1c]
   15eb8:	mov    rdi,r12
   15ebb:	shl    rsi,0x3
   15ebf:	call   148b0 <alloc_clusters>
   15ec4:	movsxd rdi,DWORD PTR [rbx+0x1c]
   15ec8:	mov    r14,rax
   15ecb:	mov    QWORD PTR [rsp],rax
   15ecf:	mov    DWORD PTR [rsp+0x8],edi
   15ed3:	shl    rdi,0x3
   15ed7:	call   5970 <qemu_malloc>
   15edc:	mov    ecx,DWORD PTR [rbx+0x1c]
   15edf:	mov    r13,rax
   15ee2:	test   ecx,ecx
   15ee4:	jle    15f0b <qcow_snapshot_create+0x12b>
   15ee6:	xor    eax,eax
   15ee8:	nop    DWORD PTR [rax+rax*1+0x0]
   15ef0:	mov    rdx,QWORD PTR [rbx+0x40]
   15ef4:	mov    rdx,QWORD PTR [rdx+rax*8]
   15ef8:	bswap  rdx
   15efb:	mov    QWORD PTR [r13+rax*8+0x0],rdx
   15f00:	mov    ecx,DWORD PTR [rbx+0x1c]
   15f03:	add    rax,0x1
   15f07:	cmp    ecx,eax
   15f09:	jg     15ef0 <qcow_snapshot_create+0x110>
   15f0b:	mov    rdi,QWORD PTR [rbx]
   15f0e:	mov    rdx,r13
   15f11:	shl    ecx,0x3
   15f14:	mov    rsi,r14
   15f17:	call   19110 <bdrv_pwrite>
   15f1c:	movsxd rdx,DWORD PTR [rbx+0x1c]
   15f20:	cdqe
   15f22:	shl    rdx,0x3
   15f26:	cmp    rax,rdx
   15f29:	jne    1608f <qcow_snapshot_create+0x2af>
   15f2f:	mov    rdi,r13
   15f32:	call   5960 <qemu_free>
   15f37:	mov    eax,DWORD PTR [rbx+0x35c]
   15f3d:	add    eax,0x1
   15f40:	cdqe
   15f42:	lea    rdi,[rax*8+0x0]
   15f4a:	sub    rdi,rax
   15f4d:	shl    rdi,0x3
   15f51:	call   5970 <qemu_malloc>
   15f56:	mov    rsi,QWORD PTR [rbx+0x360]
   15f5d:	mov    r13,rax
   15f60:	test   rsi,rsi
   15f63:	je     15f8f <qcow_snapshot_create+0x1af>
   15f65:	movsxd rax,DWORD PTR [rbx+0x35c]
   15f6c:	mov    rdi,r13
   15f6f:	lea    rdx,[rax*8+0x0]
   15f77:	sub    rdx,rax
   15f7a:	shl    rdx,0x3
   15f7e:	call   33b0 <memcpy@plt>
   15f83:	mov    rdi,QWORD PTR [rbx+0x360]
   15f8a:	call   5960 <qemu_free>
   15f8f:	movsxd rax,DWORD PTR [rbx+0x35c]
   15f96:	mov    QWORD PTR [rbx+0x360],r13
   15f9d:	mov    rdi,r12
   15fa0:	movdqa xmm1,XMMWORD PTR [rsp]
   15fa5:	movdqa xmm2,XMMWORD PTR [rsp+0x10]
   15fab:	lea    edx,[rax+0x1]
   15fae:	movdqa xmm3,XMMWORD PTR [rsp+0x20]
   15fb4:	mov    DWORD PTR [rbx+0x35c],edx
   15fba:	lea    rdx,[rax*8+0x0]
   15fc2:	sub    rdx,rax
   15fc5:	lea    rax,[r13+rdx*8+0x0]
   15fca:	mov    rdx,QWORD PTR [rsp+0x30]
   15fcf:	movups XMMWORD PTR [rax],xmm1
   15fd2:	mov    QWORD PTR [rax+0x30],rdx
   15fd6:	movups XMMWORD PTR [rax+0x10],xmm2
   15fda:	movups XMMWORD PTR [rax+0x20],xmm3
   15fde:	call   153f0 <qcow_write_snapshots>
   15fe3:	test   eax,eax
   15fe5:	js     1608c <qcow_snapshot_create+0x2ac>
   15feb:	xor    eax,eax
   15fed:	mov    rsi,QWORD PTR [rsp+0x38]
   15ff2:	xor    rsi,QWORD PTR fs:0x28
   15ffb:	jne    160bb <qcow_snapshot_create+0x2db>
   16001:	add    rsp,0x48
   16005:	pop    rbx
   16006:	pop    rbp
   16007:	pop    r12
   16009:	pop    r13
   1600b:	pop    r14
   1600d:	pop    r15
   1600f:	ret
   16010:	mov    eax,DWORD PTR [rbx+0x35c]
   16016:	test   eax,eax
   16018:	jle    160a9 <qcow_snapshot_create+0x2c9>
   1601e:	xor    r15d,r15d
   16021:	xor    ebp,ebp
   16023:	xor    r14d,r14d
   16026:	nop    WORD PTR cs:[rax+rax*1+0x0]
   16030:	mov    rax,QWORD PTR [rbx+0x360]
   16037:	xor    esi,esi
   16039:	mov    edx,0xa
   1603e:	mov    rdi,QWORD PTR [rax+r15*1+0x10]
   16043:	call   35e0 <strtoul@plt>
   16048:	cmp    ebp,eax
   1604a:	cmovl  ebp,eax
   1604d:	add    r14d,0x1
   16051:	add    r15,0x38
   16055:	cmp    r14d,DWORD PTR [rbx+0x35c]
   1605c:	jl     16030 <qcow_snapshot_create+0x250>
   1605e:	lea    r9d,[rbp+0x1]
   16062:	mov    rdi,r13
   16065:	mov    ecx,0x80
   1606a:	mov    edx,0x1
   1606f:	xor    eax,eax
   16071:	lea    r8,[rip+0xb96a]        # 219e2 <__FUNCTION__.13813+0x8a>
   16078:	mov    esi,0x80
   1607d:	call   3060 <__snprintf_chk@plt>
   16082:	mov    rdi,QWORD PTR [r12+0x40]
   16087:	jmp    15e2f <qcow_snapshot_create+0x4f>
   1608c:	xor    r13d,r13d
   1608f:	mov    rdi,rbp
   16092:	call   5960 <qemu_free>
   16097:	mov    rdi,r13
   1609a:	call   5960 <qemu_free>
   1609f:	mov    eax,0xffffffff
   160a4:	jmp    15fed <qcow_snapshot_create+0x20d>
   160a9:	mov    r9d,0x1
   160af:	jmp    16062 <qcow_snapshot_create+0x282>
   160b1:	mov    eax,0xfffffffe
   160b6:	jmp    15fed <qcow_snapshot_create+0x20d>
   160bb:	call   31c0 <__stack_chk_fail@plt>

00000000000160c0 <qcow_write_compressed>:
   160c0:	push   r15
   160c2:	push   r14
   160c4:	push   r13
   160c6:	push   r12
   160c8:	push   rbp
   160c9:	push   rbx
   160ca:	sub    rsp,0xe8
   160d1:	mov    r14,QWORD PTR [rdi+0x40]
   160d5:	mov    rax,QWORD PTR fs:0x28
   160de:	mov    QWORD PTR [rsp+0xd8],rax
   160e6:	xor    eax,eax
   160e8:	test   ecx,ecx
   160ea:	je     16388 <qcow_write_compressed+0x2c8>
   160f0:	cmp    DWORD PTR [r14+0x10],ecx
   160f4:	jne    16580 <qcow_write_compressed+0x4c0>
   160fa:	mov    ecx,DWORD PTR [r14+0xc]
   160fe:	mov    r12,rdx
   16101:	mov    edx,0x10624dd3
   16106:	mov    r13,rdi
   16109:	lea    rbx,[rsp+0x60]
   1610e:	mov    rbp,rsi
   16111:	mov    eax,ecx
   16113:	imul   edx
   16115:	mov    eax,ecx
   16117:	sar    eax,0x1f
   1611a:	sar    edx,0x6
   1611d:	sub    edx,eax
   1611f:	lea    edi,[rcx+rdx*1+0x80]
   16126:	movsxd rdi,edi
   16129:	call   5970 <qemu_malloc>
   1612e:	mov    ecx,0xe
   16133:	mov    rdi,rbx
   16136:	xor    r9d,r9d
   16139:	mov    QWORD PTR [rsp],rax
   1613d:	xor    eax,eax
   1613f:	mov    esi,0xffffffff
   16144:	mov    r8d,0x9
   1614a:	rep stos QWORD PTR es:[rdi],rax
   1614d:	lea    rax,[rip+0x7deb]        # 1df3f <__PRETTY_FUNCTION__.13430+0x8f>
   16154:	push   0x70
   16156:	mov    rdi,rbx
   16159:	push   rax
   1615a:	mov    ecx,0xfffffff4
   1615f:	mov    edx,0x8
   16164:	call   32c0 <deflateInit2_@plt>
   16169:	mov    DWORD PTR [rsp+0x24],eax
   1616d:	pop    rcx
   1616e:	pop    rsi
   1616f:	test   eax,eax
   16171:	jne    16546 <qcow_write_compressed+0x486>
   16177:	mov    eax,DWORD PTR [r14+0xc]
   1617b:	mov    esi,0x4
   16180:	mov    rdi,rbx
   16183:	mov    QWORD PTR [rsp+0x60],r12
   16188:	mov    DWORD PTR [rsp+0x68],eax
   1618c:	mov    DWORD PTR [rsp+0x80],eax
   16193:	mov    rax,QWORD PTR [rsp]
   16197:	mov    QWORD PTR [rsp+0x78],rax
   1619c:	call   3240 <deflate@plt>
   161a1:	mov    r15d,eax
   161a4:	cmp    eax,0x1
   161a7:	ja     16618 <qcow_write_compressed+0x558>
   161ad:	mov    rax,QWORD PTR [rsp+0x78]
   161b2:	mov    rdi,rbx
   161b5:	mov    QWORD PTR [rsp+0x8],rax
   161ba:	call   3490 <deflateEnd@plt>
   161bf:	cmp    r15d,0x1
   161c3:	jne    16378 <qcow_write_compressed+0x2b8>
   161c9:	mov    rax,QWORD PTR [rsp+0x8]
   161ce:	sub    rax,QWORD PTR [rsp]
   161d2:	mov    QWORD PTR [rsp+0x8],rax
   161d7:	mov    r15d,eax
   161da:	mov    rbx,QWORD PTR [r13+0x40]
   161de:	cmp    DWORD PTR [r14+0xc],eax
   161e2:	jg     163c0 <qcow_write_compressed+0x300>
   161e8:	lea    rax,[rsp+0x40]
   161ed:	mov    r14d,DWORD PTR [r14+0x10]
   161f1:	mov    QWORD PTR [rsp+0x8],rax
   161f6:	lea    rax,[rsp+0x38]
   161fb:	mov    QWORD PTR [rsp+0x20],rax
   16200:	lea    rax,[rbx+0x168]
   16207:	mov    QWORD PTR [rsp+0x28],rax
   1620c:	test   r14d,r14d
   1620f:	jg     162a6 <qcow_write_compressed+0x1e6>
   16215:	jmp    163b0 <qcow_write_compressed+0x2f0>
   1621a:	nop    WORD PTR [rax+rax*1+0x0]
   16220:	mov    r9,QWORD PTR [rsp+0x28]
   16225:	mov    rdx,r12
   16228:	mov    rdi,rbp
   1622b:	mov    QWORD PTR [rsp+0x18],r10
   16230:	mov    rsi,QWORD PTR [rbx+0x118]
   16237:	mov    r8d,0x1
   1623d:	call   13080 <encrypt_sectors.isra.12>
   16242:	mov    ecx,DWORD PTR [rsp+0x38]
   16246:	mov    r10,QWORD PTR [rsp+0x18]
   1624b:	mov    rdx,QWORD PTR [rbx+0x118]
   16252:	mov    rdi,QWORD PTR [rbx]
   16255:	shl    ecx,0x9
   16258:	mov    rsi,r10
   1625b:	call   19110 <bdrv_pwrite>
   16260:	mov    edx,DWORD PTR [rsp+0x38]
   16264:	shl    edx,0x9
   16267:	cmp    edx,eax
   16269:	jne    16330 <qcow_write_compressed+0x270>
   1626f:	mov    rdx,QWORD PTR [rsp+0x8]
   16274:	mov    rsi,r15
   16277:	mov    rdi,r13
   1627a:	call   14f50 <alloc_cluster_link_l2>
   1627f:	test   eax,eax
   16281:	js     16330 <qcow_write_compressed+0x270>
   16287:	movsxd rdx,DWORD PTR [rsp+0x38]
   1628c:	mov    rax,rdx
   1628f:	sub    r14d,edx
   16292:	add    rbp,rdx
   16295:	shl    eax,0x9
   16298:	cdqe
   1629a:	add    r12,rax
   1629d:	test   r14d,r14d
   162a0:	jle    163b0 <qcow_write_compressed+0x2f0>
   162a6:	mov    eax,DWORD PTR [rbx+0x10]
   162a9:	mov    edx,DWORD PTR [rbx+0x160]
   162af:	lea    r10d,[rax-0x1]
   162b3:	and    r10d,ebp
   162b6:	lea    ecx,[r10+r14*1]
   162ba:	test   edx,edx
   162bc:	je     162c6 <qcow_write_compressed+0x206>
   162be:	shl    eax,0x5
   162c1:	cmp    ecx,eax
   162c3:	cmovg  ecx,eax
   162c6:	mov    rsi,rbp
   162c9:	mov    r9,QWORD PTR [rsp+0x8]
   162ce:	mov    r8,QWORD PTR [rsp+0x20]
   162d3:	mov    edx,r10d
   162d6:	shl    rsi,0x9
   162da:	mov    rdi,r13
   162dd:	mov    DWORD PTR [rsp+0x18],r10d
   162e2:	call   14d20 <alloc_cluster_offset>
   162e7:	mov    r15,rax
   162ea:	test   rax,rax
   162ed:	je     1633f <qcow_write_compressed+0x27f>
   162ef:	mov    r10d,DWORD PTR [rsp+0x18]
   162f4:	mov    ecx,DWORD PTR [rsp+0x38]
   162f8:	shl    r10d,0x9
   162fc:	movsxd r10,r10d
   162ff:	add    r10,rax
   16302:	mov    eax,DWORD PTR [rbx+0x160]
   16308:	test   eax,eax
   1630a:	jne    16220 <qcow_write_compressed+0x160>
   16310:	mov    rdi,QWORD PTR [rbx]
   16313:	mov    rdx,r12
   16316:	shl    ecx,0x9
   16319:	mov    rsi,r10
   1631c:	call   19110 <bdrv_pwrite>
   16321:	mov    edx,DWORD PTR [rsp+0x38]
   16325:	shl    edx,0x9
   16328:	cmp    edx,eax
   1632a:	je     1626f <qcow_write_compressed+0x1af>
   16330:	mov    edx,DWORD PTR [rsp+0x50]
   16334:	mov    rsi,r15
   16337:	mov    rdi,r13
   1633a:	call   14860 <free_any_clusters>
   1633f:	mov    rdi,QWORD PTR [rsp]
   16343:	call   5960 <qemu_free>
   16348:	mov    rbx,QWORD PTR [rsp+0xd8]
   16350:	xor    rbx,QWORD PTR fs:0x28
   16359:	mov    eax,DWORD PTR [rsp+0x14]
   1635d:	jne    1664c <qcow_write_compressed+0x58c>
   16363:	add    rsp,0xe8
   1636a:	pop    rbx
   1636b:	pop    rbp
   1636c:	pop    r12
   1636e:	pop    r13
   16370:	pop    r14
   16372:	pop    r15
   16374:	ret
   16375:	nop    DWORD PTR [rax]
   16378:	mov    rbx,QWORD PTR [r13+0x40]
   1637c:	jmp    161e8 <qcow_write_compressed+0x128>
   16381:	nop    DWORD PTR [rax+0x0]
   16388:	mov    rdi,QWORD PTR [r14]
   1638b:	call   191c0 <bdrv_getlength>
   16390:	mov    rdi,QWORD PTR [r14]
   16393:	lea    rsi,[rax+0x1ff]
   1639a:	and    rsi,0xfffffffffffffe00
   163a1:	call   19190 <bdrv_truncate>
   163a6:	mov    DWORD PTR [rsp+0x14],0x0
   163ae:	jmp    16348 <qcow_write_compressed+0x288>
   163b0:	mov    QWORD PTR [rbx+0x120],0xffffffffffffffff
   163bb:	jmp    1633f <qcow_write_compressed+0x27f>
   163c0:	mov    rsi,rbp
   163c3:	lea    rcx,[rsp+0x38]
   163c8:	lea    rdx,[rsp+0x40]
   163cd:	mov    rdi,r13
   163d0:	shl    rsi,0x9
   163d4:	lea    r8,[rsp+0x34]
   163d9:	call   14a60 <get_cluster_table>
   163de:	test   eax,eax
   163e0:	je     16570 <qcow_write_compressed+0x4b0>
   163e6:	movsxd rdx,DWORD PTR [rsp+0x34]
   163eb:	mov    rax,QWORD PTR [rsp+0x40]
   163f0:	mov    rsi,QWORD PTR [rax+rdx*8]
   163f4:	bswap  rsi
   163f7:	test   rsi,rsi
   163fa:	js     16560 <qcow_write_compressed+0x4a0>
   16400:	jne    165e0 <qcow_write_compressed+0x520>
   16406:	mov    rax,QWORD PTR [rsp+0x8]
   1640b:	mov    r12,QWORD PTR [r13+0x40]
   1640f:	test   eax,eax
   16411:	jle    16651 <qcow_write_compressed+0x591>
   16417:	movsxd rsi,DWORD PTR [r12+0xc]
   1641c:	cmp    eax,esi
   1641e:	jg     16651 <qcow_write_compressed+0x591>
   16424:	mov    rbp,QWORD PTR [r12+0x158]
   1642c:	test   rbp,rbp
   1642f:	je     165f8 <qcow_write_compressed+0x538>
   16435:	lea    ecx,[rsi-0x1]
   16438:	mov    edx,esi
   1643a:	mov    eax,ecx
   1643c:	and    eax,ebp
   1643e:	sub    edx,eax
   16440:	cmp    DWORD PTR [rsp+0x8],edx
   16444:	jg     1646a <qcow_write_compressed+0x3aa>
   16446:	jmp    16593 <qcow_write_compressed+0x4d3>
   1644b:	nop    DWORD PTR [rax+rax*1+0x0]
   16450:	lea    ecx,[rsi-0x1]
   16453:	mov    QWORD PTR [r12+0x158],rax
   1645b:	mov    edi,ecx
   1645d:	and    edi,eax
   1645f:	sub    edx,edi
   16461:	cmp    r15d,edx
   16464:	jle    16590 <qcow_write_compressed+0x4d0>
   1646a:	mov    rdi,r13
   1646d:	call   148b0 <alloc_clusters>
   16472:	movsxd rsi,DWORD PTR [r12+0xc]
   16477:	mov    r8,QWORD PTR [r12+0x158]
   1647f:	mov    ecx,esi
   16481:	mov    rdx,rsi
   16484:	neg    ecx
   16486:	movsxd rcx,ecx
   16489:	and    rcx,r8
   1648c:	add    rcx,rsi
   1648f:	cmp    rax,rcx
   16492:	jne    16450 <qcow_write_compressed+0x390>
   16494:	mov    ecx,DWORD PTR [r12+0x8]
   16499:	mov    rsi,r8
   1649c:	mov    edx,0x1
   164a1:	mov    rdi,r13
   164a4:	mov    QWORD PTR [rsp+0x18],r8
   164a9:	sar    rsi,cl
   164ac:	call   143a0 <update_cluster_refcount>
   164b1:	movsxd r15,DWORD PTR [rsp+0x8]
   164b6:	mov    r8,QWORD PTR [rsp+0x18]
   164bb:	add    QWORD PTR [r12+0x158],r15
   164c3:	mov    rbp,r8
   164c6:	lea    rax,[rbp+r15*1-0x1]
   164cb:	mov    rdx,rbp
   164ce:	mov    ecx,DWORD PTR [rbx+0x24]
   164d1:	shr    rdx,0x9
   164d5:	shr    rax,0x9
   164d9:	sub    eax,edx
   164db:	movsxd rdx,DWORD PTR [rsp+0x34]
   164e0:	cdqe
   164e2:	shl    rax,cl
   164e5:	or     rbp,rax
   164e8:	mov    rax,QWORD PTR [rsp+0x40]
   164ed:	bts    rbp,0x3e
   164f2:	mov    rcx,rbp
   164f5:	bswap  rcx
   164f8:	mov    QWORD PTR [rax+rdx*8],rcx
   164fc:	mov    rdi,QWORD PTR [rbx]
   164ff:	mov    ecx,0x8
   16504:	movsxd rsi,DWORD PTR [rsp+0x34]
   16509:	mov    rdx,QWORD PTR [rsp+0x40]
   1650e:	shl    rsi,0x3
   16512:	add    rdx,rsi
   16515:	add    rsi,QWORD PTR [rsp+0x38]
   1651a:	call   19110 <bdrv_pwrite>
   1651f:	cmp    eax,0x8
   16522:	jne    16570 <qcow_write_compressed+0x4b0>
   16524:	mov    rbx,QWORD PTR [rsp+0x8]
   16529:	mov    rsi,QWORD PTR [r14+0x30]
   1652d:	mov    rdx,QWORD PTR [rsp]
   16531:	mov    rdi,QWORD PTR [r14]
   16534:	and    rsi,rbp
   16537:	mov    ecx,ebx
   16539:	call   19110 <bdrv_pwrite>
   1653e:	cmp    eax,ebx
   16540:	je     1633f <qcow_write_compressed+0x27f>
   16546:	mov    rdi,QWORD PTR [rsp]
   1654a:	call   5960 <qemu_free>
   1654f:	mov    DWORD PTR [rsp+0x14],0xffffffff
   16557:	jmp    16348 <qcow_write_compressed+0x288>
   1655c:	nop    DWORD PTR [rax+0x0]
   16560:	btr    rsi,0x3f
   16565:	mov    rbp,rsi
   16568:	test   rsi,rsi
   1656b:	jne    16524 <qcow_write_compressed+0x464>
   1656d:	nop    DWORD PTR [rax]
   16570:	mov    DWORD PTR [rsp+0x14],0xffffffff
   16578:	jmp    16348 <qcow_write_compressed+0x288>
   1657d:	nop    DWORD PTR [rax]
   16580:	mov    DWORD PTR [rsp+0x14],0xffffffea
   16588:	jmp    16348 <qcow_write_compressed+0x288>
   1658d:	nop    DWORD PTR [rax]
   16590:	mov    rbp,rax
   16593:	mov    rax,QWORD PTR [rsp+0x8]
   16598:	cmp    eax,edx
   1659a:	je     16636 <qcow_write_compressed+0x576>
   165a0:	movsxd r15,eax
   165a3:	lea    rax,[r15+rbp*1]
   165a7:	mov    QWORD PTR [r12+0x158],rax
   165af:	movsxd rcx,ecx
   165b2:	test   rcx,rbp
   165b5:	je     164c6 <qcow_write_compressed+0x406>
   165bb:	mov    ecx,DWORD PTR [r12+0x8]
   165c0:	mov    rsi,rbp
   165c3:	mov    edx,0x1
   165c8:	mov    rdi,r13
   165cb:	sar    rsi,cl
   165ce:	call   143a0 <update_cluster_refcount>
   165d3:	jmp    164c6 <qcow_write_compressed+0x406>
   165d8:	nop    DWORD PTR [rax+rax*1+0x0]
   165e0:	mov    edx,0x1
   165e5:	mov    rdi,r13
   165e8:	call   14860 <free_any_clusters>
   165ed:	jmp    16406 <qcow_write_compressed+0x346>
   165f2:	nop    WORD PTR [rax+rax*1+0x0]
   165f8:	mov    rdi,r13
   165fb:	call   148b0 <alloc_clusters>
   16600:	movsxd rsi,DWORD PTR [r12+0xc]
   16605:	mov    rbp,rax
   16608:	mov    QWORD PTR [r12+0x158],rax
   16610:	jmp    16435 <qcow_write_compressed+0x375>
   16615:	nop    DWORD PTR [rax]
   16618:	mov    rdi,QWORD PTR [rsp]
   1661c:	call   5960 <qemu_free>
   16621:	mov    rdi,rbx
   16624:	call   3490 <deflateEnd@plt>
   16629:	mov    DWORD PTR [rsp+0x14],0xffffffff
   16631:	jmp    16348 <qcow_write_compressed+0x288>
   16636:	mov    QWORD PTR [r12+0x158],0x0
   16642:	movsxd r15,DWORD PTR [rsp+0x8]
   16647:	jmp    165af <qcow_write_compressed+0x4ef>
   1664c:	call   31c0 <__stack_chk_fail@plt>
   16651:	lea    rcx,[rip+0xaeb8]        # 21510 <__PRETTY_FUNCTION__.14860>
   16658:	mov    edx,0x8bd
   1665d:	lea    rsi,[rip+0xae55]        # 214b9 <__PRETTY_FUNCTION__.14257+0x19>
   16664:	lea    rdi,[rip+0xae7d]        # 214e8 <__PRETTY_FUNCTION__.14257+0x48>
   1666b:	call   3230 <__assert_fail@plt>

0000000000016670 <parallels_close>:
   16670:	push   rbx
   16671:	mov    rbx,QWORD PTR [rdi+0x40]
   16675:	mov    rdi,QWORD PTR [rbx+0x8]
   16679:	call   5960 <qemu_free>
   1667e:	mov    edi,DWORD PTR [rbx]
   16680:	pop    rbx
   16681:	jmp    3270 <close@plt>
   16686:	nop    WORD PTR cs:[rax+rax*1+0x0]

00000000000167a0 <parallels_open>:
   167a0:	push   r13
   167a2:	mov    r13,rdi
   167a5:	push   r12
   167a7:	mov    r12,rsi
   167aa:	mov    esi,0x2
   167af:	push   rbp
   167b0:	push   rbx
   167b1:	sub    rsp,0x58
   167b5:	mov    rbx,QWORD PTR [rdi+0x40]
   167b9:	mov    rdi,r12
   167bc:	mov    rax,QWORD PTR fs:0x28
   167c5:	mov    QWORD PTR [rsp+0x48],rax
   167ca:	xor    eax,eax
   167cc:	call   3500 <open64@plt>
   167d1:	mov    ebp,eax
   167d3:	test   eax,eax
   167d5:	js     168c0 <parallels_open+0x120>
   167db:	mov    DWORD PTR [r13+0x8],0x1
   167e3:	mov    rsi,rsp
   167e6:	mov    edx,0x40
   167eb:	mov    edi,ebp
   167ed:	mov    DWORD PTR [rbx],ebp
   167ef:	call   52c0 <qemu_read_ok>
   167f4:	test   eax,eax
   167f6:	js     168e0 <parallels_open+0x140>
   167fc:	movabs rdx,0x6563617053656572
   16806:	xor    rdx,QWORD PTR [rsp+0x8]
   1680b:	movabs rax,0x4674756f68746957
   16815:	xor    rax,QWORD PTR [rsp]
   16819:	or     rdx,rax
   1681c:	jne    168e0 <parallels_open+0x140>
   16822:	xor    r12d,r12d
   16825:	cmp    DWORD PTR [rsp+0x10],0x2
   1682a:	jne    168e0 <parallels_open+0x140>
   16830:	mov    eax,DWORD PTR [rsp+0x24]
   16834:	xor    edx,edx
   16836:	mov    esi,0x40
   1683b:	mov    QWORD PTR [r13+0x0],rax
   1683f:	mov    edi,DWORD PTR [rbx]
   16841:	call   3650 <lseek64@plt>
   16846:	cmp    rax,0x40
   1684a:	jne    168e0 <parallels_open+0x140>
   16850:	mov    eax,DWORD PTR [rsp+0x1c]
   16854:	mov    DWORD PTR [rbx+0x14],eax
   16857:	mov    edi,DWORD PTR [rsp+0x20]
   1685b:	mov    DWORD PTR [rbx+0x10],edi
   1685e:	shl    edi,0x2
   16861:	movsxd rdi,edi
   16864:	call   5970 <qemu_malloc>
   16869:	mov    QWORD PTR [rbx+0x8],rax
   1686d:	test   rax,rax
   16870:	je     168ee <parallels_open+0x14e>
   16872:	mov    ecx,DWORD PTR [rbx+0x10]
   16875:	mov    edi,DWORD PTR [rbx]
   16877:	mov    rsi,rax
   1687a:	lea    edx,[rcx*4+0x0]
   16881:	movsxd rdx,edx
   16884:	call   32e0 <read@plt>
   16889:	mov    ecx,DWORD PTR [rbx+0x10]
   1688c:	lea    edx,[rcx*4+0x0]
   16893:	movsxd rdx,edx
   16896:	cmp    rdx,rax
   16899:	jne    168e0 <parallels_open+0x140>
   1689b:	mov    rcx,QWORD PTR [rsp+0x48]
   168a0:	xor    rcx,QWORD PTR fs:0x28
   168a9:	mov    eax,r12d
   168ac:	jne    168fd <parallels_open+0x15d>
   168ae:	add    rsp,0x58
   168b2:	pop    rbx
   168b3:	pop    rbp
   168b4:	pop    r12
   168b6:	pop    r13
   168b8:	ret
   168b9:	nop    DWORD PTR [rax+0x0]
   168c0:	xor    esi,esi
   168c2:	mov    rdi,r12
   168c5:	xor    eax,eax
   168c7:	call   3500 <open64@plt>
   168cc:	mov    ebp,eax
   168ce:	test   eax,eax
   168d0:	jns    167db <parallels_open+0x3b>
   168d6:	mov    r12d,0xffffffff
   168dc:	jmp    1689b <parallels_open+0xfb>
   168de:	xchg   ax,ax
   168e0:	mov    rdi,QWORD PTR [rbx+0x8]
   168e4:	test   rdi,rdi
   168e7:	je     168ee <parallels_open+0x14e>
   168e9:	call   5960 <qemu_free>
   168ee:	mov    edi,ebp
   168f0:	mov    r12d,0xffffffff
   168f6:	call   3270 <close@plt>
   168fb:	jmp    1689b <parallels_open+0xfb>
   168fd:	call   31c0 <__stack_chk_fail@plt>
   16902:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   1690d:	nop    DWORD PTR [rax]

0000000000016910 <parallels_probe>:
   16910:	xor    eax,eax
   16912:	cmp    esi,0x3f
   16915:	jle    16939 <parallels_probe+0x29>
   16917:	movabs rcx,0x6563617053656572
   16921:	xor    rcx,QWORD PTR [rdi+0x8]
   16925:	movabs rdx,0x4674756f68746957
   1692f:	xor    rdx,QWORD PTR [rdi]
   16932:	or     rcx,rdx
   16935:	je     16940 <parallels_probe+0x30>
   16937:	xor    eax,eax
   16939:	ret
   1693a:	nop    WORD PTR [rax+rax*1+0x0]
   16940:	cmp    DWORD PTR [rdi+0x10],0x2
   16944:	mov    edx,0x64
   16949:	cmove  eax,edx
   1694c:	ret
   1694d:	nop    DWORD PTR [rax]

0000000000016950 <nbd_getlength>:
   16950:	mov    rax,QWORD PTR [rdi+0x40]
   16954:	mov    rax,QWORD PTR [rax+0x8]
   16958:	ret
   16959:	nop    DWORD PTR [rax+0x0]

0000000000016960 <nbd_close>:
   16960:	push   rbx
   16961:	sub    rsp,0x30
   16965:	mov    rbx,QWORD PTR [rdi+0x40]
   16969:	mov    rax,QWORD PTR fs:0x28
   16972:	mov    QWORD PTR [rsp+0x28],rax
   16977:	xor    eax,eax
   16979:	mov    DWORD PTR [rsp],0x2
   16980:	mov    rsi,rsp
   16983:	mov    QWORD PTR [rsp+0x8],rdi
   16988:	mov    QWORD PTR [rsp+0x10],0x0
   16991:	mov    DWORD PTR [rsp+0x18],0x0
   16999:	mov    edi,DWORD PTR [rbx]
   1699b:	call   17560 <nbd_send_request>
   169a0:	mov    edi,DWORD PTR [rbx]
   169a2:	call   3270 <close@plt>
   169a7:	mov    rax,QWORD PTR [rsp+0x28]
   169ac:	xor    rax,QWORD PTR fs:0x28
   169b5:	jne    169bd <nbd_close+0x5d>
   169b7:	add    rsp,0x30
   169bb:	pop    rbx
   169bc:	ret
   169bd:	call   31c0 <__stack_chk_fail@plt>
   169c2:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   169cd:	nop    DWORD PTR [rax]

00000000000169d0 <nbd_write>:
   169d0:	push   rbp
   169d1:	shl    rsi,0x9
   169d5:	shl    ecx,0x9
   169d8:	mov    rbp,rdx
   169db:	push   rbx
   169dc:	sub    rsp,0x48
   169e0:	mov    rbx,QWORD PTR [rdi+0x40]
   169e4:	mov    rax,QWORD PTR fs:0x28
   169ed:	mov    QWORD PTR [rsp+0x38],rax
   169f2:	xor    eax,eax
   169f4:	mov    QWORD PTR [rsp+0x20],rsi
   169f9:	lea    rsi,[rsp+0x10]
   169fe:	mov    DWORD PTR [rsp+0x10],0x1
   16a06:	mov    QWORD PTR [rsp+0x18],rdi
   16a0b:	mov    DWORD PTR [rsp+0x28],ecx
   16a0f:	mov    edi,DWORD PTR [rbx]
   16a11:	call   17560 <nbd_send_request>
   16a16:	cmp    eax,0xffffffff
   16a19:	je     16a70 <nbd_write+0xa0>
   16a1b:	mov    edx,DWORD PTR [rsp+0x28]
   16a1f:	mov    edi,DWORD PTR [rbx]
   16a21:	xor    ecx,ecx
   16a23:	mov    rsi,rbp
   16a26:	call   16ce0 <nbd_wr_sync>
   16a2b:	mov    edx,DWORD PTR [rsp+0x28]
   16a2f:	cmp    rax,rdx
   16a32:	jne    16a88 <nbd_write+0xb8>
   16a34:	mov    edi,DWORD PTR [rbx]
   16a36:	mov    rsi,rsp
   16a39:	call   17620 <nbd_receive_reply>
   16a3e:	cmp    eax,0xffffffff
   16a41:	je     16a70 <nbd_write+0xa0>
   16a43:	mov    eax,DWORD PTR [rsp]
   16a46:	test   eax,eax
   16a48:	jne    16a80 <nbd_write+0xb0>
   16a4a:	mov    rax,QWORD PTR [rsp+0x18]
   16a4f:	cmp    QWORD PTR [rsp+0x8],rax
   16a54:	jne    16a88 <nbd_write+0xb8>
   16a56:	xor    eax,eax
   16a58:	mov    rbx,QWORD PTR [rsp+0x38]
   16a5d:	xor    rbx,QWORD PTR fs:0x28
   16a66:	jne    16a8f <nbd_write+0xbf>
   16a68:	add    rsp,0x48
   16a6c:	pop    rbx
   16a6d:	pop    rbp
   16a6e:	ret
   16a6f:	nop
   16a70:	call   30d0 <__errno_location@plt>
   16a75:	mov    eax,DWORD PTR [rax]
   16a77:	neg    eax
   16a79:	jmp    16a58 <nbd_write+0x88>
   16a7b:	nop    DWORD PTR [rax+rax*1+0x0]
   16a80:	neg    eax
   16a82:	jmp    16a58 <nbd_write+0x88>
   16a84:	nop    DWORD PTR [rax+0x0]
   16a88:	mov    eax,0xfffffffb
   16a8d:	jmp    16a58 <nbd_write+0x88>
   16a8f:	call   31c0 <__stack_chk_fail@plt>
   16a94:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   16a9f:	nop

0000000000016aa0 <nbd_read>:
   16aa0:	push   rbp
   16aa1:	shl    rsi,0x9
   16aa5:	shl    ecx,0x9
   16aa8:	mov    rbp,rdx
   16aab:	push   rbx
   16aac:	sub    rsp,0x48
   16ab0:	mov    rbx,QWORD PTR [rdi+0x40]
   16ab4:	mov    rax,QWORD PTR fs:0x28
   16abd:	mov    QWORD PTR [rsp+0x38],rax
   16ac2:	xor    eax,eax
   16ac4:	mov    QWORD PTR [rsp+0x20],rsi
   16ac9:	lea    rsi,[rsp+0x10]
   16ace:	mov    DWORD PTR [rsp+0x10],0x0
   16ad6:	mov    QWORD PTR [rsp+0x18],rdi
   16adb:	mov    DWORD PTR [rsp+0x28],ecx
   16adf:	mov    edi,DWORD PTR [rbx]
   16ae1:	call   17560 <nbd_send_request>
   16ae6:	cmp    eax,0xffffffff
   16ae9:	je     16b48 <nbd_read+0xa8>
   16aeb:	mov    edi,DWORD PTR [rbx]
   16aed:	mov    rsi,rsp
   16af0:	call   17620 <nbd_receive_reply>
   16af5:	cmp    eax,0xffffffff
   16af8:	je     16b48 <nbd_read+0xa8>
   16afa:	mov    eax,DWORD PTR [rsp]
   16afd:	test   eax,eax
   16aff:	jne    16b58 <nbd_read+0xb8>
   16b01:	mov    rax,QWORD PTR [rsp+0x18]
   16b06:	cmp    QWORD PTR [rsp+0x8],rax
   16b0b:	jne    16b60 <nbd_read+0xc0>
   16b0d:	mov    edx,DWORD PTR [rsp+0x28]
   16b11:	mov    edi,DWORD PTR [rbx]
   16b13:	mov    ecx,0x1
   16b18:	mov    rsi,rbp
   16b1b:	call   16ce0 <nbd_wr_sync>
   16b20:	mov    edx,DWORD PTR [rsp+0x28]
   16b24:	cmp    rax,rdx
   16b27:	jne    16b60 <nbd_read+0xc0>
   16b29:	xor    eax,eax
   16b2b:	mov    rdx,QWORD PTR [rsp+0x38]
   16b30:	xor    rdx,QWORD PTR fs:0x28
   16b39:	jne    16b67 <nbd_read+0xc7>
   16b3b:	add    rsp,0x48
   16b3f:	pop    rbx
   16b40:	pop    rbp
   16b41:	ret
   16b42:	nop    WORD PTR [rax+rax*1+0x0]
   16b48:	call   30d0 <__errno_location@plt>
   16b4d:	mov    eax,DWORD PTR [rax]
   16b4f:	neg    eax
   16b51:	jmp    16b2b <nbd_read+0x8b>
   16b53:	nop    DWORD PTR [rax+rax*1+0x0]
   16b58:	neg    eax
   16b5a:	jmp    16b2b <nbd_read+0x8b>
   16b5c:	nop    DWORD PTR [rax+0x0]
   16b60:	mov    eax,0xfffffffb
   16b65:	jmp    16b2b <nbd_read+0x8b>
   16b67:	call   31c0 <__stack_chk_fail@plt>
   16b6c:	nop    DWORD PTR [rax+0x0]

0000000000016b70 <nbd_open>:
   16b70:	push   r13
   16b72:	push   r12
   16b74:	push   rbp
   16b75:	push   rbx
   16b76:	sub    rsp,0xb8
   16b7d:	mov    r12,QWORD PTR [rdi+0x40]
   16b81:	mov    rax,QWORD PTR fs:0x28
   16b8a:	mov    QWORD PTR [rsp+0xa8],rax
   16b92:	xor    eax,eax
   16b94:	and    edx,0x4
   16b97:	jne    16cd0 <nbd_open+0x160>
   16b9d:	mov    rcx,rsi
   16ba0:	mov    ebp,edx
   16ba2:	lea    rsi,[rip+0xa9ab]        # 21554 <__PRETTY_FUNCTION__.14669+0x34>
   16ba9:	mov    rdx,rsp
   16bac:	mov    rdi,rcx
   16baf:	call   5620 <strstart>
   16bb4:	test   eax,eax
   16bb6:	je     16cd0 <nbd_open+0x160>
   16bbc:	mov    rdi,QWORD PTR [rsp]
   16bc0:	lea    rdx,[rsp+0x8]
   16bc5:	lea    rsi,[rip+0xa98d]        # 21559 <__PRETTY_FUNCTION__.14669+0x39>
   16bcc:	call   5620 <strstart>
   16bd1:	test   eax,eax
   16bd3:	je     16c70 <nbd_open+0x100>
   16bd9:	mov    rdi,QWORD PTR [rsp+0x8]
   16bde:	cmp    BYTE PTR [rdi],0x2f
   16be1:	jne    16cd0 <nbd_open+0x160>
   16be7:	call   170d0 <unix_socket_outgoing>
   16bec:	mov    ebx,eax
   16bee:	cmp    ebx,0xffffffff
   16bf1:	je     16c60 <nbd_open+0xf0>
   16bf3:	lea    rdx,[rsp+0x18]
   16bf8:	lea    rsi,[rsp+0x10]
   16bfd:	mov    edi,ebx
   16bff:	call   17260 <nbd_receive_negotiate>
   16c04:	cmp    eax,0xffffffff
   16c07:	je     16c50 <nbd_open+0xe0>
   16c09:	mov    DWORD PTR [r12],ebx
   16c0d:	mov    rax,QWORD PTR [rsp+0x10]
   16c12:	mov    QWORD PTR [r12+0x8],rax
   16c17:	mov    rax,QWORD PTR [rsp+0x18]
   16c1c:	mov    QWORD PTR [r12+0x10],rax
   16c21:	mov    rcx,QWORD PTR [rsp+0xa8]
   16c29:	xor    rcx,QWORD PTR fs:0x28
   16c32:	mov    eax,ebp
   16c34:	jne    16cda <nbd_open+0x16a>
   16c3a:	add    rsp,0xb8
   16c41:	pop    rbx
   16c42:	pop    rbp
   16c43:	pop    r12
   16c45:	pop    r13
   16c47:	ret
   16c48:	nop    DWORD PTR [rax+rax*1+0x0]
   16c50:	mov    edi,ebx
   16c52:	call   3270 <close@plt>
   16c57:	nop    WORD PTR [rax+rax*1+0x0]
   16c60:	call   30d0 <__errno_location@plt>
   16c65:	mov    eax,DWORD PTR [rax]
   16c67:	neg    eax
   16c69:	mov    ebp,eax
   16c6b:	jmp    16c21 <nbd_open+0xb1>
   16c6d:	nop    DWORD PTR [rax]
   16c70:	lea    r13,[rsp+0x20]
   16c75:	mov    rdx,QWORD PTR [rsp]
   16c79:	mov    esi,0x80
   16c7e:	mov    rdi,r13
   16c81:	call   5560 <pstrcpy>
   16c86:	mov    esi,0x3a
   16c8b:	mov    rdi,r13
   16c8e:	call   31e0 <strchr@plt>
   16c93:	test   rax,rax
   16c96:	je     16cd0 <nbd_open+0x160>
   16c98:	mov    BYTE PTR [rax],0x0
   16c9b:	lea    rbx,[rax+0x1]
   16c9f:	xor    edx,edx
   16ca1:	lea    rsi,[rsp+0x18]
   16ca6:	mov    rdi,rbx
   16ca9:	call   3390 <strtol@plt>
   16cae:	cmp    QWORD PTR [rsp+0x18],rbx
   16cb3:	je     16cd0 <nbd_open+0x160>
   16cb5:	movzx  esi,ax
   16cb8:	mov    rdi,r13
   16cbb:	call   16e00 <tcp_socket_outgoing>
   16cc0:	mov    ebx,eax
   16cc2:	jmp    16bee <nbd_open+0x7e>
   16cc7:	nop    WORD PTR [rax+rax*1+0x0]
   16cd0:	mov    ebp,0xffffffea
   16cd5:	jmp    16c21 <nbd_open+0xb1>
   16cda:	call   31c0 <__stack_chk_fail@plt>
   16cdf:	nop

0000000000016d60 <nbd_send_reply.isra.0>:
   16d60:	sub    rsp,0x28
   16d64:	bswap  esi
   16d66:	bswap  rdx
   16d69:	xor    ecx,ecx
   16d6b:	mov    rax,QWORD PTR fs:0x28
   16d74:	mov    QWORD PTR [rsp+0x18],rax
   16d79:	xor    eax,eax
   16d7b:	mov    DWORD PTR [rsp+0x4],esi
   16d7f:	mov    rsi,rsp
   16d82:	mov    QWORD PTR [rsp+0x8],rdx
   16d87:	mov    edx,0x10
   16d8c:	mov    DWORD PTR [rsp],0x98664467
   16d93:	call   16ce0 <nbd_wr_sync>
   16d98:	cmp    rax,0x10
   16d9c:	jne    16db5 <nbd_send_reply.isra.0+0x55>
   16d9e:	xor    eax,eax
   16da0:	mov    rcx,QWORD PTR [rsp+0x18]
   16da5:	xor    rcx,QWORD PTR fs:0x28
   16dae:	jne    16df5 <nbd_send_reply.isra.0+0x95>
   16db0:	add    rsp,0x28
   16db4:	ret
   16db5:	mov    rdi,QWORD PTR [rip+0x13544]        # 2a300 <stderr@@GLIBC_2.2.5>
   16dbc:	mov    r9d,0x225
   16dc2:	xor    eax,eax
   16dc4:	lea    r8,[rip+0xaae5]        # 218b0 <__FUNCTION__.13867>
   16dcb:	lea    rcx,[rip+0xa791]        # 21563 <__PRETTY_FUNCTION__.14669+0x43>
   16dd2:	lea    rdx,[rip+0xa7c7]        # 215a0 <__PRETTY_FUNCTION__.14669+0x80>
   16dd9:	mov    esi,0x1
   16dde:	call   3660 <__fprintf_chk@plt>
   16de3:	call   30d0 <__errno_location@plt>
   16de8:	mov    DWORD PTR [rax],0x16
   16dee:	mov    eax,0xffffffff
   16df3:	jmp    16da0 <nbd_send_reply.isra.0+0x40>
   16df5:	call   31c0 <__stack_chk_fail@plt>
   16dfa:	nop    WORD PTR [rax+rax*1+0x0]

0000000000016e00 <tcp_socket_outgoing>:
   16e00:	push   r12
   16e02:	xor    edx,edx
   16e04:	mov    r12,rdi
   16e07:	mov    edi,0x2
   16e0c:	push   rbp
   16e0d:	mov    ebp,esi
   16e0f:	mov    esi,0x1
   16e14:	push   rbx
   16e15:	sub    rsp,0x30
   16e19:	mov    rax,QWORD PTR fs:0x28
   16e22:	mov    QWORD PTR [rsp+0x28],rax
   16e27:	xor    eax,eax
   16e29:	call   36f0 <socket@plt>
   16e2e:	mov    ebx,eax
   16e30:	cmp    eax,0xffffffff
   16e33:	je     16ea8 <tcp_socket_outgoing+0xa8>
   16e35:	lea    rsi,[rsp+0xc]
   16e3a:	mov    rdi,r12
   16e3d:	call   3400 <inet_aton@plt>
   16e42:	test   eax,eax
   16e44:	jne    16e68 <tcp_socket_outgoing+0x68>
   16e46:	mov    rdi,r12
   16e49:	call   3360 <gethostbyname@plt>
   16e4e:	test   rax,rax
   16e51:	je     16e99 <tcp_socket_outgoing+0x99>
   16e53:	mov    rax,QWORD PTR [rax+0x18]
   16e57:	mov    rax,QWORD PTR [rax]
   16e5a:	mov    eax,DWORD PTR [rax]
   16e5c:	mov    DWORD PTR [rsp+0xc],eax
   16e60:	jmp    16e6c <tcp_socket_outgoing+0x6c>
   16e62:	nop    WORD PTR [rax+rax*1+0x0]
   16e68:	mov    eax,DWORD PTR [rsp+0xc]
   16e6c:	mov    edx,0x2
   16e71:	rol    bp,0x8
   16e75:	lea    rsi,[rsp+0x10]
   16e7a:	mov    edi,ebx
   16e7c:	mov    WORD PTR [rsp+0x10],dx
   16e81:	mov    edx,0x10
   16e86:	mov    WORD PTR [rsp+0x12],bp
   16e8b:	mov    DWORD PTR [rsp+0x14],eax
   16e8f:	call   3630 <connect@plt>
   16e94:	cmp    eax,0xffffffff
   16e97:	jne    16ea8 <tcp_socket_outgoing+0xa8>
   16e99:	mov    edi,ebx
   16e9b:	mov    ebx,0xffffffff
   16ea0:	call   3270 <close@plt>
   16ea5:	nop    DWORD PTR [rax]
   16ea8:	mov    rcx,QWORD PTR [rsp+0x28]
   16ead:	xor    rcx,QWORD PTR fs:0x28
   16eb6:	mov    eax,ebx
   16eb8:	jne    16ec3 <tcp_socket_outgoing+0xc3>
   16eba:	add    rsp,0x30
   16ebe:	pop    rbx
   16ebf:	pop    rbp
   16ec0:	pop    r12
   16ec2:	ret
   16ec3:	call   31c0 <__stack_chk_fail@plt>
   16ec8:	nop    DWORD PTR [rax+rax*1+0x0]

0000000000016ed0 <tcp_socket_incoming>:
   16ed0:	push   r12
   16ed2:	xor    edx,edx
   16ed4:	mov    r12,rdi
   16ed7:	mov    edi,0x2
   16edc:	push   rbp
   16edd:	mov    ebp,esi
   16edf:	mov    esi,0x1
   16ee4:	push   rbx
   16ee5:	sub    rsp,0x30
   16ee9:	mov    rax,QWORD PTR fs:0x28
   16ef2:	mov    QWORD PTR [rsp+0x28],rax
   16ef7:	xor    eax,eax
   16ef9:	call   36f0 <socket@plt>
   16efe:	mov    ebx,eax
   16f00:	cmp    eax,0xffffffff
   16f03:	je     16f89 <tcp_socket_incoming+0xb9>
   16f09:	lea    rsi,[rsp+0x8]
   16f0e:	mov    rdi,r12
   16f11:	call   3400 <inet_aton@plt>
   16f16:	test   eax,eax
   16f18:	je     16fa8 <tcp_socket_incoming+0xd8>
   16f1e:	mov    eax,DWORD PTR [rsp+0x8]
   16f22:	mov    edx,0x2
   16f27:	rol    bp,0x8
   16f2b:	lea    rcx,[rsp+0xc]
   16f30:	mov    edi,ebx
   16f32:	mov    WORD PTR [rsp+0x10],dx
   16f37:	mov    r8d,0x4
   16f3d:	mov    edx,0x2
   16f42:	mov    esi,0x1
   16f47:	mov    WORD PTR [rsp+0x12],bp
   16f4c:	mov    DWORD PTR [rsp+0x14],eax
   16f50:	mov    DWORD PTR [rsp+0xc],0x1
   16f58:	call   3150 <setsockopt@plt>
   16f5d:	cmp    eax,0xffffffff
   16f60:	je     16fd0 <tcp_socket_incoming+0x100>
   16f62:	lea    rsi,[rsp+0x10]
   16f67:	mov    edx,0x10
   16f6c:	mov    edi,ebx
   16f6e:	call   34f0 <bind@plt>
   16f73:	cmp    eax,0xffffffff
   16f76:	je     16fd0 <tcp_socket_incoming+0x100>
   16f78:	mov    esi,0x80
   16f7d:	mov    edi,ebx
   16f7f:	call   3470 <listen@plt>
   16f84:	cmp    eax,0xffffffff
   16f87:	je     16fd0 <tcp_socket_incoming+0x100>
   16f89:	mov    rcx,QWORD PTR [rsp+0x28]
   16f8e:	xor    rcx,QWORD PTR fs:0x28
   16f97:	mov    eax,ebx
   16f99:	jne    16fde <tcp_socket_incoming+0x10e>
   16f9b:	add    rsp,0x30
   16f9f:	pop    rbx
   16fa0:	pop    rbp
   16fa1:	pop    r12
   16fa3:	ret
   16fa4:	nop    DWORD PTR [rax+0x0]
   16fa8:	mov    rdi,r12
   16fab:	call   3360 <gethostbyname@plt>
   16fb0:	test   rax,rax
   16fb3:	je     16fd0 <tcp_socket_incoming+0x100>
   16fb5:	mov    rax,QWORD PTR [rax+0x18]
   16fb9:	mov    rax,QWORD PTR [rax]
   16fbc:	mov    eax,DWORD PTR [rax]
   16fbe:	mov    DWORD PTR [rsp+0x8],eax
   16fc2:	jmp    16f22 <tcp_socket_incoming+0x52>
   16fc7:	nop    WORD PTR [rax+rax*1+0x0]
   16fd0:	mov    edi,ebx
   16fd2:	mov    ebx,0xffffffff
   16fd7:	call   3270 <close@plt>
   16fdc:	jmp    16f89 <tcp_socket_incoming+0xb9>
   16fde:	call   31c0 <__stack_chk_fail@plt>
   16fe3:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   16fee:	xchg   ax,ax

0000000000017260 <nbd_receive_negotiate>:
   17260:	push   rbp
   17261:	mov    ecx,0x1
   17266:	mov    rbp,rsi
   17269:	push   rbx
   1726a:	mov    rbx,rdx
   1726d:	mov    edx,0x98
   17272:	sub    rsp,0xa8
   17279:	mov    rax,QWORD PTR fs:0x28
   17282:	mov    QWORD PTR [rsp+0x98],rax
   1728a:	xor    eax,eax
   1728c:	mov    rsi,rsp
   1728f:	call   16ce0 <nbd_wr_sync>
   17294:	cmp    rax,0x98
   1729a:	jne    17300 <nbd_receive_negotiate+0xa0>
   1729c:	mov    rax,QWORD PTR [rsp+0x8]
   172a1:	bswap  rax
   172a4:	mov    rdx,rax
   172a7:	mov    rax,QWORD PTR [rsp+0x10]
   172ac:	bswap  rax
   172af:	mov    QWORD PTR [rbp+0x0],rax
   172b3:	movabs rax,0x434947414d44424e
   172bd:	mov    QWORD PTR [rbx],0x400
   172c4:	cmp    QWORD PTR [rsp],rax
   172c8:	jne    1735d <nbd_receive_negotiate+0xfd>
   172ce:	movabs rax,0x420281861253
   172d8:	cmp    rdx,rax
   172db:	jne    17340 <nbd_receive_negotiate+0xe0>
   172dd:	xor    eax,eax
   172df:	mov    rcx,QWORD PTR [rsp+0x98]
   172e7:	xor    rcx,QWORD PTR fs:0x28
   172f0:	jne    1737a <nbd_receive_negotiate+0x11a>
   172f6:	add    rsp,0xa8
   172fd:	pop    rbx
   172fe:	pop    rbp
   172ff:	ret
   17300:	mov    r9d,0x135
   17306:	lea    r8,[rip+0xa633]        # 21940 <__FUNCTION__.13821>
   1730d:	lea    rcx,[rip+0xa24f]        # 21563 <__PRETTY_FUNCTION__.14669+0x43>
   17314:	lea    rdx,[rip+0xa269]        # 21584 <__PRETTY_FUNCTION__.14669+0x64>
   1731b:	mov    rdi,QWORD PTR [rip+0x12fde]        # 2a300 <stderr@@GLIBC_2.2.5>
   17322:	mov    esi,0x1
   17327:	xor    eax,eax
   17329:	call   3660 <__fprintf_chk@plt>
   1732e:	call   30d0 <__errno_location@plt>
   17333:	mov    DWORD PTR [rax],0x16
   17339:	mov    eax,0xffffffff
   1733e:	jmp    172df <nbd_receive_negotiate+0x7f>
   17340:	mov    r9d,0x153
   17346:	lea    r8,[rip+0xa5f3]        # 21940 <__FUNCTION__.13821>
   1734d:	lea    rcx,[rip+0xa20f]        # 21563 <__PRETTY_FUNCTION__.14669+0x43>
   17354:	lea    rdx,[rip+0xa295]        # 215f0 <__PRETTY_FUNCTION__.14669+0xd0>
   1735b:	jmp    1731b <nbd_receive_negotiate+0xbb>
   1735d:	mov    r9d,0x14b
   17363:	lea    r8,[rip+0xa5d6]        # 21940 <__FUNCTION__.13821>
   1736a:	lea    rcx,[rip+0xa1f2]        # 21563 <__PRETTY_FUNCTION__.14669+0x43>
   17371:	lea    rdx,[rip+0xa250]        # 215c8 <__PRETTY_FUNCTION__.14669+0xa8>
   17378:	jmp    1731b <nbd_receive_negotiate+0xbb>
   1737a:	call   31c0 <__stack_chk_fail@plt>
   1737f:	nop

0000000000017380 <nbd_init>:
   17380:	push   r14
   17382:	xor    eax,eax
   17384:	mov    r14d,esi
   17387:	mov    esi,0xab01
   1738c:	push   r13
   1738e:	mov    r13,rcx
   17391:	push   r12
   17393:	mov    r12d,edi
   17396:	push   rbp
   17397:	mov    rbp,rdx
   1739a:	mov    rdx,rcx
   1739d:	push   rbx
   1739e:	call   3260 <ioctl@plt>
   173a3:	cmp    eax,0xffffffff
   173a6:	je     17411 <nbd_init+0x91>
   173a8:	mov    rax,rbp
   173ab:	xor    edx,edx
   173ad:	mov    esi,0xab07
   173b2:	mov    edi,r12d
   173b5:	div    r13
   173b8:	mov    rdx,rax
   173bb:	xor    eax,eax
   173bd:	call   3260 <ioctl@plt>
   173c2:	mov    ebx,eax
   173c4:	cmp    eax,0xffffffff
   173c7:	je     17452 <nbd_init+0xd2>
   173cd:	mov    esi,0xab04
   173d2:	mov    edi,r12d
   173d5:	xor    eax,eax
   173d7:	call   3260 <ioctl@plt>
   173dc:	mov    ebx,eax
   173de:	cmp    eax,0xffffffff
   173e1:	je     1747a <nbd_init+0xfa>
   173e7:	mov    edx,r14d
   173ea:	mov    esi,0xab00
   173ef:	mov    edi,r12d
   173f2:	xor    eax,eax
   173f4:	call   3260 <ioctl@plt>
   173f9:	mov    ebx,eax
   173fb:	cmp    eax,0xffffffff
   173fe:	je     174a2 <nbd_init+0x122>
   17404:	xor    ebx,ebx
   17406:	mov    eax,ebx
   17408:	pop    rbx
   17409:	pop    rbp
   1740a:	pop    r12
   1740c:	pop    r13
   1740e:	pop    r14
   17410:	ret
   17411:	mov    ebx,eax
   17413:	call   30d0 <__errno_location@plt>
   17418:	mov    r9d,0x161
   1741e:	lea    r8,[rip+0xa503]        # 21928 <__FUNCTION__.13829>
   17425:	lea    rcx,[rip+0xa137]        # 21563 <__PRETTY_FUNCTION__.14669+0x43>
   1742c:	mov    r12d,DWORD PTR [rax]
   1742f:	mov    rbp,rax
   17432:	lea    rdx,[rip+0xa1df]        # 21618 <__PRETTY_FUNCTION__.14669+0xf8>
   17439:	mov    rdi,QWORD PTR [rip+0x12ec0]        # 2a300 <stderr@@GLIBC_2.2.5>
   17440:	mov    esi,0x1
   17445:	xor    eax,eax
   17447:	call   3660 <__fprintf_chk@plt>
   1744c:	mov    DWORD PTR [rbp+0x0],r12d
   17450:	jmp    17406 <nbd_init+0x86>
   17452:	call   30d0 <__errno_location@plt>
   17457:	mov    r9d,0x16b
   1745d:	lea    r8,[rip+0xa4c4]        # 21928 <__FUNCTION__.13829>
   17464:	lea    rcx,[rip+0xa0f8]        # 21563 <__PRETTY_FUNCTION__.14669+0x43>
   1746b:	mov    rbp,rax
   1746e:	mov    r12d,DWORD PTR [rax]
   17471:	lea    rdx,[rip+0xa1d0]        # 21648 <__PRETTY_FUNCTION__.14669+0x128>
   17478:	jmp    17439 <nbd_init+0xb9>
   1747a:	call   30d0 <__errno_location@plt>
   1747f:	mov    r9d,0x174
   17485:	lea    r8,[rip+0xa49c]        # 21928 <__FUNCTION__.13829>
   1748c:	lea    rcx,[rip+0xa0d0]        # 21563 <__PRETTY_FUNCTION__.14669+0x43>
   17493:	mov    rbp,rax
   17496:	mov    r12d,DWORD PTR [rax]
   17499:	lea    rdx,[rip+0xa1d8]        # 21678 <__PRETTY_FUNCTION__.14669+0x158>
   174a0:	jmp    17439 <nbd_init+0xb9>
   174a2:	call   30d0 <__errno_location@plt>
   174a7:	mov    r9d,0x17d
   174ad:	lea    r8,[rip+0xa474]        # 21928 <__FUNCTION__.13829>
   174b4:	lea    rcx,[rip+0xa0a8]        # 21563 <__PRETTY_FUNCTION__.14669+0x43>
   174bb:	mov    rbp,rax
   174be:	mov    r12d,DWORD PTR [rax]
   174c1:	lea    rdx,[rip+0xa1e0]        # 216a8 <__PRETTY_FUNCTION__.14669+0x188>
   174c8:	jmp    17439 <nbd_init+0xb9>
   174cd:	nop    DWORD PTR [rax]

00000000000174d0 <nbd_disconnect>:
   174d0:	push   rbx
   174d1:	mov    esi,0xab05
   174d6:	mov    ebx,edi
   174d8:	xor    eax,eax
   174da:	call   3260 <ioctl@plt>
   174df:	mov    edi,ebx
   174e1:	mov    esi,0xab08
   174e6:	xor    eax,eax
   174e8:	call   3260 <ioctl@plt>
   174ed:	mov    edi,ebx
   174ef:	mov    esi,0xab04
   174f4:	xor    eax,eax
   174f6:	call   3260 <ioctl@plt>
   174fb:	xor    eax,eax
   174fd:	pop    rbx
   174fe:	ret
   174ff:	nop

0000000000017500 <nbd_client>:
   17500:	push   r13
   17502:	mov    esi,0xab03
   17507:	xor    eax,eax
   17509:	push   r12
   1750b:	push   rbp
   1750c:	push   rbx
   1750d:	mov    ebx,edi
   1750f:	sub    rsp,0x8
   17513:	call   3260 <ioctl@plt>
   17518:	mov    r12d,eax
   1751b:	call   30d0 <__errno_location@plt>
   17520:	mov    edi,ebx
   17522:	mov    esi,0xab05
   17527:	mov    r13d,DWORD PTR [rax]
   1752a:	mov    rbp,rax
   1752d:	xor    eax,eax
   1752f:	call   3260 <ioctl@plt>
   17534:	mov    edi,ebx
   17536:	mov    esi,0xab04
   1753b:	xor    eax,eax
   1753d:	call   3260 <ioctl@plt>
   17542:	mov    DWORD PTR [rbp+0x0],r13d
   17546:	add    rsp,0x8
   1754a:	mov    eax,r12d
   1754d:	pop    rbx
   1754e:	pop    rbp
   1754f:	pop    r12
   17551:	pop    r13
   17553:	ret
   17554:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   1755f:	nop

0000000000017560 <nbd_send_request>:
   17560:	sub    rsp,0x38
   17564:	xor    ecx,ecx
   17566:	mov    edx,0x1c
   1756b:	mov    rax,QWORD PTR fs:0x28
   17574:	mov    QWORD PTR [rsp+0x28],rax
   17579:	xor    eax,eax
   1757b:	mov    eax,DWORD PTR [rsi]
   1757d:	mov    DWORD PTR [rsp],0x13956025
   17584:	bswap  eax
   17586:	mov    DWORD PTR [rsp+0x4],eax
   1758a:	mov    rax,QWORD PTR [rsi+0x8]
   1758e:	bswap  rax
   17591:	mov    QWORD PTR [rsp+0x8],rax
   17596:	mov    rax,QWORD PTR [rsi+0x10]
   1759a:	bswap  rax
   1759d:	mov    QWORD PTR [rsp+0x10],rax
   175a2:	mov    eax,DWORD PTR [rsi+0x18]
   175a5:	mov    rsi,rsp
   175a8:	bswap  eax
   175aa:	mov    DWORD PTR [rsp+0x18],eax
   175ae:	call   16ce0 <nbd_wr_sync>
   175b3:	cmp    rax,0x1c
   175b7:	jne    175d0 <nbd_send_request+0x70>
   175b9:	xor    eax,eax
   175bb:	mov    rdx,QWORD PTR [rsp+0x28]
   175c0:	xor    rdx,QWORD PTR fs:0x28
   175c9:	jne    17610 <nbd_send_request+0xb0>
   175cb:	add    rsp,0x38
   175cf:	ret
   175d0:	mov    rdi,QWORD PTR [rip+0x12d29]        # 2a300 <stderr@@GLIBC_2.2.5>
   175d7:	mov    r9d,0x1c5
   175dd:	xor    eax,eax
   175df:	lea    r8,[rip+0xa32a]        # 21910 <__FUNCTION__.13847>
   175e6:	lea    rcx,[rip+0x9f76]        # 21563 <__PRETTY_FUNCTION__.14669+0x43>
   175ed:	lea    rdx,[rip+0x9fac]        # 215a0 <__PRETTY_FUNCTION__.14669+0x80>
   175f4:	mov    esi,0x1
   175f9:	call   3660 <__fprintf_chk@plt>
   175fe:	call   30d0 <__errno_location@plt>
   17603:	mov    DWORD PTR [rax],0x16
   17609:	mov    eax,0xffffffff
   1760e:	jmp    175bb <nbd_send_request+0x5b>
   17610:	call   31c0 <__stack_chk_fail@plt>
   17615:	data16 nop WORD PTR cs:[rax+rax*1+0x0]

0000000000017620 <nbd_receive_reply>:
   17620:	push   rbx
   17621:	mov    ecx,0x1
   17626:	mov    rbx,rsi
   17629:	mov    edx,0x10
   1762e:	sub    rsp,0x20
   17632:	movdqa xmm0,XMMWORD PTR [rip+0xa336]        # 21970 <__FUNCTION__.13813+0x18>
   1763a:	mov    rax,QWORD PTR fs:0x28
   17643:	mov    QWORD PTR [rsp+0x18],rax
   17648:	xor    eax,eax
   1764a:	mov    rsi,rsp
   1764d:	movaps XMMWORD PTR [rsp],xmm0
   17651:	call   16ce0 <nbd_wr_sync>
   17656:	cmp    rax,0x10
   1765a:	jne    17698 <nbd_receive_reply+0x78>
   1765c:	mov    edx,DWORD PTR [rsp+0x4]
   17660:	mov    eax,DWORD PTR [rsp]
   17663:	bswap  edx
   17665:	mov    DWORD PTR [rbx],edx
   17667:	mov    rdx,QWORD PTR [rsp+0x8]
   1766c:	bswap  eax
   1766e:	bswap  rdx
   17671:	mov    QWORD PTR [rbx+0x8],rdx
   17675:	cmp    eax,0x67446698
   1767a:	jne    176d8 <nbd_receive_reply+0xb8>
   1767c:	xor    eax,eax
   1767e:	mov    rcx,QWORD PTR [rsp+0x18]
   17683:	xor    rcx,QWORD PTR fs:0x28
   1768c:	jne    17722 <nbd_receive_reply+0x102>
   17692:	add    rsp,0x20
   17696:	pop    rbx
   17697:	ret
   17698:	mov    rdi,QWORD PTR [rip+0x12c61]        # 2a300 <stderr@@GLIBC_2.2.5>
   1769f:	mov    r9d,0x1fa
   176a5:	xor    eax,eax
   176a7:	lea    r8,[rip+0xa242]        # 218f0 <__FUNCTION__.13861>
   176ae:	lea    rcx,[rip+0x9eae]        # 21563 <__PRETTY_FUNCTION__.14669+0x43>
   176b5:	lea    rdx,[rip+0x9ec8]        # 21584 <__PRETTY_FUNCTION__.14669+0x64>
   176bc:	mov    esi,0x1
   176c1:	call   3660 <__fprintf_chk@plt>
   176c6:	call   30d0 <__errno_location@plt>
   176cb:	mov    DWORD PTR [rax],0x16
   176d1:	mov    eax,0xffffffff
   176d6:	jmp    1767e <nbd_receive_reply+0x5e>
   176d8:	sub    rsp,0x8
   176dc:	mov    rdi,QWORD PTR [rip+0x12c1d]        # 2a300 <stderr@@GLIBC_2.2.5>
   176e3:	lea    rdx,[rip+0x9fe6]        # 216d0 <__PRETTY_FUNCTION__.14669+0x1b0>
   176ea:	mov    r9d,0x20e
   176f0:	push   rax
   176f1:	lea    r8,[rip+0xa1f8]        # 218f0 <__FUNCTION__.13861>
   176f8:	lea    rcx,[rip+0x9e64]        # 21563 <__PRETTY_FUNCTION__.14669+0x43>
   176ff:	xor    eax,eax
   17701:	mov    esi,0x1
   17706:	call   3660 <__fprintf_chk@plt>
   1770b:	call   30d0 <__errno_location@plt>
   17710:	mov    DWORD PTR [rax],0x16
   17716:	pop    rax
   17717:	mov    eax,0xffffffff
   1771c:	pop    rdx
   1771d:	jmp    1767e <nbd_receive_reply+0x5e>
   17722:	call   31c0 <__stack_chk_fail@plt>
   17727:	nop    WORD PTR [rax+rax*1+0x0]

0000000000017730 <nbd_trip>:
   17730:	push   r15
   17732:	mov    r15,rdi
   17735:	push   r14
   17737:	mov    r14,r8
   1773a:	push   r13
   1773c:	push   r12
   1773e:	mov    r12,rcx
   17741:	mov    ecx,0x1
   17746:	push   rbp
   17747:	mov    rbp,rdx
   1774a:	mov    edx,0x1c
   1774f:	push   rbx
   17750:	mov    ebx,esi
   17752:	mov    edi,ebx
   17754:	sub    rsp,0x58
   17758:	mov    DWORD PTR [rsp],r9d
   1775c:	lea    rsi,[rsp+0x20]
   17761:	mov    r13,QWORD PTR [rsp+0x90]
   17769:	mov    rax,QWORD PTR fs:0x28
   17772:	mov    QWORD PTR [rsp+0x48],rax
   17777:	xor    eax,eax
   17779:	call   16ce0 <nbd_wr_sync>
   1777e:	cmp    rax,0x1c
   17782:	jne    17ace <nbd_trip+0x39e>
   17788:	mov    eax,DWORD PTR [rsp+0x20]
   1778c:	mov    r8d,DWORD PTR [rsp+0x38]
   17791:	mov    edx,DWORD PTR [rsp+0x24]
   17795:	mov    rcx,QWORD PTR [rsp+0x28]
   1779a:	bswap  eax
   1779c:	mov    r9,QWORD PTR [rsp+0x30]
   177a1:	bswap  r8d
   177a4:	cmp    eax,0x25609513
   177a9:	jne    17aee <nbd_trip+0x3be>
   177af:	cmp    DWORD PTR [rsp+0x98],r8d
   177b7:	jb     17908 <nbd_trip+0x1d8>
   177bd:	mov    r10d,r8d
   177c0:	bswap  r9
   177c3:	mov    rax,r10
   177c6:	add    rax,r9
   177c9:	jb     17b38 <nbd_trip+0x408>
   177cf:	cmp    rax,rbp
   177d2:	ja     17938 <nbd_trip+0x208>
   177d8:	mov    eax,edx
   177da:	bswap  rcx
   177dd:	mov    rbp,rcx
   177e0:	bswap  eax
   177e2:	cmp    eax,0x1
   177e5:	je     17870 <nbd_trip+0x140>
   177eb:	test   eax,eax
   177ed:	je     179d0 <nbd_trip+0x2a0>
   177f3:	cmp    eax,0x2
   177f6:	je     179b8 <nbd_trip+0x288>
   177fc:	sub    rsp,0x8
   17800:	mov    r9d,0x28f
   17806:	lea    r8,[rip+0xa0cb]        # 218d8 <__FUNCTION__.13880>
   1780d:	push   rax
   1780e:	lea    rcx,[rip+0x9d4e]        # 21563 <__PRETTY_FUNCTION__.14669+0x43>
   17815:	lea    rdx,[rip+0xa054]        # 21870 <__PRETTY_FUNCTION__.14669+0x350>
   1781c:	mov    rdi,QWORD PTR [rip+0x12add]        # 2a300 <stderr@@GLIBC_2.2.5>
   17823:	mov    esi,0x1
   17828:	xor    eax,eax
   1782a:	mov    r12d,0xffffffff
   17830:	call   3660 <__fprintf_chk@plt>
   17835:	call   30d0 <__errno_location@plt>
   1783a:	mov    DWORD PTR [rax],0x16
   17840:	pop    rax
   17841:	pop    rdx
   17842:	mov    rbx,QWORD PTR [rsp+0x48]
   17847:	xor    rbx,QWORD PTR fs:0x28
   17850:	mov    eax,r12d
   17853:	jne    17b33 <nbd_trip+0x403>
   17859:	add    rsp,0x58
   1785d:	pop    rbx
   1785e:	pop    rbp
   1785f:	pop    r12
   17861:	pop    r13
   17863:	pop    r14
   17865:	pop    r15
   17867:	ret
   17868:	nop    DWORD PTR [rax+rax*1+0x0]
   17870:	mov    rdx,r10
   17873:	mov    ecx,0x1
   17878:	mov    rsi,r13
   1787b:	mov    edi,ebx
   1787d:	mov    DWORD PTR [rsp+0x1c],r8d
   17882:	mov    QWORD PTR [rsp+0x10],r9
   17887:	mov    QWORD PTR [rsp+0x8],r10
   1788c:	call   16ce0 <nbd_wr_sync>
   17891:	mov    r10,QWORD PTR [rsp+0x8]
   17896:	mov    r9,QWORD PTR [rsp+0x10]
   1789b:	mov    r8d,DWORD PTR [rsp+0x1c]
   178a0:	cmp    r10,rax
   178a3:	jne    17a70 <nbd_trip+0x340>
   178a9:	cmp    BYTE PTR [rsp],0x0
   178ad:	mov    QWORD PTR [rsp+0x8],r10
   178b2:	jne    17a60 <nbd_trip+0x330>
   178b8:	lea    rsi,[r12+r9*1]
   178bc:	mov    ecx,r8d
   178bf:	mov    rdx,r13
   178c2:	mov    rdi,r15
   178c5:	shr    ecx,0x9
   178c8:	shr    rsi,0x9
   178cc:	call   18650 <bdrv_write>
   178d1:	mov    r10,QWORD PTR [rsp+0x8]
   178d6:	cmp    eax,0xffffffff
   178d9:	mov    r12d,eax
   178dc:	je     17b13 <nbd_trip+0x3e3>
   178e2:	add    QWORD PTR [r14],r10
   178e5:	xor    esi,esi
   178e7:	mov    rdx,rbp
   178ea:	mov    edi,ebx
   178ec:	xor    r12d,r12d
   178ef:	call   16d60 <nbd_send_reply.isra.0>
   178f4:	cmp    eax,0xffffffff
   178f7:	sete   r12b
   178fb:	neg    r12d
   178fe:	jmp    17842 <nbd_trip+0x112>
   17903:	nop    DWORD PTR [rax+rax*1+0x0]
   17908:	mov    eax,DWORD PTR [rsp+0x98]
   1790f:	mov    r9d,0x239
   17915:	lea    rcx,[rip+0x9c47]        # 21563 <__PRETTY_FUNCTION__.14669+0x43>
   1791c:	lea    rdx,[rip+0x9dd5]        # 216f8 <__PRETTY_FUNCTION__.14669+0x1d8>
   17923:	push   rax
   17924:	push   r8
   17926:	lea    r8,[rip+0x9fab]        # 218d8 <__FUNCTION__.13880>
   1792d:	jmp    1781c <nbd_trip+0xec>
   17932:	nop    WORD PTR [rax+rax*1+0x0]
   17938:	push   r12
   1793a:	mov    rdi,QWORD PTR [rip+0x129bf]        # 2a300 <stderr@@GLIBC_2.2.5>
   17941:	mov    esi,0x1
   17946:	xor    eax,eax
   17948:	push   rbp
   17949:	lea    rcx,[rip+0x9c13]        # 21563 <__PRETTY_FUNCTION__.14669+0x43>
   17950:	lea    rdx,[rip+0x9e21]        # 21778 <__PRETTY_FUNCTION__.14669+0x258>
   17957:	push   r8
   17959:	lea    r8,[rip+0x9f78]        # 218d8 <__FUNCTION__.13880>
   17960:	push   r9
   17962:	mov    r9d,0x248
   17968:	call   3660 <__fprintf_chk@plt>
   1796d:	add    rsp,0x20
   17971:	mov    r9d,0x249
   17977:	lea    r8,[rip+0x9f5a]        # 218d8 <__FUNCTION__.13880>
   1797e:	lea    rcx,[rip+0x9bde]        # 21563 <__PRETTY_FUNCTION__.14669+0x43>
   17985:	lea    rdx,[rip+0x9e2c]        # 217b8 <__PRETTY_FUNCTION__.14669+0x298>
   1798c:	mov    rdi,QWORD PTR [rip+0x1296d]        # 2a300 <stderr@@GLIBC_2.2.5>
   17993:	mov    esi,0x1
   17998:	xor    eax,eax
   1799a:	mov    r12d,0xffffffff
   179a0:	call   3660 <__fprintf_chk@plt>
   179a5:	call   30d0 <__errno_location@plt>
   179aa:	mov    DWORD PTR [rax],0x16
   179b0:	jmp    17842 <nbd_trip+0x112>
   179b5:	nop    DWORD PTR [rax]
   179b8:	call   30d0 <__errno_location@plt>
   179bd:	mov    r12d,0x1
   179c3:	mov    DWORD PTR [rax],0x0
   179c9:	jmp    17842 <nbd_trip+0x112>
   179ce:	xchg   ax,ax
   179d0:	lea    rsi,[r12+r9*1]
   179d4:	mov    ecx,r8d
   179d7:	mov    rdx,r13
   179da:	mov    rdi,r15
   179dd:	shr    ecx,0x9
   179e0:	shr    rsi,0x9
   179e4:	mov    QWORD PTR [rsp],r10
   179e8:	call   18210 <bdrv_read>
   179ed:	mov    r10,QWORD PTR [rsp]
   179f1:	cmp    eax,0xffffffff
   179f4:	mov    r12d,eax
   179f7:	je     17a90 <nbd_trip+0x360>
   179fd:	add    QWORD PTR [r14],r10
   17a00:	mov    rdx,rbp
   17a03:	xor    esi,esi
   17a05:	mov    edi,ebx
   17a07:	mov    QWORD PTR [rsp],r10
   17a0b:	call   16d60 <nbd_send_reply.isra.0>
   17a10:	mov    r12d,eax
   17a13:	cmp    eax,0xffffffff
   17a16:	je     17842 <nbd_trip+0x112>
   17a1c:	mov    r10,QWORD PTR [rsp]
   17a20:	xor    ecx,ecx
   17a22:	mov    rsi,r13
   17a25:	mov    edi,ebx
   17a27:	xor    r12d,r12d
   17a2a:	mov    rdx,r10
   17a2d:	call   16ce0 <nbd_wr_sync>
   17a32:	mov    r10,QWORD PTR [rsp]
   17a36:	cmp    r10,rax
   17a39:	je     17842 <nbd_trip+0x112>
   17a3f:	mov    r9d,0x267
   17a45:	lea    r8,[rip+0x9e8c]        # 218d8 <__FUNCTION__.13880>
   17a4c:	lea    rcx,[rip+0x9b10]        # 21563 <__PRETTY_FUNCTION__.14669+0x43>
   17a53:	lea    rdx,[rip+0x9b46]        # 215a0 <__PRETTY_FUNCTION__.14669+0x80>
   17a5a:	jmp    1798c <nbd_trip+0x25c>
   17a5f:	nop
   17a60:	mov    esi,0x1
   17a65:	jmp    178e7 <nbd_trip+0x1b7>
   17a6a:	nop    WORD PTR [rax+rax*1+0x0]
   17a70:	mov    r9d,0x272
   17a76:	lea    r8,[rip+0x9e5b]        # 218d8 <__FUNCTION__.13880>
   17a7d:	lea    rcx,[rip+0x9adf]        # 21563 <__PRETTY_FUNCTION__.14669+0x43>
   17a84:	lea    rdx,[rip+0x9d8d]        # 21818 <__PRETTY_FUNCTION__.14669+0x2f8>
   17a8b:	jmp    1798c <nbd_trip+0x25c>
   17a90:	mov    r9d,0x259
   17a96:	lea    r8,[rip+0x9e3b]        # 218d8 <__FUNCTION__.13880>
   17a9d:	lea    rcx,[rip+0x9abf]        # 21563 <__PRETTY_FUNCTION__.14669+0x43>
   17aa4:	lea    rdx,[rip+0x9d45]        # 217f0 <__PRETTY_FUNCTION__.14669+0x2d0>
   17aab:	mov    rdi,QWORD PTR [rip+0x1284e]        # 2a300 <stderr@@GLIBC_2.2.5>
   17ab2:	mov    esi,0x1
   17ab7:	xor    eax,eax
   17ab9:	call   3660 <__fprintf_chk@plt>
   17abe:	call   30d0 <__errno_location@plt>
   17ac3:	mov    DWORD PTR [rax],0x16
   17ac9:	jmp    17842 <nbd_trip+0x112>
   17ace:	mov    r9d,0x1d3
   17ad4:	lea    r8,[rip+0x9de5]        # 218c0 <__FUNCTION__.13854>
   17adb:	lea    rcx,[rip+0x9a81]        # 21563 <__PRETTY_FUNCTION__.14669+0x43>
   17ae2:	lea    rdx,[rip+0x9a9b]        # 21584 <__PRETTY_FUNCTION__.14669+0x64>
   17ae9:	jmp    1798c <nbd_trip+0x25c>
   17aee:	sub    rsp,0x8
   17af2:	mov    r9d,0x1eb
   17af8:	lea    r8,[rip+0x9dc1]        # 218c0 <__FUNCTION__.13854>
   17aff:	push   rax
   17b00:	lea    rcx,[rip+0x9a5c]        # 21563 <__PRETTY_FUNCTION__.14669+0x43>
   17b07:	lea    rdx,[rip+0x9bc2]        # 216d0 <__PRETTY_FUNCTION__.14669+0x1b0>
   17b0e:	jmp    1781c <nbd_trip+0xec>
   17b13:	mov    r9d,0x27f
   17b19:	lea    r8,[rip+0x9db8]        # 218d8 <__FUNCTION__.13880>
   17b20:	lea    rcx,[rip+0x9a3c]        # 21563 <__PRETTY_FUNCTION__.14669+0x43>
   17b27:	lea    rdx,[rip+0x9d1a]        # 21848 <__PRETTY_FUNCTION__.14669+0x328>
   17b2e:	jmp    17aab <nbd_trip+0x37b>
   17b33:	call   31c0 <__stack_chk_fail@plt>
   17b38:	mov    r9d,0x240
   17b3e:	lea    r8,[rip+0x9d93]        # 218d8 <__FUNCTION__.13880>
   17b45:	lea    rcx,[rip+0x9a17]        # 21563 <__PRETTY_FUNCTION__.14669+0x43>
   17b4c:	lea    rdx,[rip+0x9bdd]        # 21730 <__PRETTY_FUNCTION__.14669+0x210>
   17b53:	jmp    1798c <nbd_trip+0x25c>
   17b58:	nop    DWORD PTR [rax+rax*1+0x0]

0000000000017b60 <bdrv_register>:
   17b60:	cmp    QWORD PTR [rdi+0x60],0x0
   17b65:	je     17be0 <bdrv_register+0x80>
   17b67:	cmp    QWORD PTR [rdi+0x20],0x0
   17b6c:	mov    rax,QWORD PTR [rdi+0x70]
   17b70:	mov    edx,DWORD PTR [rdi+0x80]
   17b76:	je     17bb8 <bdrv_register+0x58>
   17b78:	cmp    QWORD PTR [rdi+0x78],0x0
   17b7d:	je     17c1b <bdrv_register+0xbb>
   17b83:	mov    QWORD PTR [rdi+0x120],rax
   17b8a:	mov    rax,QWORD PTR [rip+0x127ef]        # 2a380 <first_drv>
   17b91:	mov    DWORD PTR [rdi+0x128],edx
   17b97:	mov    QWORD PTR [rdi+0x130],0x0
   17ba2:	mov    QWORD PTR [rdi+0x138],rax
   17ba9:	mov    QWORD PTR [rip+0x127d0],rdi        # 2a380 <first_drv>
   17bb0:	ret
   17bb1:	nop    DWORD PTR [rax+0x0]
   17bb8:	cmp    QWORD PTR [rdi+0x90],0x0
   17bc0:	jne    17b78 <bdrv_register+0x18>
   17bc2:	lea    rsi,[rip+0x2557]        # 1a120 <bdrv_read_em>
   17bc9:	mov    QWORD PTR [rdi+0x20],rsi
   17bcd:	lea    rsi,[rip+0x28cc]        # 1a4a0 <bdrv_write_em>
   17bd4:	mov    QWORD PTR [rdi+0x28],rsi
   17bd8:	jmp    17b78 <bdrv_register+0x18>
   17bda:	nop    WORD PTR [rax+rax*1+0x0]
   17be0:	lea    rax,[rip+0x2b99]        # 1a780 <bdrv_aio_read_em>
   17be7:	cmp    QWORD PTR [rdi+0x78],0x0
   17bec:	mov    edx,0x38
   17bf1:	mov    DWORD PTR [rdi+0x80],0x38
   17bfb:	mov    QWORD PTR [rdi+0x60],rax
   17bff:	lea    rax,[rip+0x2bea]        # 1a7f0 <bdrv_aio_write_em>
   17c06:	mov    QWORD PTR [rdi+0x68],rax
   17c0a:	lea    rax,[rip+0x1bf]        # 17dd0 <bdrv_aio_cancel_em>
   17c11:	mov    QWORD PTR [rdi+0x70],rax
   17c15:	jne    17b83 <bdrv_register+0x23>
   17c1b:	lea    rcx,[rip+0x2ace]        # 1a6f0 <bdrv_aio_flush_em>
   17c22:	mov    QWORD PTR [rdi+0x78],rcx
   17c26:	jmp    17b83 <bdrv_register+0x23>
   17c2b:	nop    DWORD PTR [rax+rax*1+0x0]

0000000000017c30 <bdrv_invalid_protocol_open>:
   17c30:	mov    eax,0xfffffffe
   17c35:	ret
   17c36:	nop    WORD PTR cs:[rax+rax*1+0x0]

0000000000017c50 <bdrv_rw_em_cb>:
   17c50:	mov    DWORD PTR [rdi],esi
   17c52:	ret
   17c53:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   17c5e:	xchg   ax,ax

0000000000017dd0 <bdrv_aio_cancel_em>:
   17dd0:	push   rbx
   17dd1:	mov    rbx,rdi
   17dd4:	mov    rdi,QWORD PTR [rdi+0x28]
   17dd8:	call   5180 <qemu_bh_delete>
   17ddd:	mov    rax,QWORD PTR [rbx]
   17de0:	mov    QWORD PTR [rbx+0x28],0x0
   17de8:	mov    rdx,QWORD PTR [rax+0x10]
   17dec:	mov    QWORD PTR [rbx+0x20],rdx
   17df0:	mov    QWORD PTR [rax+0x10],rbx
   17df4:	pop    rbx
   17df5:	ret
   17df6:	nop    WORD PTR cs:[rax+rax*1+0x0]

0000000000017eb0 <path_is_absolute>:
   17eb0:	push   rbx
   17eb1:	mov    esi,0x3a
   17eb6:	mov    rbx,rdi
   17eb9:	call   31e0 <strchr@plt>
   17ebe:	test   rax,rax
   17ec1:	lea    rdx,[rax+0x1]
   17ec5:	cmovne rbx,rdx
   17ec9:	xor    eax,eax
   17ecb:	cmp    BYTE PTR [rbx],0x2f
   17ece:	pop    rbx
   17ecf:	sete   al
   17ed2:	ret
   17ed3:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   17ede:	xchg   ax,ax

0000000000017ee0 <path_combine>:
   17ee0:	test   esi,esi
   17ee2:	jle    17fa0 <path_combine+0xc0>
   17ee8:	push   r15
   17eea:	push   r14
   17eec:	push   r13
   17eee:	movsxd r13,esi
   17ef1:	mov    esi,0x3a
   17ef6:	push   r12
   17ef8:	mov    r12,rdi
   17efb:	mov    rdi,rcx
   17efe:	mov    r14,r13
   17f01:	push   rbp
   17f02:	mov    rbp,rcx
   17f05:	push   rbx
   17f06:	mov    rbx,rdx
   17f09:	sub    rsp,0x8
   17f0d:	call   31e0 <strchr@plt>
   17f12:	test   rax,rax
   17f15:	lea    rdx,[rax+0x1]
   17f19:	cmove  rdx,rbp
   17f1d:	cmp    BYTE PTR [rdx],0x2f
   17f20:	je     17fd0 <path_combine+0xf0>
   17f26:	mov    esi,0x3a
   17f2b:	mov    rdi,rbx
   17f2e:	call   31e0 <strchr@plt>
   17f33:	mov    esi,0x2f
   17f38:	mov    rdi,rbx
   17f3b:	mov    r15,rax
   17f3e:	call   3210 <strrchr@plt>
   17f43:	test   r15,r15
   17f46:	je     17fb8 <path_combine+0xd8>
   17f48:	lea    rdx,[r15+0x1]
   17f4c:	mov    r8,rbx
   17f4f:	test   rax,rax
   17f52:	je     17f58 <path_combine+0x78>
   17f54:	lea    r8,[rax+0x1]
   17f58:	cmp    r8,rdx
   17f5b:	cmovae rdx,r8
   17f5f:	sub    rdx,rbx
   17f62:	cmp    r14d,edx
   17f65:	jg     17fa8 <path_combine+0xc8>
   17f67:	lea    edx,[r14-0x1]
   17f6b:	movsxd rdx,edx
   17f6e:	lea    r14,[r12+rdx*1]
   17f72:	mov    rsi,rbx
   17f75:	mov    rdi,r12
   17f78:	call   33b0 <memcpy@plt>
   17f7d:	mov    BYTE PTR [r14],0x0
   17f81:	add    rsp,0x8
   17f85:	mov    rdx,rbp
   17f88:	pop    rbx
   17f89:	mov    rsi,r13
   17f8c:	pop    rbp
   17f8d:	mov    rdi,r12
   17f90:	pop    r12
   17f92:	pop    r13
   17f94:	pop    r14
   17f96:	pop    r15
   17f98:	jmp    55a0 <pstrcat>
   17f9d:	nop    DWORD PTR [rax]
   17fa0:	ret
   17fa1:	nop    DWORD PTR [rax+0x0]
   17fa8:	movsxd rdx,edx
   17fab:	lea    r14,[r12+rdx*1]
   17faf:	jmp    17f72 <path_combine+0x92>
   17fb1:	nop    DWORD PTR [rax+0x0]
   17fb8:	mov    rdx,rbx
   17fbb:	test   rax,rax
   17fbe:	jne    17f54 <path_combine+0x74>
   17fc0:	mov    r14,r12
   17fc3:	xor    edx,edx
   17fc5:	jmp    17f72 <path_combine+0x92>
   17fc7:	nop    WORD PTR [rax+rax*1+0x0]
   17fd0:	add    rsp,0x8
   17fd4:	mov    rdx,rbp
   17fd7:	mov    rsi,r13
   17fda:	mov    rdi,r12
   17fdd:	pop    rbx
   17fde:	pop    rbp
   17fdf:	pop    r12
   17fe1:	pop    r13
   17fe3:	pop    r14
   17fe5:	pop    r15
   17fe7:	jmp    5560 <pstrcpy>
   17fec:	nop    DWORD PTR [rax+0x0]

0000000000017ff0 <bdrv_new>:
   17ff0:	push   rbp
   17ff1:	mov    rbp,rdi
   17ff4:	mov    edi,0x8c8
   17ff9:	push   rbx
   17ffa:	sub    rsp,0x8
   17ffe:	call   59c0 <qemu_mallocz>
   18003:	mov    rdx,rbp
   18006:	mov    esi,0x20
   1800b:	lea    rdi,[rax+0x898]
   18012:	mov    rbx,rax
   18015:	call   5560 <pstrcpy>
   1801a:	cmp    BYTE PTR [rbp+0x0],0x0
   1801e:	je     18051 <bdrv_new+0x61>
   18020:	mov    rcx,QWORD PTR [rip+0x12471]        # 2a498 <bdrv_first>
   18027:	test   rcx,rcx
   1802a:	jne    1803b <bdrv_new+0x4b>
   1802c:	lea    rcx,[rip+0x12465]        # 2a498 <bdrv_first>
   18033:	jmp    1804e <bdrv_new+0x5e>
   18035:	nop    DWORD PTR [rax]
   18038:	mov    rcx,rdx
   1803b:	mov    rdx,QWORD PTR [rcx+0x8b8]
   18042:	test   rdx,rdx
   18045:	jne    18038 <bdrv_new+0x48>
   18047:	add    rcx,0x8b8
   1804e:	mov    QWORD PTR [rcx],rbx
   18051:	add    rsp,0x8
   18055:	mov    rax,rbx
   18058:	pop    rbx
   18059:	pop    rbp
   1805a:	ret
   1805b:	nop    DWORD PTR [rax+rax*1+0x0]

0000000000018060 <bdrv_find_format>:
   18060:	push   rbp
   18061:	push   rbx
   18062:	sub    rsp,0x8
   18066:	mov    rbx,QWORD PTR [rip+0x12313]        # 2a380 <first_drv>
   1806d:	test   rbx,rbx
   18070:	je     1809b <bdrv_find_format+0x3b>
   18072:	mov    rbp,rdi
   18075:	jmp    1808c <bdrv_find_format+0x2c>
   18077:	nop    WORD PTR [rax+rax*1+0x0]
   18080:	mov    rbx,QWORD PTR [rbx+0x138]
   18087:	test   rbx,rbx
   1808a:	je     1809b <bdrv_find_format+0x3b>
   1808c:	mov    rdi,QWORD PTR [rbx]
   1808f:	mov    rsi,rbp
   18092:	call   3350 <strcmp@plt>
   18097:	test   eax,eax
   18099:	jne    18080 <bdrv_find_format+0x20>
   1809b:	add    rsp,0x8
   1809f:	mov    rax,rbx
   180a2:	pop    rbx
   180a3:	pop    rbp
   180a4:	ret
   180a5:	data16 nop WORD PTR cs:[rax+rax*1+0x0]

00000000000180d0 <get_tmp_filename>:
   180d0:	push   rbp
   180d1:	mov    rbp,rdi
   180d4:	lea    rdi,[rip+0x98aa]        # 21985 <__FUNCTION__.13813+0x2d>
   180db:	push   rbx
   180dc:	mov    ebx,esi
   180de:	sub    rsp,0x8
   180e2:	call   3040 <getenv@plt>
   180e7:	movsxd rsi,ebx
   180ea:	mov    rdi,rbp
   180ed:	mov    edx,0x1
   180f2:	test   rax,rax
   180f5:	lea    r9,[rip+0x9884]        # 21980 <__FUNCTION__.13813+0x28>
   180fc:	lea    r8,[rip+0x9889]        # 2198c <__FUNCTION__.13813+0x34>
   18103:	mov    rcx,0xffffffffffffffff
   1810a:	cmovne r9,rax
   1810e:	xor    eax,eax
   18110:	call   3060 <__snprintf_chk@plt>
   18115:	mov    rdi,rbp
   18118:	call   3300 <mkstemp64@plt>
   1811d:	add    rsp,0x8
   18121:	pop    rbx
   18122:	mov    edi,eax
   18124:	pop    rbp
   18125:	jmp    3270 <close@plt>
   1812a:	nop    WORD PTR [rax+rax*1+0x0]

0000000000018130 <bdrv_delete>:
   18130:	mov    rax,QWORD PTR [rip+0x12361]        # 2a498 <bdrv_first>
   18137:	push   rbx
   18138:	mov    rbx,rdi
   1813b:	cmp    rax,rdi
   1813e:	je     18196 <bdrv_delete+0x66>
   18140:	test   rax,rax
   18143:	jne    18155 <bdrv_delete+0x25>
   18145:	jmp    18174 <bdrv_delete+0x44>
   18147:	nop    WORD PTR [rax+rax*1+0x0]
   18150:	test   rax,rax
   18153:	je     18180 <bdrv_delete+0x50>
   18155:	lea    rdx,[rax+0x8b8]
   1815c:	mov    rax,QWORD PTR [rax+0x8b8]
   18163:	cmp    rbx,rax
   18166:	jne    18150 <bdrv_delete+0x20>
   18168:	mov    rax,QWORD PTR [rbx+0x8b8]
   1816f:	mov    QWORD PTR [rdx],rax
   18172:	jmp    18185 <bdrv_delete+0x55>
   18174:	lea    rdx,[rip+0x1231d]        # 2a498 <bdrv_first>
   1817b:	nop    DWORD PTR [rax+rax*1+0x0]
   18180:	test   rbx,rbx
   18183:	je     18168 <bdrv_delete+0x38>
   18185:	mov    rdi,rbx
   18188:	call   181a0 <bdrv_close>
   1818d:	mov    rdi,rbx
   18190:	pop    rbx
   18191:	jmp    5960 <qemu_free>
   18196:	lea    rdx,[rip+0x122fb]        # 2a498 <bdrv_first>
   1819d:	jmp    18168 <bdrv_delete+0x38>
   1819f:	nop

0000000000019080 <bdrv_file_open>:
   19080:	push   r13
   19082:	mov    r13,rdi
   19085:	lea    rdi,[rip+0x7bd6]        # 20c62 <desc_template.13939+0x382>
   1908c:	push   r12
   1908e:	mov    r12,rsi
   19091:	push   rbp
   19092:	push   rbx
   19093:	mov    ebx,edx
   19095:	or     ebx,0x10
   19098:	sub    rsp,0x18
   1909c:	call   17ff0 <bdrv_new>
   190a1:	mov    edx,ebx
   190a3:	lea    rcx,[rip+0x110f6]        # 2a1a0 <bdrv_raw>
   190aa:	mov    rsi,r12
   190ad:	mov    rdi,rax
   190b0:	mov    rbp,rax
   190b3:	call   18b80 <bdrv_open2>
   190b8:	test   eax,eax
   190ba:	js     190e0 <bdrv_file_open+0x60>
   190bc:	mov    DWORD PTR [rbp+0x880],0x1
   190c6:	xor    eax,eax
   190c8:	mov    QWORD PTR [r13+0x0],rbp
   190cc:	add    rsp,0x18
   190d0:	pop    rbx
   190d1:	pop    rbp
   190d2:	pop    r12
   190d4:	pop    r13
   190d6:	ret
   190d7:	nop    WORD PTR [rax+rax*1+0x0]
   190e0:	mov    rdi,rbp
   190e3:	mov    DWORD PTR [rsp+0xc],eax
   190e7:	call   18130 <bdrv_delete>
   190ec:	mov    eax,DWORD PTR [rsp+0xc]
   190f0:	add    rsp,0x18
   190f4:	pop    rbx
   190f5:	pop    rbp
   190f6:	pop    r12
   190f8:	pop    r13
   190fa:	ret
   190fb:	nop    DWORD PTR [rax+rax*1+0x0]

0000000000019440 <bdrv_set_geometry_hint>:
   19440:	mov    DWORD PTR [rdi+0x884],esi
   19446:	mov    DWORD PTR [rdi+0x888],edx
   1944c:	mov    DWORD PTR [rdi+0x88c],ecx
   19452:	ret
   19453:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   1945e:	xchg   ax,ax

0000000000019460 <bdrv_set_type_hint>:
   19460:	mov    DWORD PTR [rdi+0x894],esi
   19466:	sub    esi,0x1
   19469:	xor    eax,eax
   1946b:	cmp    esi,0x1
   1946e:	setbe  al
   19471:	mov    DWORD PTR [rdi+0xc],eax
   19474:	ret
   19475:	data16 nop WORD PTR cs:[rax+rax*1+0x0]

0000000000019480 <bdrv_set_translation_hint>:
   19480:	mov    DWORD PTR [rdi+0x890],esi
   19486:	ret
   19487:	nop    WORD PTR [rax+rax*1+0x0]

0000000000019490 <bdrv_get_geometry_hint>:
   19490:	mov    eax,DWORD PTR [rdi+0x884]
   19496:	mov    DWORD PTR [rsi],eax
   19498:	mov    eax,DWORD PTR [rdi+0x888]
   1949e:	mov    DWORD PTR [rdx],eax
   194a0:	mov    eax,DWORD PTR [rdi+0x88c]
   194a6:	mov    DWORD PTR [rcx],eax
   194a8:	ret
   194a9:	nop    DWORD PTR [rax+0x0]

00000000000194b0 <bdrv_get_type_hint>:
   194b0:	mov    eax,DWORD PTR [rdi+0x894]
   194b6:	ret
   194b7:	nop    WORD PTR [rax+rax*1+0x0]

00000000000194c0 <bdrv_get_translation_hint>:
   194c0:	mov    eax,DWORD PTR [rdi+0x890]
   194c6:	ret
   194c7:	nop    WORD PTR [rax+rax*1+0x0]

00000000000194d0 <bdrv_is_removable>:
   194d0:	mov    eax,DWORD PTR [rdi+0xc]
   194d3:	ret
   194d4:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   194df:	nop

00000000000194e0 <bdrv_is_read_only>:
   194e0:	mov    eax,DWORD PTR [rdi+0x8]
   194e3:	ret
   194e4:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   194ef:	nop

00000000000194f0 <bdrv_is_sg>:
   194f0:	mov    eax,DWORD PTR [rdi+0x1c]
   194f3:	ret
   194f4:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   194ff:	nop

0000000000019500 <bdrv_set_change_cb>:
   19500:	mov    QWORD PTR [rdi+0x28],rsi
   19504:	mov    QWORD PTR [rdi+0x30],rdx
   19508:	ret
   19509:	nop    DWORD PTR [rax+0x0]

0000000000019510 <bdrv_is_encrypted>:
   19510:	mov    rdx,QWORD PTR [rdi+0x850]
   19517:	test   rdx,rdx
   1951a:	je     19528 <bdrv_is_encrypted+0x18>
   1951c:	mov    edx,DWORD PTR [rdx+0x14]
   1951f:	mov    eax,0x1
   19524:	test   edx,edx
   19526:	jne    1952b <bdrv_is_encrypted+0x1b>
   19528:	mov    eax,DWORD PTR [rdi+0x14]
   1952b:	ret
   1952c:	nop    DWORD PTR [rax+0x0]

0000000000019530 <bdrv_key_required>:
   19530:	mov    rdx,QWORD PTR [rdi+0x850]
   19537:	test   rdx,rdx
   1953a:	je     1954f <bdrv_key_required+0x1f>
   1953c:	mov    esi,DWORD PTR [rdx+0x14]
   1953f:	test   esi,esi
   19541:	je     1954f <bdrv_key_required+0x1f>
   19543:	mov    ecx,DWORD PTR [rdx+0x18]
   19546:	mov    eax,0x1
   1954b:	test   ecx,ecx
   1954d:	je     19560 <bdrv_key_required+0x30>
   1954f:	mov    eax,DWORD PTR [rdi+0x14]
   19552:	test   eax,eax
   19554:	je     19560 <bdrv_key_required+0x30>
   19556:	mov    edx,DWORD PTR [rdi+0x18]
   19559:	xor    eax,eax
   1955b:	test   edx,edx
   1955d:	sete   al
   19560:	ret
   19561:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   1956c:	nop    DWORD PTR [rax+0x0]

00000000000195f0 <bdrv_get_format>:
   195f0:	mov    rax,QWORD PTR [rdi+0x38]
   195f4:	mov    rcx,rsi
   195f7:	test   rax,rax
   195fa:	je     19610 <bdrv_get_format+0x20>
   195fc:	movsxd rsi,edx
   195ff:	mov    rdx,QWORD PTR [rax]
   19602:	mov    rdi,rcx
   19605:	jmp    5560 <pstrcpy>
   1960a:	nop    WORD PTR [rax+rax*1+0x0]
   19610:	mov    BYTE PTR [rsi],0x0
   19613:	ret
   19614:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   1961f:	nop

0000000000019660 <bdrv_find>:
   19660:	push   rbp
   19661:	push   rbx
   19662:	sub    rsp,0x8
   19666:	mov    rbx,QWORD PTR [rip+0x10e2b]        # 2a498 <bdrv_first>
   1966d:	test   rbx,rbx
   19670:	je     1969f <bdrv_find+0x3f>
   19672:	mov    rbp,rdi
   19675:	jmp    1968c <bdrv_find+0x2c>
   19677:	nop    WORD PTR [rax+rax*1+0x0]
   19680:	mov    rbx,QWORD PTR [rbx+0x8b8]
   19687:	test   rbx,rbx
   1968a:	je     1969f <bdrv_find+0x3f>
   1968c:	lea    rsi,[rbx+0x898]
   19693:	mov    rdi,rbp
   19696:	call   3350 <strcmp@plt>
   1969b:	test   eax,eax
   1969d:	jne    19680 <bdrv_find+0x20>
   1969f:	add    rsp,0x8
   196a3:	mov    rax,rbx
   196a6:	pop    rbx
   196a7:	pop    rbp
   196a8:	ret
   196a9:	nop    DWORD PTR [rax+0x0]

00000000000196f0 <bdrv_get_device_name>:
   196f0:	lea    rax,[rdi+0x898]
   196f7:	ret
   196f8:	nop    DWORD PTR [rax+rax*1+0x0]

0000000000019850 <bdrv_info>:
   19850:	push   rbx
   19851:	mov    rbx,QWORD PTR [rip+0x10c40]        # 2a498 <bdrv_first>
   19858:	test   rbx,rbx
   1985b:	jne    19930 <bdrv_info+0xe0>
   19861:	jmp    19a00 <bdrv_info+0x1b0>
   19866:	nop    WORD PTR cs:[rax+rax*1+0x0]
   19870:	test   eax,eax
   19872:	je     199b0 <bdrv_info+0x160>
   19878:	mov    esi,DWORD PTR [rbx+0xc]
   1987b:	lea    rdi,[rip+0x814a]        # 219cc <__FUNCTION__.13813+0x74>
   19882:	xor    eax,eax
   19884:	call   5100 <term_printf>
   19889:	mov    edx,DWORD PTR [rbx+0xc]
   1988c:	test   edx,edx
   1988e:	jne    19980 <bdrv_info+0x130>
   19894:	cmp    QWORD PTR [rbx+0x38],0x0
   19899:	je     1999c <bdrv_info+0x14c>
   1989f:	xor    eax,eax
   198a1:	lea    rdi,[rip+0x813d]        # 219e5 <__FUNCTION__.13813+0x8d>
   198a8:	call   5100 <term_printf>
   198ad:	lea    rdi,[rbx+0x48]
   198b1:	call   5110 <term_print_filename>
   198b6:	cmp    BYTE PTR [rbx+0x448],0x0
   198bd:	jne    199e0 <bdrv_info+0x190>
   198c3:	mov    esi,DWORD PTR [rbx+0x8]
   198c6:	lea    rdi,[rip+0x812e]        # 219fb <__FUNCTION__.13813+0xa3>
   198cd:	xor    eax,eax
   198cf:	call   5100 <term_printf>
   198d4:	mov    rax,QWORD PTR [rbx+0x38]
   198d8:	lea    rdi,[rip+0x8123]        # 21a02 <__FUNCTION__.13813+0xaa>
   198df:	mov    rsi,QWORD PTR [rax]
   198e2:	xor    eax,eax
   198e4:	call   5100 <term_printf>
   198e9:	mov    rax,QWORD PTR [rbx+0x850]
   198f0:	test   rax,rax
   198f3:	je     19901 <bdrv_info+0xb1>
   198f5:	mov    eax,DWORD PTR [rax+0x14]
   198f8:	mov    esi,0x1
   198fd:	test   eax,eax
   198ff:	jne    19904 <bdrv_info+0xb4>
   19901:	mov    esi,DWORD PTR [rbx+0x14]
   19904:	lea    rdi,[rip+0x80ff]        # 21a0a <__FUNCTION__.13813+0xb2>
   1990b:	xor    eax,eax
   1990d:	call   5100 <term_printf>
   19912:	lea    rdi,[rip+0x7348]        # 20c61 <desc_template.13939+0x381>
   19919:	xor    eax,eax
   1991b:	call   5100 <term_printf>
   19920:	mov    rbx,QWORD PTR [rbx+0x8b8]
   19927:	test   rbx,rbx
   1992a:	je     19a00 <bdrv_info+0x1b0>
   19930:	lea    rsi,[rbx+0x898]
   19937:	lea    rdi,[rip+0x8079]        # 219b7 <__FUNCTION__.13813+0x5f>
   1993e:	xor    eax,eax
   19940:	call   5100 <term_printf>
   19945:	xor    eax,eax
   19947:	lea    rdi,[rip+0x806d]        # 219bb <__FUNCTION__.13813+0x63>
   1994e:	call   5100 <term_printf>
   19953:	mov    eax,DWORD PTR [rbx+0x894]
   19959:	cmp    eax,0x1
   1995c:	je     199c8 <bdrv_info+0x178>
   1995e:	cmp    eax,0x2
   19961:	jne    19870 <bdrv_info+0x20>
   19967:	lea    rdi,[rip+0x8057]        # 219c5 <__FUNCTION__.13813+0x6d>
   1996e:	xor    eax,eax
   19970:	call   5100 <term_printf>
   19975:	jmp    19878 <bdrv_info+0x28>
   1997a:	nop    WORD PTR [rax+rax*1+0x0]
   19980:	mov    esi,DWORD PTR [rbx+0x10]
   19983:	xor    eax,eax
   19985:	lea    rdi,[rip+0x804e]        # 219da <__FUNCTION__.13813+0x82>
   1998c:	call   5100 <term_printf>
   19991:	cmp    QWORD PTR [rbx+0x38],0x0
   19996:	jne    1989f <bdrv_info+0x4f>
   1999c:	lea    rdi,[rip+0x8075]        # 21a18 <__FUNCTION__.13813+0xc0>
   199a3:	xor    eax,eax
   199a5:	call   5100 <term_printf>
   199aa:	jmp    19912 <bdrv_info+0xc2>
   199af:	nop
   199b0:	lea    rdi,[rip+0x800b]        # 219c2 <__FUNCTION__.13813+0x6a>
   199b7:	call   5100 <term_printf>
   199bc:	jmp    19878 <bdrv_info+0x28>
   199c1:	nop    DWORD PTR [rax+0x0]
   199c8:	lea    rdi,[rip+0x7fe2]        # 219b1 <__FUNCTION__.13813+0x59>
   199cf:	xor    eax,eax
   199d1:	call   5100 <term_printf>
   199d6:	jmp    19878 <bdrv_info+0x28>
   199db:	nop    DWORD PTR [rax+rax*1+0x0]
   199e0:	lea    rdi,[rip+0x8005]        # 219ec <__FUNCTION__.13813+0x94>
   199e7:	xor    eax,eax
   199e9:	call   5100 <term_printf>
   199ee:	lea    rdi,[rbx+0x448]
   199f5:	call   5110 <term_print_filename>
   199fa:	jmp    198c3 <bdrv_info+0x73>
   199ff:	nop
   19a00:	pop    rbx
   19a01:	ret
   19a02:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   19a0d:	nop    DWORD PTR [rax]

0000000000019a10 <bdrv_info_stats>:
   19a10:	push   rbp
   19a11:	push   rbx
   19a12:	sub    rsp,0x8
   19a16:	mov    rbx,QWORD PTR [rip+0x10a7b]        # 2a498 <bdrv_first>
   19a1d:	test   rbx,rbx
   19a20:	je     19a69 <bdrv_info_stats+0x59>
   19a22:	lea    rbp,[rip+0x807f]        # 21aa8 <__FUNCTION__.13813+0x150>
   19a29:	nop    DWORD PTR [rax+0x0]
   19a30:	mov    rcx,QWORD PTR [rbx+0x868]
   19a37:	mov    rdx,QWORD PTR [rbx+0x860]
   19a3e:	xor    eax,eax
   19a40:	lea    rsi,[rbx+0x898]
   19a47:	mov    r9,QWORD PTR [rbx+0x878]
   19a4e:	mov    r8,QWORD PTR [rbx+0x870]
   19a55:	mov    rdi,rbp
   19a58:	call   5100 <term_printf>
   19a5d:	mov    rbx,QWORD PTR [rbx+0x8b8]
   19a64:	test   rbx,rbx
   19a67:	jne    19a30 <bdrv_info_stats+0x20>
   19a69:	add    rsp,0x8
   19a6d:	pop    rbx
   19a6e:	pop    rbp
   19a6f:	ret

0000000000019a70 <bdrv_get_encrypted_filename>:
   19a70:	mov    rax,QWORD PTR [rdi+0x850]
   19a77:	test   rax,rax
   19a7a:	je     19a83 <bdrv_get_encrypted_filename+0x13>
   19a7c:	mov    ecx,DWORD PTR [rax+0x14]
   19a7f:	test   ecx,ecx
   19a81:	jne    19a98 <bdrv_get_encrypted_filename+0x28>
   19a83:	mov    edx,DWORD PTR [rdi+0x14]
   19a86:	xor    eax,eax
   19a88:	test   edx,edx
   19a8a:	je     19a90 <bdrv_get_encrypted_filename+0x20>
   19a8c:	lea    rax,[rdi+0x48]
   19a90:	ret
   19a91:	nop    DWORD PTR [rax+0x0]
   19a98:	lea    rax,[rdi+0x448]
   19a9f:	ret

0000000000019aa0 <bdrv_get_backing_filename>:
   19aa0:	cmp    QWORD PTR [rdi+0x850],0x0
   19aa8:	mov    rax,rsi
   19aab:	movsxd rsi,edx
   19aae:	je     19ac0 <bdrv_get_backing_filename+0x20>
   19ab0:	lea    rdx,[rdi+0x448]
   19ab7:	mov    rdi,rax
   19aba:	jmp    5560 <pstrcpy>
   19abf:	nop
   19ac0:	lea    rdx,[rip+0x719b]        # 20c62 <desc_template.13939+0x382>
   19ac7:	mov    rdi,rax
   19aca:	jmp    5560 <pstrcpy>
   19acf:	nop

0000000000019e60 <bdrv_snapshot_dump>:
   19e60:	push   r14
   19e62:	push   r13
   19e64:	push   r12
   19e66:	mov    r12,rdi
   19e69:	push   rbp
   19e6a:	movsxd rbp,esi
   19e6d:	push   rbx
   19e6e:	sub    rsp,0x1e0
   19e75:	mov    rax,QWORD PTR fs:0x28
   19e7e:	mov    QWORD PTR [rsp+0x1d8],rax
   19e86:	xor    eax,eax
   19e88:	test   rdx,rdx
   19e8b:	je     1a038 <bdrv_snapshot_dump+0x1d8>
   19e91:	lea    r14,[rsp+0x10]
   19e96:	lea    rdi,[rsp+0x8]
   19e9b:	mov    rbx,rdx
   19e9e:	mov    eax,DWORD PTR [rdx+0x184]
   19ea4:	mov    rsi,r14
   19ea7:	lea    r13,[rsp+0xd0]
   19eaf:	mov    QWORD PTR [rsp+0x8],rax
   19eb4:	call   3100 <localtime_r@plt>
   19eb9:	mov    rcx,r14
   19ebc:	mov    esi,0x80
   19ec1:	mov    rdi,r13
   19ec4:	lea    rdx,[rip+0x7b9f]        # 21a6a <__FUNCTION__.13813+0x112>
   19ecb:	lea    r14,[rsp+0x150]
   19ed3:	call   3510 <strftime@plt>
   19ed8:	mov    rcx,QWORD PTR [rbx+0x190]
   19edf:	sub    rsp,0x8
   19ee3:	movabs r9,0x44b82fa09b5a53
   19eed:	lea    r8,[rip+0x7b88]        # 21a7c <__FUNCTION__.13813+0x124>
   19ef4:	mov    rdx,rcx
   19ef7:	shr    rdx,0x9
   19efb:	mov    rax,rdx
   19efe:	mul    r9
   19f01:	movabs r9,0x91a2b3c4d5e6f81
   19f0b:	mov    rsi,rdx
   19f0e:	shr    rdx,0xf
   19f12:	mov    rax,rdx
   19f15:	shr    rsi,0xb
   19f19:	mul    r9
   19f1c:	mov    rax,rcx
   19f1f:	movabs rcx,0x20c49ba5e353f7cf
   19f29:	shr    rdx,0x3
   19f2d:	mov    r9,rdx
   19f30:	movabs rdx,0x431bde82d7b634db
   19f3a:	mul    rdx
   19f3d:	mov    rdi,rdx
   19f40:	shr    rdx,0x15
   19f44:	mov    rax,rdx
   19f47:	shr    rdi,0x12
   19f4b:	mul    rcx
   19f4e:	mov    rax,rsi
   19f51:	shr    rdx,0x4
   19f55:	imul   rcx,rdx,0x3e8
   19f5c:	sub    rdi,rcx
   19f5f:	push   rdi
   19f60:	movabs rdi,0x8888888888888889
   19f6a:	mul    rdi
   19f6d:	mov    rcx,rdx
   19f70:	shr    rcx,0x5
   19f74:	mov    rax,rcx
   19f77:	shl    rax,0x4
   19f7b:	sub    rax,rcx
   19f7e:	shl    rax,0x2
   19f82:	sub    rsi,rax
   19f85:	mov    rax,rcx
   19f88:	mul    rdi
   19f8b:	push   rsi
   19f8c:	mov    rdi,r14
   19f8f:	mov    esi,0x80
   19f94:	shr    rdx,0x5
   19f98:	mov    rax,rdx
   19f9b:	shl    rax,0x4
   19f9f:	sub    rax,rdx
   19fa2:	mov    edx,0x1
   19fa7:	shl    rax,0x2
   19fab:	sub    rcx,rax
   19fae:	xor    eax,eax
   19fb0:	push   rcx
   19fb1:	mov    ecx,0x80
   19fb6:	call   3060 <__snprintf_chk@plt>
   19fbb:	add    rsp,0x20
   19fbf:	mov    edx,DWORD PTR [rbx+0x180]
   19fc5:	mov    esi,0x80
   19fca:	lea    rdi,[rsp+0x50]
   19fcf:	call   19cf0 <get_human_readable_size>
   19fd4:	push   r14
   19fd6:	mov    r9,rbx
   19fd9:	push   r13
   19fdb:	push   rax
   19fdc:	lea    rax,[rbx+0x80]
   19fe3:	push   rax
   19fe4:	xor    eax,eax
   19fe6:	lea    r8,[rip+0x7a4d]        # 21a3a <__FUNCTION__.13813+0xe2>
   19fed:	mov    rsi,rbp
   19ff0:	mov    rdi,r12
   19ff3:	mov    rcx,0xffffffffffffffff
   19ffa:	mov    edx,0x1
   19fff:	call   3060 <__snprintf_chk@plt>
   1a004:	add    rsp,0x20
   1a008:	mov    rax,r12
   1a00b:	mov    rbx,QWORD PTR [rsp+0x1d8]
   1a013:	xor    rbx,QWORD PTR fs:0x28
   1a01c:	jne    1a061 <bdrv_snapshot_dump+0x201>
   1a022:	add    rsp,0x1e0
   1a029:	pop    rbx
   1a02a:	pop    rbp
   1a02b:	pop    r12
   1a02d:	pop    r13
   1a02f:	pop    r14
   1a031:	ret
   1a032:	nop    WORD PTR [rax+rax*1+0x0]
   1a038:	lea    rax,[rip+0x7a11]        # 21a50 <__FUNCTION__.13813+0xf8>
   1a03f:	lea    r9,[rip+0x6764]        # 207aa <Te0+0x40a>
   1a046:	push   rax
   1a047:	lea    rax,[rip+0x7a0b]        # 21a59 <__FUNCTION__.13813+0x101>
   1a04e:	push   rax
   1a04f:	lea    rax,[rip+0x7a08]        # 21a5e <__FUNCTION__.13813+0x106>
   1a056:	push   rax
   1a057:	lea    rax,[rip+0x7a08]        # 21a66 <__FUNCTION__.13813+0x10e>
   1a05e:	push   rax
   1a05f:	jmp    19fe4 <bdrv_snapshot_dump+0x184>
   1a061:	call   31c0 <__stack_chk_fail@plt>
   1a066:	nop    WORD PTR cs:[rax+rax*1+0x0]

000000000001a120 <bdrv_read_em>:
   1a120:	sub    rsp,0x18
   1a124:	lea    r8,[rip+0xffffffffffffdb25]        # 17c50 <bdrv_rw_em_cb>
   1a12b:	mov    rax,QWORD PTR fs:0x28
   1a134:	mov    QWORD PTR [rsp+0x8],rax
   1a139:	xor    eax,eax
   1a13b:	lea    r9,[rsp+0x4]
   1a140:	mov    DWORD PTR [rsp+0x4],0x7fffffff
   1a148:	call   1a070 <bdrv_aio_read>
   1a14d:	test   rax,rax
   1a150:	je     1a185 <bdrv_read_em+0x65>
   1a152:	mov    eax,DWORD PTR [rsp+0x4]
   1a156:	cmp    eax,0x7fffffff
   1a15b:	jne    1a170 <bdrv_read_em+0x50>
   1a15d:	nop    DWORD PTR [rax]
   1a160:	call   1adb0 <qemu_aio_wait>
   1a165:	mov    eax,DWORD PTR [rsp+0x4]
   1a169:	cmp    eax,0x7fffffff
   1a16e:	je     1a160 <bdrv_read_em+0x40>
   1a170:	mov    rdx,QWORD PTR [rsp+0x8]
   1a175:	xor    rdx,QWORD PTR fs:0x28
   1a17e:	jne    1a18c <bdrv_read_em+0x6c>
   1a180:	add    rsp,0x18
   1a184:	ret
   1a185:	mov    eax,0xffffffff
   1a18a:	jmp    1a170 <bdrv_read_em+0x50>
   1a18c:	call   31c0 <__stack_chk_fail@plt>
   1a191:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   1a19c:	nop    DWORD PTR [rax+0x0]

000000000001a260 <bdrv_aio_rw_vector>:
   1a260:	push   r14
   1a262:	mov    r14d,ecx
   1a265:	push   r13
   1a267:	mov    r13,rsi
   1a26a:	push   r12
   1a26c:	push   rbp
   1a26d:	mov    rbp,rdi
   1a270:	push   rbx
   1a271:	sub    rsp,0x20
   1a275:	mov    rbx,QWORD PTR [rip+0x10124]        # 2a3a0 <vectored_aio_pool+0x10>
   1a27c:	mov    r12d,DWORD PTR [rsp+0x50]
   1a281:	test   rbx,rbx
   1a284:	je     1a330 <bdrv_aio_rw_vector+0xd0>
   1a28a:	mov    rax,QWORD PTR [rbx+0x20]
   1a28e:	mov    QWORD PTR [rip+0x1010b],rax        # 2a3a0 <vectored_aio_pool+0x10>
   1a295:	mov    QWORD PTR [rbx+0x8],rbp
   1a299:	mov    esi,r14d
   1a29c:	mov    edi,0x200
   1a2a1:	mov    QWORD PTR [rbx+0x10],r8
   1a2a5:	shl    esi,0x9
   1a2a8:	mov    QWORD PTR [rbx+0x18],r9
   1a2ac:	movsxd rsi,esi
   1a2af:	mov    QWORD PTR [rbx+0x28],rdx
   1a2b3:	call   53b0 <qemu_memalign>
   1a2b8:	mov    DWORD PTR [rbx+0x38],r12d
   1a2bc:	mov    QWORD PTR [rbx+0x30],rax
   1a2c0:	test   r12d,r12d
   1a2c3:	jne    1a300 <bdrv_aio_rw_vector+0xa0>
   1a2c5:	mov    r9,rbx
   1a2c8:	lea    r8,[rip+0xffffffffffffda71]        # 17d40 <bdrv_aio_rw_vector_cb>
   1a2cf:	mov    ecx,r14d
   1a2d2:	mov    rdx,rax
   1a2d5:	mov    rsi,r13
   1a2d8:	mov    rdi,rbp
   1a2db:	call   1a070 <bdrv_aio_read>
   1a2e0:	mov    QWORD PTR [rbx+0x40],rax
   1a2e4:	test   rax,rax
   1a2e7:	je     1a370 <bdrv_aio_rw_vector+0x110>
   1a2ed:	mov    rax,rbx
   1a2f0:	add    rsp,0x20
   1a2f4:	pop    rbx
   1a2f5:	pop    rbp
   1a2f6:	pop    r12
   1a2f8:	pop    r13
   1a2fa:	pop    r14
   1a2fc:	ret
   1a2fd:	nop    DWORD PTR [rax]
   1a300:	mov    rdi,QWORD PTR [rbx+0x28]
   1a304:	mov    rsi,rax
   1a307:	call   5880 <qemu_iovec_to_buffer>
   1a30c:	mov    rdx,QWORD PTR [rbx+0x30]
   1a310:	mov    r9,rbx
   1a313:	mov    ecx,r14d
   1a316:	lea    r8,[rip+0xffffffffffffda23]        # 17d40 <bdrv_aio_rw_vector_cb>
   1a31d:	mov    rsi,r13
   1a320:	mov    rdi,rbp
   1a323:	call   1a1a0 <bdrv_aio_write>
   1a328:	mov    QWORD PTR [rbx+0x40],rax
   1a32c:	jmp    1a2e4 <bdrv_aio_rw_vector+0x84>
   1a32e:	xchg   ax,ax
   1a330:	movsxd rdi,DWORD PTR [rip+0x10061]        # 2a398 <vectored_aio_pool+0x8>
   1a337:	mov    QWORD PTR [rsp+0x18],r9
   1a33c:	mov    QWORD PTR [rsp+0x10],r8
   1a341:	mov    QWORD PTR [rsp+0x8],rdx
   1a346:	call   59c0 <qemu_mallocz>
   1a34b:	mov    r9,QWORD PTR [rsp+0x18]
   1a350:	mov    r8,QWORD PTR [rsp+0x10]
   1a355:	mov    rbx,rax
   1a358:	lea    rax,[rip+0x10031]        # 2a390 <vectored_aio_pool>
   1a35f:	mov    rdx,QWORD PTR [rsp+0x8]
   1a364:	mov    QWORD PTR [rbx],rax
   1a367:	jmp    1a295 <bdrv_aio_rw_vector+0x35>
   1a36c:	nop    DWORD PTR [rax+0x0]
   1a370:	mov    rdi,QWORD PTR [rbx+0x30]
   1a374:	mov    QWORD PTR [rsp+0x8],rax
   1a379:	call   5460 <qemu_vfree>
   1a37e:	mov    rdx,QWORD PTR [rbx]
   1a381:	mov    rax,QWORD PTR [rsp+0x8]
   1a386:	mov    rcx,QWORD PTR [rdx+0x10]
   1a38a:	mov    QWORD PTR [rbx+0x20],rcx
   1a38e:	mov    QWORD PTR [rdx+0x10],rbx
   1a392:	jmp    1a2f0 <bdrv_aio_rw_vector+0x90>
   1a397:	nop    WORD PTR [rax+rax*1+0x0]

000000000001a3a0 <bdrv_aio_readv>:
   1a3a0:	push   r15
   1a3a2:	mov    rax,rsi
   1a3a5:	mov    r15d,ecx
   1a3a8:	push   r14
   1a3aa:	neg    rax
   1a3ad:	mov    r14,rdi
   1a3b0:	push   r13
   1a3b2:	mov    r13,r9
   1a3b5:	push   r12
   1a3b7:	mov    r12,r8
   1a3ba:	push   rbp
   1a3bb:	mov    rbp,rdx
   1a3be:	mov    edx,ecx
   1a3c0:	push   rbx
   1a3c1:	mov    rbx,rsi
   1a3c4:	shl    rsi,0x9
   1a3c8:	sub    rsp,0x8
   1a3cc:	test   rbx,rbx
   1a3cf:	cmovs  rsi,rax
   1a3d3:	shl    edx,0x9
   1a3d6:	movsxd rdx,edx
   1a3d9:	call   17e00 <bdrv_check_byte_request>
   1a3de:	mov    edx,eax
   1a3e0:	xor    eax,eax
   1a3e2:	test   edx,edx
   1a3e4:	jne    1a405 <bdrv_aio_readv+0x65>
   1a3e6:	sub    rsp,0x8
   1a3ea:	mov    ecx,r15d
   1a3ed:	mov    rdx,rbp
   1a3f0:	mov    r9,r13
   1a3f3:	push   0x0
   1a3f5:	mov    r8,r12
   1a3f8:	mov    rsi,rbx
   1a3fb:	mov    rdi,r14
   1a3fe:	call   1a260 <bdrv_aio_rw_vector>
   1a403:	pop    rdx
   1a404:	pop    rcx
   1a405:	add    rsp,0x8
   1a409:	pop    rbx
   1a40a:	pop    rbp
   1a40b:	pop    r12
   1a40d:	pop    r13
   1a40f:	pop    r14
   1a411:	pop    r15
   1a413:	ret
   1a414:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   1a41f:	nop

000000000001a420 <bdrv_aio_writev>:
   1a420:	push   r15
   1a422:	mov    rax,rsi
   1a425:	mov    r15d,ecx
   1a428:	push   r14
   1a42a:	neg    rax
   1a42d:	mov    r14,rdi
   1a430:	push   r13
   1a432:	mov    r13,r9
   1a435:	push   r12
   1a437:	mov    r12,r8
   1a43a:	push   rbp
   1a43b:	mov    rbp,rdx
   1a43e:	mov    edx,ecx
   1a440:	push   rbx
   1a441:	mov    rbx,rsi
   1a444:	shl    rsi,0x9
   1a448:	sub    rsp,0x8
   1a44c:	test   rbx,rbx
   1a44f:	cmovs  rsi,rax
   1a453:	shl    edx,0x9
   1a456:	movsxd rdx,edx
   1a459:	call   17e00 <bdrv_check_byte_request>
   1a45e:	mov    edx,eax
   1a460:	xor    eax,eax
   1a462:	test   edx,edx
   1a464:	jne    1a485 <bdrv_aio_writev+0x65>
   1a466:	sub    rsp,0x8
   1a46a:	mov    ecx,r15d
   1a46d:	mov    rdx,rbp
   1a470:	mov    r9,r13
   1a473:	push   0x1
   1a475:	mov    r8,r12
   1a478:	mov    rsi,rbx
   1a47b:	mov    rdi,r14
   1a47e:	call   1a260 <bdrv_aio_rw_vector>
   1a483:	pop    rdx
   1a484:	pop    rcx
   1a485:	add    rsp,0x8
   1a489:	pop    rbx
   1a48a:	pop    rbp
   1a48b:	pop    r12
   1a48d:	pop    r13
   1a48f:	pop    r14
   1a491:	pop    r15
   1a493:	ret
   1a494:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   1a49f:	nop

000000000001a4a0 <bdrv_write_em>:
   1a4a0:	sub    rsp,0x18
   1a4a4:	lea    r8,[rip+0xffffffffffffd7a5]        # 17c50 <bdrv_rw_em_cb>
   1a4ab:	mov    rax,QWORD PTR fs:0x28
   1a4b4:	mov    QWORD PTR [rsp+0x8],rax
   1a4b9:	xor    eax,eax
   1a4bb:	lea    r9,[rsp+0x4]
   1a4c0:	mov    DWORD PTR [rsp+0x4],0x7fffffff
   1a4c8:	call   1a1a0 <bdrv_aio_write>
   1a4cd:	test   rax,rax
   1a4d0:	je     1a505 <bdrv_write_em+0x65>
   1a4d2:	mov    eax,DWORD PTR [rsp+0x4]
   1a4d6:	cmp    eax,0x7fffffff
   1a4db:	jne    1a4f0 <bdrv_write_em+0x50>
   1a4dd:	nop    DWORD PTR [rax]
   1a4e0:	call   1adb0 <qemu_aio_wait>
   1a4e5:	mov    eax,DWORD PTR [rsp+0x4]
   1a4e9:	cmp    eax,0x7fffffff
   1a4ee:	je     1a4e0 <bdrv_write_em+0x40>
   1a4f0:	mov    rdx,QWORD PTR [rsp+0x8]
   1a4f5:	xor    rdx,QWORD PTR fs:0x28
   1a4fe:	jne    1a50c <bdrv_write_em+0x6c>
   1a500:	add    rsp,0x18
   1a504:	ret
   1a505:	mov    eax,0xffffffff
   1a50a:	jmp    1a4f0 <bdrv_write_em+0x50>
   1a50c:	call   31c0 <__stack_chk_fail@plt>
   1a511:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   1a51c:	nop    DWORD PTR [rax+0x0]

000000000001a550 <bdrv_init>:
   1a550:	lea    rax,[rip+0xffffffffffffd6e9]        # 17c40 <bdrv_aio_cancel_vector>
   1a557:	lea    rdi,[rip+0xfc42]        # 2a1a0 <bdrv_raw>
   1a55e:	mov    DWORD PTR [rip+0xfe30],0x48        # 2a398 <vectored_aio_pool+0x8>
   1a568:	mov    QWORD PTR [rip+0xfe21],rax        # 2a390 <vectored_aio_pool>
   1a56f:	mov    QWORD PTR [rip+0xfe26],0x0        # 2a3a0 <vectored_aio_pool+0x10>
   1a57a:	call   17b60 <bdrv_register>
   1a57f:	lea    rdi,[rip+0xfada]        # 2a060 <bdrv_host_device>
   1a586:	call   17b60 <bdrv_register>
   1a58b:	lea    rdi,[rip+0xea8e]        # 29020 <bdrv_cow>
   1a592:	call   17b60 <bdrv_register>
   1a597:	lea    rdi,[rip+0xebc2]        # 29160 <bdrv_qcow>
   1a59e:	call   17b60 <bdrv_register>
   1a5a3:	lea    rdi,[rip+0xecf6]        # 292a0 <bdrv_vmdk>
   1a5aa:	call   17b60 <bdrv_register>
   1a5af:	lea    rdi,[rip+0xee2a]        # 293e0 <bdrv_cloop>
   1a5b6:	call   17b60 <bdrv_register>
   1a5bb:	lea    rdi,[rip+0xef5e]        # 29520 <bdrv_dmg>
   1a5c2:	call   17b60 <bdrv_register>
   1a5c7:	lea    rdi,[rip+0xf092]        # 29660 <bdrv_bochs>
   1a5ce:	call   17b60 <bdrv_register>
   1a5d3:	lea    rdi,[rip+0xf1c6]        # 297a0 <bdrv_vpc>
   1a5da:	call   17b60 <bdrv_register>
   1a5df:	lea    rdi,[rip+0xf2fa]        # 298e0 <bdrv_vvfat>
   1a5e6:	call   17b60 <bdrv_register>
   1a5eb:	lea    rdi,[rip+0xf56e]        # 29b60 <bdrv_qcow2>
   1a5f2:	call   17b60 <bdrv_register>
   1a5f7:	lea    rdi,[rip+0xf6a2]        # 29ca0 <bdrv_parallels>
   1a5fe:	call   17b60 <bdrv_register>
   1a603:	lea    rdi,[rip+0xf7d6]        # 29de0 <bdrv_nbd>
   1a60a:	jmp    17b60 <bdrv_register>
   1a60f:	nop

000000000001a610 <aio_pool_init>:
   1a610:	mov    DWORD PTR [rdi+0x8],esi
   1a613:	mov    QWORD PTR [rdi],rdx
   1a616:	mov    QWORD PTR [rdi+0x10],0x0
   1a61e:	ret
   1a61f:	nop

000000000001a620 <qemu_aio_get_pool>:
   1a620:	push   rbx
   1a621:	mov    rbx,rdi
   1a624:	sub    rsp,0x20
   1a628:	mov    rax,QWORD PTR [rdi+0x10]
   1a62c:	test   rax,rax
   1a62f:	je     1a650 <qemu_aio_get_pool+0x30>
   1a631:	mov    rdi,QWORD PTR [rax+0x20]
   1a635:	mov    QWORD PTR [rbx+0x10],rdi
   1a639:	mov    QWORD PTR [rax+0x8],rsi
   1a63d:	mov    QWORD PTR [rax+0x10],rdx
   1a641:	mov    QWORD PTR [rax+0x18],rcx
   1a645:	add    rsp,0x20
   1a649:	pop    rbx
   1a64a:	ret
   1a64b:	nop    DWORD PTR [rax+rax*1+0x0]
   1a650:	movsxd rdi,DWORD PTR [rdi+0x8]
   1a654:	mov    QWORD PTR [rsp+0x18],rcx
   1a659:	mov    QWORD PTR [rsp+0x10],rdx
   1a65e:	mov    QWORD PTR [rsp+0x8],rsi
   1a663:	call   59c0 <qemu_mallocz>
   1a668:	mov    rcx,QWORD PTR [rsp+0x18]
   1a66d:	mov    rdx,QWORD PTR [rsp+0x10]
   1a672:	mov    QWORD PTR [rax],rbx
   1a675:	mov    rsi,QWORD PTR [rsp+0x8]
   1a67a:	jmp    1a639 <qemu_aio_get_pool+0x19>
   1a67c:	nop    DWORD PTR [rax+0x0]

000000000001a680 <qemu_aio_get>:
   1a680:	push   rbp
   1a681:	mov    rbp,rdi
   1a684:	push   rbx
   1a685:	sub    rsp,0x18
   1a689:	mov    rbx,QWORD PTR [rdi+0x38]
   1a68d:	mov    rax,QWORD PTR [rbx+0x130]
   1a694:	test   rax,rax
   1a697:	je     1a6c0 <qemu_aio_get+0x40>
   1a699:	mov    rcx,QWORD PTR [rax+0x20]
   1a69d:	mov    QWORD PTR [rbx+0x130],rcx
   1a6a4:	mov    QWORD PTR [rax+0x8],rbp
   1a6a8:	mov    QWORD PTR [rax+0x10],rsi
   1a6ac:	mov    QWORD PTR [rax+0x18],rdx
   1a6b0:	add    rsp,0x18
   1a6b4:	pop    rbx
   1a6b5:	pop    rbp
   1a6b6:	ret
   1a6b7:	nop    WORD PTR [rax+rax*1+0x0]
   1a6c0:	movsxd rdi,DWORD PTR [rbx+0x128]
   1a6c7:	mov    QWORD PTR [rsp+0x8],rdx
   1a6cc:	add    rbx,0x120
   1a6d3:	mov    QWORD PTR [rsp],rsi
   1a6d7:	call   59c0 <qemu_mallocz>
   1a6dc:	mov    rdx,QWORD PTR [rsp+0x8]
   1a6e1:	mov    rsi,QWORD PTR [rsp]
   1a6e5:	mov    QWORD PTR [rax],rbx
   1a6e8:	jmp    1a6a4 <qemu_aio_get+0x24>
   1a6ea:	nop    WORD PTR [rax+rax*1+0x0]

000000000001a780 <bdrv_aio_read_em>:
   1a780:	push   r14
   1a782:	mov    r14d,ecx
   1a785:	push   r13
   1a787:	mov    r13,rdx
   1a78a:	mov    rdx,r9
   1a78d:	push   r12
   1a78f:	mov    r12,rsi
   1a792:	mov    rsi,r8
   1a795:	push   rbp
   1a796:	mov    rbp,rdi
   1a799:	push   rbx
   1a79a:	call   1a680 <qemu_aio_get>
   1a79f:	cmp    QWORD PTR [rax+0x28],0x0
   1a7a4:	mov    rbx,rax
   1a7a7:	je     1a7d8 <bdrv_aio_read_em+0x58>
   1a7a9:	mov    ecx,r14d
   1a7ac:	mov    rdx,r13
   1a7af:	mov    rsi,r12
   1a7b2:	mov    rdi,rbp
   1a7b5:	call   18210 <bdrv_read>
   1a7ba:	mov    rdi,QWORD PTR [rbx+0x28]
   1a7be:	mov    DWORD PTR [rbx+0x30],eax
   1a7c1:	call   5160 <qemu_bh_schedule>
   1a7c6:	mov    rax,rbx
   1a7c9:	pop    rbx
   1a7ca:	pop    rbp
   1a7cb:	pop    r12
   1a7cd:	pop    r13
   1a7cf:	pop    r14
   1a7d1:	ret
   1a7d2:	nop    WORD PTR [rax+rax*1+0x0]
   1a7d8:	mov    rsi,rax
   1a7db:	lea    rdi,[rip+0xffffffffffffd5be]        # 17da0 <bdrv_aio_bh_cb>
   1a7e2:	call   5120 <qemu_bh_new>
   1a7e7:	mov    QWORD PTR [rbx+0x28],rax
   1a7eb:	jmp    1a7a9 <bdrv_aio_read_em+0x29>
   1a7ed:	nop    DWORD PTR [rax]

000000000001a7f0 <bdrv_aio_write_em>:
   1a7f0:	push   r14
   1a7f2:	mov    r14d,ecx
   1a7f5:	push   r13
   1a7f7:	mov    r13,rdx
   1a7fa:	mov    rdx,r9
   1a7fd:	push   r12
   1a7ff:	mov    r12,rsi
   1a802:	mov    rsi,r8
   1a805:	push   rbp
   1a806:	mov    rbp,rdi
   1a809:	push   rbx
   1a80a:	call   1a680 <qemu_aio_get>
   1a80f:	cmp    QWORD PTR [rax+0x28],0x0
   1a814:	mov    rbx,rax
   1a817:	je     1a848 <bdrv_aio_write_em+0x58>
   1a819:	mov    ecx,r14d
   1a81c:	mov    rdx,r13
   1a81f:	mov    rsi,r12
   1a822:	mov    rdi,rbp
   1a825:	call   18650 <bdrv_write>
   1a82a:	mov    rdi,QWORD PTR [rbx+0x28]
   1a82e:	mov    DWORD PTR [rbx+0x30],eax
   1a831:	call   5160 <qemu_bh_schedule>
   1a836:	mov    rax,rbx
   1a839:	pop    rbx
   1a83a:	pop    rbp
   1a83b:	pop    r12
   1a83d:	pop    r13
   1a83f:	pop    r14
   1a841:	ret
   1a842:	nop    WORD PTR [rax+rax*1+0x0]
   1a848:	mov    rsi,rax
   1a84b:	lea    rdi,[rip+0xffffffffffffd54e]        # 17da0 <bdrv_aio_bh_cb>
   1a852:	call   5120 <qemu_bh_new>
   1a857:	mov    QWORD PTR [rbx+0x28],rax
   1a85b:	jmp    1a819 <bdrv_aio_write_em+0x29>
   1a85d:	nop    DWORD PTR [rax]

000000000001a860 <qemu_aio_release>:
   1a860:	mov    rax,QWORD PTR [rdi]
   1a863:	mov    rdx,QWORD PTR [rax+0x10]
   1a867:	mov    QWORD PTR [rdi+0x20],rdx
   1a86b:	mov    QWORD PTR [rax+0x10],rdi
   1a86f:	ret

000000000001a930 <bdrv_is_locked>:
   1a930:	mov    eax,DWORD PTR [rdi+0x10]
   1a933:	ret
   1a934:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   1a93f:	nop

000000000001ac30 <qemu_aio_set_fd_handler>:
   1ac30:	push   r12
   1ac32:	mov    r12,rdx
   1ac35:	push   rbp
   1ac36:	mov    rbp,rsi
   1ac39:	push   rbx
   1ac3a:	mov    ebx,edi
   1ac3c:	sub    rsp,0x10
   1ac40:	mov    rdi,QWORD PTR [rip+0xf769]        # 2a3b0 <aio_handlers>
   1ac47:	test   rdi,rdi
   1ac4a:	jne    1ac59 <qemu_aio_set_fd_handler+0x29>
   1ac4c:	jmp    1acc0 <qemu_aio_set_fd_handler+0x90>
   1ac4e:	xchg   ax,ax
   1ac50:	mov    rdi,QWORD PTR [rdi+0x30]
   1ac54:	test   rdi,rdi
   1ac57:	je     1acc0 <qemu_aio_set_fd_handler+0x90>
   1ac59:	cmp    ebx,DWORD PTR [rdi]
   1ac5b:	jne    1ac50 <qemu_aio_set_fd_handler+0x20>
   1ac5d:	mov    rax,rbp
   1ac60:	or     rax,r12
   1ac63:	jne    1ad13 <qemu_aio_set_fd_handler+0xe3>
   1ac69:	mov    eax,DWORD PTR [rip+0xf739]        # 2a3a8 <walking_handlers>
   1ac6f:	test   eax,eax
   1ac71:	jne    1ad30 <qemu_aio_set_fd_handler+0x100>
   1ac77:	mov    rax,QWORD PTR [rdi+0x30]
   1ac7b:	mov    rcx,QWORD PTR [rdi+0x38]
   1ac7f:	test   rax,rax
   1ac82:	je     1ac90 <qemu_aio_set_fd_handler+0x60>
   1ac84:	mov    QWORD PTR [rax+0x38],rcx
   1ac88:	mov    rcx,QWORD PTR [rdi+0x38]
   1ac8c:	mov    rax,QWORD PTR [rdi+0x30]
   1ac90:	mov    QWORD PTR [rcx],rax
   1ac93:	mov    QWORD PTR [rsp],r8
   1ac97:	call   5960 <qemu_free>
   1ac9c:	mov    r8,QWORD PTR [rsp]
   1aca0:	mov    rcx,r12
   1aca3:	mov    rdx,rbp
   1aca6:	mov    edi,ebx
   1aca8:	xor    esi,esi
   1acaa:	call   5190 <qemu_set_fd_handler2>
   1acaf:	add    rsp,0x10
   1acb3:	xor    eax,eax
   1acb5:	pop    rbx
   1acb6:	pop    rbp
   1acb7:	pop    r12
   1acb9:	ret
   1acba:	nop    WORD PTR [rax+rax*1+0x0]
   1acc0:	mov    rax,rbp
   1acc3:	or     rax,r12
   1acc6:	je     1aca0 <qemu_aio_set_fd_handler+0x70>
   1acc8:	mov    edi,0x40
   1accd:	mov    QWORD PTR [rsp+0x8],r8
   1acd2:	mov    QWORD PTR [rsp],rcx
   1acd6:	call   59c0 <qemu_mallocz>
   1acdb:	mov    rcx,QWORD PTR [rsp]
   1acdf:	mov    r8,QWORD PTR [rsp+0x8]
   1ace4:	mov    rdi,rax
   1ace7:	mov    DWORD PTR [rax],ebx
   1ace9:	mov    rax,QWORD PTR [rip+0xf6c0]        # 2a3b0 <aio_handlers>
   1acf0:	test   rax,rax
   1acf3:	mov    QWORD PTR [rdi+0x30],rax
   1acf7:	je     1ad01 <qemu_aio_set_fd_handler+0xd1>
   1acf9:	lea    r9,[rdi+0x30]
   1acfd:	mov    QWORD PTR [rax+0x38],r9
   1ad01:	lea    rax,[rip+0xf6a8]        # 2a3b0 <aio_handlers>
   1ad08:	mov    QWORD PTR [rip+0xf6a1],rdi        # 2a3b0 <aio_handlers>
   1ad0f:	mov    QWORD PTR [rdi+0x38],rax
   1ad13:	mov    QWORD PTR [rdi+0x8],rbp
   1ad17:	mov    QWORD PTR [rdi+0x10],r12
   1ad1b:	mov    QWORD PTR [rdi+0x18],rcx
   1ad1f:	mov    QWORD PTR [rdi+0x28],r8
   1ad23:	jmp    1aca0 <qemu_aio_set_fd_handler+0x70>
   1ad28:	nop    DWORD PTR [rax+rax*1+0x0]
   1ad30:	mov    DWORD PTR [rdi+0x20],0x1
   1ad37:	jmp    1aca0 <qemu_aio_set_fd_handler+0x70>
   1ad3c:	nop    DWORD PTR [rax+0x0]

000000000001ade0 <die2>:
   1ade0:	push   rbx
   1ade1:	mov    rbx,rsi
   1ade4:	call   3690 <strerror@plt>
   1ade9:	mov    rdi,QWORD PTR [rip+0xf510]        # 2a300 <stderr@@GLIBC_2.2.5>
   1adf0:	mov    rcx,rbx
   1adf3:	lea    rdx,[rip+0x6cfe]        # 21af8 <suffixes.14512+0xd>
   1adfa:	mov    r8,rax
   1adfd:	mov    esi,0x1
   1ae02:	xor    eax,eax
   1ae04:	call   3660 <__fprintf_chk@plt>
   1ae09:	call   30c0 <abort@plt>
   1ae0e:	xchg   ax,ax

000000000001ae10 <die>:
   1ae10:	push   rbx
   1ae11:	mov    rbx,rdi
   1ae14:	call   30d0 <__errno_location@plt>
   1ae19:	mov    rsi,rbx
   1ae1c:	mov    edi,DWORD PTR [rax]
   1ae1e:	call   1ade0 <die2>
   1ae23:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   1ae2e:	xchg   ax,ax

000000000001ae30 <fsync_like_pwrite>:
   1ae30:	sub    rsp,0x8
   1ae34:	cmp    rdx,0x1
   1ae38:	jne    1ae56 <fsync_like_pwrite+0x26>
   1ae3a:	test   rcx,rcx
   1ae3d:	jne    1ae75 <fsync_like_pwrite+0x45>
   1ae3f:	call   3560 <fsync@plt>
   1ae44:	cmp    eax,0x1
   1ae47:	sbb    rax,rax
   1ae4a:	add    rsp,0x8
   1ae4e:	and    eax,0x2
   1ae51:	sub    rax,0x1
   1ae55:	ret
   1ae56:	lea    rcx,[rip+0x6da3]        # 21c00 <__PRETTY_FUNCTION__.14120>
   1ae5d:	mov    edx,0xcf
   1ae62:	lea    rsi,[rip+0x6c9e]        # 21b07 <suffixes.14512+0x1c>
   1ae69:	lea    rdi,[rip+0x6caa]        # 21b1a <suffixes.14512+0x2f>
   1ae70:	call   3230 <__assert_fail@plt>
   1ae75:	lea    rcx,[rip+0x6d84]        # 21c00 <__PRETTY_FUNCTION__.14120>
   1ae7c:	mov    edx,0xd0
   1ae81:	lea    rsi,[rip+0x6c7f]        # 21b07 <suffixes.14512+0x1c>
   1ae88:	lea    rdi,[rip+0x6d52]        # 21be1 <suffixes.14512+0xf6>
   1ae8f:	call   3230 <__assert_fail@plt>
   1ae94:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   1ae9f:	nop

000000000001aea0 <mutex_unlock.constprop.4>:
   1aea0:	sub    rsp,0x8
   1aea4:	lea    rdi,[rip+0xf5b5]        # 2a460 <lock>
   1aeab:	call   3430 <pthread_mutex_unlock@plt>
   1aeb0:	test   eax,eax
   1aeb2:	jne    1aeb9 <mutex_unlock.constprop.4+0x19>
   1aeb4:	add    rsp,0x8
   1aeb8:	ret
   1aeb9:	lea    rsi,[rip+0x6c63]        # 21b23 <suffixes.14512+0x38>
   1aec0:	mov    edi,eax
   1aec2:	call   1ade0 <die2>
   1aec7:	nop    WORD PTR [rax+rax*1+0x0]

000000000001aed0 <mutex_lock.constprop.5>:
   1aed0:	sub    rsp,0x8
   1aed4:	lea    rdi,[rip+0xf585]        # 2a460 <lock>
   1aedb:	call   36c0 <pthread_mutex_lock@plt>
   1aee0:	test   eax,eax
   1aee2:	jne    1aee9 <mutex_lock.constprop.5+0x19>
   1aee4:	add    rsp,0x8
   1aee8:	ret
   1aee9:	lea    rsi,[rip+0x6c48]        # 21b38 <suffixes.14512+0x4d>
   1aef0:	mov    edi,eax
   1aef2:	call   1ade0 <die2>
   1aef7:	nop    WORD PTR [rax+rax*1+0x0]

000000000001af00 <qemu_paio_submit>:
   1af00:	push   rbx
   1af01:	mov    rbx,rdi
   1af04:	mov    QWORD PTR [rdi+0x38],rsi
   1af08:	mov    QWORD PTR [rdi+0x40],0xffffffffffffff8d
   1af10:	mov    DWORD PTR [rdi+0x48],0x0
   1af17:	call   1aed0 <mutex_lock.constprop.5>
   1af1c:	mov    eax,DWORD PTR [rip+0xf4ae]        # 2a3d0 <idle_threads>
   1af22:	test   eax,eax
   1af24:	jne    1af31 <qemu_paio_submit+0x31>
   1af26:	mov    eax,DWORD PTR [rip+0xf4a8]        # 2a3d4 <cur_threads>
   1af2c:	cmp    eax,0x3f
   1af2f:	jle    1af70 <qemu_paio_submit+0x70>
   1af31:	mov    rax,QWORD PTR [rip+0xf490]        # 2a3c8 <request_list+0x8>
   1af38:	mov    QWORD PTR [rbx+0x28],0x0
   1af40:	mov    QWORD PTR [rbx+0x30],rax
   1af44:	mov    QWORD PTR [rax],rbx
   1af47:	add    rbx,0x28
   1af4b:	mov    QWORD PTR [rip+0xf476],rbx        # 2a3c8 <request_list+0x8>
   1af52:	call   1aea0 <mutex_unlock.constprop.4>
   1af57:	lea    rdi,[rip+0xf4c2]        # 2a420 <cond>
   1af5e:	call   3320 <pthread_cond_signal@plt>
   1af63:	test   eax,eax
   1af65:	jne    1afb1 <qemu_paio_submit+0xb1>
   1af67:	xor    eax,eax
   1af69:	pop    rbx
   1af6a:	ret
   1af6b:	nop    DWORD PTR [rax+rax*1+0x0]
   1af70:	add    eax,0x1
   1af73:	xor    ecx,ecx
   1af75:	lea    rdx,[rip+0x44]        # 1afc0 <aio_thread>
   1af7c:	mov    DWORD PTR [rip+0xf44a],0x1        # 2a3d0 <idle_threads>
   1af86:	lea    rsi,[rip+0xf453]        # 2a3e0 <attr>
   1af8d:	lea    rdi,[rip+0xf484]        # 2a418 <thread_id>
   1af94:	mov    DWORD PTR [rip+0xf43a],eax        # 2a3d4 <cur_threads>
   1af9a:	call   30a0 <pthread_create@plt>
   1af9f:	test   eax,eax
   1afa1:	je     1af31 <qemu_paio_submit+0x31>
   1afa3:	lea    rsi,[rip+0x6ba1]        # 21b4b <suffixes.14512+0x60>
   1afaa:	mov    edi,eax
   1afac:	call   1ade0 <die2>
   1afb1:	lea    rsi,[rip+0x6ba2]        # 21b5a <suffixes.14512+0x6f>
   1afb8:	mov    edi,eax
   1afba:	call   1ade0 <die2>
   1afbf:	nop

000000000001b1c0 <qemu_paio_init>:
   1b1c0:	sub    rsp,0x8
   1b1c4:	lea    rdi,[rip+0xf215]        # 2a3e0 <attr>
   1b1cb:	call   3310 <pthread_attr_init@plt>
   1b1d0:	test   eax,eax
   1b1d2:	jne    1b209 <qemu_paio_init+0x49>
   1b1d4:	mov    esi,0x1
   1b1d9:	lea    rdi,[rip+0xf200]        # 2a3e0 <attr>
   1b1e0:	call   3410 <pthread_attr_setdetachstate@plt>
   1b1e5:	test   eax,eax
   1b1e7:	jne    1b217 <qemu_paio_init+0x57>
   1b1e9:	lea    rax,[rip+0xf1d0]        # 2a3c0 <request_list>
   1b1f0:	mov    QWORD PTR [rip+0xf1c5],0x0        # 2a3c0 <request_list>
   1b1fb:	mov    QWORD PTR [rip+0xf1c6],rax        # 2a3c8 <request_list+0x8>
   1b202:	xor    eax,eax
   1b204:	add    rsp,0x8
   1b208:	ret
   1b209:	lea    rsi,[rip+0x6998]        # 21ba8 <suffixes.14512+0xbd>
   1b210:	mov    edi,eax
   1b212:	call   1ade0 <die2>
   1b217:	lea    rsi,[rip+0x699c]        # 21bba <suffixes.14512+0xcf>
   1b21e:	mov    edi,eax
   1b220:	call   1ade0 <die2>
   1b225:	data16 nop WORD PTR cs:[rax+rax*1+0x0]

000000000001b230 <qemu_paio_read>:
   1b230:	mov    rsi,QWORD PTR [rip+0xddb1]        # 28fe8 <pread64@GLIBC_2.2.5>
   1b237:	jmp    1af00 <qemu_paio_submit>
   1b23c:	nop    DWORD PTR [rax+0x0]

000000000001b240 <qemu_paio_write>:
   1b240:	mov    rsi,QWORD PTR [rip+0xdd99]        # 28fe0 <pwrite64@GLIBC_2.2.5>
   1b247:	jmp    1af00 <qemu_paio_submit>
   1b24c:	nop    DWORD PTR [rax+0x0]

000000000001b250 <qemu_paio_fsync>:
   1b250:	sub    rsp,0x8
   1b254:	cmp    QWORD PTR [rdi+0x20],0x0
   1b259:	jne    1b27a <qemu_paio_fsync+0x2a>
   1b25b:	cmp    QWORD PTR [rdi+0x8],0x0
   1b260:	jne    1b299 <qemu_paio_fsync+0x49>
   1b262:	mov    QWORD PTR [rdi+0x10],0x1
   1b26a:	lea    rsi,[rip+0xfffffffffffffbbf]        # 1ae30 <fsync_like_pwrite>
   1b271:	add    rsp,0x8
   1b275:	jmp    1af00 <qemu_paio_submit>
   1b27a:	lea    rcx,[rip+0x699f]        # 21c20 <__PRETTY_FUNCTION__.14124>
   1b281:	mov    edx,0xd5
   1b286:	lea    rsi,[rip+0x687a]        # 21b07 <suffixes.14512+0x1c>
   1b28d:	lea    rdi,[rip+0x6942]        # 21bd6 <suffixes.14512+0xeb>
   1b294:	call   3230 <__assert_fail@plt>
   1b299:	lea    rcx,[rip+0x6980]        # 21c20 <__PRETTY_FUNCTION__.14124>
   1b2a0:	mov    edx,0xd6
   1b2a5:	lea    rsi,[rip+0x685b]        # 21b07 <suffixes.14512+0x1c>
   1b2ac:	lea    rdi,[rip+0x6938]        # 21beb <suffixes.14512+0x100>
   1b2b3:	call   3230 <__assert_fail@plt>
   1b2b8:	nop    DWORD PTR [rax+rax*1+0x0]

000000000001b2c0 <qemu_paio_return>:
   1b2c0:	push   rbx
   1b2c1:	mov    rbx,rdi
   1b2c4:	call   1aed0 <mutex_lock.constprop.5>
   1b2c9:	mov    rbx,QWORD PTR [rbx+0x40]
   1b2cd:	call   1aea0 <mutex_unlock.constprop.4>
   1b2d2:	mov    rax,rbx
   1b2d5:	pop    rbx
   1b2d6:	ret
   1b2d7:	nop    WORD PTR [rax+rax*1+0x0]

000000000001b2e0 <qemu_paio_error>:
   1b2e0:	push   rbx
   1b2e1:	mov    rbx,rdi
   1b2e4:	call   1aed0 <mutex_lock.constprop.5>
   1b2e9:	mov    rbx,QWORD PTR [rbx+0x40]
   1b2ed:	call   1aea0 <mutex_unlock.constprop.4>
   1b2f2:	mov    eax,0x0
   1b2f7:	mov    rdx,rbx
   1b2fa:	neg    rdx
   1b2fd:	test   rbx,rbx
   1b300:	pop    rbx
   1b301:	cmovs  eax,edx
   1b304:	ret
   1b305:	data16 nop WORD PTR cs:[rax+rax*1+0x0]

000000000001b310 <qemu_paio_cancel>:
   1b310:	push   rbx
   1b311:	mov    rbx,rsi
   1b314:	call   1aed0 <mutex_lock.constprop.5>
   1b319:	mov    eax,DWORD PTR [rbx+0x48]
   1b31c:	test   eax,eax
   1b31e:	jne    1b358 <qemu_paio_cancel+0x48>
   1b320:	mov    rax,QWORD PTR [rbx+0x28]
   1b324:	mov    rdx,QWORD PTR [rbx+0x30]
   1b328:	test   rax,rax
   1b32b:	je     1b370 <qemu_paio_cancel+0x60>
   1b32d:	mov    QWORD PTR [rax+0x30],rdx
   1b331:	mov    rdx,QWORD PTR [rbx+0x30]
   1b335:	mov    rax,QWORD PTR [rbx+0x28]
   1b339:	mov    QWORD PTR [rdx],rax
   1b33c:	mov    QWORD PTR [rbx+0x40],0xffffffffffffff83
   1b344:	mov    ebx,0x1
   1b349:	call   1aea0 <mutex_unlock.constprop.4>
   1b34e:	mov    eax,ebx
   1b350:	pop    rbx
   1b351:	ret
   1b352:	nop    WORD PTR [rax+rax*1+0x0]
   1b358:	cmp    QWORD PTR [rbx+0x40],0xffffffffffffff8d
   1b35d:	setne  bl
   1b360:	call   1aea0 <mutex_unlock.constprop.4>
   1b365:	movzx  ebx,bl
   1b368:	add    ebx,0x2
   1b36b:	mov    eax,ebx
   1b36d:	pop    rbx
   1b36e:	ret
   1b36f:	nop
   1b370:	mov    QWORD PTR [rip+0xf051],rdx        # 2a3c8 <request_list+0x8>
   1b377:	jmp    1b339 <qemu_paio_cancel+0x29>
   1b379:	nop    DWORD PTR [rax+0x0]

000000000001b380 <posix_aio_flush>:
   1b380:	xor    eax,eax
   1b382:	cmp    QWORD PTR [rdi+0x8],0x0
   1b387:	setne  al
   1b38a:	ret
   1b38b:	nop    DWORD PTR [rax+rax*1+0x0]

000000000001b390 <fd_open>:
   1b390:	push   r12
   1b392:	xor    eax,eax
   1b394:	push   rbp
   1b395:	push   rbx
   1b396:	mov    rbx,QWORD PTR [rdi+0x40]
   1b39a:	cmp    DWORD PTR [rbx+0x4],0x2
   1b39e:	jne    1b3ea <fd_open+0x5a>
   1b3a0:	mov    r12d,DWORD PTR [rbx]
   1b3a3:	mov    rbp,rdi
   1b3a6:	test   r12d,r12d
   1b3a9:	jns    1b3f0 <fd_open+0x60>
   1b3ab:	mov    edx,DWORD PTR [rbx+0x20]
   1b3ae:	test   edx,edx
   1b3b0:	jne    1b438 <fd_open+0xa8>
   1b3b6:	mov    esi,DWORD PTR [rbx+0xc]
   1b3b9:	lea    rdi,[rbp+0x48]
   1b3bd:	call   3440 <__open64_2@plt>
   1b3c2:	mov    DWORD PTR [rbx],eax
   1b3c4:	test   eax,eax
   1b3c6:	js     1b45b <fd_open+0xcb>
   1b3cc:	test   r12d,r12d
   1b3cf:	js     1b410 <fd_open+0x80>
   1b3d1:	mov    rdi,QWORD PTR [rip+0xf0b8]        # 2a490 <rt_clock>
   1b3d8:	call   51a0 <qemu_get_clock>
   1b3dd:	mov    DWORD PTR [rbx+0x20],0x0
   1b3e4:	mov    QWORD PTR [rbx+0x10],rax
   1b3e8:	xor    eax,eax
   1b3ea:	pop    rbx
   1b3eb:	pop    rbp
   1b3ec:	pop    r12
   1b3ee:	ret
   1b3ef:	nop
   1b3f0:	mov    rdi,QWORD PTR [rip+0xf099]        # 2a490 <rt_clock>
   1b3f7:	call   51a0 <qemu_get_clock>
   1b3fc:	sub    rax,QWORD PTR [rbx+0x10]
   1b400:	cmp    rax,0x3e7
   1b406:	jg     1b420 <fd_open+0x90>
   1b408:	mov    eax,DWORD PTR [rbx]
   1b40a:	test   eax,eax
   1b40c:	jns    1b3d1 <fd_open+0x41>
   1b40e:	jmp    1b3ab <fd_open+0x1b>
   1b410:	mov    DWORD PTR [rbx+0x24],0x1
   1b417:	jmp    1b3d1 <fd_open+0x41>
   1b419:	nop    DWORD PTR [rax+0x0]
   1b420:	mov    edi,DWORD PTR [rbx]
   1b422:	call   3270 <close@plt>
   1b427:	mov    DWORD PTR [rbx],0xffffffff
   1b42d:	jmp    1b3ab <fd_open+0x1b>
   1b432:	nop    WORD PTR [rax+rax*1+0x0]
   1b438:	mov    rdi,QWORD PTR [rip+0xf051]        # 2a490 <rt_clock>
   1b43f:	call   51a0 <qemu_get_clock>
   1b444:	sub    rax,QWORD PTR [rbx+0x18]
   1b448:	cmp    rax,0x3e7
   1b44e:	jg     1b3b6 <fd_open+0x26>
   1b454:	mov    eax,0xfffffffb
   1b459:	jmp    1b3ea <fd_open+0x5a>
   1b45b:	mov    rdi,QWORD PTR [rip+0xf02e]        # 2a490 <rt_clock>
   1b462:	call   51a0 <qemu_get_clock>
   1b467:	mov    DWORD PTR [rbx+0x20],0x1
   1b46e:	mov    QWORD PTR [rbx+0x18],rax
   1b472:	test   r12d,r12d
   1b475:	js     1b454 <fd_open+0xc4>
   1b477:	mov    DWORD PTR [rbx+0x24],0x1
   1b47e:	jmp    1b454 <fd_open+0xc4>

000000000001b480 <raw_getlength>:
   1b480:	push   rbx
   1b481:	mov    rax,QWORD PTR [rdi+0x40]
   1b485:	mov    ebx,DWORD PTR [rax]
   1b487:	call   1b390 <fd_open>
   1b48c:	test   eax,eax
   1b48e:	js     1b4a0 <raw_getlength+0x20>
   1b490:	mov    edi,ebx
   1b492:	mov    edx,0x2
   1b497:	xor    esi,esi
   1b499:	pop    rbx
   1b49a:	jmp    3650 <lseek64@plt>
   1b49f:	nop
   1b4a0:	cdqe
   1b4a2:	pop    rbx
   1b4a3:	ret
   1b4a4:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   1b4af:	nop

000000000001b4b0 <raw_media_changed>:
   1b4b0:	push   rbx
   1b4b1:	mov    rbx,QWORD PTR [rdi+0x40]
   1b4b5:	mov    eax,0xffffffa1
   1b4ba:	cmp    DWORD PTR [rbx+0x4],0x2
   1b4be:	jne    1b4cf <raw_media_changed+0x1f>
   1b4c0:	call   1b390 <fd_open>
   1b4c5:	mov    eax,DWORD PTR [rbx+0x24]
   1b4c8:	mov    DWORD PTR [rbx+0x24],0x0
   1b4cf:	pop    rbx
   1b4d0:	ret
   1b4d1:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   1b4dc:	nop    DWORD PTR [rax+0x0]

000000000001b4e0 <raw_create>:
   1b4e0:	test   ecx,ecx
   1b4e2:	jne    1b530 <raw_create+0x50>
   1b4e4:	test   rdx,rdx
   1b4e7:	jne    1b530 <raw_create+0x50>
   1b4e9:	push   rbp
   1b4ea:	mov    edx,0x1a4
   1b4ef:	xor    eax,eax
   1b4f1:	push   rbx
   1b4f2:	mov    rbx,rsi
   1b4f5:	mov    esi,0x241
   1b4fa:	sub    rsp,0x8
   1b4fe:	call   3500 <open64@plt>
   1b503:	mov    ebp,eax
   1b505:	test   eax,eax
   1b507:	js     1b540 <raw_create+0x60>
   1b509:	shl    rbx,0x9
   1b50d:	mov    edi,eax
   1b50f:	mov    rsi,rbx
   1b512:	call   34c0 <ftruncate64@plt>
   1b517:	mov    edi,ebp
   1b519:	call   3270 <close@plt>
   1b51e:	xor    eax,eax
   1b520:	add    rsp,0x8
   1b524:	pop    rbx
   1b525:	pop    rbp
   1b526:	ret
   1b527:	nop    WORD PTR [rax+rax*1+0x0]
   1b530:	mov    eax,0xffffffa1
   1b535:	ret
   1b536:	nop    WORD PTR cs:[rax+rax*1+0x0]
   1b540:	mov    eax,0xfffffffb
   1b545:	jmp    1b520 <raw_create+0x40>
   1b547:	nop    WORD PTR [rax+rax*1+0x0]

000000000001b550 <raw_pread_aligned>:
   1b550:	push   r15
   1b552:	push   r14
   1b554:	mov    r14,rdx
   1b557:	push   r13
   1b559:	mov    r13,rsi
   1b55c:	push   r12
   1b55e:	mov    r12d,ecx
   1b561:	push   rbp
   1b562:	push   rbx
   1b563:	mov    rbx,rdi
   1b566:	sub    rsp,0x8
   1b56a:	mov    rbp,QWORD PTR [rdi+0x40]
   1b56e:	call   1b390 <fd_open>
   1b573:	test   eax,eax
   1b575:	js     1b5b5 <raw_pread_aligned+0x65>
   1b577:	mov    edi,DWORD PTR [rbp+0x0]
   1b57a:	test   r13,r13
   1b57d:	js     1b592 <raw_pread_aligned+0x42>
   1b57f:	xor    edx,edx
   1b581:	mov    rsi,r13
   1b584:	call   3650 <lseek64@plt>
   1b589:	cmp    rax,0xffffffffffffffff
   1b58d:	je     1b605 <raw_pread_aligned+0xb5>
   1b58f:	mov    edi,DWORD PTR [rbp+0x0]
   1b592:	mov    DWORD PTR [rbp+0x8],0x0
   1b599:	movsxd r15,r12d
   1b59c:	mov    rsi,r14
   1b59f:	mov    rdx,r15
   1b5a2:	call   5210 <qemu_read>
   1b5a7:	cmp    r12d,eax
   1b5aa:	je     1b5b5 <raw_pread_aligned+0x65>
   1b5ac:	cmp    DWORD PTR [rbx+0x894],0x1
   1b5b3:	je     1b5c8 <raw_pread_aligned+0x78>
   1b5b5:	add    rsp,0x8
   1b5b9:	pop    rbx
   1b5ba:	pop    rbp
   1b5bb:	pop    r12
   1b5bd:	pop    r13
   1b5bf:	pop    r14
   1b5c1:	pop    r15
   1b5c3:	ret
   1b5c4:	nop    DWORD PTR [rax+0x0]
   1b5c8:	mov    edi,DWORD PTR [rbp+0x0]
   1b5cb:	xor    edx,edx
   1b5cd:	mov    rsi,r13
   1b5d0:	call   3650 <lseek64@plt>
   1b5d5:	mov    edi,DWORD PTR [rbp+0x0]
   1b5d8:	mov    rdx,r15
   1b5db:	mov    rsi,r14
   1b5de:	call   5210 <qemu_read>
   1b5e3:	cmp    r12d,eax
   1b5e6:	je     1b5b5 <raw_pread_aligned+0x65>
   1b5e8:	mov    edi,DWORD PTR [rbp+0x0]
   1b5eb:	xor    edx,edx
   1b5ed:	mov    rsi,r13
   1b5f0:	call   3650 <lseek64@plt>
   1b5f5:	mov    edi,DWORD PTR [rbp+0x0]
   1b5f8:	mov    rdx,r15
   1b5fb:	mov    rsi,r14
   1b5fe:	call   5210 <qemu_read>
   1b603:	jmp    1b5b5 <raw_pread_aligned+0x65>
   1b605:	add    DWORD PTR [rbp+0x8],0x1
   1b609:	jmp    1b5b5 <raw_pread_aligned+0x65>
   1b60b:	nop    DWORD PTR [rax+rax*1+0x0]

000000000001b8c0 <raw_aio_setup>:
   1b8c0:	push   r15
   1b8c2:	mov    r15,r8
   1b8c5:	push   r14
   1b8c7:	push   r13
   1b8c9:	mov    r13,rdx
   1b8cc:	push   r12
   1b8ce:	mov    r12d,ecx
   1b8d1:	push   rbp
   1b8d2:	mov    rbp,rsi
   1b8d5:	push   rbx
   1b8d6:	mov    rbx,rdi
   1b8d9:	sub    rsp,0x18
   1b8dd:	mov    r14,QWORD PTR [rdi+0x40]
   1b8e1:	mov    QWORD PTR [rsp+0x8],r9
   1b8e6:	call   1b390 <fd_open>
   1b8eb:	mov    r9,QWORD PTR [rsp+0x8]
   1b8f0:	test   eax,eax
   1b8f2:	js     1b960 <raw_aio_setup+0xa0>
   1b8f4:	mov    rdx,r9
   1b8f7:	mov    rsi,r15
   1b8fa:	mov    rdi,rbx
   1b8fd:	call   1a680 <qemu_aio_get>
   1b902:	test   rax,rax
   1b905:	je     1b960 <raw_aio_setup+0xa0>
   1b907:	mov    edx,DWORD PTR [r14]
   1b90a:	mov    ecx,r12d
   1b90d:	mov    DWORD PTR [rax+0x40],0xc
   1b914:	neg    ecx
   1b916:	mov    QWORD PTR [rax+0x30],r13
   1b91a:	mov    DWORD PTR [rax+0x28],edx
   1b91d:	mov    edx,r12d
   1b920:	movsxd rcx,ecx
   1b923:	shl    edx,0x9
   1b926:	test   r12d,r12d
   1b929:	movsxd rdx,edx
   1b92c:	cmovs  rdx,rcx
   1b930:	shl    rbp,0x9
   1b934:	mov    QWORD PTR [rax+0x48],rbp
   1b938:	mov    QWORD PTR [rax+0x38],rdx
   1b93c:	mov    rdx,QWORD PTR [rip+0xeb45]        # 2a488 <posix_aio_state>
   1b943:	mov    rcx,QWORD PTR [rdx+0x8]
   1b947:	mov    QWORD PTR [rax+0x78],rcx
   1b94b:	mov    QWORD PTR [rdx+0x8],rax
   1b94f:	add    rsp,0x18
   1b953:	pop    rbx
   1b954:	pop    rbp
   1b955:	pop    r12
   1b957:	pop    r13
   1b959:	pop    r14
   1b95b:	pop    r15
   1b95d:	ret
   1b95e:	xchg   ax,ax
   1b960:	add    rsp,0x18
   1b964:	xor    eax,eax
   1b966:	pop    rbx
   1b967:	pop    rbp
   1b968:	pop    r12
   1b96a:	pop    r13
   1b96c:	pop    r14
   1b96e:	pop    r15
   1b970:	ret
   1b971:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   1b97c:	nop    DWORD PTR [rax+0x0]

000000000001b9a0 <raw_ioctl>:
   1b9a0:	mov    rax,QWORD PTR [rdi+0x40]
   1b9a4:	mov    edi,DWORD PTR [rax]
   1b9a6:	xor    eax,eax
   1b9a8:	jmp    3260 <ioctl@plt>
   1b9ad:	nop    DWORD PTR [rax]

000000000001b9b0 <raw_set_locked>:
   1b9b0:	mov    rcx,QWORD PTR [rdi+0x40]
   1b9b4:	cmp    DWORD PTR [rcx+0x4],0x1
   1b9b8:	jne    1b9d8 <raw_set_locked+0x28>
   1b9ba:	sub    rsp,0x8
   1b9be:	mov    edi,DWORD PTR [rcx]
   1b9c0:	mov    edx,esi
   1b9c2:	xor    eax,eax
   1b9c4:	mov    esi,0x5329
   1b9c9:	call   3260 <ioctl@plt>
   1b9ce:	xor    eax,eax
   1b9d0:	add    rsp,0x8
   1b9d4:	ret
   1b9d5:	nop    DWORD PTR [rax]
   1b9d8:	mov    eax,0xffffffa1
   1b9dd:	ret
   1b9de:	xchg   ax,ax

000000000001b9e0 <raw_close>:
   1b9e0:	push   rbx
   1b9e1:	mov    rbx,QWORD PTR [rdi+0x40]
   1b9e5:	mov    edi,DWORD PTR [rbx]
   1b9e7:	test   edi,edi
   1b9e9:	jns    1b9f0 <raw_close+0x10>
   1b9eb:	pop    rbx
   1b9ec:	ret
   1b9ed:	nop    DWORD PTR [rax]
   1b9f0:	xor    edx,edx
   1b9f2:	mov    esi,0x1261
   1b9f7:	xor    eax,eax
   1b9f9:	call   3260 <ioctl@plt>
   1b9fe:	mov    edi,DWORD PTR [rbx]
   1ba00:	call   3270 <close@plt>
   1ba05:	mov    rdi,QWORD PTR [rbx+0x28]
   1ba09:	mov    DWORD PTR [rbx],0xffffffff
   1ba0f:	test   rdi,rdi
   1ba12:	je     1b9eb <raw_close+0xb>
   1ba14:	pop    rbx
   1ba15:	jmp    5960 <qemu_free>
   1ba1a:	nop    WORD PTR [rax+rax*1+0x0]

000000000001bb40 <aio_signal_handler>:
   1bb40:	sub    rsp,0x18
   1bb44:	mov    rax,QWORD PTR fs:0x28
   1bb4d:	mov    QWORD PTR [rsp+0x8],rax
   1bb52:	xor    eax,eax
   1bb54:	mov    rax,QWORD PTR [rip+0xe92d]        # 2a488 <posix_aio_state>
   1bb5b:	test   rax,rax
   1bb5e:	je     1bb77 <aio_signal_handler+0x37>
   1bb60:	mov    edi,DWORD PTR [rax+0x4]
   1bb63:	lea    rsi,[rsp+0x7]
   1bb68:	mov    edx,0x1
   1bb6d:	mov    BYTE PTR [rsp+0x7],0x0
   1bb72:	call   3160 <write@plt>
   1bb77:	call   50f0 <qemu_service_io>
   1bb7c:	mov    rax,QWORD PTR [rsp+0x8]
   1bb81:	xor    rax,QWORD PTR fs:0x28
   1bb8a:	jne    1bb91 <aio_signal_handler+0x51>
   1bb8c:	add    rsp,0x18
   1bb90:	ret
   1bb91:	call   31c0 <__stack_chk_fail@plt>
   1bb96:	nop    WORD PTR cs:[rax+rax*1+0x0]

000000000001bba0 <raw_eject>:
   1bba0:	push   rbp
   1bba1:	push   rbx
   1bba2:	sub    rsp,0x8
   1bba6:	mov    rbx,QWORD PTR [rdi+0x40]
   1bbaa:	mov    eax,DWORD PTR [rbx+0x4]
   1bbad:	cmp    eax,0x1
   1bbb0:	je     1bbf8 <raw_eject+0x58>
   1bbb2:	cmp    eax,0x2
   1bbb5:	jne    1bbe8 <raw_eject+0x48>
   1bbb7:	mov    rbp,rdi
   1bbba:	mov    edi,DWORD PTR [rbx]
   1bbbc:	test   edi,edi
   1bbbe:	jns    1bc38 <raw_eject+0x98>
   1bbc0:	mov    esi,DWORD PTR [rbx+0xc]
   1bbc3:	lea    rdi,[rbp+0x48]
   1bbc7:	or     esi,0x800
   1bbcd:	call   3440 <__open64_2@plt>
   1bbd2:	mov    ebx,eax
   1bbd4:	test   eax,eax
   1bbd6:	jns    1bc50 <raw_eject+0xb0>
   1bbd8:	xor    eax,eax
   1bbda:	add    rsp,0x8
   1bbde:	pop    rbx
   1bbdf:	pop    rbp
   1bbe0:	ret
   1bbe1:	nop    DWORD PTR [rax+0x0]
   1bbe8:	mov    eax,0xffffffa1
   1bbed:	add    rsp,0x8
   1bbf1:	pop    rbx
   1bbf2:	pop    rbp
   1bbf3:	ret
   1bbf4:	nop    DWORD PTR [rax+0x0]
   1bbf8:	mov    edi,DWORD PTR [rbx]
   1bbfa:	xor    edx,edx
   1bbfc:	test   esi,esi
   1bbfe:	je     1bc20 <raw_eject+0x80>
   1bc00:	xor    eax,eax
   1bc02:	mov    esi,0x5309
   1bc07:	call   3260 <ioctl@plt>
   1bc0c:	test   eax,eax
   1bc0e:	jns    1bbd8 <raw_eject+0x38>
   1bc10:	lea    rdi,[rip+0x6019]        # 21c30 <__PRETTY_FUNCTION__.14124+0x10>
   1bc17:	call   35b0 <perror@plt>
   1bc1c:	xor    eax,eax
   1bc1e:	jmp    1bbed <raw_eject+0x4d>
   1bc20:	xor    eax,eax
   1bc22:	mov    esi,0x5319
   1bc27:	call   3260 <ioctl@plt>
   1bc2c:	test   eax,eax
   1bc2e:	js     1bc10 <raw_eject+0x70>
   1bc30:	xor    eax,eax
   1bc32:	jmp    1bbda <raw_eject+0x3a>
   1bc34:	nop    DWORD PTR [rax+0x0]
   1bc38:	call   3270 <close@plt>
   1bc3d:	mov    DWORD PTR [rbx],0xffffffff
   1bc43:	jmp    1bbc0 <raw_eject+0x20>
   1bc48:	nop    DWORD PTR [rax+rax*1+0x0]
   1bc50:	xor    edx,edx
   1bc52:	mov    edi,eax
   1bc54:	mov    esi,0x25a
   1bc59:	xor    eax,eax
   1bc5b:	call   3260 <ioctl@plt>
   1bc60:	test   eax,eax
   1bc62:	js     1bc78 <raw_eject+0xd8>
   1bc64:	mov    edi,ebx
   1bc66:	call   3270 <close@plt>
   1bc6b:	xor    eax,eax
   1bc6d:	jmp    1bbda <raw_eject+0x3a>
   1bc72:	nop    WORD PTR [rax+rax*1+0x0]
   1bc78:	lea    rdi,[rip+0x5fbc]        # 21c3b <__PRETTY_FUNCTION__.14124+0x1b>
   1bc7f:	call   35b0 <perror@plt>
   1bc84:	jmp    1bc64 <raw_eject+0xc4>
   1bc86:	nop    WORD PTR cs:[rax+rax*1+0x0]

000000000001bc90 <raw_pwrite_aligned>:
   1bc90:	push   r13
   1bc92:	mov    r13,rsi
   1bc95:	push   r12
   1bc97:	mov    r12,rdx
   1bc9a:	push   rbp
   1bc9b:	push   rbx
   1bc9c:	mov    ebx,ecx
   1bc9e:	sub    rsp,0x8
   1bca2:	mov    rbp,QWORD PTR [rdi+0x40]
   1bca6:	call   1b390 <fd_open>
   1bcab:	test   eax,eax
   1bcad:	js     1bcf0 <raw_pwrite_aligned+0x60>
   1bcaf:	mov    edi,DWORD PTR [rbp+0x0]
   1bcb2:	test   r13,r13
   1bcb5:	js     1bcca <raw_pwrite_aligned+0x3a>
   1bcb7:	xor    edx,edx
   1bcb9:	mov    rsi,r13
   1bcbc:	call   3650 <lseek64@plt>
   1bcc1:	cmp    rax,0xffffffffffffffff
   1bcc5:	je     1bd06 <raw_pwrite_aligned+0x76>
   1bcc7:	mov    edi,DWORD PTR [rbp+0x0]
   1bcca:	mov    DWORD PTR [rbp+0x8],0x0
   1bcd1:	movsxd rdx,ebx
   1bcd4:	mov    rsi,r12
   1bcd7:	call   52e0 <qemu_write>
   1bcdc:	mov    edx,eax
   1bcde:	test   eax,eax
   1bce0:	js     1bcf0 <raw_pwrite_aligned+0x60>
   1bce2:	add    rsp,0x8
   1bce6:	mov    eax,edx
   1bce8:	pop    rbx
   1bce9:	pop    rbp
   1bcea:	pop    r12
   1bcec:	pop    r13
   1bcee:	ret
   1bcef:	nop
   1bcf0:	call   30d0 <__errno_location@plt>
   1bcf5:	mov    edx,DWORD PTR [rax]
   1bcf7:	add    rsp,0x8
   1bcfb:	pop    rbx
   1bcfc:	pop    rbp
   1bcfd:	neg    edx
   1bcff:	pop    r12
   1bd01:	pop    r13
   1bd03:	mov    eax,edx
   1bd05:	ret
   1bd06:	add    DWORD PTR [rbp+0x8],0x1
   1bd0a:	mov    edx,0xfffffffb
   1bd0f:	jmp    1bce2 <raw_pwrite_aligned+0x52>
   1bd11:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   1bd1c:	nop    DWORD PTR [rax+0x0]

000000000001c020 <raw_aio_remove>:
   1c020:	mov    rax,QWORD PTR [rip+0xe461]        # 2a488 <posix_aio_state>
   1c027:	mov    rdx,QWORD PTR [rax+0x8]
   1c02b:	test   rdx,rdx
   1c02e:	je     1c051 <raw_aio_remove+0x31>
   1c030:	cmp    rdx,rdi
   1c033:	jne    1c048 <raw_aio_remove+0x28>
   1c035:	jmp    1c080 <raw_aio_remove+0x60>
   1c037:	nop    WORD PTR [rax+rax*1+0x0]
   1c040:	cmp    rax,rdi
   1c043:	je     1c070 <raw_aio_remove+0x50>
   1c045:	mov    rdx,rax
   1c048:	mov    rax,QWORD PTR [rdx+0x78]
   1c04c:	test   rax,rax
   1c04f:	jne    1c040 <raw_aio_remove+0x20>
   1c051:	mov    rcx,QWORD PTR [rip+0xe2a8]        # 2a300 <stderr@@GLIBC_2.2.5>
   1c058:	mov    edx,0x27
   1c05d:	mov    esi,0x1
   1c062:	lea    rdi,[rip+0x5c17]        # 21c80 <__PRETTY_FUNCTION__.14124+0x60>
   1c069:	jmp    3640 <fwrite@plt>
   1c06e:	xchg   ax,ax
   1c070:	add    rdx,0x78
   1c074:	mov    rax,QWORD PTR [rdi+0x78]
   1c078:	mov    QWORD PTR [rdx],rax
   1c07b:	jmp    1a860 <qemu_aio_release>
   1c080:	lea    rdx,[rax+0x8]
   1c084:	jmp    1c074 <raw_aio_remove+0x54>
   1c086:	nop    WORD PTR cs:[rax+rax*1+0x0]

000000000001c090 <raw_aio_flush>:
   1c090:	push   rbx
   1c091:	mov    r8,rsi
   1c094:	mov    r9,rdx
   1c097:	xor    ecx,ecx
   1c099:	xor    edx,edx
   1c09b:	xor    esi,esi
   1c09d:	call   1b8c0 <raw_aio_setup>
   1c0a2:	test   rax,rax
   1c0a5:	je     1c0c0 <raw_aio_flush+0x30>
   1c0a7:	lea    rdi,[rax+0x28]
   1c0ab:	mov    rbx,rax
   1c0ae:	call   1b250 <qemu_paio_fsync>
   1c0b3:	test   eax,eax
   1c0b5:	js     1c0d0 <raw_aio_flush+0x40>
   1c0b7:	mov    rax,rbx
   1c0ba:	pop    rbx
   1c0bb:	ret
   1c0bc:	nop    DWORD PTR [rax+0x0]
   1c0c0:	xor    ebx,ebx
   1c0c2:	mov    rax,rbx
   1c0c5:	pop    rbx
   1c0c6:	ret
   1c0c7:	nop    WORD PTR [rax+rax*1+0x0]
   1c0d0:	mov    rdi,rbx
   1c0d3:	xor    ebx,ebx
   1c0d5:	call   1c020 <raw_aio_remove>
   1c0da:	jmp    1c0b7 <raw_aio_flush+0x27>
   1c0dc:	nop    DWORD PTR [rax+0x0]

000000000001c0e0 <raw_aio_cancel>:
   1c0e0:	push   rbp
   1c0e1:	mov    rbp,rdi
   1c0e4:	push   rbx
   1c0e5:	lea    rbx,[rdi+0x28]
   1c0e9:	mov    rsi,rbx
   1c0ec:	sub    rsp,0x8
   1c0f0:	mov    edi,DWORD PTR [rdi+0x28]
   1c0f3:	call   1b310 <qemu_paio_cancel>
   1c0f8:	cmp    eax,0x2
   1c0fb:	je     1c110 <raw_aio_cancel+0x30>
   1c0fd:	add    rsp,0x8
   1c101:	mov    rdi,rbp
   1c104:	pop    rbx
   1c105:	pop    rbp
   1c106:	jmp    1c020 <raw_aio_remove>
   1c10b:	nop    DWORD PTR [rax+rax*1+0x0]
   1c110:	mov    rdi,rbx
   1c113:	call   1b2e0 <qemu_paio_error>
   1c118:	cmp    eax,0x73
   1c11b:	jne    1c0fd <raw_aio_cancel+0x1d>
   1c11d:	mov    rdi,rbx
   1c120:	call   1b2e0 <qemu_paio_error>
   1c125:	cmp    eax,0x73
   1c128:	je     1c110 <raw_aio_cancel+0x30>
   1c12a:	jmp    1c0fd <raw_aio_cancel+0x1d>
   1c12c:	nop    DWORD PTR [rax+0x0]

000000000001c130 <raw_aio_cancel>:
   1c130:	push   r13
   1c132:	mov    r13,rsi
   1c135:	push   r12
   1c137:	mov    r12,rdx
   1c13a:	push   rbp
   1c13b:	mov    rbp,rdi
   1c13e:	push   rbx
   1c13f:	sub    rsp,0x18
   1c143:	mov    rax,QWORD PTR [rdi+0x40]
   1c147:	cmp    QWORD PTR [rax+0x28],0x0
   1c14c:	jne    1c190 <raw_aio_write+0x60>
   1c14e:	mov    rdx,r12
   1c151:	mov    rsi,r13
   1c154:	mov    rdi,rbp
   1c157:	call   1b8c0 <raw_aio_setup>
   1c15c:	mov    rbx,rax
   1c15f:	test   rax,rax
   1c162:	je     1c180 <raw_aio_write+0x50>
   1c164:	lea    rdi,[rax+0x28]
   1c168:	call   1b240 <qemu_paio_write>
   1c16d:	test   eax,eax
   1c16f:	js     1c1e8 <raw_aio_write+0xb8>
   1c171:	add    rsp,0x18
   1c175:	mov    rax,rbx
   1c178:	pop    rbx
   1c179:	pop    rbp
   1c17a:	pop    r12
   1c17c:	pop    r13
   1c17e:	ret
   1c17f:	nop
   1c180:	add    rsp,0x18
   1c184:	xor    ebx,ebx
   1c186:	mov    rax,rbx
   1c189:	pop    rbx
   1c18a:	pop    rbp
   1c18b:	pop    r12
   1c18d:	pop    r13
   1c18f:	ret
   1c190:	test   edx,0x1ff
   1c196:	je     1c14e <raw_aio_write+0x1e>
   1c198:	mov    rdx,r9
   1c19b:	mov    rsi,r8
   1c19e:	mov    DWORD PTR [rsp+0xc],ecx
   1c1a2:	call   1a680 <qemu_aio_get>
   1c1a7:	mov    ecx,DWORD PTR [rsp+0xc]
   1c1ab:	mov    rsi,r13
   1c1ae:	mov    rdx,r12
   1c1b1:	shl    rsi,0x9
   1c1b5:	mov    rdi,rbp
   1c1b8:	mov    rbx,rax
   1c1bb:	shl    ecx,0x9
   1c1be:	call   1bd20 <raw_pwrite>
   1c1c3:	mov    rsi,rbx
   1c1c6:	lea    rdi,[rip+0xfffffffffffff7b3]        # 1b980 <raw_aio_em_cb>
   1c1cd:	mov    DWORD PTR [rbx+0x80],eax
   1c1d3:	call   5120 <qemu_bh_new>
   1c1d8:	mov    rdi,rax
   1c1db:	call   5160 <qemu_bh_schedule>
   1c1e0:	jmp    1c171 <raw_aio_write+0x41>
   1c1e2:	nop    WORD PTR [rax+rax*1+0x0]
   1c1e8:	mov    rdi,rbx
   1c1eb:	xor    ebx,ebx
   1c1ed:	call   1c020 <raw_aio_remove>
   1c1f2:	jmp    1c171 <raw_aio_write+0x41>
   1c1f7:	nop    WORD PTR [rax+rax*1+0x0]

000000000001c200 <raw_aio_read>:
   1c200:	push   r13
   1c202:	mov    r13,rsi
   1c205:	push   r12
   1c207:	mov    r12,rdx
   1c20a:	push   rbp
   1c20b:	mov    rbp,rdi
   1c20e:	push   rbx
   1c20f:	sub    rsp,0x18
   1c213:	mov    rax,QWORD PTR [rdi+0x40]
   1c217:	cmp    QWORD PTR [rax+0x28],0x0
   1c21c:	jne    1c260 <raw_aio_read+0x60>
   1c21e:	mov    rdx,r12
   1c221:	mov    rsi,r13
   1c224:	mov    rdi,rbp
   1c227:	call   1b8c0 <raw_aio_setup>
   1c22c:	mov    rbx,rax
   1c22f:	test   rax,rax
   1c232:	je     1c250 <raw_aio_read+0x50>
   1c234:	lea    rdi,[rax+0x28]
   1c238:	call   1b230 <qemu_paio_read>
   1c23d:	test   eax,eax
   1c23f:	js     1c2b8 <raw_aio_read+0xb8>
   1c241:	add    rsp,0x18
   1c245:	mov    rax,rbx
   1c248:	pop    rbx
   1c249:	pop    rbp
   1c24a:	pop    r12
   1c24c:	pop    r13
   1c24e:	ret
   1c24f:	nop
   1c250:	add    rsp,0x18
   1c254:	xor    ebx,ebx
   1c256:	mov    rax,rbx
   1c259:	pop    rbx
   1c25a:	pop    rbp
   1c25b:	pop    r12
   1c25d:	pop    r13
   1c25f:	ret
   1c260:	test   edx,0x1ff
   1c266:	je     1c21e <raw_aio_read+0x1e>
   1c268:	mov    rdx,r9
   1c26b:	mov    rsi,r8
   1c26e:	mov    DWORD PTR [rsp+0xc],ecx
   1c272:	call   1a680 <qemu_aio_get>
   1c277:	mov    ecx,DWORD PTR [rsp+0xc]
   1c27b:	mov    rsi,r13
   1c27e:	mov    rdx,r12
   1c281:	shl    rsi,0x9
   1c285:	mov    rdi,rbp
   1c288:	mov    rbx,rax
   1c28b:	shl    ecx,0x9
   1c28e:	call   1b610 <raw_pread>
   1c293:	mov    rsi,rbx
   1c296:	lea    rdi,[rip+0xfffffffffffff6e3]        # 1b980 <raw_aio_em_cb>
   1c29d:	mov    DWORD PTR [rbx+0x80],eax
   1c2a3:	call   5120 <qemu_bh_new>
   1c2a8:	mov    rdi,rax
   1c2ab:	call   5160 <qemu_bh_schedule>
   1c2b0:	jmp    1c241 <raw_aio_read+0x41>
   1c2b2:	nop    WORD PTR [rax+rax*1+0x0]
   1c2b8:	mov    rdi,rbx
   1c2bb:	xor    ebx,ebx
   1c2bd:	call   1c020 <raw_aio_remove>
   1c2c2:	jmp    1c241 <raw_aio_read+0x41>
   1c2c7:	nop    WORD PTR [rax+rax*1+0x0]

000000000001c2d0 <raw_flush>:
   1c2d0:	sub    rsp,0x8
   1c2d4:	mov    rax,QWORD PTR [rdi+0x40]
   1c2d8:	mov    edi,DWORD PTR [rax]
   1c2da:	call   3560 <fsync@plt>
   1c2df:	test   eax,eax
   1c2e1:	je     1c2ea <raw_flush+0x1a>
   1c2e3:	call   30d0 <__errno_location@plt>
   1c2e8:	mov    eax,DWORD PTR [rax]
   1c2ea:	add    rsp,0x8
   1c2ee:	ret
   1c2ef:	nop

000000000001c2f0 <raw_is_inserted>:
   1c2f0:	sub    rsp,0x8
   1c2f4:	mov    rcx,QWORD PTR [rdi+0x40]
   1c2f8:	mov    eax,DWORD PTR [rcx+0x4]
   1c2fb:	cmp    eax,0x1
   1c2fe:	je     1c328 <raw_is_inserted+0x38>
   1c300:	cmp    eax,0x2
   1c303:	jne    1c318 <raw_is_inserted+0x28>
   1c305:	call   1b390 <fd_open>
   1c30a:	add    rsp,0x8
   1c30e:	not    eax
   1c310:	shr    eax,0x1f
   1c313:	ret
   1c314:	nop    DWORD PTR [rax+0x0]
   1c318:	mov    eax,0x1
   1c31d:	add    rsp,0x8
   1c321:	ret
   1c322:	nop    WORD PTR [rax+rax*1+0x0]
   1c328:	mov    edi,DWORD PTR [rcx]
   1c32a:	xor    eax,eax
   1c32c:	mov    edx,0x7fffffff
   1c331:	mov    esi,0x5326
   1c336:	call   3260 <ioctl@plt>
   1c33b:	cmp    eax,0x4
   1c33e:	sete   al
   1c341:	add    rsp,0x8
   1c345:	movzx  eax,al
   1c348:	ret
   1c349:	nop    DWORD PTR [rax+0x0]

000000000001c350 <posix_aio_init.part.8>:
   1c350:	push   rbp
   1c351:	mov    edi,0x10
   1c356:	push   rbx
   1c357:	sub    rsp,0x148
   1c35e:	mov    rax,QWORD PTR fs:0x28
   1c367:	mov    QWORD PTR [rsp+0x138],rax
   1c36f:	xor    eax,eax
   1c371:	lea    rbp,[rsp+0x20]
   1c376:	call   5970 <qemu_malloc>
   1c37b:	mov    rdi,rbp
   1c37e:	mov    rbx,rax
   1c381:	call   3380 <sigemptyset@plt>
   1c386:	mov    rdi,rbp
   1c389:	mov    esi,0xc
   1c38e:	call   36a0 <sigaddset@plt>
   1c393:	xor    edx,edx
   1c395:	mov    rsi,rbp
   1c398:	mov    edi,0x1
   1c39d:	call   3050 <sigprocmask@plt>
   1c3a2:	lea    rbp,[rsp+0xa0]
   1c3aa:	lea    rdi,[rsp+0xa8]
   1c3b2:	call   33a0 <sigfillset@plt>
   1c3b7:	xor    edx,edx
   1c3b9:	mov    edi,0xc
   1c3be:	mov    rsi,rbp
   1c3c1:	lea    rax,[rip+0xfffffffffffff778]        # 1bb40 <aio_signal_handler>
   1c3c8:	mov    DWORD PTR [rsp+0x128],0x0
   1c3d3:	mov    QWORD PTR [rsp+0xa0],rax
   1c3db:	call   3140 <sigaction@plt>
   1c3e0:	mov    QWORD PTR [rbx+0x8],0x0
   1c3e8:	lea    rdi,[rsp+0x18]
   1c3ed:	call   3290 <pipe@plt>
   1c3f2:	cmp    eax,0xffffffff
   1c3f5:	je     1c490 <posix_aio_init.part.8+0x140>
   1c3fb:	mov    edi,DWORD PTR [rsp+0x18]
   1c3ff:	mov    edx,0x800
   1c404:	mov    esi,0x4
   1c409:	mov    DWORD PTR [rbx],edi
   1c40b:	mov    eax,DWORD PTR [rsp+0x1c]
   1c40f:	mov    DWORD PTR [rbx+0x4],eax
   1c412:	xor    eax,eax
   1c414:	call   3520 <fcntl64@plt>
   1c419:	mov    edi,DWORD PTR [rbx+0x4]
   1c41c:	mov    edx,0x800
   1c421:	xor    eax,eax
   1c423:	mov    esi,0x4
   1c428:	call   3520 <fcntl64@plt>
   1c42d:	mov    edi,DWORD PTR [rbx]
   1c42f:	mov    r8,rbx
   1c432:	xor    edx,edx
   1c434:	lea    rcx,[rip+0xffffffffffffef45]        # 1b380 <posix_aio_flush>
   1c43b:	lea    rsi,[rip+0xfffffffffffff5de]        # 1ba20 <posix_aio_read>
   1c442:	call   1ac30 <qemu_aio_set_fd_handler>
   1c447:	lea    rdi,[rsp+0xc]
   1c44c:	movabs rax,0x4000000040
   1c456:	mov    DWORD PTR [rsp+0x14],0x0
   1c45e:	mov    QWORD PTR [rsp+0xc],rax
   1c463:	call   1b1c0 <qemu_paio_init>
   1c468:	mov    QWORD PTR [rip+0xe019],rbx        # 2a488 <posix_aio_state>
   1c46f:	xor    eax,eax
   1c471:	mov    rcx,QWORD PTR [rsp+0x138]
   1c479:	xor    rcx,QWORD PTR fs:0x28
   1c482:	jne    1c4c0 <posix_aio_init.part.8+0x170>
   1c484:	add    rsp,0x148
   1c48b:	pop    rbx
   1c48c:	pop    rbp
   1c48d:	ret
   1c48e:	xchg   ax,ax
   1c490:	mov    rcx,QWORD PTR [rip+0xde69]        # 2a300 <stderr@@GLIBC_2.2.5>
   1c497:	mov    edx,0x16
   1c49c:	mov    esi,0x1
   1c4a1:	lea    rdi,[rip+0x579b]        # 21c43 <__PRETTY_FUNCTION__.14124+0x23>
   1c4a8:	call   3640 <fwrite@plt>
   1c4ad:	mov    rdi,rbx
   1c4b0:	call   5960 <qemu_free>
   1c4b5:	call   30d0 <__errno_location@plt>
   1c4ba:	mov    eax,DWORD PTR [rax]
   1c4bc:	neg    eax
   1c4be:	jmp    1c471 <posix_aio_init.part.8+0x121>
   1c4c0:	call   31c0 <__stack_chk_fail@plt>
   1c4c5:	data16 nop WORD PTR cs:[rax+rax*1+0x0]

000000000001c4d0 <raw_open>:
   1c4d0:	push   r13
   1c4d2:	mov    r13,rsi
   1c4d5:	push   r12
   1c4d7:	mov    r12,rdi
   1c4da:	push   rbp
   1c4db:	mov    ebp,edx
   1c4dd:	push   rbx
   1c4de:	sub    rsp,0x8
   1c4e2:	cmp    QWORD PTR [rip+0xdf9e],0x0        # 2a488 <posix_aio_state>
   1c4ea:	mov    rbx,QWORD PTR [rdi+0x40]
   1c4ee:	je     1c5e0 <raw_open+0x110>
   1c4f4:	mov    esi,ebp
   1c4f6:	mov    DWORD PTR [rbx+0x8],0x0
   1c4fd:	and    esi,0x3
   1c500:	cmp    esi,0x2
   1c503:	je     1c510 <raw_open+0x40>
   1c505:	mov    DWORD PTR [r12+0x8],0x1
   1c50e:	xor    esi,esi
   1c510:	mov    eax,esi
   1c512:	or     eax,0x240
   1c517:	test   bpl,0x4
   1c51b:	cmovne esi,eax
   1c51e:	test   bpl,0x20
   1c522:	je     1c5a8 <raw_open+0xd8>
   1c528:	mov    DWORD PTR [rbx+0x4],0x0
   1c52f:	or     esi,0x4000
   1c535:	mov    edx,0x1a4
   1c53a:	xor    eax,eax
   1c53c:	mov    rdi,r13
   1c53f:	call   3500 <open64@plt>
   1c544:	mov    ebp,eax
   1c546:	test   eax,eax
   1c548:	jns    1c570 <raw_open+0xa0>
   1c54a:	call   30d0 <__errno_location@plt>
   1c54f:	mov    eax,DWORD PTR [rax]
   1c551:	mov    ebx,eax
   1c553:	neg    ebx
   1c555:	cmp    eax,0x1e
   1c558:	mov    eax,0xfffffff3
   1c55d:	cmove  ebx,eax
   1c560:	add    rsp,0x8
   1c564:	mov    eax,ebx
   1c566:	pop    rbx
   1c567:	pop    rbp
   1c568:	pop    r12
   1c56a:	pop    r13
   1c56c:	ret
   1c56d:	nop    DWORD PTR [rax]
   1c570:	mov    DWORD PTR [rbx],eax
   1c572:	mov    esi,0x4000
   1c577:	mov    edi,0x200
   1c57c:	mov    QWORD PTR [rbx+0x28],0x0
   1c584:	call   53b0 <qemu_memalign>
   1c589:	mov    QWORD PTR [rbx+0x28],rax
   1c58d:	test   rax,rax
   1c590:	je     1c5f0 <raw_open+0x120>
   1c592:	xor    ebx,ebx
   1c594:	add    rsp,0x8
   1c598:	mov    eax,ebx
   1c59a:	pop    rbx
   1c59b:	pop    rbp
   1c59c:	pop    r12
   1c59e:	pop    r13
   1c5a0:	ret
   1c5a1:	nop    DWORD PTR [rax+0x0]
   1c5a8:	mov    eax,esi
   1c5aa:	mov    DWORD PTR [rbx+0x4],0x0
   1c5b1:	mov    edx,0x1a4
   1c5b6:	mov    rdi,r13
   1c5b9:	or     ah,0x10
   1c5bc:	and    ebp,0x40
   1c5bf:	cmove  esi,eax
   1c5c2:	xor    eax,eax
   1c5c4:	call   3500 <open64@plt>
   1c5c9:	test   eax,eax
   1c5cb:	js     1c54a <raw_open+0x7a>
   1c5d1:	mov    DWORD PTR [rbx],eax
   1c5d3:	mov    QWORD PTR [rbx+0x28],0x0
   1c5db:	xor    ebx,ebx
   1c5dd:	jmp    1c594 <raw_open+0xc4>
   1c5df:	nop
   1c5e0:	call   1c350 <posix_aio_init.part.8>
   1c5e5:	jmp    1c4f4 <raw_open+0x24>
   1c5ea:	nop    WORD PTR [rax+rax*1+0x0]
   1c5f0:	call   30d0 <__errno_location@plt>
   1c5f5:	mov    edi,ebp
   1c5f7:	mov    ebx,DWORD PTR [rax]
   1c5f9:	neg    ebx
   1c5fb:	call   3270 <close@plt>
   1c600:	jmp    1c560 <raw_open+0x90>
   1c605:	data16 nop WORD PTR cs:[rax+rax*1+0x0]

000000000001c610 <hdev_open>:
   1c610:	cmp    QWORD PTR [rip+0xde70],0x0        # 2a488 <posix_aio_state>
   1c618:	push   r14
   1c61a:	mov    r14,rdi
   1c61d:	push   r13
   1c61f:	mov    r13,rsi
   1c622:	push   r12
   1c624:	mov    r12d,edx
   1c627:	push   rbp
   1c628:	push   rbx
   1c629:	mov    rbp,QWORD PTR [rdi+0x40]
   1c62d:	je     1c6e8 <hdev_open+0xd8>
   1c633:	mov    ebx,r12d
   1c636:	and    ebx,0x3
   1c639:	cmp    ebx,0x2
   1c63c:	je     1c648 <hdev_open+0x38>
   1c63e:	mov    DWORD PTR [r14+0x8],0x1
   1c646:	xor    ebx,ebx
   1c648:	test   r12b,0x20
   1c64c:	je     1c6b0 <hdev_open+0xa0>
   1c64e:	or     bh,0x40
   1c651:	mov    DWORD PTR [rbp+0x4],0x0
   1c658:	xor    edx,edx
   1c65a:	lea    rsi,[rip+0x55f9]        # 21c5a <__PRETTY_FUNCTION__.14124+0x3a>
   1c661:	mov    rdi,r13
   1c664:	call   5620 <strstart>
   1c669:	test   eax,eax
   1c66b:	je     1c6c0 <hdev_open+0xb0>
   1c66d:	mov    DWORD PTR [rbp+0x4],0x1
   1c674:	or     bh,0x8
   1c677:	xor    eax,eax
   1c679:	mov    edx,0x1a4
   1c67e:	mov    esi,ebx
   1c680:	mov    rdi,r13
   1c683:	call   3500 <open64@plt>
   1c688:	test   eax,eax
   1c68a:	js     1c6f8 <hdev_open+0xe8>
   1c68c:	xor    ebx,ebx
   1c68e:	cmp    DWORD PTR [rbp+0x4],0x2
   1c692:	mov    DWORD PTR [rbp+0x0],eax
   1c695:	je     1c720 <hdev_open+0x110>
   1c69b:	mov    eax,ebx
   1c69d:	pop    rbx
   1c69e:	pop    rbp
   1c69f:	pop    r12
   1c6a1:	pop    r13
   1c6a3:	pop    r14
   1c6a5:	ret
   1c6a6:	nop    WORD PTR cs:[rax+rax*1+0x0]
   1c6b0:	mov    eax,ebx
   1c6b2:	or     ah,0x10
   1c6b5:	and    r12d,0x40
   1c6b9:	cmove  ebx,eax
   1c6bc:	jmp    1c651 <hdev_open+0x41>
   1c6be:	xchg   ax,ax
   1c6c0:	xor    edx,edx
   1c6c2:	lea    rsi,[rip+0x5599]        # 21c62 <__PRETTY_FUNCTION__.14124+0x42>
   1c6c9:	mov    rdi,r13
   1c6cc:	call   5620 <strstart>
   1c6d1:	test   eax,eax
   1c6d3:	je     1c740 <hdev_open+0x130>
   1c6d5:	mov    DWORD PTR [rbp+0xc],ebx
   1c6d8:	or     bh,0x8
   1c6db:	mov    DWORD PTR [rbp+0x4],0x2
   1c6e2:	jmp    1c677 <hdev_open+0x67>
   1c6e4:	nop    DWORD PTR [rax+0x0]
   1c6e8:	call   1c350 <posix_aio_init.part.8>
   1c6ed:	jmp    1c633 <hdev_open+0x23>
   1c6f2:	nop    WORD PTR [rax+rax*1+0x0]
   1c6f8:	call   30d0 <__errno_location@plt>
   1c6fd:	mov    eax,DWORD PTR [rax]
   1c6ff:	mov    ebx,eax
   1c701:	neg    ebx
   1c703:	cmp    eax,0x1e
   1c706:	mov    eax,0xfffffff3
   1c70b:	cmove  ebx,eax
   1c70e:	mov    eax,ebx
   1c710:	pop    rbx
   1c711:	pop    rbp
   1c712:	pop    r12
   1c714:	pop    r13
   1c716:	pop    r14
   1c718:	ret
   1c719:	nop    DWORD PTR [rax+0x0]
   1c720:	mov    edi,eax
   1c722:	call   3270 <close@plt>
   1c727:	mov    DWORD PTR [rbp+0x0],0xffffffff
   1c72e:	mov    eax,ebx
   1c730:	mov    DWORD PTR [rbp+0x24],0x1
   1c737:	pop    rbx
   1c738:	pop    rbp
   1c739:	pop    r12
   1c73b:	pop    r13
   1c73d:	pop    r14
   1c73f:	ret
   1c740:	xor    edx,edx
   1c742:	lea    rsi,[rip+0x5521]        # 21c6a <__PRETTY_FUNCTION__.14124+0x4a>
   1c749:	mov    rdi,r13
   1c74c:	call   5620 <strstart>
   1c751:	test   eax,eax
   1c753:	je     1c677 <hdev_open+0x67>
   1c759:	mov    DWORD PTR [r14+0x1c],0x1
   1c761:	jmp    1c677 <hdev_open+0x67>
   1c766:	nop    WORD PTR cs:[rax+rax*1+0x0]

000000000001c770 <raw_truncate>:
   1c770:	push   rbx
   1c771:	mov    rax,QWORD PTR [rdi+0x40]
   1c775:	mov    ebx,DWORD PTR [rax+0x4]
   1c778:	test   ebx,ebx
   1c77a:	jne    1c7a0 <raw_truncate+0x30>
   1c77c:	mov    edi,DWORD PTR [rax]
   1c77e:	call   34c0 <ftruncate64@plt>
   1c783:	test   eax,eax
   1c785:	js     1c790 <raw_truncate+0x20>
   1c787:	mov    eax,ebx
   1c789:	pop    rbx
   1c78a:	ret
   1c78b:	nop    DWORD PTR [rax+rax*1+0x0]
   1c790:	call   30d0 <__errno_location@plt>
   1c795:	mov    ebx,DWORD PTR [rax]
   1c797:	neg    ebx
   1c799:	mov    eax,ebx
   1c79b:	pop    rbx
   1c79c:	ret
   1c79d:	nop    DWORD PTR [rax]
   1c7a0:	mov    ebx,0xffffffa1
   1c7a5:	jmp    1c787 <raw_truncate+0x17>
   1c7a7:	nop    WORD PTR [rax+rax*1+0x0]

000000000001c820 <atexit>:
   1c820:	mov    rdx,QWORD PTR [rip+0xc7e1]        # 29008 <__dso_handle>
   1c827:	xor    esi,esi
   1c829:	jmp    35f0 <__cxa_atexit@plt>

0000000000006000 <cow_create>:
    6000:   push   r14
    6002:   push   r13
    6004:   push   r12
    6006:   push   rbp
    6007:   push   rbx
    6008:   sub    rsp,0x4c0
    600f:   mov    rax,QWORD PTR fs:0x28
    6018:   mov    QWORD PTR [rsp+0x4b8],rax
    6020:   xor    eax,eax
    6022:   test   ecx,ecx
    6024:   jne    6150 <cow_create+0x150>
    602a:   mov    rbx,rsi
    602d:   mov    r13,rdx
    6030:   mov    esi,0x241
    6035:   mov    edx,0x1a4
    603a:   call   3500 <open64@plt>
    603f:   mov    ebp,eax
    6041:   test   eax,eax
    6043:   js     6160 <cow_create+0x160>
    6049:   lea    r12,[rsp+0x90]
    6051:   xor    eax,eax
    6053:   mov    ecx,0x84
    6058:   mov    rdi,r12
    605b:   rep stos QWORD PTR es:[rdi],rax
    605e:   movabs rax,0x20000004d4f4f4f
    6068:   mov    QWORD PTR [rsp+0x90],rax
    6070:   test   r13,r13
    6073:   je     60c7 <cow_create+0xc7>
    6075:   xor    esi,esi
    6077:   mov    rdi,r13
    607a:   xor    eax,eax
    607c:   call   3500 <open64@plt>
    6081:   mov    r14d,eax
    6084:   test   eax,eax
    6086:   js     60b5 <cow_create+0xb5>
    6088:   mov    edi,0x1
    608d:   mov    rdx,rsp
    6090:   mov    esi,eax
    6092:   call   3340 <__fxstat64@plt>
    6097:   mov    edi,r14d
    609a:   test   eax,eax
    609c:   jne    6140 <cow_create+0x140>
    60a2:   call   3270 <close@plt>
    60a7:   mov    rax,QWORD PTR [rsp+0x58]
    60ac:   bswap  eax
    60ae:   mov    DWORD PTR [rsp+0x498],eax
    60b5:   lea    rdi,[r12+0x8]
    60ba:   mov    rdx,r13
    60bd:   mov    esi,0x400
    60c2:   call   5560 <pstrcpy>
    60c7:   mov    rax,rbx
    60ca:   mov    edx,0x420
    60cf:   mov    rsi,r12
    60d2:   mov    edi,ebp
    60d4:   mov    DWORD PTR [rsp+0x4a8],0x20000
    60df:   shl    rax,0x9
    60e3:   bswap  rax
    60e6:   mov    QWORD PTR [rsp+0x4a0],rax
    60ee:   call   3160 <write@plt>
    60f3:   lea    rsi,[rbx+0x7]
    60f7:   mov    edi,ebp
    60f9:   mov    rbx,rsi
    60fc:   sar    rbx,0x3
    6100:   lea    rsi,[rbx+0x420]
    6107:   call   34c0 <ftruncate64@plt>
    610c:   mov    edi,ebp
    610e:   call   3270 <close@plt>
    6113:   xor    eax,eax
    6115:   mov    rdx,QWORD PTR [rsp+0x4b8]
    611d:   xor    rdx,QWORD PTR fs:0x28
    6126:   jne    6167 <cow_create+0x167>
    6128:   add    rsp,0x4c0
    612f:   pop    rbx
    6130:   pop    rbp
    6131:   pop    r12
    6133:   pop    r13
    6135:   pop    r14
    6137:   ret
    6138:   nop    DWORD PTR [rax+rax*1+0x0]
    6140:   call   3270 <close@plt>
    6145:   jmp    60b5 <cow_create+0xb5>
    614a:   nop    WORD PTR [rax+rax*1+0x0]
    6150:   mov    eax,0xffffffa1
    6155:   jmp    6115 <cow_create+0x115>
    6157:   nop    WORD PTR [rax+rax*1+0x0]
    6160:   mov    eax,0xffffffff
    6165:   jmp    6115 <cow_create+0x115>
    6167:   call   31c0 <__stack_chk_fail@plt>
    616c:   nop    DWORD PTR [rax+0x0]

000000000000a1b0 <dmg_read>:
    a1b0:   push   r15
    a1b2:   push   r14
    a1b4:   push   r13
    a1b6:   push   r12
    a1b8:   push   rbp
    a1b9:   push   rbx
    a1ba:   sub    rsp,0x18
    a1be:   mov    r13,QWORD PTR [rdi+0x40]
    a1c2:   test   ecx,ecx
    a1c4:   jle    a315 <dmg_read+0x165>
    a1ca:   lea    rax,[r13+0x48]
    a1ce:   mov    r15d,esi
    a1d1:   lea    ebp,[rcx+rsi*1]
    a1d4:   mov    r14,rdx
    a1d7:   mov    QWORD PTR [rsp+0x8],rax
    a1dc:   nop    DWORD PTR [rax+0x0]
    a1e0:   mov    eax,DWORD PTR [r13+0x30]
    a1e4:   mov    r8d,DWORD PTR [r13+0x4]
    a1e8:   cmp    eax,r8d
    a1eb:   jae    a211 <dmg_read+0x61>
    a1ed:   mov    rdx,QWORD PTR [r13+0x20]
    a1f1:   movsxd rcx,r15d
    a1f4:   mov    rdx,QWORD PTR [rdx+rax*8]
    a1f8:   cmp    rdx,rcx
    a1fb:   ja     a211 <dmg_read+0x61>
    a1fd:   mov    rsi,QWORD PTR [r13+0x28]
    a201:   mov    rdi,QWORD PTR [rsi+rax*8]
    a205:   add    rdi,rdx
    a208:   cmp    rcx,rdi
    a20b:   jb     a2c0 <dmg_read+0x110>
    a211:   mov    r10d,r8d
    a214:   xor    ecx,ecx
    a216:   movsxd rdi,r15d
    a219:   cmp    ecx,r10d
    a21c:   je     a25e <dmg_read+0xae>
    a21e:   lea    eax,[rcx+r10*1]
    a222:   mov    rsi,QWORD PTR [r13+0x20]
    a226:   shr    eax,1
    a228:   mov    edx,eax
    a22a:   mov    ebx,eax
    a22c:   lea    r9,[rdx*8+0x0]
    a234:   mov    rdx,QWORD PTR [rsi+rdx*8]
    a238:   cmp    rdi,rdx
    a23b:   jb     a25a <dmg_read+0xaa>
    a23d:   jmp    a27b <dmg_read+0xcb>
    a23f:   nop
    a240:   lea    ebx,[rcx+rax*1]
    a243:   shr    ebx,1
    a245:   mov    edx,ebx
    a247:   lea    r9,[rdx*8+0x0]
    a24f:   mov    rdx,QWORD PTR [rsi+rdx*8]
    a253:   cmp    rdx,rdi
    a256:   jbe    a278 <dmg_read+0xc8>
    a258:   mov    eax,ebx
    a25a:   cmp    ecx,eax
    a25c:   jne    a240 <dmg_read+0x90>
    a25e:   add    rsp,0x18
    a262:   mov    eax,0xffffffff
    a267:   pop    rbx
    a268:   pop    rbp
    a269:   pop    r12
    a26b:   pop    r13
    a26d:   pop    r14
    a26f:   pop    r15
    a271:   ret
    a272:   nop    WORD PTR [rax+rax*1+0x0]
    a278:   mov    r10d,eax
    a27b:   mov    rax,QWORD PTR [r13+0x28]
    a27f:   mov    ecx,ebx
    a281:   add    rdx,QWORD PTR [rax+r9*1]
    a285:   cmp    rdx,rdi
    a288:   jbe    a219 <dmg_read+0x69>
    a28a:   cmp    r8d,ebx
    a28d:   jbe    a25e <dmg_read+0xae>
    a28f:   mov    rdx,QWORD PTR [r13+0x8]
    a293:   mov    r12d,ebx
    a296:   mov    DWORD PTR [r13+0x30],r8d
    a29a:   mov    edx,DWORD PTR [rdx+r12*4]
    a29e:   cmp    edx,0x2
    a2a1:   je     a410 <dmg_read+0x260>
    a2a7:   cmp    edx,0x80000005
    a2ad:   je     a360 <dmg_read+0x1b0>
    a2b3:   cmp    edx,0x1
    a2b6:   je     a330 <dmg_read+0x180>
    a2b8:   mov    DWORD PTR [r13+0x30],ebx
    a2bc:   mov    rdx,QWORD PTR [rsi+r12*8]
    a2c0:   mov    esi,r15d
    a2c3:   lea    rdi,[r14+0x8]
    a2c7:   add    r15d,0x1
    a2cb:   sub    esi,edx
    a2cd:   and    rdi,0xfffffffffffffff8
    a2d1:   shl    esi,0x9
    a2d4:   add    rsi,QWORD PTR [r13+0x40]
    a2d8:   mov    rax,QWORD PTR [rsi]
    a2db:   mov    QWORD PTR [r14],rax
    a2de:   mov    rax,QWORD PTR [rsi+0x1f8]
    a2e5:   mov    QWORD PTR [r14+0x1f8],rax
    a2ec:   mov    rax,r14
    a2ef:   add    r14,0x200
    a2f6:   sub    rax,rdi
    a2f9:   lea    ecx,[rax+0x200]
    a2ff:   sub    rsi,rax
    a302:   mov    eax,ecx
    a304:   shr    eax,0x3
    a307:   mov    ecx,eax
    a309:   rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
    a30c:   cmp    ebp,r15d
    a30f:   jne    a1e0 <dmg_read+0x30>
    a315:   add    rsp,0x18
    a319:   xor    eax,eax
    a31b:   pop    rbx
    a31c:   pop    rbp
    a31d:   pop    r12
    a31f:   pop    r13
    a321:   pop    r14
    a323:   pop    r15
    a325:   ret
    a326:   nop    WORD PTR cs:[rax+rax*1+0x0]
    a330:   mov    rax,QWORD PTR [r13+0x18]
    a334:   mov    rsi,QWORD PTR [r13+0x40]
    a338:   mov    edi,DWORD PTR [r13+0x0]
    a33c:   mov    rdx,QWORD PTR [rax+r12*8]
    a340:   call   52c0 <qemu_read_ok>
    a345:   test   eax,eax
    a347:   js     a25e <dmg_read+0xae>
    a34d:   mov    rsi,QWORD PTR [r13+0x20]
    a351:   jmp    a2b8 <dmg_read+0x108>
    a356:   nop    WORD PTR cs:[rax+rax*1+0x0]
    a360:   mov    rax,QWORD PTR [r13+0x10]
    a364:   mov    edi,DWORD PTR [r13+0x0]
    a368:   xor    edx,edx
    a36a:   mov    rsi,QWORD PTR [rax+r12*8]
    a36e:   call   3650 <lseek64@plt>
    a373:   test   eax,eax
    a375:   js     a25e <dmg_read+0xae>
    a37b:   mov    rax,QWORD PTR [r13+0x18]
    a37f:   mov    rsi,QWORD PTR [r13+0x38]
    a383:   mov    edi,DWORD PTR [r13+0x0]
    a387:   mov    rdx,QWORD PTR [rax+r12*8]
    a38b:   call   52c0 <qemu_read_ok>
    a390:   test   eax,eax
    a392:   js     a25e <dmg_read+0xae>
    a398:   mov    rax,QWORD PTR [r13+0x38]
    a39c:   mov    rdi,QWORD PTR [rsp+0x8]
    a3a1:   mov    QWORD PTR [r13+0x48],rax
    a3a5:   mov    rax,QWORD PTR [r13+0x18]
    a3a9:   mov    rax,QWORD PTR [rax+r12*8]
    a3ad:   mov    DWORD PTR [r13+0x50],eax
    a3b1:   mov    rax,QWORD PTR [r13+0x40]
    a3b5:   mov    QWORD PTR [r13+0x60],rax
    a3b9:   mov    rax,QWORD PTR [r13+0x28]
    a3bd:   mov    rax,QWORD PTR [rax+r12*8]
    a3c1:   shl    eax,0x9
    a3c4:   mov    DWORD PTR [r13+0x68],eax
    a3c8:   call   3600 <inflateReset@plt>
    a3cd:   test   eax,eax
    a3cf:   jne    a25e <dmg_read+0xae>
    a3d5:   mov    rdi,QWORD PTR [rsp+0x8]
    a3da:   mov    esi,0x4
    a3df:   call   3110 <inflate@plt>
    a3e4:   cmp    eax,0x1
    a3e7:   jne    a25e <dmg_read+0xae>
    a3ed:   mov    rax,QWORD PTR [r13+0x28]
    a3f1:   mov    rax,QWORD PTR [rax+r12*8]
    a3f5:   shl    rax,0x9
    a3f9:   cmp    QWORD PTR [r13+0x70],rax
    a3fd:   je     a34d <dmg_read+0x19d>
    a403:   jmp    a25e <dmg_read+0xae>
    a408:   nop    DWORD PTR [rax+rax*1+0x0]
    a410:   mov    rdx,QWORD PTR [rax+r12*8]
    a414:   mov    rdi,QWORD PTR [r13+0x40]
    a418:   xor    esi,esi
    a41a:   shl    rdx,0x9
    a41e:   call   3250 <memset@plt>
    a423:   jmp    a34d <dmg_read+0x19d>
    a428:   nop    DWORD PTR [rax+rax*1+0x0]

000000000000b460 <vpc_create>:
    b460:   push   r15
    b462:   push   r14
    b464:   push   r13
    b466:   push   r12
    b468:   push   rbp
    b469:   push   rbx
    b46a:   sub    rsp,0x428
    b471:   mov    rax,QWORD PTR fs:0x28
    b47a:   mov    QWORD PTR [rsp+0x418],rax
    b482:   xor    eax,eax
    b484:   mov    eax,0xffffffa1
    b489:   test   rdx,rdx
    b48c:   jne    b695 <vpc_create+0x235>
    b492:   mov    rbx,rsi
    b495:   mov    edx,0x1a4
    b49a:   mov    esi,0x241
    b49f:   xor    eax,eax
    b4a1:   call   3500 <open64@plt>
    b4a6:   mov    r13d,eax
    b4a9:   test   eax,eax
    b4ab:   js     b690 <vpc_create+0x230>
    b4b1:   cmp    rbx,0xfeff010
    b4b8:   jg     b6c0 <vpc_create+0x260>
    b4be:   cmp    rbx,0x3effc10
    b4c5:   jle    b7a0 <vpc_create+0x340>
    b4cb:   movabs rdx,0x8080808080808081
    b4d5:   mov    rax,rbx
    b4d8:   imul   rdx
    b4db:   add    rdx,rbx
    b4de:   sar    rbx,0x3f
    b4e2:   sar    rdx,0x7
    b4e6:   sub    rdx,rbx
    b4e9:   mov    rbx,rdx
    b4ec:   add    ebx,0xf
    b4ef:   shr    ebx,0x4
    b4f2:   mov    eax,ebx
    b4f4:   rol    bx,0x8
    b4f8:   mov    r12,rax
    b4fb:   shl    r12,0x8
    b4ff:   sub    r12,rax
    b502:   mov    r14,r12
    b505:   shl    r12,0xd
    b509:   shl    r14,0x4
    b50d:   bswap  r12
    b510:   add    r14,0x1000
    b517:   shr    r14,0xc
    b51b:   mov    BYTE PTR [rsp+0xf],0xff
    b520:   mov    r15d,0x10
    b526:   lea    rbp,[rsp+0x10]
    b52b:   xor    eax,eax
    b52d:   mov    ecx,0x80
    b532:   mov    rdi,rbp
    b535:   rep stos QWORD PTR es:[rdi],rax
    b538:   xor    edi,edi
    b53a:   movabs rax,0x78697463656e6f63
    b544:   mov    DWORD PTR [rsp+0x2c],0x756d6571
    b54c:   mov    QWORD PTR [rsp+0x10],rax
    b551:   movabs rax,0x10002000000
    b55b:   mov    QWORD PTR [rsp+0x18],rax
    b560:   movabs rax,0x2000000000000
    b56a:   mov    DWORD PTR [rsp+0x34],0x6b326957
    b572:   mov    QWORD PTR [rsp+0x20],rax
    b577:   call   33e0 <time@plt>
    b57c:   mov    DWORD PTR [rsp+0x30],0x3000500
    b584:   xor    edx,edx
    b586:   lea    rsi,[rbp+0x200]
    b58d:   sub    eax,0x386d4380
    b592:   mov    WORD PTR [rsp+0x48],bx
    b597:   bswap  eax
    b599:   mov    BYTE PTR [rsp+0x4a],r15b
    b59e:   mov    DWORD PTR [rsp+0x28],eax
    b5a2:   movzx  eax,BYTE PTR [rsp+0xf]
    b5a7:   mov    DWORD PTR [rsp+0x4c],0x3000000
    b5af:   mov    QWORD PTR [rsp+0x38],r12
    b5b4:   mov    QWORD PTR [rsp+0x40],r12
    b5b9:   mov    r12,rbp
    b5bc:   mov    BYTE PTR [rsp+0x4b],al
    b5c0:   mov    rax,rbp
    b5c3:   nop    DWORD PTR [rax+rax*1+0x0]
    b5c8:   movzx  ecx,BYTE PTR [rax]
    b5cb:   add    rax,0x1
    b5cf:   add    edx,ecx
    b5d1:   cmp    rsi,rax
    b5d4:   jne    b5c8 <vpc_create+0x168>
    b5d6:   not    edx
    b5d8:   mov    rsi,rbp
    b5db:   mov    edi,r13d
    b5de:   bswap  edx
    b5e0:   mov    DWORD PTR [rsp+0x50],edx
    b5e4:   mov    edx,0x200
    b5e9:   call   3160 <write@plt>
    b5ee:   cmp    rax,0x200
    b5f4:   jne    b690 <vpc_create+0x230>
    b5fa:   lea    r15,[r14*4+0x1ff]
    b602:   xor    edx,edx
    b604:   mov    edi,r13d
    b607:   mov    rsi,r15
    b60a:   and    rsi,0xfffffffffffffe00
    b611:   add    rsi,0x600
    b618:   call   3650 <lseek64@plt>
    b61d:   test   rax,rax
    b620:   js     b690 <vpc_create+0x230>
    b622:   mov    edx,0x200
    b627:   mov    rsi,rbp
    b62a:   mov    edi,r13d
    b62d:   call   3160 <write@plt>
    b632:   cmp    rax,0x200
    b638:   jne    b690 <vpc_create+0x230>
    b63a:   xor    edx,edx
    b63c:   mov    esi,0x600
    b641:   mov    edi,r13d
    b644:   call   3650 <lseek64@plt>
    b649:   test   rax,rax
    b64c:   js     b690 <vpc_create+0x230>
    b64e:   mov    ecx,0x40
    b653:   mov    rdi,rbp
    b656:   shr    r15,0x9
    b65a:   xor    ebx,ebx
    b65c:   mov    rax,0xffffffffffffffff
    b663:   rep stos QWORD PTR es:[rdi],rax
    b666:   jmp    b678 <vpc_create+0x218>
    b668:   nop    DWORD PTR [rax+rax*1+0x0]
    b670:   add    ebx,0x1
    b673:   cmp    ebx,r15d
    b676:   je     b6e0 <vpc_create+0x280>
    b678:   mov    edx,0x200
    b67d:   mov    rsi,rbp
    b680:   mov    edi,r13d
    b683:   call   3160 <write@plt>
    b688:   cmp    rax,0x200
    b68e:   je     b670 <vpc_create+0x210>
    b690:   mov    eax,0xfffffffb
    b695:   mov    rdi,QWORD PTR [rsp+0x418]
    b69d:   xor    rdi,QWORD PTR fs:0x28
    b6a6:   jne    b936 <vpc_create+0x4d6>
    b6ac:   add    rsp,0x428
    b6b3:   pop    rbx
    b6b4:   pop    rbp
    b6b5:   pop    r12
    b6b7:   pop    r13
    b6b9:   pop    r14
    b6bb:   pop    r15
    b6bd:   ret
    b6be:   xchg   ax,ax
    b6c0:   movabs r12,0x20e0df1f000000
    b6ca:   mov    ebx,0xffffffff
    b6cf:   mov    r14d,0xff00
    b6d5:   jmp    b51b <vpc_create+0xbb>
    b6da:   nop    WORD PTR [rax+rax*1+0x0]
    b6e0:   xor    eax,eax
    b6e2:   mov    ecx,0x80
    b6e7:   mov    rdi,rbp
    b6ea:   bswap  r14d
    b6ed:   rep stos QWORD PTR es:[rdi],rax
    b6f0:   mov    DWORD PTR [rsp+0x2c],r14d
    b6f5:   movabs rax,0x6573726170737863
    b6ff:   lea    rcx,[rbp+0x400]
    b706:   mov    QWORD PTR [rbp+0x0],rax
    b70a:   movabs rax,0xffffffff00000000
    b714:   mov    DWORD PTR [rsp+0x28],0x100
    b71c:   mov    DWORD PTR [rsp+0x30],0x2000
    b724:   mov    QWORD PTR [rsp+0x18],rax
    b729:   movabs rax,0x6000000000000
    b733:   mov    QWORD PTR [rsp+0x20],rax
    b738:   xor    eax,eax
    b73a:   nop    WORD PTR [rax+rax*1+0x0]
    b740:   movzx  edx,BYTE PTR [r12]
    b745:   add    r12,0x1
    b749:   add    eax,edx
    b74b:   cmp    rcx,r12
    b74e:   jne    b740 <vpc_create+0x2e0>
    b750:   not    eax
    b752:   xor    edx,edx
    b754:   mov    esi,0x200
    b759:   mov    edi,r13d
    b75c:   bswap  eax
    b75e:   mov    DWORD PTR [rsp+0x34],eax
    b762:   call   3650 <lseek64@plt>
    b767:   test   rax,rax
    b76a:   js     b690 <vpc_create+0x230>
    b770:   mov    edx,0x400
    b775:   mov    rsi,rbp
    b778:   mov    edi,r13d
    b77b:   call   3160 <write@plt>
    b780:   cmp    rax,0x400
    b786:   jne    b690 <vpc_create+0x230>
    b78c:   mov    edi,r13d
    b78f:   call   3270 <close@plt>
    b794:   xor    eax,eax
    b796:   jmp    b695 <vpc_create+0x235>
    b79b:   nop    DWORD PTR [rax+rax*1+0x0]
    b7a0:   movabs rdx,0x7878787878787879
    b7aa:   mov    rax,rbx
    b7ad:   imul   rdx
    b7b0:   mov    rax,rbx
    b7b3:   sar    rax,0x3f
    b7b7:   sar    rdx,0x3
    b7bb:   sub    rdx,rax
    b7be:   lea    eax,[rdx+0x3ff]
    b7c4:   shr    eax,0xa
    b7c7:   mov    r15d,eax
    b7ca:   cmp    al,0x3
    b7cc:   jbe    b870 <vpc_create+0x410>
    b7d2:   movzx  ecx,al
    b7d5:   mov    edi,ecx
    b7d7:   shl    edi,0xa
    b7da:   cmp    edi,edx
    b7dc:   jbe    b7e6 <vpc_create+0x386>
    b7de:   cmp    al,0x10
    b7e0:   jbe    b8f4 <vpc_create+0x494>
    b7e6:   movabs rdx,0x8421084210842109
    b7f0:   mov    rax,rbx
    b7f3:   mov    rcx,rbx
    b7f6:   imul   rdx
    b7f9:   sar    rcx,0x3f
    b7fd:   lea    rax,[rdx+rbx*1]
    b801:   sar    rax,0x4
    b805:   sub    rax,rcx
    b808:   cmp    eax,0x3fff
    b80d:   jbe    b8b5 <vpc_create+0x455>
    b813:   mov    rax,rbx
    b816:   mov    BYTE PTR [rsp+0xf],0x3f
    b81b:   movabs rdx,0x8208208208208209
    b825:   mov    r15d,0x10
    b82b:   imul   rdx
    b82e:   add    rbx,rdx
    b831:   sar    rbx,0x5
    b835:   sub    rbx,rcx
    b838:   add    ebx,0xf
    b83b:   shr    ebx,0x4
    b83e:   movzx  eax,bx
    b841:   rol    bx,0x8
    b845:   mov    r12,rax
    b848:   shl    r12,0x6
    b84c:   sub    r12,rax
    b84f:   mov    r14,r12
    b852:   shl    r12,0xd
    b856:   shl    r14,0x4
    b85a:   bswap  r12
    b85d:   add    r14,0x1000
    b864:   shr    r14,0xc
    b868:   jmp    b526 <vpc_create+0xc6>
    b86d:   nop    DWORD PTR [rax]
    b870:   cmp    edx,0xfff
    b876:   ja     b7e6 <vpc_create+0x386>
    b87c:   lea    ebx,[rdx+0x3]
    b87f:   mov    BYTE PTR [rsp+0xf],0x11
    b884:   mov    r15d,0x4
    b88a:   shr    ebx,0x2
    b88d:   mov    eax,ebx
    b88f:   rol    bx,0x8
    b893:   mov    r12,rax
    b896:   shl    r12,0x4
    b89a:   add    r12,rax
    b89d:   lea    r14,[r12*4+0x1000]
    b8a5:   shl    r12,0xb
    b8a9:   shr    r14,0xc
    b8ad:   bswap  r12
    b8b0:   jmp    b526 <vpc_create+0xc6>
    b8b5:   lea    ebx,[rax+0xf]
    b8b8:   mov    BYTE PTR [rsp+0xf],0x1f
    b8bd:   mov    r15d,0x10
    b8c3:   shr    ebx,0x4
    b8c6:   mov    eax,ebx
    b8c8:   rol    bx,0x8
    b8cc:   mov    r12,rax
    b8cf:   shl    r12,0x5
    b8d3:   sub    r12,rax
    b8d6:   mov    r14,r12
    b8d9:   shl    r12,0xd
    b8dd:   shl    r14,0x4
    b8e1:   bswap  r12
    b8e4:   add    r14,0x1000
    b8eb:   shr    r14,0xc
    b8ef:   jmp    b526 <vpc_create+0xc6>
    b8f4:   lea    eax,[rcx+rdx*1-0x1]
    b8f8:   xor    edx,edx
    b8fa:   mov    BYTE PTR [rsp+0xf],0x11
    b8ff:   div    ecx
    b901:   movzx  edx,r15b
    b905:   movzx  ecx,ax
    b908:   mov    ebx,eax
    b90a:   imul   rcx,rdx
    b90e:   rol    bx,0x8
    b912:   mov    rdx,rcx
    b915:   shl    rdx,0x4
    b919:   add    rdx,rcx
    b91c:   lea    r14,[rdx+0x1000]
    b923:   shl    rdx,0x9
    b927:   bswap  rdx
    b92a:   shr    r14,0xc
    b92e:   mov    r12,rdx
    b931:   jmp    b526 <vpc_create+0xc6>
    b936:   call   31c0 <__stack_chk_fail@plt>
    b93b:   nop    DWORD PTR [rax+rax*1+0x0]

0000000000016ff0 <unix_socket_incoming>:
   16ff0:   push   r12
   16ff2:   xor    edx,edx
   16ff4:   mov    esi,0x1
   16ff9:   push   rbp
   16ffa:   mov    rbp,rdi
   16ffd:   mov    edi,0x1
   17002:   push   rbx
   17003:   add    rsp,0xffffffffffffff80
   17007:   mov    rax,QWORD PTR fs:0x28
   17010:   mov    QWORD PTR [rsp+0x78],rax
   17015:   xor    eax,eax
   17017:   call   36f0 <socket@plt>
   1701c:   mov    ebx,eax
   1701e:   cmp    eax,0xffffffff
   17021:   je     17091 <unix_socket_incoming+0xa1>
   17023:   mov    r12,rsp
   17026:   xor    eax,eax
   17028:   mov    rdx,rbp
   1702b:   mov    esi,0x6c
   17030:   lea    r8,[r12+0x2]
   17035:   lea    rdi,[r12+0x8]
   1703a:   mov    QWORD PTR [rsp+0x2],0x0
   17043:   mov    QWORD PTR [r12+0x66],0x0
   1704c:   mov    rcx,r8
   1704f:   sub    rcx,rdi
   17052:   add    ecx,0x6c
   17055:   shr    ecx,0x3
   17058:   rep stos QWORD PTR es:[rdi],rax
   1705b:   mov    eax,0x1
   17060:   mov    rdi,r8
   17063:   mov    WORD PTR [rsp],ax
   17067:   call   5560 <pstrcpy>
   1706c:   mov    edx,0x6e
   17071:   mov    rsi,r12
   17074:   mov    edi,ebx
   17076:   call   34f0 <bind@plt>
   1707b:   cmp    eax,0xffffffff
   1707e:   je     170b0 <unix_socket_incoming+0xc0>
   17080:   mov    esi,0x80
   17085:   mov    edi,ebx
   17087:   call   3470 <listen@plt>
   1708c:   cmp    eax,0xffffffff
   1708f:   je     170b0 <unix_socket_incoming+0xc0>
   17091:   mov    rdx,QWORD PTR [rsp+0x78]
   17096:   xor    rdx,QWORD PTR fs:0x28
   1709f:   mov    eax,ebx
   170a1:   jne    170be <unix_socket_incoming+0xce>
   170a3:   sub    rsp,0xffffffffffffff80
   170a7:   pop    rbx
   170a8:   pop    rbp
   170a9:   pop    r12
   170ab:   ret
   170ac:   nop    DWORD PTR [rax+0x0]
   170b0:   mov    edi,ebx
   170b2:   mov    ebx,0xffffffff
   170b7:   call   3270 <close@plt>
   170bc:   jmp    17091 <unix_socket_incoming+0xa1>
   170be:   call   31c0 <__stack_chk_fail@plt>
   170c3:   data16 nop WORD PTR cs:[rax+rax*1+0x0]
   170ce:   xchg   ax,ax

00000000000170d0 <unix_socket_outgoing>:
   170d0:   push   r12
   170d2:   xor    edx,edx
   170d4:   mov    esi,0x1
   170d9:   push   rbp
   170da:   mov    rbp,rdi
   170dd:   mov    edi,0x1
   170e2:   push   rbx
   170e3:   add    rsp,0xffffffffffffff80
   170e7:   mov    rax,QWORD PTR fs:0x28
   170f0:   mov    QWORD PTR [rsp+0x78],rax
   170f5:   xor    eax,eax
   170f7:   call   36f0 <socket@plt>
   170fc:   mov    ebx,eax
   170fe:   cmp    eax,0xffffffff
   17101:   je     17162 <unix_socket_outgoing+0x92>
   17103:   mov    r12,rsp
   17106:   xor    eax,eax
   17108:   mov    rdx,rbp
   1710b:   mov    esi,0x6c
   17110:   lea    r8,[r12+0x2]
   17115:   lea    rdi,[r12+0x8]
   1711a:   mov    QWORD PTR [rsp+0x2],0x0
   17123:   mov    QWORD PTR [r12+0x66],0x0
   1712c:   mov    rcx,r8
   1712f:   sub    rcx,rdi
   17132:   add    ecx,0x6c
   17135:   shr    ecx,0x3
   17138:   rep stos QWORD PTR es:[rdi],rax
   1713b:   mov    eax,0x1
   17140:   mov    rdi,r8
   17143:   mov    WORD PTR [rsp],ax
   17147:   call   5560 <pstrcpy>
   1714c:   mov    edx,0x6e
   17151:   mov    rsi,r12
   17154:   mov    edi,ebx
   17156:   call   3630 <connect@plt>
   1715b:   mov    ebp,eax
   1715d:   cmp    eax,0xffffffff
   17160:   je     1717d <unix_socket_outgoing+0xad>
   17162:   mov    rdx,QWORD PTR [rsp+0x78]
   17167:   xor    rdx,QWORD PTR fs:0x28
   17170:   mov    eax,ebx
   17172:   jne    17188 <unix_socket_outgoing+0xb8>
   17174:   sub    rsp,0xffffffffffffff80
   17178:   pop    rbx
   17179:   pop    rbp
   1717a:   pop    r12
   1717c:   ret
   1717d:   mov    edi,ebx
   1717f:   mov    ebx,ebp
   17181:   call   3270 <close@plt>
   17186:   jmp    17162 <unix_socket_outgoing+0x92>
   17188:   call   31c0 <__stack_chk_fail@plt>
   1718d:   nop    DWORD PTR [rax]

0000000000017190 <nbd_negotiate>:
   17190:   sub    rsp,0xa8
   17197:   mov    rax,rsi
   1719a:   mov    r8d,edi
   1719d:   movabs rdx,0x434947414d44424e
   171a7:   mov    rdi,QWORD PTR fs:0x28
   171b0:   mov    QWORD PTR [rsp+0x98],rdi
   171b8:   xor    edi,edi
   171ba:   mov    rsi,rsp
   171bd:   mov    QWORD PTR [rsp],rdx
   171c1:   bswap  rax
   171c4:   movabs rcx,0x5312868102420000
   171ce:   lea    rdx,[rsi+0x18]
   171d2:   mov    QWORD PTR [rsp+0x10],rax
   171d7:   xor    eax,eax
   171d9:   mov    rdi,rdx
   171dc:   mov    QWORD PTR [rsp+0x8],rcx
   171e1:   mov    ecx,0x10
   171e6:   mov    edx,0x98
   171eb:   rep stos QWORD PTR es:[rdi],rax
   171ee:   mov    edi,r8d
   171f1:   call   16ce0 <nbd_wr_sync>
   171f6:   cmp    rax,0x98
   171fc:   jne    1721b <nbd_negotiate+0x8b>
   171fe:   xor    eax,eax
   17200:   mov    rdx,QWORD PTR [rsp+0x98]
   17208:   xor    rdx,QWORD PTR fs:0x28
   17211:   jne    1725b <nbd_negotiate+0xcb>
   17213:   add    rsp,0xa8
   1721a:   ret
   1721b:   mov    rdi,QWORD PTR [rip+0x130de]        # 2a300 <stderr@@GLIBC_2.2.5>
   17222:   mov    r9d,0x123
   17228:   xor    eax,eax
   1722a:   lea    r8,[rip+0xa727]        # 21958 <__FUNCTION__.13813>
   17231:   lea    rcx,[rip+0xa32b]        # 21563 <__PRETTY_FUNCTION__.14669+0x43>
   17238:   lea    rdx,[rip+0xa32a]        # 21569 <__PRETTY_FUNCTION__.14669+0x49>
   1723f:   mov    esi,0x1
   17244:   call   3660 <__fprintf_chk@plt>
   17249:   call   30d0 <__errno_location@plt>
   1724e:   mov    DWORD PTR [rax],0x16
   17254:   mov    eax,0xffffffff
   17259:   jmp    17200 <nbd_negotiate+0x70>
   1725b:   call   31c0 <__stack_chk_fail@plt>

00000000000156c0 <update_snapshot_refcount>:
   156c0:   push   r15
   156c2:   mov    r15,rsi
   156c5:   push   r14
   156c7:   push   r13
   156c9:   push   r12
   156cb:   push   rbp
   156cc:   push   rbx
   156cd:   mov    ebx,edx
   156cf:   sub    rsp,0x68
   156d3:   mov    r14,QWORD PTR [rdi+0x40]
   156d7:   mov    DWORD PTR [rsp+0x28],edx
   156db:   mov    edx,DWORD PTR [r14+0x18]
   156df:   mov    QWORD PTR [rsp+0x10],rdi
   156e4:   mov    rdi,QWORD PTR [r14+0x48]
   156e8:   mov    QWORD PTR [rsp+0x58],rsi
   156ed:   xor    esi,esi
   156ef:   shl    edx,0x4
   156f2:   mov    DWORD PTR [rsp+0x2c],ecx
   156f6:   movsxd rdx,edx
   156f9:   shl    rdx,0x3
   156fd:   call   3250 <memset@plt>
   15702:   lea    rdi,[r14+0x58]
   15706:   mov    eax,r14d
   15709:   pxor   xmm0,xmm0
   1570d:   and    rdi,0xfffffffffffffff8
   15711:   mov    QWORD PTR [r14+0x50],0x0
   15719:   mov    QWORD PTR [r14+0xc8],0x0
   15724:   sub    eax,edi
   15726:   lea    ecx,[rax+0xd0]
   1572c:   xor    eax,eax
   1572e:   shr    ecx,0x3
   15731:   rep stos QWORD PTR es:[rdi],rax
   15734:   movsxd rax,ebx
   15737:   movups XMMWORD PTR [r14+0xd0],xmm0
   1573f:   lea    rbp,[rax*8+0x0]
   15747:   movups XMMWORD PTR [r14+0xe0],xmm0
   1574f:   movups XMMWORD PTR [r14+0xf0],xmm0
   15757:   movups XMMWORD PTR [r14+0x100],xmm0
   1575f:   mov    QWORD PTR [rsp+0x50],rbp
   15764:   cmp    QWORD PTR [r14+0x38],r15
   15768:   jne    15af0 <update_snapshot_refcount+0x430>
   1576e:   mov    eax,DWORD PTR [rsp+0x28]
   15772:   cmp    DWORD PTR [r14+0x1c],eax
   15776:   jne    15ba7 <update_snapshot_refcount+0x4e7>
   1577c:   mov    eax,DWORD PTR [r14+0x18]
   15780:   mov    r10,QWORD PTR [r14+0x40]
   15784:   shl    eax,0x3
   15787:   mov    QWORD PTR [rsp+0x8],r10
   1578c:   movsxd rdi,eax
   1578f:   mov    DWORD PTR [rsp+0x40],eax
   15793:   call   5970 <qemu_malloc>
   15798:   mov    edi,DWORD PTR [rsp+0x28]
   1579c:   mov    r15,rax
   1579f:   test   edi,edi
   157a1:   jle    15a47 <update_snapshot_refcount+0x387>
   157a7:   mov    QWORD PTR [rsp+0x48],0x0
   157b0:   mov    r10,QWORD PTR [rsp+0x8]
   157b5:   xor    r12d,r12d
   157b8:   mov    DWORD PTR [rsp+0x44],0x0
   157c0:   mov    QWORD PTR [rsp+0x8],r10
   157c5:   jmp    157df <update_snapshot_refcount+0x11f>
   157c7:   nop    WORD PTR [rax+rax*1+0x0]
   157d0:   add    r12,0x1
   157d4:   cmp    DWORD PTR [rsp+0x28],r12d
   157d9:   jle    159c8 <update_snapshot_refcount+0x308>
   157df:   mov    rax,QWORD PTR [rsp+0x8]
   157e4:   mov    r9,QWORD PTR [rax+r12*8]
   157e8:   test   r9,r9
   157eb:   je     157d0 <update_snapshot_refcount+0x110>
   157ed:   mov    ebx,DWORD PTR [rsp+0x40]
   157f1:   mov    rdi,QWORD PTR [r14]
   157f4:   mov    rdx,r15
   157f7:   mov    QWORD PTR [rsp+0x30],r9
   157fc:   movabs rax,0x7fffffffffffffff
   15806:   and    rax,r9
   15809:   mov    ecx,ebx
   1580b:   mov    rsi,rax
   1580e:   mov    QWORD PTR [rsp+0x20],rax
   15813:   call   18b00 <bdrv_pread>
   15818:   cmp    eax,ebx
   1581a:   jne    15b71 <update_snapshot_refcount+0x4b1>
   15820:   mov    esi,DWORD PTR [r14+0x18]
   15824:   xor    ebp,ebp
   15826:   mov    r9,QWORD PTR [rsp+0x30]
   1582b:   mov    DWORD PTR [rsp+0x18],0x0
   15833:   test   esi,esi
   15835:   jle    15950 <update_snapshot_refcount+0x290>
   1583b:   mov    rax,rbp
   1583e:   mov    QWORD PTR [rsp+0x38],r12
   15843:   mov    rbp,r15
   15846:   mov    r12,r14
   15849:   mov    QWORD PTR [rsp+0x30],r9
   1584e:   mov    r13d,DWORD PTR [rsp+0x2c]
   15853:   mov    r15,rax
   15856:   jmp    15890 <update_snapshot_refcount+0x1d0>
   15858:   nop    DWORD PTR [rax+rax*1+0x0]
   15860:   test   r13d,r13d
   15863:   jne    15a60 <update_snapshot_refcount+0x3a0>
   15869:   cmp    r14,rbx
   1586c:   je     15881 <update_snapshot_refcount+0x1c1>
   1586e:   mov    rax,r14
   15871:   mov    DWORD PTR [rsp+0x18],0x1
   15879:   bswap  rax
   1587c:   mov    QWORD PTR [rbp+r15*8+0x0],rax
   15881:   add    r15,0x1
   15885:   cmp    DWORD PTR [r12+0x18],r15d
   1588a:   jle    15910 <update_snapshot_refcount+0x250>
   15890:   mov    rbx,QWORD PTR [rbp+r15*8+0x0]
   15895:   bswap  rbx
   15898:   test   rbx,rbx
   1589b:   je     15881 <update_snapshot_refcount+0x1c1>
   1589d:   movabs r14,0x7fffffffffffffff
   158a7:   movabs rax,0x4000000000000000
   158b1:   and    r14,rbx
   158b4:   test   rbx,rax
   158b7:   jne    15860 <update_snapshot_refcount+0x1a0>
   158b9:   mov    ecx,DWORD PTR [r12+0x8]
   158be:   mov    rsi,r14
   158c1:   shr    rsi,cl
   158c4:   test   r13d,r13d
   158c7:   je     158f8 <update_snapshot_refcount+0x238>
   158c9:   mov    rdi,QWORD PTR [rsp+0x10]
   158ce:   mov    edx,r13d
   158d1:   call   143a0 <update_cluster_refcount>
   158d6:   movabs r10,0x8000000000000000
   158e0:   mov    rdx,r14
   158e3:   or     r10,r14
   158e6:   cmp    eax,0x1
   158e9:   cmove  rdx,r10
   158ed:   mov    r14,rdx
   158f0:   jmp    15869 <update_snapshot_refcount+0x1a9>
   158f5:   nop    DWORD PTR [rax]
   158f8:   mov    rax,QWORD PTR [rsp+0x10]
   158fd:   mov    rdi,QWORD PTR [rax+0x40]
   15901:   call   12a40 <get_refcount.isra.4>
   15906:   jmp    158d6 <update_snapshot_refcount+0x216>
   15908:   nop    DWORD PTR [rax+rax*1+0x0]
   15910:   mov    edx,DWORD PTR [rsp+0x18]
   15914:   mov    r14,r12
   15917:   mov    r15,rbp
   1591a:   mov    r9,QWORD PTR [rsp+0x30]
   1591f:   mov    r12,QWORD PTR [rsp+0x38]
   15924:   test   edx,edx
   15926:   je     15950 <update_snapshot_refcount+0x290>
   15928:   mov    ebx,DWORD PTR [rsp+0x40]
   1592c:   mov    rdi,QWORD PTR [r14]
   1592f:   mov    rdx,rbp
   15932:   mov    QWORD PTR [rsp+0x18],r9
   15937:   mov    rsi,QWORD PTR [rsp+0x20]
   1593c:   mov    ecx,ebx
   1593e:   call   19110 <bdrv_pwrite>
   15943:   mov    r9,QWORD PTR [rsp+0x18]
   15948:   cmp    eax,ebx
   1594a:   jne    15b71 <update_snapshot_refcount+0x4b1>
   15950:   mov    ecx,DWORD PTR [r14+0x8]
   15954:   mov    rsi,QWORD PTR [rsp+0x20]
   15959:   shr    rsi,cl
   1595c:   mov    ecx,DWORD PTR [rsp+0x2c]
   15960:   test   ecx,ecx
   15962:   je     15aa0 <update_snapshot_refcount+0x3e0>
   15968:   mov    edx,DWORD PTR [rsp+0x2c]
   1596c:   mov    rdi,QWORD PTR [rsp+0x10]
   15971:   mov    QWORD PTR [rsp+0x18],r9
   15976:   call   143a0 <update_cluster_refcount>
   1597b:   mov    r9,QWORD PTR [rsp+0x18]
   15980:   movabs rcx,0x8000000000000000
   1598a:   mov    rdi,QWORD PTR [rsp+0x20]
   1598f:   or     rcx,rdi
   15992:   mov    rdx,rdi
   15995:   cmp    eax,0x1
   15998:   cmove  rdx,rcx
   1599c:   cmp    rdx,r9
   1599f:   je     157d0 <update_snapshot_refcount+0x110>
   159a5:   mov    rdi,QWORD PTR [rsp+0x8]
   159aa:   mov    DWORD PTR [rsp+0x44],0x1
   159b2:   mov    QWORD PTR [rdi+r12*8],rdx
   159b6:   add    r12,0x1
   159ba:   cmp    DWORD PTR [rsp+0x28],r12d
   159bf:   jg     157df <update_snapshot_refcount+0x11f>
   159c5:   nop    DWORD PTR [rax]
   159c8:   mov    eax,DWORD PTR [rsp+0x44]
   159cc:   mov    r10,QWORD PTR [rsp+0x8]
   159d1:   test   eax,eax
   159d3:   je     15a3b <update_snapshot_refcount+0x37b>
   159d5:   mov    ecx,DWORD PTR [rsp+0x28]
   159d9:   xor    eax,eax
   159db:   nop    DWORD PTR [rax+rax*1+0x0]
   159e0:   mov    rdx,QWORD PTR [r10+rax*8]
   159e4:   bswap  rdx
   159e7:   mov    QWORD PTR [r10+rax*8],rdx
   159eb:   add    rax,0x1
   159ef:   cmp    ecx,eax
   159f1:   jg     159e0 <update_snapshot_refcount+0x320>
   159f3:   mov    rbx,QWORD PTR [rsp+0x50]
   159f8:   mov    rdi,QWORD PTR [r14]
   159fb:   mov    rdx,r10
   159fe:   mov    QWORD PTR [rsp+0x8],r10
   15a03:   mov    rsi,QWORD PTR [rsp+0x58]
   15a08:   mov    ecx,ebx
   15a0a:   call   19110 <bdrv_pwrite>
   15a0f:   mov    r10,QWORD PTR [rsp+0x8]
   15a14:   cdqe
   15a16:   cmp    rax,rbx
   15a19:   jne    15b76 <update_snapshot_refcount+0x4b6>
   15a1f:   mov    ecx,DWORD PTR [rsp+0x28]
   15a23:   xor    eax,eax
   15a25:   nop    DWORD PTR [rax]
   15a28:   mov    rdx,QWORD PTR [r10+rax*8]
   15a2c:   bswap  rdx
   15a2f:   mov    QWORD PTR [r10+rax*8],rdx
   15a33:   add    rax,0x1
   15a37:   cmp    ecx,eax
   15a39:   jg     15a28 <update_snapshot_refcount+0x368>
   15a3b:   cmp    QWORD PTR [rsp+0x48],0x0
   15a41:   jne    15ad9 <update_snapshot_refcount+0x419>
   15a47:   mov    rdi,r15
   15a4a:   call   5960 <qemu_free>
   15a4f:   add    rsp,0x68
   15a53:   xor    eax,eax
   15a55:   pop    rbx
   15a56:   pop    rbp
   15a57:   pop    r12
   15a59:   pop    r13
   15a5b:   pop    r14
   15a5d:   pop    r15
   15a5f:   ret
   15a60:   mov    ecx,DWORD PTR [r12+0x24]
   15a65:   mov    rdx,r14
   15a68:   mov    rsi,QWORD PTR [r12+0x30]
   15a6d:   mov    rdi,QWORD PTR [rsp+0x10]
   15a72:   shr    rdx,cl
   15a75:   and    edx,DWORD PTR [r12+0x28]
   15a7a:   and    rsi,r14
   15a7d:   mov    ecx,r13d
   15a80:   add    edx,0x1
   15a83:   and    rsi,0xfffffffffffffe00
   15a8a:   shl    edx,0x9
   15a8d:   movsxd rdx,edx
   15a90:   call   147f0 <update_refcount>
   15a95:   jmp    15869 <update_snapshot_refcount+0x1a9>
   15a9a:   nop    WORD PTR [rax+rax*1+0x0]
   15aa0:   mov    rax,QWORD PTR [rsp+0x10]
   15aa5:   mov    QWORD PTR [rsp+0x18],r9
   15aaa:   mov    rdi,QWORD PTR [rax+0x40]
   15aae:   call   12a40 <get_refcount.isra.4>
   15ab3:   mov    r9,QWORD PTR [rsp+0x18]
   15ab8:   jmp    15980 <update_snapshot_refcount+0x2c0>
   15abd:   mov    edi,DWORD PTR [r14+0x18]
   15ac1:   mov    QWORD PTR [rsp+0x8],r10
   15ac6:   shl    edi,0x3
   15ac9:   movsxd rdi,edi
   15acc:   call   5970 <qemu_malloc>
   15ad1:   mov    r10,QWORD PTR [rsp+0x8]
   15ad6:   mov    r15,rax
   15ad9:   mov    rdi,r10
   15adc:   call   5960 <qemu_free>
   15ae1:   jmp    15a47 <update_snapshot_refcount+0x387>
   15ae6:   nop    WORD PTR cs:[rax+rax*1+0x0]
   15af0:   mov    rdi,rbp
   15af3:   call   5970 <qemu_malloc>
   15af8:   mov    rdi,QWORD PTR [r14]
   15afb:   mov    ecx,ebp
   15afd:   mov    rsi,r15
   15b00:   mov    rdx,rax
   15b03:   mov    QWORD PTR [rsp+0x8],rax
   15b08:   call   18b00 <bdrv_pread>
   15b0d:   mov    r10,QWORD PTR [rsp+0x8]
   15b12:   cdqe
   15b14:   cmp    rax,rbp
   15b17:   jne    15b9a <update_snapshot_refcount+0x4da>
   15b1d:   test   ebx,ebx
   15b1f:   jle    15abd <update_snapshot_refcount+0x3fd>
   15b21:   lea    edx,[rbx-0x1]
   15b24:   mov    rax,r10
   15b27:   lea    rcx,[r10+rdx*8+0x8]
   15b2c:   nop    DWORD PTR [rax+0x0]
   15b30:   mov    rdx,QWORD PTR [rax]
   15b33:   add    rax,0x8
   15b37:   bswap  rdx
   15b3a:   mov    QWORD PTR [rax-0x8],rdx
   15b3e:   cmp    rcx,rax
   15b41:   jne    15b30 <update_snapshot_refcount+0x470>
   15b43:   mov    eax,DWORD PTR [r14+0x18]
   15b47:   mov    QWORD PTR [rsp+0x8],r10
   15b4c:   shl    eax,0x3
   15b4f:   movsxd rdi,eax
   15b52:   mov    DWORD PTR [rsp+0x40],eax
   15b56:   call   5970 <qemu_malloc>
   15b5b:   mov    r10,QWORD PTR [rsp+0x8]
   15b60:   mov    QWORD PTR [rsp+0x48],0x1
   15b69:   mov    r15,rax
   15b6c:   jmp    157b5 <update_snapshot_refcount+0xf5>
   15b71:   mov    r10,QWORD PTR [rsp+0x8]
   15b76:   cmp    QWORD PTR [rsp+0x48],0x0
   15b7c:   jne    15b9d <update_snapshot_refcount+0x4dd>
   15b7e:   mov    rdi,r15
   15b81:   call   5960 <qemu_free>
   15b86:   add    rsp,0x68
   15b8a:   mov    eax,0xfffffffb
   15b8f:   pop    rbx
   15b90:   pop    rbp
   15b91:   pop    r12
   15b93:   pop    r13
   15b95:   pop    r14
   15b97:   pop    r15
   15b99:   ret
   15b9a:   xor    r15d,r15d
   15b9d:   mov    rdi,r10
   15ba0:   call   5960 <qemu_free>
   15ba5:   jmp    15b7e <update_snapshot_refcount+0x4be>
   15ba7:   lea    rcx,[rip+0xb972]        # 21520 <__PRETTY_FUNCTION__.14669>
   15bae:   mov    edx,0x69b
   15bb3:   lea    rsi,[rip+0xb8ff]        # 214b9 <__PRETTY_FUNCTION__.14257+0x19>
   15bba:   lea    rdi,[rip+0xb906]        # 214c7 <__PRETTY_FUNCTION__.14257+0x27>
   15bc1:   call   3230 <__assert_fail@plt>
   15bc6:   nop    WORD PTR cs:[rax+rax*1+0x0]

0000000000017c60 <find_protocol>:
   17c60:   push   r12
   17c62:   mov    esi,0x3a
   17c67:   push   rbp
   17c68:   push   rbx
   17c69:   mov    rbx,rdi
   17c6c:   sub    rsp,0x90
   17c73:   mov    rax,QWORD PTR fs:0x28
   17c7c:   mov    QWORD PTR [rsp+0x88],rax
   17c84:   xor    eax,eax
   17c86:   call   31e0 <strchr@plt>
   17c8b:   test   rax,rax
   17c8e:   je     17d30 <find_protocol+0xd0>
   17c94:   sub    rax,rbx
   17c97:   cmp    eax,0x7f
   17c9a:   ja     17d20 <find_protocol+0xc0>
   17ca0:   mov    r12d,eax
   17ca3:   movsxd rdx,eax
   17ca6:   mov    rbp,rsp
   17ca9:   mov    rsi,rbx
   17cac:   mov    ecx,0x80
   17cb1:   mov    rdi,rbp
   17cb4:   call   3370 <__memcpy_chk@plt>
   17cb9:   mov    rbx,QWORD PTR [rip+0x126c0]        # 2a380 <first_drv>
   17cc0:   movsxd rax,r12d
   17cc3:   mov    BYTE PTR [rsp+rax*1],0x0
   17cc7:   test   rbx,rbx
   17cca:   je     17cf4 <find_protocol+0x94>
   17ccc:   nop    DWORD PTR [rax+0x0]
   17cd0:   mov    rdi,QWORD PTR [rbx+0x88]
   17cd7:   test   rdi,rdi
   17cda:   je     17ce8 <find_protocol+0x88>
   17cdc:   mov    rsi,rbp
   17cdf:   call   3350 <strcmp@plt>
   17ce4:   test   eax,eax
   17ce6:   je     17cfb <find_protocol+0x9b>
   17ce8:   mov    rbx,QWORD PTR [rbx+0x138]
   17cef:   test   rbx,rbx
   17cf2:   jne    17cd0 <find_protocol+0x70>
   17cf4:   lea    rbx,[rip+0x12225]        # 29f20 <bdrv_invalid_protocol>
   17cfb:   mov    rcx,QWORD PTR [rsp+0x88]
   17d03:   xor    rcx,QWORD PTR fs:0x28
   17d0c:   mov    rax,rbx
   17d0f:   jne    17d34 <find_protocol+0xd4>
   17d11:   add    rsp,0x90
   17d18:   pop    rbx
   17d19:   pop    rbp
   17d1a:   pop    r12
   17d1c:   ret
   17d1d:   nop    DWORD PTR [rax]
   17d20:   mov    edx,0x7f
   17d25:   mov    r12d,0x7f
   17d2b:   jmp    17ca6 <find_protocol+0x46>
   17d30:   xor    ebx,ebx
   17d32:   jmp    17cfb <find_protocol+0x9b>
   17d34:   call   31c0 <__stack_chk_fail@plt>
   17d39:   nop    DWORD PTR [rax+0x0]

0000000000016ce0 <nbd_wr_sync>:
   16ce0:   push   r14
   16ce2:   push   r13
   16ce4:   push   r12
   16ce6:   push   rbp
   16ce7:   push   rbx
   16ce8:   test   rdx,rdx
   16ceb:   je     16d3e <nbd_wr_sync+0x5e>
   16ced:   mov    r14d,edi
   16cf0:   mov    r13,rsi
   16cf3:   mov    rbp,rdx
   16cf6:   mov    r12d,ecx
   16cf9:   xor    ebx,ebx
   16cfb:   jmp    16d0d <nbd_wr_sync+0x2d>
   16cfd:   nop    DWORD PTR [rax]
   16d00:   test   rax,rax
   16d03:   je     16d40 <nbd_wr_sync+0x60>
   16d05:   add    rbx,rax
   16d08:   cmp    rbp,rbx
   16d0b:   jbe    16d40 <nbd_wr_sync+0x60>
   16d0d:   mov    rdx,rbp
   16d10:   lea    rsi,[r13+rbx*1+0x0]
   16d15:   xor    ecx,ecx
   16d17:   mov    edi,r14d
   16d1a:   sub    rdx,rbx
   16d1d:   test   r12b,r12b
   16d20:   je     16d50 <nbd_wr_sync+0x70>
   16d22:   call   3080 <recv@plt>
   16d27:   cmp    rax,0xffffffffffffffff
   16d2b:   jne    16d00 <nbd_wr_sync+0x20>
   16d2d:   call   30d0 <__errno_location@plt>
   16d32:   mov    eax,DWORD PTR [rax]
   16d34:   cmp    eax,0xb
   16d37:   je     16d08 <nbd_wr_sync+0x28>
   16d39:   cmp    eax,0x4
   16d3c:   je     16d08 <nbd_wr_sync+0x28>
   16d3e:   xor    ebx,ebx
   16d40:   mov    rax,rbx
   16d43:   pop    rbx
   16d44:   pop    rbp
   16d45:   pop    r12
   16d47:   pop    r13
   16d49:   pop    r14
   16d4b:   ret
   16d4c:   nop    DWORD PTR [rax+0x0]
   16d50:   call   31d0 <send@plt>
   16d55:   jmp    16d27 <nbd_wr_sync+0x47>
   16d57:   nop    WORD PTR [rax+rax*1+0x0]

0000000000004520 <bdrv_new_open>:
    4520:   push   r15
    4522:   push   r14
    4524:   push   r13
    4526:   push   r12
    4528:   mov    r12,rdi
    452b:   lea    rdi,[rip+0x1c730]        # 20c62 <desc_template.13939+0x382>
    4532:   push   rbp
    4533:   mov    rbp,rsi
    4536:   push   rbx
    4537:   sub    rsp,0x168
    453e:   mov    rax,QWORD PTR fs:0x28
    4547:   mov    QWORD PTR [rsp+0x158],rax
    454f:   xor    eax,eax
    4551:   call   17ff0 <bdrv_new>
    4556:   test   rax,rax
    4559:   je     478d <bdrv_new_open+0x26d>
    455f:   mov    rbx,rax
    4562:   test   rbp,rbp
    4565:   je     4770 <bdrv_new_open+0x250>
    456b:   mov    rdi,rbp
    456e:   call   18060 <bdrv_find_format>
    4573:   mov    rcx,rax
    4576:   test   rax,rax
    4579:   je     47a0 <bdrv_new_open+0x280>
    457f:   mov    edx,0x40
    4584:   mov    rsi,r12
    4587:   mov    rdi,rbx
    458a:   call   18b80 <bdrv_open2>
    458f:   test   eax,eax
    4591:   js     477c <bdrv_new_open+0x25c>
    4597:   mov    rdi,rbx
    459a:   call   19510 <bdrv_is_encrypted>
    459f:   test   eax,eax
    45a1:   jne    45d0 <bdrv_new_open+0xb0>
    45a3:   mov    rdx,QWORD PTR [rsp+0x158]
    45ab:   xor    rdx,QWORD PTR fs:0x28
    45b4:   mov    rax,rbx
    45b7:   jne    479b <bdrv_new_open+0x27b>
    45bd:   add    rsp,0x168
    45c4:   pop    rbx
    45c5:   pop    rbp
    45c6:   pop    r12
    45c8:   pop    r13
    45ca:   pop    r14
    45cc:   pop    r15
    45ce:   ret
    45cf:   nop
    45d0:   mov    rdx,r12
    45d3:   lea    rsi,[rip+0x194ce]        # 1daa8 <_IO_stdin_used+0xaa8>
    45da:   xor    eax,eax
    45dc:   xor    r13d,r13d
    45df:   mov    edi,0x1
    45e4:   lea    rbp,[rsp+0x10]
    45e9:   lea    r15,[rsp+0xf]
    45ee:   call   34d0 <__printf_chk@plt>
    45f3:   lea    rsi,[rip+0x18aa9]        # 1d0a3 <_IO_stdin_used+0xa3>
    45fa:   mov    edi,0x1
    45ff:   xor    eax,eax
    4601:   call   34d0 <__printf_chk@plt>
    4606:   mov    rdi,QWORD PTR [rip+0x25cd3]        # 2a2e0 <stdout@@GLIBC_2.2.5>
    460d:   lea    r14,[rsp+0x50]
    4612:   call   3460 <fflush@plt>
    4617:   mov    rsi,rbp
    461a:   xor    edi,edi
    461c:   call   3580 <tcgetattr@plt>
    4621:   mov    rax,QWORD PTR [rsp+0x40]
    4626:   mov    rdx,rbp
    4629:   xor    esi,esi
    462b:   movdqa xmm0,XMMWORD PTR [rsp+0x10]
    4631:   movdqa xmm1,XMMWORD PTR [rsp+0x20]
    4637:   xor    edi,edi
    4639:   xor    ebp,ebp
    463b:   mov    QWORD PTR [rip+0x25d0e],rax        # 2a350 <oldtty+0x30>
    4642:   mov    eax,DWORD PTR [rsp+0x48]
    4646:   movdqa xmm2,XMMWORD PTR [rsp+0x30]
    464c:   movaps XMMWORD PTR [rip+0x25ccd],xmm0        # 2a320 <oldtty>
    4653:   mov    DWORD PTR [rip+0x25cff],eax        # 2a358 <oldtty+0x38>
    4659:   mov    eax,DWORD PTR [rsp+0x18]
    465d:   movaps XMMWORD PTR [rip+0x25ccc],xmm1        # 2a330 <oldtty+0x10>
    4664:   and    eax,0xfffffecf
    4669:   movaps XMMWORD PTR [rip+0x25cd0],xmm2        # 2a340 <oldtty+0x20>
    4670:   or     eax,0x30
    4673:   and    DWORD PTR [rsp+0x10],0xfffffa14
    467b:   mov    DWORD PTR [rsp+0x18],eax
    467f:   mov    eax,0x100
    4684:   or     DWORD PTR [rsp+0x14],0x1
    4689:   and    DWORD PTR [rsp+0x1c],0xffff7fb5
    4691:   mov    WORD PTR [rsp+0x26],ax
    4696:   call   3590 <tcsetattr@plt>
    469b:   lea    rdi,[rip+0xfffffffffffff6ce]        # 3d70 <term_exit>
    46a2:   call   1c820 <atexit>
    46a7:   nop    WORD PTR [rax+rax*1+0x0]
    46b0:   mov    edx,0x1
    46b5:   mov    rsi,r15
    46b8:   lea    r12,[r14+r13*1]
    46bc:   xor    edi,edi
    46be:   call   32e0 <read@plt>
    46c3:   cmp    eax,0xffffffff
    46c6:   je     46f0 <bdrv_new_open+0x1d0>
    46c8:   test   eax,eax
    46ca:   je     4701 <bdrv_new_open+0x1e1>
    46cc:   movzx  eax,BYTE PTR [rsp+0xf]
    46d1:   cmp    al,0xd
    46d3:   je     4730 <bdrv_new_open+0x210>
    46d5:   cmp    ebp,0xfe
    46db:   jg     46b0 <bdrv_new_open+0x190>
    46dd:   add    ebp,0x1
    46e0:   mov    BYTE PTR [r12],al
    46e4:   movsxd r13,ebp
    46e7:   jmp    46b0 <bdrv_new_open+0x190>
    46e9:   nop    DWORD PTR [rax+0x0]
    46f0:   call   30d0 <__errno_location@plt>
    46f5:   mov    eax,DWORD PTR [rax]
    46f7:   cmp    eax,0xb
    46fa:   je     46b0 <bdrv_new_open+0x190>
    46fc:   cmp    eax,0x4
    46ff:   je     46b0 <bdrv_new_open+0x190>
    4701:   lea    rdx,[rip+0x25c18]        # 2a320 <oldtty>
    4708:   xor    esi,esi
    470a:   xor    edi,edi
    470c:   call   3590 <tcsetattr@plt>
    4711:   mov    BYTE PTR [r12],0x0
    4716:   mov    edi,0xa
    471b:   call   3090 <putchar@plt>
    4720:   lea    rdi,[rip+0x18998]        # 1d0bf <_IO_stdin_used+0xbf>
    4727:   xor    eax,eax
    4729:   call   3da0 <error>
    472e:   xchg   ax,ax
    4730:   xor    esi,esi
    4732:   xor    edi,edi
    4734:   lea    rdx,[rip+0x25be5]        # 2a320 <oldtty>
    473b:   call   3590 <tcsetattr@plt>
    4740:   mov    BYTE PTR [r12],0x0
    4745:   mov    edi,0xa
    474a:   call   3090 <putchar@plt>
    474f:   mov    rsi,r14
    4752:   mov    rdi,rbx
    4755:   call   19570 <bdrv_set_key>
    475a:   test   eax,eax
    475c:   jns    45a3 <bdrv_new_open+0x83>
    4762:   lea    rdi,[rip+0x18945]        # 1d0ae <_IO_stdin_used+0xae>
    4769:   xor    eax,eax
    476b:   call   3da0 <error>
    4770:   lea    rcx,[rip+0x25a29]        # 2a1a0 <bdrv_raw>
    4777:   jmp    457f <bdrv_new_open+0x5f>
    477c:   mov    rsi,r12
    477f:   lea    rdi,[rip+0x188df]        # 1d065 <_IO_stdin_used+0x65>
    4786:   xor    eax,eax
    4788:   call   3da0 <error>
    478d:   lea    rdi,[rip+0x188a6]        # 1d03a <_IO_stdin_used+0x3a>
    4794:   xor    eax,eax
    4796:   call   3da0 <error>
    479b:   call   31c0 <__stack_chk_fail@plt>
    47a0:   mov    rsi,rbp
    47a3:   lea    rdi,[rip+0x188a2]        # 1d04c <_IO_stdin_used+0x4c>
    47aa:   xor    eax,eax
    47ac:   call   3da0 <error>
    47b1:   data16 nop WORD PTR cs:[rax+rax*1+0x0]
    47bc:   nop    DWORD PTR [rax+0x0]

000000000000b0a0 <vpc_read>:
    b0a0:   push   r15
    b0a2:   push   r14
    b0a4:   push   r13
    b0a6:   push   r12
    b0a8:   push   rbp
    b0a9:   push   rbx
    b0aa:   sub    rsp,0x8
    b0ae:   mov    r12,QWORD PTR [rdi+0x40]
    b0b2:   test   ecx,ecx
    b0b4:   jle    b160 <vpc_read+0xc0>
    b0ba:   lea    ebx,[rcx-0x1]
    b0bd:   shl    rsi,0x9
    b0c1:   mov    r13,rdi
    b0c4:   mov    r15,rdx
    b0c7:   add    rbx,0x1
    b0cb:   sub    rsi,rdx
    b0ce:   xor    r14d,r14d
    b0d1:   shl    rbx,0x9
    b0d5:   mov    rbp,rsi
    b0d8:   mov    rsi,r12
    b0db:   add    rbx,rdx
    b0de:   jmp    b0f0 <vpc_read+0x50>
    b0e0:   add    r15,0x200
    b0e7:   cmp    r15,rbx
    b0ea:   je     b160 <vpc_read+0xc0>
    b0ec:   mov    rsi,QWORD PTR [r13+0x40]
    b0f0:   mov    ecx,DWORD PTR [rsi+0x230]
    b0f6:   lea    rax,[r15+rbp*1]
    b0fa:   xor    edx,edx
    b0fc:   div    rcx
    b0ff:   shr    rdx,0x9
    b103:   cmp    DWORD PTR [rsi+0x210],eax
    b109:   jbe    b178 <vpc_read+0xd8>
    b10b:   mov    rcx,QWORD PTR [rsi+0x218]
    b112:   mov    eax,eax
    b114:   mov    ecx,DWORD PTR [rcx+rax*4]
    b117:   cmp    ecx,0xffffffff
    b11a:   je     b178 <vpc_read+0xd8>
    b11c:   mov    esi,DWORD PTR [rsi+0x234]
    b122:   shl    rdx,0x9
    b126:   shl    rcx,0x9
    b12a:   mov    rdi,QWORD PTR [r12]
    b12e:   add    rdx,rsi
    b131:   lea    rsi,[rdx+rcx*1]
    b135:   mov    ecx,0x200
    b13a:   mov    rdx,r15
    b13d:   call   18b00 <bdrv_pread>
    b142:   cmp    eax,0x200
    b147:   je     b0e0 <vpc_read+0x40>
    b149:   add    rsp,0x8
    b14d:   mov    eax,0xffffffff
    b152:   pop    rbx
    b153:   pop    rbp
    b154:   pop    r12
    b156:   pop    r13
    b158:   pop    r14
    b15a:   pop    r15
    b15c:   ret
    b15d:   nop    DWORD PTR [rax]
    b160:   add    rsp,0x8
    b164:   xor    eax,eax
    b166:   pop    rbx
    b167:   pop    rbp
    b168:   pop    r12
    b16a:   pop    r13
    b16c:   pop    r14
    b16e:   pop    r15
    b170:   ret
    b171:   nop    DWORD PTR [rax+0x0]
    b178:   lea    rdi,[r15+0x8]
    b17c:   mov    rcx,r15
    b17f:   mov    rax,r14
    b182:   mov    QWORD PTR [r15],0x0
    b189:   mov    QWORD PTR [r15+0x1f8],0x0
    b194:   and    rdi,0xfffffffffffffff8
    b198:   sub    rcx,rdi
    b19b:   add    ecx,0x200
    b1a1:   shr    ecx,0x3
    b1a4:   rep stos QWORD PTR es:[rdi],rax
    b1a7:   jmp    b0e0 <vpc_read+0x40>
    b1ac:   nop    DWORD PTR [rax+0x0]

000000000001b610 <raw_pread>:
   1b610:   push   r15
   1b612:   mov    r15d,ecx
   1b615:   push   r14
   1b617:   push   r13
   1b619:   push   r12
   1b61b:   push   rbp
   1b61c:   mov    rbp,rdx
   1b61f:   push   rbx
   1b620:   mov    rbx,rsi
   1b623:   sub    rsp,0x18
   1b627:   mov    r13,QWORD PTR [rdi+0x40]
   1b62b:   mov    QWORD PTR [rsp+0x8],rdi
   1b630:   mov    rdx,QWORD PTR [r13+0x28]
   1b634:   test   rdx,rdx
   1b637:   je     1b858 <raw_pread+0x248>
   1b63d:   mov    r12,rsi
   1b640:   and    r12d,0x1ff
   1b647:   je     1b6d8 <raw_pread+0xc8>
   1b64d:   lea    ecx,[rcx+r12*1+0x1ff]
   1b655:   mov    eax,0x4000
   1b65a:   movsxd r14,r12d
   1b65d:   and    ecx,0xfffffe00
   1b663:   cmp    ecx,0x4000
   1b669:   cmovg  ecx,eax
   1b66c:   sub    rsi,r14
   1b66f:   call   1b550 <raw_pread_aligned>
   1b674:   test   eax,eax
   1b676:   js     1b70a <raw_pread+0xfa>
   1b67c:   mov    eax,0x200
   1b681:   mov    rsi,QWORD PTR [r13+0x28]
   1b685:   sub    eax,r12d
   1b688:   mov    r12d,eax
   1b68b:   add    rsi,r14
   1b68e:   cmp    r15d,eax
   1b691:   jge    1b720 <raw_pread+0x110>
   1b697:   movsxd rax,r15d
   1b69a:   cmp    rax,0x8
   1b69e:   jae    1b860 <raw_pread+0x250>
   1b6a4:   test   al,0x4
   1b6a6:   jne    1b89c <raw_pread+0x28c>
   1b6ac:   test   rax,rax
   1b6af:   je     1b88a <raw_pread+0x27a>
   1b6b5:   movzx  edx,BYTE PTR [rsi]
   1b6b8:   mov    BYTE PTR [rbp+0x0],dl
   1b6bb:   test   al,0x2
   1b6bd:   je     1b88a <raw_pread+0x27a>
   1b6c3:   movzx  edx,WORD PTR [rsi+rax*1-0x2]
   1b6c8:   mov    WORD PTR [rbp+rax*1-0x2],dx
   1b6cd:   jmp    1b88a <raw_pread+0x27a>
   1b6d2:   nop    WORD PTR [rax+rax*1+0x0]
   1b6d8:   mov    r12d,ecx
   1b6db:   and    r12d,0x1ff
   1b6e2:   jne    1b788 <raw_pread+0x178>
   1b6e8:   test   ebp,0x1ff
   1b6ee:   jne    1b810 <raw_pread+0x200>
   1b6f4:   mov    rdi,QWORD PTR [rsp+0x8]
   1b6f9:   mov    ecx,r15d
   1b6fc:   mov    rdx,rbp
   1b6ff:   mov    rsi,rbx
   1b702:   call   1b550 <raw_pread_aligned>
   1b707:   add    eax,r12d
   1b70a:   add    rsp,0x18
   1b70e:   pop    rbx
   1b70f:   pop    rbp
   1b710:   pop    r12
   1b712:   pop    r13
   1b714:   pop    r14
   1b716:   pop    r15
   1b718:   ret
   1b719:   nop    DWORD PTR [rax+0x0]
   1b720:   movsxd rdx,eax
   1b723:   cmp    eax,0x8
   1b726:   jb     1b820 <raw_pread+0x210>
   1b72c:   mov    rax,QWORD PTR [rsi]
   1b72f:   lea    rdi,[rbp+0x8]
   1b733:   and    rdi,0xfffffffffffffff8
   1b737:   mov    QWORD PTR [rbp+0x0],rax
   1b73b:   mov    eax,r12d
   1b73e:   mov    rcx,QWORD PTR [rsi+rax*1-0x8]
   1b743:   mov    QWORD PTR [rbp+rax*1-0x8],rcx
   1b748:   mov    rax,rbp
   1b74b:   sub    rax,rdi
   1b74e:   lea    ecx,[r12+rax*1]
   1b752:   sub    rsi,rax
   1b755:   mov    eax,ecx
   1b757:   shr    eax,0x3
   1b75a:   mov    ecx,eax
   1b75c:   rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
   1b75f:   add    rbp,rdx
   1b762:   add    rbx,rdx
   1b765:   sub    r15d,r12d
   1b768:   je     1b7f6 <raw_pread+0x1e6>
   1b76e:   test   r15d,0x1ff
   1b775:   jne    1b790 <raw_pread+0x180>
   1b777:   test   ebp,0x1ff
   1b77d:   jne    1b790 <raw_pread+0x180>
   1b77f:   jmp    1b6f4 <raw_pread+0xe4>
   1b784:   nop    DWORD PTR [rax+0x0]
   1b788:   xor    r12d,r12d
   1b78b:   jmp    1b794 <raw_pread+0x184>
   1b78d:   nop    DWORD PTR [rax]
   1b790:   mov    rdx,QWORD PTR [r13+0x28]
   1b794:   lea    ecx,[r15+0x1ff]
   1b79b:   mov    eax,0x4000
   1b7a0:   mov    rdi,QWORD PTR [rsp+0x8]
   1b7a5:   mov    rsi,rbx
   1b7a8:   and    ecx,0xfffffe00
   1b7ae:   cmp    ecx,0x4000
   1b7b4:   cmovg  ecx,eax
   1b7b7:   call   1b550 <raw_pread_aligned>
   1b7bc:   test   eax,eax
   1b7be:   js     1b70a <raw_pread+0xfa>
   1b7c4:   cmp    eax,r15d
   1b7c7:   mov    rsi,QWORD PTR [r13+0x28]
   1b7cb:   mov    rdi,rbp
   1b7ce:   cmovg  eax,r15d
   1b7d2:   movsxd r9,eax
   1b7d5:   mov    rdx,r9
   1b7d8:   mov    r14,r9
   1b7db:   mov    QWORD PTR [rsp],r9
   1b7df:   call   33b0 <memcpy@plt>
   1b7e4:   mov    r9,QWORD PTR [rsp]
   1b7e8:   add    r12d,r14d
   1b7eb:   add    rbp,r9
   1b7ee:   add    rbx,r9
   1b7f1:   sub    r15d,r14d
   1b7f4:   jne    1b790 <raw_pread+0x180>
   1b7f6:   add    rsp,0x18
   1b7fa:   mov    eax,r12d
   1b7fd:   pop    rbx
   1b7fe:   pop    rbp
   1b7ff:   pop    r12
   1b801:   pop    r13
   1b803:   pop    r14
   1b805:   pop    r15
   1b807:   ret
   1b808:   nop    DWORD PTR [rax+rax*1+0x0]
   1b810:   xor    eax,eax
   1b812:   test   ecx,ecx
   1b814:   jne    1b794 <raw_pread+0x184>
   1b81a:   jmp    1b70a <raw_pread+0xfa>
   1b81f:   nop
   1b820:   test   al,0x4
   1b822:   jne    1b8ab <raw_pread+0x29b>
   1b828:   test   eax,eax
   1b82a:   je     1b75f <raw_pread+0x14f>
   1b830:   movzx  eax,BYTE PTR [rsi]
   1b833:   mov    BYTE PTR [rbp+0x0],al
   1b836:   test   r12b,0x2
   1b83a:   je     1b75f <raw_pread+0x14f>
   1b840:   mov    eax,r12d
   1b843:   movzx  ecx,WORD PTR [rsi+rax*1-0x2]
   1b848:   mov    WORD PTR [rbp+rax*1-0x2],cx
   1b84d:   jmp    1b75f <raw_pread+0x14f>
   1b852:   nop    WORD PTR [rax+rax*1+0x0]
   1b858:   xor    r12d,r12d
   1b85b:   jmp    1b6f4 <raw_pread+0xe4>
   1b860:   mov    rdx,QWORD PTR [rsi]
   1b863:   lea    rdi,[rbp+0x8]
   1b867:   and    rdi,0xfffffffffffffff8
   1b86b:   mov    QWORD PTR [rbp+0x0],rdx
   1b86f:   mov    rdx,QWORD PTR [rsi+rax*1-0x8]
   1b874:   mov    QWORD PTR [rbp+rax*1-0x8],rdx
   1b879:   sub    rbp,rdi
   1b87c:   lea    rcx,[rax+rbp*1]
   1b880:   sub    rsi,rbp
   1b883:   shr    rcx,0x3
   1b887:   rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
   1b88a:   add    rsp,0x18
   1b88e:   mov    eax,r15d
   1b891:   pop    rbx
   1b892:   pop    rbp
   1b893:   pop    r12
   1b895:   pop    r13
   1b897:   pop    r14
   1b899:   pop    r15
   1b89b:   ret
   1b89c:   mov    edx,DWORD PTR [rsi]
   1b89e:   mov    DWORD PTR [rbp+0x0],edx
   1b8a1:   mov    edx,DWORD PTR [rsi+rax*1-0x4]
   1b8a5:   mov    DWORD PTR [rbp+rax*1-0x4],edx
   1b8a9:   jmp    1b88a <raw_pread+0x27a>
   1b8ab:   mov    eax,DWORD PTR [rsi]
   1b8ad:   mov    DWORD PTR [rbp+0x0],eax
   1b8b0:   mov    eax,r12d
   1b8b3:   mov    ecx,DWORD PTR [rsi+rax*1-0x4]
   1b8b7:   mov    DWORD PTR [rbp+rax*1-0x4],ecx
   1b8bb:   jmp    1b75f <raw_pread+0x14f>

0000000000018320 <bdrv_pread_em>:
   18320:   push   r15
   18322:   mov    r15,rsi
   18325:   mov    r8,rdi
   18328:   push   r14
   1832a:   mov    r14,rdx
   1832d:   push   r13
   1832f:   push   r12
   18331:   mov    r12d,ecx
   18334:   push   rbp
   18335:   mov    ebp,ecx
   18337:   push   rbx
   18338:   mov    ebx,esi
   1833a:   neg    ebx
   1833c:   and    ebx,0x1ff
   18342:   sub    rsp,0x228
   18349:   mov    rax,QWORD PTR fs:0x28
   18352:   mov    QWORD PTR [rsp+0x218],rax
   1835a:   xor    eax,eax
   1835c:   cmp    ecx,ebx
   1835e:   cmovle ebx,ecx
   18361:   sar    r15,0x9
   18365:   test   ebx,ebx
   18367:   jg     183e0 <bdrv_pread_em+0xc0>
   18369:   mov    ebx,ebp
   1836b:   sar    ebx,0x9
   1836e:   test   ebx,ebx
   18370:   jg     18450 <bdrv_pread_em+0x130>
   18376:   test   ebp,ebp
   18378:   jg     183b0 <bdrv_pread_em+0x90>
   1837a:   mov    eax,r12d
   1837d:   mov    rdi,QWORD PTR [rsp+0x218]
   18385:   xor    rdi,QWORD PTR fs:0x28
   1838e:   jne    184fa <bdrv_pread_em+0x1da>
   18394:   add    rsp,0x228
   1839b:   pop    rbx
   1839c:   pop    rbp
   1839d:   pop    r12
   1839f:   pop    r13
   183a1:   pop    r14
   183a3:   pop    r15
   183a5:   ret
   183a6:   nop    WORD PTR cs:[rax+rax*1+0x0]
   183b0:   lea    rbx,[rsp+0x10]
   183b5:   mov    ecx,0x1
   183ba:   mov    rsi,r15
   183bd:   mov    rdi,r8
   183c0:   mov    rdx,rbx
   183c3:   call   18210 <bdrv_read>
   183c8:   test   eax,eax
   183ca:   js     184f0 <bdrv_pread_em+0x1d0>
   183d0:   movsxd rdx,ebp
   183d3:   mov    rsi,rbx
   183d6:   mov    rdi,r14
   183d9:   call   33b0 <memcpy@plt>
   183de:   jmp    1837a <bdrv_pread_em+0x5a>
   183e0:   lea    rbp,[rsp+0x10]
   183e5:   mov    r13,rsi
   183e8:   mov    ecx,0x1
   183ed:   mov    rsi,r15
   183f0:   mov    rdx,rbp
   183f3:   mov    QWORD PTR [rsp+0x8],rdi
   183f8:   call   18210 <bdrv_read>
   183fd:   mov    r8,QWORD PTR [rsp+0x8]
   18402:   test   eax,eax
   18404:   js     184f0 <bdrv_pread_em+0x1d0>
   1840a:   and    r13d,0x1ff
   18411:   movsxd rax,ebx
   18414:   lea    rsi,[rbp+r13*1+0x0]
   18419:   cmp    ebx,0x8
   1841c:   jae    18490 <bdrv_pread_em+0x170>
   1841e:   test   bl,0x4
   18421:   jne    184d8 <bdrv_pread_em+0x1b8>
   18427:   test   ebx,ebx
   18429:   je     184bb <bdrv_pread_em+0x19b>
   1842f:   movzx  edx,BYTE PTR [rsi]
   18432:   mov    BYTE PTR [r14],dl
   18435:   test   bl,0x2
   18438:   je     184bb <bdrv_pread_em+0x19b>
   1843e:   mov    edx,ebx
   18440:   movzx  ecx,WORD PTR [rsi+rdx*1-0x2]
   18445:   mov    WORD PTR [r14+rdx*1-0x2],cx
   1844b:   jmp    184bb <bdrv_pread_em+0x19b>
   1844d:   nop    DWORD PTR [rax]
   18450:   mov    ecx,ebx
   18452:   mov    rdx,r14
   18455:   mov    rsi,r15
   18458:   mov    rdi,r8
   1845b:   mov    QWORD PTR [rsp+0x8],r8
   18460:   call   18210 <bdrv_read>
   18465:   test   eax,eax
   18467:   js     184f0 <bdrv_pread_em+0x1d0>
   1846d:   mov    eax,ebp
   1846f:   movsxd rbx,ebx
   18472:   mov    r8,QWORD PTR [rsp+0x8]
   18477:   and    eax,0xfffffe00
   1847c:   add    r15,rbx
   1847f:   movsxd rdx,eax
   18482:   sub    ebp,eax
   18484:   add    r14,rdx
   18487:   jmp    18376 <bdrv_pread_em+0x56>
   1848c:   nop    DWORD PTR [rax+0x0]
   18490:   mov    rdx,QWORD PTR [rsi]
   18493:   lea    rdi,[r14+0x8]
   18497:   and    rdi,0xfffffffffffffff8
   1849b:   mov    QWORD PTR [r14],rdx
   1849e:   mov    edx,ebx
   184a0:   mov    rcx,QWORD PTR [rsi+rdx*1-0x8]
   184a5:   mov    QWORD PTR [r14+rdx*1-0x8],rcx
   184aa:   mov    rcx,r14
   184ad:   sub    rcx,rdi
   184b0:   sub    rsi,rcx
   184b3:   add    ecx,ebx
   184b5:   shr    ecx,0x3
   184b8:   rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
   184bb:   mov    ebp,r12d
   184be:   add    r15,0x1
   184c2:   add    r14,rax
   184c5:   sub    ebp,ebx
   184c7:   jne    18369 <bdrv_pread_em+0x49>
   184cd:   jmp    1837a <bdrv_pread_em+0x5a>
   184d2:   nop    WORD PTR [rax+rax*1+0x0]
   184d8:   mov    edx,DWORD PTR [rsi]
   184da:   mov    DWORD PTR [r14],edx
   184dd:   mov    edx,ebx
   184df:   mov    ecx,DWORD PTR [rsi+rdx*1-0x4]
   184e3:   mov    DWORD PTR [r14+rdx*1-0x4],ecx
   184e8:   jmp    184bb <bdrv_pread_em+0x19b>
   184ea:   nop    WORD PTR [rax+rax*1+0x0]
   184f0:   mov    eax,0xfffffffb
   184f5:   jmp    1837d <bdrv_pread_em+0x5d>
   184fa:   call   31c0 <__stack_chk_fail@plt>
   184ff:   nop

00000000000188f0 <bdrv_pwrite_em>:
   188f0:   push   r15
   188f2:   mov    r15d,ecx
   188f5:   push   r14
   188f7:   mov    r14d,ecx
   188fa:   push   r13
   188fc:   mov    r13,rsi
   188ff:   push   r12
   18901:   mov    r12,rdx
   18904:   push   rbp
   18905:   push   rbx
   18906:   mov    ebx,esi
   18908:   neg    ebx
   1890a:   and    ebx,0x1ff
   18910:   sub    rsp,0x228
   18917:   mov    QWORD PTR [rsp],rdi
   1891b:   mov    rax,QWORD PTR fs:0x28
   18924:   mov    QWORD PTR [rsp+0x218],rax
   1892c:   xor    eax,eax
   1892e:   cmp    ecx,ebx
   18930:   cmovle ebx,ecx
   18933:   sar    r13,0x9
   18937:   test   ebx,ebx
   18939:   jg     18a10 <bdrv_pwrite_em+0x120>
   1893f:   mov    ebx,r14d
   18942:   sar    ebx,0x9
   18945:   test   ebx,ebx
   18947:   jg     18980 <bdrv_pwrite_em+0x90>
   18949:   test   r14d,r14d
   1894c:   jg     189b1 <bdrv_pwrite_em+0xc1>
   1894e:   mov    eax,r15d
   18951:   mov    rcx,QWORD PTR [rsp+0x218]
   18959:   xor    rcx,QWORD PTR fs:0x28
   18962:   jne    18aec <bdrv_pwrite_em+0x1fc>
   18968:   add    rsp,0x228
   1896f:   pop    rbx
   18970:   pop    rbp
   18971:   pop    r12
   18973:   pop    r13
   18975:   pop    r14
   18977:   pop    r15
   18979:   ret
   1897a:   nop    WORD PTR [rax+rax*1+0x0]
   18980:   mov    rdi,QWORD PTR [rsp]
   18984:   mov    ecx,ebx
   18986:   mov    rdx,r12
   18989:   mov    rsi,r13
   1898c:   call   18650 <bdrv_write>
   18991:   test   eax,eax
   18993:   js     18a00 <bdrv_pwrite_em+0x110>
   18995:   mov    eax,r14d
   18998:   movsxd rbx,ebx
   1899b:   and    eax,0xfffffe00
   189a0:   add    r13,rbx
   189a3:   movsxd rdx,eax
   189a6:   sub    r14d,eax
   189a9:   add    r12,rdx
   189ac:   test   r14d,r14d
   189af:   jle    1894e <bdrv_pwrite_em+0x5e>
   189b1:   mov    rbp,QWORD PTR [rsp]
   189b5:   lea    rbx,[rsp+0x10]
   189ba:   mov    ecx,0x1
   189bf:   mov    rsi,r13
   189c2:   mov    rdx,rbx
   189c5:   mov    rdi,rbp
   189c8:   call   18210 <bdrv_read>
   189cd:   test   eax,eax
   189cf:   js     18a00 <bdrv_pwrite_em+0x110>
   189d1:   movsxd rdx,r14d
   189d4:   mov    ecx,0x200
   189d9:   mov    rsi,r12
   189dc:   mov    rdi,rbx
   189df:   call   3370 <__memcpy_chk@plt>
   189e4:   mov    ecx,0x1
   189e9:   mov    rdx,rbx
   189ec:   mov    rsi,r13
   189ef:   mov    rdi,rbp
   189f2:   call   18650 <bdrv_write>
   189f7:   test   eax,eax
   189f9:   jns    1894e <bdrv_pwrite_em+0x5e>
   189ff:   nop
   18a00:   mov    eax,0xfffffffb
   18a05:   jmp    18951 <bdrv_pwrite_em+0x61>
   18a0a:   nop    WORD PTR [rax+rax*1+0x0]
   18a10:   lea    r14,[rsp+0x10]
   18a15:   mov    rbp,rsi
   18a18:   mov    ecx,0x1
   18a1d:   mov    rsi,r13
   18a20:   mov    rdx,r14
   18a23:   call   18210 <bdrv_read>
   18a28:   test   eax,eax
   18a2a:   js     18a00 <bdrv_pwrite_em+0x110>
   18a2c:   movsxd rax,ebx
   18a2f:   and    ebp,0x1ff
   18a35:   mov    QWORD PTR [rsp+0x8],rax
   18a3a:   add    rbp,r14
   18a3d:   cmp    ebx,0x8
   18a40:   jae    18a70 <bdrv_pwrite_em+0x180>
   18a42:   test   bl,0x4
   18a45:   jne    18ad8 <bdrv_pwrite_em+0x1e8>
   18a4b:   test   ebx,ebx
   18a4d:   je     18a9f <bdrv_pwrite_em+0x1af>
   18a4f:   movzx  eax,BYTE PTR [r12]
   18a54:   mov    BYTE PTR [rbp+0x0],al
   18a57:   test   bl,0x2
   18a5a:   je     18a9f <bdrv_pwrite_em+0x1af>
   18a5c:   mov    eax,ebx
   18a5e:   movzx  edx,WORD PTR [r12+rax*1-0x2]
   18a64:   mov    WORD PTR [rbp+rax*1-0x2],dx
   18a69:   jmp    18a9f <bdrv_pwrite_em+0x1af>
   18a6b:   nop    DWORD PTR [rax+rax*1+0x0]
   18a70:   mov    rax,QWORD PTR [r12]
   18a74:   lea    rdi,[rbp+0x8]
   18a78:   mov    rsi,r12
   18a7b:   and    rdi,0xfffffffffffffff8
   18a7f:   mov    QWORD PTR [rbp+0x0],rax
   18a83:   mov    eax,ebx
   18a85:   mov    rdx,QWORD PTR [r12+rax*1-0x8]
   18a8a:   mov    QWORD PTR [rbp+rax*1-0x8],rdx
   18a8f:   sub    rbp,rdi
   18a92:   sub    rsi,rbp
   18a95:   add    ebp,ebx
   18a97:   shr    ebp,0x3
   18a9a:   mov    ecx,ebp
   18a9c:   rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
   18a9f:   mov    rdi,QWORD PTR [rsp]
   18aa3:   mov    ecx,0x1
   18aa8:   mov    rdx,r14
   18aab:   mov    rsi,r13
   18aae:   call   18650 <bdrv_write>
   18ab3:   test   eax,eax
   18ab5:   js     18a00 <bdrv_pwrite_em+0x110>
   18abb:   mov    r14d,r15d
   18abe:   add    r13,0x1
   18ac2:   add    r12,QWORD PTR [rsp+0x8]
   18ac7:   sub    r14d,ebx
   18aca:   jne    1893f <bdrv_pwrite_em+0x4f>
   18ad0:   jmp    1894e <bdrv_pwrite_em+0x5e>
   18ad5:   nop    DWORD PTR [rax]
   18ad8:   mov    eax,DWORD PTR [r12]
   18adc:   mov    DWORD PTR [rbp+0x0],eax
   18adf:   mov    eax,ebx
   18ae1:   mov    edx,DWORD PTR [r12+rax*1-0x4]
   18ae6:   mov    DWORD PTR [rbp+rax*1-0x4],edx
   18aea:   jmp    18a9f <bdrv_pwrite_em+0x1af>
   18aec:   call   31c0 <__stack_chk_fail@plt>
   18af1:   data16 nop WORD PTR cs:[rax+rax*1+0x0]
   18afc:   nop    DWORD PTR [rax+0x0]
