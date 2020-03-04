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

00000000000037c0 <main>:
    37c0:	push   r15
    37c2:	push   r14
    37c4:	push   r13
    37c6:	mov    r13,rsi
    37c9:	push   r12
    37cb:	push   rbp
    37cc:	mov    ebp,edi
    37ce:	push   rbx
    37cf:	sub    rsp,0x38
    37d3:	mov    rax,QWORD PTR fs:0x28
    37dc:	mov    QWORD PTR [rsp+0x28],rax
    37e1:	xor    eax,eax
    37e3:	call   1a550 <bdrv_init>
    37e8:	cmp    ebp,0x1
    37eb:	jle    3b5c <main+0x39c>
    37f1:	mov    r14,QWORD PTR [r13+0x8]
    37f5:	mov    ecx,0x7
    37fa:	sub    ebp,0x1
    37fd:	lea    r12,[r13+0x8]
    3801:	lea    rdi,[rip+0x1e34b]        # 21b53 <suffixes.14512+0x68>
    3808:	mov    rsi,r14
    380b:	repz cmps BYTE PTR ds:[rsi],BYTE PTR es:[rdi]
    380d:	seta   bl
    3810:	sbb    bl,0x0
    3813:	movsx  ebx,bl
    3816:	test   ebx,ebx
    3818:	je     38ea <main+0x12a>
    381e:	mov    ecx,0x7
    3823:	lea    rdi,[rip+0x199df]        # 1d209 <_IO_stdin_used+0x209>
    382a:	mov    rsi,r14
    382d:	repz cmps BYTE PTR ds:[rsi],BYTE PTR es:[rdi]
    382f:	seta   al
    3832:	sbb    al,0x0
    3834:	test   al,al
    3836:	je     38ac <main+0xec>
    3838:	lea    rsi,[rip+0x19a3e]        # 1d27d <_IO_stdin_used+0x27d>
    383f:	mov    rdi,r14
    3842:	call   3350 <strcmp@plt>
    3847:	test   eax,eax
    3849:	je     3b8d <main+0x3cd>
    384f:	lea    rsi,[rip+0x19a2f]        # 1d285 <_IO_stdin_used+0x285>
    3856:	mov    rdi,r14
    3859:	call   3350 <strcmp@plt>
    385e:	test   eax,eax
    3860:	je     3bcc <main+0x40c>
    3866:	lea    rsi,[rip+0x19a1d]        # 1d28a <_IO_stdin_used+0x28a>
    386d:	mov    rdi,r14
    3870:	call   3350 <strcmp@plt>
    3875:	test   eax,eax
    3877:	jne    3b5c <main+0x39c>
    387d:	mov    rsi,r12
    3880:	mov    edi,ebp
    3882:	call   4280 <img_snapshot>
    3887:	xor    eax,eax
    3889:	mov    rcx,QWORD PTR [rsp+0x28]
    388e:	xor    rcx,QWORD PTR fs:0x28
    3897:	jne    3c0a <main+0x44a>
    389d:	add    rsp,0x38
    38a1:	pop    rbx
    38a2:	pop    rbp
    38a3:	pop    r12
    38a5:	pop    r13
    38a7:	pop    r14
    38a9:	pop    r15
    38ab:	ret
    38ac:	xor    ebx,ebx
    38ae:	lea    r13,[rip+0x19781]        # 1d036 <_IO_stdin_used+0x36>
    38b5:	nop    DWORD PTR [rax]
    38b8:	mov    rdx,r13
    38bb:	mov    rsi,r12
    38be:	mov    edi,ebp
    38c0:	call   35d0 <getopt@plt>
    38c5:	cmp    eax,0xffffffff
    38c8:	je     3a6b <main+0x2ab>
    38ce:	cmp    eax,0x66
    38d1:	jne    38e0 <main+0x120>
    38d3:	mov    rbx,QWORD PTR [rip+0x26a16]        # 2a2f0 <optarg@@GLIBC_2.2.5>
    38da:	jmp    38b8 <main+0xf8>
    38dc:	nop    DWORD PTR [rax+0x0]
    38e0:	cmp    eax,0x68
    38e3:	jne    38b8 <main+0xf8>
    38e5:	jmp    3b5c <main+0x39c>
    38ea:	lea    rax,[rip+0x197e0]        # 1d0d1 <_IO_stdin_used+0xd1>
    38f1:	xor    r14d,r14d
    38f4:	lea    r15,[rip+0x1a4b1]        # 1ddac <_IO_stdin_used+0xdac>
    38fb:	mov    QWORD PTR [rsp+0x8],rax
    3900:	lea    rdx,[rip+0x19886]        # 1d18d <_IO_stdin_used+0x18d>
    3907:	mov    rsi,r12
    390a:	mov    edi,ebp
    390c:	call   35d0 <getopt@plt>
    3911:	cmp    eax,0xffffffff
    3914:	je     395d <main+0x19d>
    3916:	sub    eax,0x36
    3919:	cmp    eax,0x32
    391c:	ja     3900 <main+0x140>
    391e:	movsxd rax,DWORD PTR [r15+rax*4]
    3922:	add    rax,r15
    3925:	jmp    rax
    3927:	nop    WORD PTR [rax+rax*1+0x0]
    3930:	mov    rax,QWORD PTR [rip+0x269b9]        # 2a2f0 <optarg@@GLIBC_2.2.5>
    3937:	mov    QWORD PTR [rsp+0x8],rax
    393c:	jmp    3900 <main+0x140>
    393e:	xchg   ax,ax
    3940:	or     ebx,0x1
    3943:	jmp    3900 <main+0x140>
    3945:	nop    DWORD PTR [rax]
    3948:	mov    r14,QWORD PTR [rip+0x269a1]        # 2a2f0 <optarg@@GLIBC_2.2.5>
    394f:	jmp    3900 <main+0x140>
    3951:	nop    DWORD PTR [rax+0x0]
    3958:	or     ebx,0x4
    395b:	jmp    3900 <main+0x140>
    395d:	movsxd rax,DWORD PTR [rip+0x26984]        # 2a2e8 <optind@@GLIBC_2.2.5>
    3964:	cmp    ebp,eax
    3966:	jle    3b5c <main+0x39c>
    396c:	mov    QWORD PTR [rsp+0x18],0x0
    3975:	lea    edx,[rax+0x1]
    3978:	shl    rax,0x3
    397c:	mov    DWORD PTR [rip+0x26966],edx        # 2a2e8 <optind@@GLIBC_2.2.5>
    3982:	mov    r13,QWORD PTR [r13+rax*1+0x8]
    3987:	test   r14,r14
    398a:	je     3b15 <main+0x355>
    3990:	xor    esi,esi
    3992:	mov    rdi,r14
    3995:	call   4520 <bdrv_new_open>
    399a:	lea    rsi,[rsp+0x18]
    399f:	mov    rbp,rax
    39a2:	mov    rdi,rax
    39a5:	call   191f0 <bdrv_get_geometry>
    39aa:	mov    rdi,rbp
    39ad:	shl    QWORD PTR [rsp+0x18],0x9
    39b3:	call   18130 <bdrv_delete>
    39b8:	mov    rdi,QWORD PTR [rsp+0x8]
    39bd:	call   18060 <bdrv_find_format>
    39c2:	mov    rbp,rax
    39c5:	test   rax,rax
    39c8:	je     3c20 <main+0x460>
    39ce:	mov    rcx,QWORD PTR [rsp+0x8]
    39d3:	xor    eax,eax
    39d5:	mov    rdx,r13
    39d8:	mov    edi,0x1
    39dd:	lea    rsi,[rip+0x197b1]        # 1d195 <_IO_stdin_used+0x195>
    39e4:	call   34d0 <__printf_chk@plt>
    39e9:	test   bl,0x1
    39ec:	jne    3bb4 <main+0x3f4>
    39f2:	test   bl,0x4
    39f5:	jne    3b9c <main+0x3dc>
    39fb:	test   r14,r14
    39fe:	je     3a16 <main+0x256>
    3a00:	mov    rdx,r14
    3a03:	lea    rsi,[rip+0x197c7]        # 1d1d1 <_IO_stdin_used+0x1d1>
    3a0a:	mov    edi,0x1
    3a0f:	xor    eax,eax
    3a11:	call   34d0 <__printf_chk@plt>
    3a16:	mov    rdx,QWORD PTR [rsp+0x18]
    3a1b:	lea    rsi,[rip+0x197c1]        # 1d1e3 <_IO_stdin_used+0x1e3>
    3a22:	mov    edi,0x1
    3a27:	xor    eax,eax
    3a29:	shr    rdx,0xa
    3a2d:	call   34d0 <__printf_chk@plt>
    3a32:	mov    rdx,QWORD PTR [rsp+0x18]
    3a37:	mov    r8d,ebx
    3a3a:	mov    rcx,r14
    3a3d:	mov    rsi,r13
    3a40:	mov    rdi,rbp
    3a43:	shr    rdx,0x9
    3a47:	call   180b0 <bdrv_create>
    3a4c:	test   eax,eax
    3a4e:	jns    3887 <main+0xc7>
    3a54:	cmp    eax,0xffffffa1
    3a57:	je     3be9 <main+0x429>
    3a5d:	lea    rdi,[rip+0x1978e]        # 1d1f2 <_IO_stdin_used+0x1f2>
    3a64:	xor    eax,eax
    3a66:	call   3da0 <error>
    3a6b:	movsxd rax,DWORD PTR [rip+0x26876]        # 2a2e8 <optind@@GLIBC_2.2.5>
    3a72:	cmp    ebp,eax
    3a74:	jle    3b5c <main+0x39c>
    3a7a:	lea    edx,[rax+0x1]
    3a7d:	lea    rdi,[rip+0x1d1de]        # 20c62 <desc_template.13939+0x382>
    3a84:	mov    DWORD PTR [rip+0x2685e],edx        # 2a2e8 <optind@@GLIBC_2.2.5>
    3a8a:	mov    r12,QWORD PTR [r12+rax*8]
    3a8e:	call   17ff0 <bdrv_new>
    3a93:	mov    rbp,rax
    3a96:	test   rax,rax
    3a99:	je     3c33 <main+0x473>
    3a9f:	test   rbx,rbx
    3aa2:	je     3b61 <main+0x3a1>
    3aa8:	mov    rdi,rbx
    3aab:	call   18060 <bdrv_find_format>
    3ab0:	mov    rcx,rax
    3ab3:	test   rax,rax
    3ab6:	je     3c0f <main+0x44f>
    3abc:	mov    edx,0x40
    3ac1:	mov    rsi,r12
    3ac4:	mov    rdi,rbp
    3ac7:	call   18b80 <bdrv_open2>
    3acc:	test   eax,eax
    3ace:	js     3c6b <main+0x4ab>
    3ad4:	mov    rdi,rbp
    3ad7:	call   18770 <bdrv_commit>
    3adc:	cmp    eax,0xfffffff3
    3adf:	je     3c5d <main+0x49d>
    3ae5:	jle    3b76 <main+0x3b6>
    3aeb:	cmp    eax,0xfffffffe
    3aee:	je     3c4f <main+0x48f>
    3af4:	test   eax,eax
    3af6:	jne    3c41 <main+0x481>
    3afc:	lea    rdi,[rip+0x1970d]        # 1d210 <_IO_stdin_used+0x210>
    3b03:	call   3130 <puts@plt>
    3b08:	mov    rdi,rbp
    3b0b:	call   18130 <bdrv_delete>
    3b10:	jmp    3887 <main+0xc7>
    3b15:	cmp    ebp,edx
    3b17:	jle    3b5c <main+0x39c>
    3b19:	mov    rdi,QWORD PTR [r12+rax*1+0x8]
    3b1e:	xor    edx,edx
    3b20:	lea    rsi,[rsp+0x20]
    3b25:	mov    QWORD PTR [rsp+0x20],rdi
    3b2a:	call   35e0 <strtoul@plt>
    3b2f:	mov    rdx,QWORD PTR [rsp+0x20]
    3b34:	mov    QWORD PTR [rsp+0x18],rax
    3b39:	movzx  edx,BYTE PTR [rdx]
    3b3c:	cmp    dl,0x4d
    3b3f:	je     3bdb <main+0x41b>
    3b45:	cmp    dl,0x47
    3b48:	je     3bfc <main+0x43c>
    3b4e:	mov    ecx,edx
    3b50:	and    ecx,0xffffffdf
    3b53:	cmp    cl,0x4b
    3b56:	je     3b68 <main+0x3a8>
    3b58:	test   dl,dl
    3b5a:	je     3b68 <main+0x3a8>
    3b5c:	call   3f60 <help>
    3b61:	xor    ecx,ecx
    3b63:	jmp    3abc <main+0x2fc>
    3b68:	shl    rax,0xa
    3b6c:	mov    QWORD PTR [rsp+0x18],rax
    3b71:	jmp    39b8 <main+0x1f8>
    3b76:	cmp    eax,0xffffffa1
    3b79:	jne    3c41 <main+0x481>
    3b7f:	lea    rdi,[rip+0x196bf]        # 1d245 <_IO_stdin_used+0x245>
    3b86:	xor    eax,eax
    3b88:	call   3da0 <error>
    3b8d:	mov    rsi,r12
    3b90:	mov    edi,ebp
    3b92:	call   47c0 <img_convert>
    3b97:	jmp    3887 <main+0xc7>
    3b9c:	lea    rsi,[rip+0x19616]        # 1d1b9 <_IO_stdin_used+0x1b9>
    3ba3:	mov    edi,0x1
    3ba8:	xor    eax,eax
    3baa:	call   34d0 <__printf_chk@plt>
    3baf:	jmp    39fb <main+0x23b>
    3bb4:	lea    rsi,[rip+0x195f2]        # 1d1ad <_IO_stdin_used+0x1ad>
    3bbb:	mov    edi,0x1
    3bc0:	xor    eax,eax
    3bc2:	call   34d0 <__printf_chk@plt>
    3bc7:	jmp    39f2 <main+0x232>
    3bcc:	mov    rsi,r12
    3bcf:	mov    edi,ebp
    3bd1:	call   3fb0 <img_info>
    3bd6:	jmp    3887 <main+0xc7>
    3bdb:	shl    rax,0x14
    3bdf:	mov    QWORD PTR [rsp+0x18],rax
    3be4:	jmp    39b8 <main+0x1f8>
    3be9:	mov    rsi,QWORD PTR [rsp+0x8]
    3bee:	lea    rdi,[rip+0x1a073]        # 1dc68 <_IO_stdin_used+0xc68>
    3bf5:	xor    eax,eax
    3bf7:	call   3da0 <error>
    3bfc:	shl    rax,0x1e
    3c00:	mov    QWORD PTR [rsp+0x18],rax
    3c05:	jmp    39b8 <main+0x1f8>
    3c0a:	call   31c0 <__stack_chk_fail@plt>
    3c0f:	mov    rsi,rbx
    3c12:	lea    rdi,[rip+0x19433]        # 1d04c <_IO_stdin_used+0x4c>
    3c19:	xor    eax,eax
    3c1b:	call   3da0 <error>
    3c20:	mov    rsi,QWORD PTR [rsp+0x8]
    3c25:	lea    rdi,[rip+0x19420]        # 1d04c <_IO_stdin_used+0x4c>
    3c2c:	xor    eax,eax
    3c2e:	call   3da0 <error>
    3c33:	lea    rdi,[rip+0x19400]        # 1d03a <_IO_stdin_used+0x3a>
    3c3a:	xor    eax,eax
    3c3c:	call   3da0 <error>
    3c41:	lea    rdi,[rip+0x19618]        # 1d260 <_IO_stdin_used+0x260>
    3c48:	xor    eax,eax
    3c4a:	call   3da0 <error>
    3c4f:	lea    rdi,[rip+0x195cb]        # 1d221 <_IO_stdin_used+0x221>
    3c56:	xor    eax,eax
    3c58:	call   3da0 <error>
    3c5d:	lea    rdi,[rip+0x195ce]        # 1d232 <_IO_stdin_used+0x232>
    3c64:	xor    eax,eax
    3c66:	call   3da0 <error>
    3c6b:	mov    rsi,r12
    3c6e:	lea    rdi,[rip+0x193f0]        # 1d065 <_IO_stdin_used+0x65>
    3c75:	xor    eax,eax
    3c77:	call   3da0 <error>
    3c7c:	nop    DWORD PTR [rax+0x0]

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

0000000000004280 <img_snapshot>:
    4280:	push   r14
    4282:	xor    r14d,r14d
    4285:	push   r13
    4287:	mov    r13d,edi
    428a:	push   r12
    428c:	mov    r12,rsi
    428f:	push   rbp
    4290:	xor    ebp,ebp
    4292:	push   rbx
    4293:	lea    rbx,[rip+0x19a16]        # 1dcb0 <_IO_stdin_used+0xcb0>
    429a:	sub    rsp,0x1b0
    42a1:	mov    rax,QWORD PTR fs:0x28
    42aa:	mov    QWORD PTR [rsp+0x1a8],rax
    42b2:	xor    eax,eax
    42b4:	nop    DWORD PTR [rax+0x0]
    42b8:	lea    rdx,[rip+0x18ddb]        # 1d09a <_IO_stdin_used+0x9a>
    42bf:	mov    rsi,r12
    42c2:	mov    edi,r13d
    42c5:	call   35d0 <getopt@plt>
    42ca:	cmp    eax,0xffffffff
    42cd:	je     4360 <img_snapshot+0xe0>
    42d3:	sub    eax,0x61
    42d6:	cmp    eax,0xb
    42d9:	ja     42b8 <img_snapshot+0x38>
    42db:	movsxd rax,DWORD PTR [rbx+rax*4]
    42df:	add    rax,rbx
    42e2:	jmp    rax
    42e4:	nop    DWORD PTR [rax+0x0]
    42e8:	test   ebp,ebp
    42ea:	jne    44d1 <img_snapshot+0x251>
    42f0:	mov    ebp,0x1
    42f5:	jmp    42b8 <img_snapshot+0x38>
    42f7:	nop    WORD PTR [rax+rax*1+0x0]
    4300:	test   ebp,ebp
    4302:	jne    44d1 <img_snapshot+0x251>
    4308:	mov    r14,QWORD PTR [rip+0x25fe1]        # 2a2f0 <optarg@@GLIBC_2.2.5>
    430f:	mov    ebp,0x4
    4314:	jmp    42b8 <img_snapshot+0x38>
    4316:	nop    WORD PTR cs:[rax+rax*1+0x0]
    4320:	test   ebp,ebp
    4322:	jne    44d1 <img_snapshot+0x251>
    4328:	mov    r14,QWORD PTR [rip+0x25fc1]        # 2a2f0 <optarg@@GLIBC_2.2.5>
    432f:	mov    ebp,0x2
    4334:	jmp    42b8 <img_snapshot+0x38>
    4336:	nop    WORD PTR cs:[rax+rax*1+0x0]
    4340:	test   ebp,ebp
    4342:	jne    44d1 <img_snapshot+0x251>
    4348:	mov    r14,QWORD PTR [rip+0x25fa1]        # 2a2f0 <optarg@@GLIBC_2.2.5>
    434f:	mov    ebp,0x3
    4354:	jmp    42b8 <img_snapshot+0x38>
    4359:	nop    DWORD PTR [rax+0x0]
    4360:	movsxd rax,DWORD PTR [rip+0x25f81]        # 2a2e8 <optind@@GLIBC_2.2.5>
    4367:	cmp    eax,r13d
    436a:	jge    44d1 <img_snapshot+0x251>
    4370:	lea    edx,[rax+0x1]
    4373:	lea    rdi,[rip+0x1c8e8]        # 20c62 <desc_template.13939+0x382>
    437a:	mov    DWORD PTR [rip+0x25f68],edx        # 2a2e8 <optind@@GLIBC_2.2.5>
    4380:	mov    r12,QWORD PTR [r12+rax*8]
    4384:	call   17ff0 <bdrv_new>
    4389:	mov    rbx,rax
    438c:	test   rax,rax
    438f:	je     450b <img_snapshot+0x28b>
    4395:	xor    ecx,ecx
    4397:	xor    edx,edx
    4399:	mov    rsi,r12
    439c:	mov    rdi,rax
    439f:	call   18b80 <bdrv_open2>
    43a4:	test   eax,eax
    43a6:	js     44fa <img_snapshot+0x27a>
    43ac:	cmp    ebp,0x2
    43af:	je     441e <img_snapshot+0x19e>
    43b1:	jle    440f <img_snapshot+0x18f>
    43b3:	cmp    ebp,0x3
    43b6:	je     449d <img_snapshot+0x21d>
    43bc:	cmp    ebp,0x4
    43bf:	jne    43e0 <img_snapshot+0x160>
    43c1:	mov    rsi,r14
    43c4:	mov    rdi,rbx
    43c7:	call   19c90 <bdrv_snapshot_delete>
    43cc:	mov    ebp,eax
    43ce:	test   eax,eax
    43d0:	jne    44db <img_snapshot+0x25b>
    43d6:	nop    WORD PTR cs:[rax+rax*1+0x0]
    43e0:	mov    rdi,rbx
    43e3:	call   18130 <bdrv_delete>
    43e8:	mov    rax,QWORD PTR [rsp+0x1a8]
    43f0:	xor    rax,QWORD PTR fs:0x28
    43f9:	jne    44d6 <img_snapshot+0x256>
    43ff:	add    rsp,0x1b0
    4406:	pop    rbx
    4407:	pop    rbp
    4408:	pop    r12
    440a:	pop    r13
    440c:	pop    r14
    440e:	ret
    440f:	cmp    ebp,0x1
    4412:	jne    43e0 <img_snapshot+0x160>
    4414:	mov    rdi,rbx
    4417:	call   3e90 <dump_snapshots>
    441c:	jmp    43e0 <img_snapshot+0x160>
    441e:	lea    rbp,[rsp+0x10]
    4423:	xor    eax,eax
    4425:	mov    ecx,0x33
    442a:	mov    rdx,r14
    442d:	mov    rdi,rbp
    4430:	mov    esi,0x100
    4435:	rep stos QWORD PTR es:[rdi],rax
    4438:	lea    rdi,[rsp+0x90]
    4440:	call   5560 <pstrcpy>
    4445:	mov    rdi,rsp
    4448:	xor    esi,esi
    444a:	call   3220 <gettimeofday@plt>
    444f:	mov    rax,QWORD PTR [rsp]
    4453:	mov    rsi,rbp
    4456:	mov    rdi,rbx
    4459:	mov    DWORD PTR [rsp+0x194],eax
    4460:	imul   eax,DWORD PTR [rsp+0x8],0x3e8
    4468:	mov    DWORD PTR [rsp+0x198],eax
    446f:	call   19c30 <bdrv_snapshot_create>
    4474:	mov    ebp,eax
    4476:	test   eax,eax
    4478:	je     43e0 <img_snapshot+0x160>
    447e:	mov    edi,eax
    4480:	neg    edi
    4482:	call   3690 <strerror@plt>
    4487:	mov    edx,ebp
    4489:	mov    rsi,r14
    448c:	lea    rdi,[rip+0x1959d]        # 1da30 <_IO_stdin_used+0xa30>
    4493:	mov    rcx,rax
    4496:	xor    eax,eax
    4498:	call   3da0 <error>
    449d:	mov    rsi,r14
    44a0:	mov    rdi,rbx
    44a3:	call   19c60 <bdrv_snapshot_goto>
    44a8:	mov    ebp,eax
    44aa:	test   eax,eax
    44ac:	je     43e0 <img_snapshot+0x160>
    44b2:	mov    edi,eax
    44b4:	neg    edi
    44b6:	call   3690 <strerror@plt>
    44bb:	mov    edx,ebp
    44bd:	mov    rsi,r14
    44c0:	lea    rdi,[rip+0x19591]        # 1da58 <_IO_stdin_used+0xa58>
    44c7:	mov    rcx,rax
    44ca:	xor    eax,eax
    44cc:	call   3da0 <error>
    44d1:	call   3f60 <help>
    44d6:	call   31c0 <__stack_chk_fail@plt>
    44db:	mov    edi,eax
    44dd:	neg    edi
    44df:	call   3690 <strerror@plt>
    44e4:	mov    edx,ebp
    44e6:	mov    rsi,r14
    44e9:	lea    rdi,[rip+0x19590]        # 1da80 <_IO_stdin_used+0xa80>
    44f0:	mov    rcx,rax
    44f3:	xor    eax,eax
    44f5:	call   3da0 <error>
    44fa:	mov    rsi,r12
    44fd:	lea    rdi,[rip+0x18b61]        # 1d065 <_IO_stdin_used+0x65>
    4504:	xor    eax,eax
    4506:	call   3da0 <error>
    450b:	lea    rdi,[rip+0x18b28]        # 1d03a <_IO_stdin_used+0x3a>
    4512:	xor    eax,eax
    4514:	call   3da0 <error>
    4519:	nop    DWORD PTR [rax+0x0]

00000000000047c0 <img_convert>:
    47c0:	push   r15
    47c2:	push   r14
    47c4:	lea    r14,[rip+0x19515]        # 1dce0 <_IO_stdin_used+0xce0>
    47cb:	push   r13
    47cd:	push   r12
    47cf:	xor    r12d,r12d
    47d2:	push   rbp
    47d3:	movsxd rbp,edi
    47d6:	push   rbx
    47d7:	mov    rbx,rsi
    47da:	sub    rsp,0x100a8
    47e1:	mov    rax,QWORD PTR fs:0x28
    47ea:	mov    QWORD PTR [rsp+0x10098],rax
    47f2:	xor    eax,eax
    47f4:	lea    rax,[rip+0x188d6]        # 1d0d1 <_IO_stdin_used+0xd1>
    47fb:	mov    QWORD PTR [rsp+0x18],0x0
    4804:	mov    QWORD PTR [rsp+0x28],rax
    4809:	mov    DWORD PTR [rsp+0x20],0x0
    4811:	nop    DWORD PTR [rax+0x0]
    4818:	lea    rdx,[rip+0x188b6]        # 1d0d5 <_IO_stdin_used+0xd5>
    481f:	mov    rsi,rbx
    4822:	mov    edi,ebp
    4824:	call   35d0 <getopt@plt>
    4829:	cmp    eax,0xffffffff
    482c:	je     4879 <img_convert+0xb9>
    482e:	sub    eax,0x36
    4831:	cmp    eax,0x32
    4834:	ja     4818 <img_convert+0x58>
    4836:	movsxd rax,DWORD PTR [r14+rax*4]
    483a:	add    rax,r14
    483d:	jmp    rax
    483f:	mov    r12,QWORD PTR [rip+0x25aaa]        # 2a2f0 <optarg@@GLIBC_2.2.5>
    4846:	jmp    4818 <img_convert+0x58>
    4848:	or     DWORD PTR [rsp+0x20],0x1
    484d:	jmp    4818 <img_convert+0x58>
    484f:	or     DWORD PTR [rsp+0x20],0x2
    4854:	jmp    4818 <img_convert+0x58>
    4856:	mov    rax,QWORD PTR [rip+0x25a93]        # 2a2f0 <optarg@@GLIBC_2.2.5>
    485d:	mov    QWORD PTR [rsp+0x28],rax
    4862:	jmp    4818 <img_convert+0x58>
    4864:	mov    rax,QWORD PTR [rip+0x25a85]        # 2a2f0 <optarg@@GLIBC_2.2.5>
    486b:	mov    QWORD PTR [rsp+0x18],rax
    4870:	jmp    4818 <img_convert+0x58>
    4872:	or     DWORD PTR [rsp+0x20],0x4
    4877:	jmp    4818 <img_convert+0x58>
    4879:	mov    r13d,ebp
    487c:	sub    r13d,DWORD PTR [rip+0x25a65]        # 2a2e8 <optind@@GLIBC_2.2.5>
    4883:	lea    eax,[r13-0x1]
    4887:	mov    DWORD PTR [rsp+0x48],eax
    488b:	test   eax,eax
    488d:	jle    50e1 <img_convert+0x921>
    4893:	mov    rax,QWORD PTR [rbx+rbp*8-0x8]
    4898:	cmp    DWORD PTR [rsp+0x48],0x1
    489d:	mov    QWORD PTR [rsp+0x38],rax
    48a2:	jle    48b0 <img_convert+0xf0>
    48a4:	cmp    QWORD PTR [rsp+0x18],0x0
    48aa:	jne    5018 <img_convert+0x858>
    48b0:	movsxd rdi,DWORD PTR [rsp+0x48]
    48b5:	mov    esi,0x8
    48ba:	call   3330 <calloc@plt>
    48bf:	mov    r15,rax
    48c2:	test   rax,rax
    48c5:	je     5043 <img_convert+0x883>
    48cb:	lea    eax,[r13-0x2]
    48cf:	xor    r13d,r13d
    48d2:	mov    QWORD PTR [rsp+0x8],r12
    48d7:	xor    ebp,ebp
    48d9:	mov    QWORD PTR [rsp+0x10],rax
    48de:	lea    r14,[rsp+0x78]
    48e3:	mov    r12,r13
    48e6:	jmp    48f3 <img_convert+0x133>
    48e8:	nop    DWORD PTR [rax+rax*1+0x0]
    48f0:	mov    r12,rcx
    48f3:	mov    eax,DWORD PTR [rip+0x259ef]        # 2a2e8 <optind@@GLIBC_2.2.5>
    48f9:	mov    rsi,QWORD PTR [rsp+0x8]
    48fe:	add    eax,r12d
    4901:	cdqe
    4903:	mov    rdi,QWORD PTR [rbx+rax*8]
    4907:	call   4520 <bdrv_new_open>
    490c:	mov    QWORD PTR [r15+r12*8],rax
    4910:	test   rax,rax
    4913:	je     5026 <img_convert+0x866>
    4919:	mov    rdi,rax
    491c:	mov    rsi,r14
    491f:	call   191f0 <bdrv_get_geometry>
    4924:	mov    rax,QWORD PTR [rsp+0x78]
    4929:	lea    rcx,[r12+0x1]
    492e:	add    rax,rbp
    4931:	mov    rbp,rax
    4934:	cmp    QWORD PTR [rsp+0x10],r12
    4939:	jne    48f0 <img_convert+0x130>
    493b:	mov    rdi,QWORD PTR [rsp+0x28]
    4940:	mov    r12,QWORD PTR [rsp+0x8]
    4945:	mov    QWORD PTR [rsp+0x30],rax
    494a:	call   18060 <bdrv_find_format>
    494f:	test   rax,rax
    4952:	je     50d0 <img_convert+0x910>
    4958:	lea    rdx,[rip+0x25201]        # 29b60 <bdrv_qcow2>
    495f:	lea    rcx,[rip+0x247fa]        # 29160 <bdrv_qcow>
    4966:	mov    ebx,DWORD PTR [rsp+0x20]
    496a:	cmp    rax,rdx
    496d:	setne  dl
    4970:	cmp    rax,rcx
    4973:	setne  cl
    4976:	and    edx,ecx
    4978:	and    ebx,0x2
    497b:	je     4985 <img_convert+0x1c5>
    497d:	test   dl,dl
    497f:	jne    500a <img_convert+0x84a>
    4985:	test   BYTE PTR [rsp+0x20],0x1
    498a:	je     4994 <img_convert+0x1d4>
    498c:	test   dl,dl
    498e:	jne    505f <img_convert+0x89f>
    4994:	test   BYTE PTR [rsp+0x20],0x4
    4999:	je     49ab <img_convert+0x1eb>
    499b:	lea    rdx,[rip+0x248fe]        # 292a0 <bdrv_vmdk>
    49a2:	cmp    rax,rdx
    49a5:	jne    5051 <img_convert+0x891>
    49ab:	mov    edx,DWORD PTR [rsp+0x20]
    49af:	and    edx,0x3
    49b2:	cmp    edx,0x3
    49b5:	je     50c2 <img_convert+0x902>
    49bb:	mov    r8d,DWORD PTR [rsp+0x20]
    49c0:	mov    rcx,QWORD PTR [rsp+0x18]
    49c5:	mov    rdi,rax
    49c8:	mov    rdx,QWORD PTR [rsp+0x30]
    49cd:	mov    rsi,QWORD PTR [rsp+0x38]
    49d2:	call   180b0 <bdrv_create>
    49d7:	test   eax,eax
    49d9:	jns    49f7 <img_convert+0x237>
    49db:	cmp    eax,0xffffffa1
    49de:	je     4d17 <img_convert+0x557>
    49e4:	mov    rsi,QWORD PTR [rsp+0x38]
    49e9:	lea    rdi,[rip+0x186fe]        # 1d0ee <_IO_stdin_used+0xee>
    49f0:	xor    eax,eax
    49f2:	call   3da0 <error>
    49f7:	mov    rsi,QWORD PTR [rsp+0x28]
    49fc:	mov    rdi,QWORD PTR [rsp+0x38]
    4a01:	call   4520 <bdrv_new_open>
    4a06:	mov    rdi,QWORD PTR [r15]
    4a09:	mov    rsi,r14
    4a0c:	mov    QWORD PTR [rsp+0x38],rax
    4a11:	call   191f0 <bdrv_get_geometry>
    4a16:	test   ebx,ebx
    4a18:	jne    4d28 <img_convert+0x568>
    4a1e:	lea    rax,[rsp+0x90]
    4a26:	mov    QWORD PTR [rsp+0x8],r15
    4a2b:	xor    ebx,ebx
    4a2d:	xor    r12d,r12d
    4a30:	mov    DWORD PTR [rsp+0x28],0x0
    4a38:	mov    QWORD PTR [rsp+0x40],rax
    4a3d:	mov    QWORD PTR [rsp+0x10],r14
    4a42:	nop    WORD PTR [rax+rax*1+0x0]
    4a48:	mov    rax,QWORD PTR [rsp+0x30]
    4a4d:	sub    rax,r12
    4a50:	test   rax,rax
    4a53:	jle    4b48 <img_convert+0x388>
    4a59:	cmp    rax,0x80
    4a5f:	mov    edx,0x80
    4a64:	mov    r8,r12
    4a67:	cmovle rdx,rax
    4a6b:	sub    r8,rbx
    4a6e:	mov    QWORD PTR [rsp+0x20],rdx
    4a73:	mov    ebp,edx
    4a75:	mov    rdx,QWORD PTR [rsp+0x78]
    4a7a:	cmp    r8,rdx
    4a7d:	jb     4d01 <img_convert+0x541>
    4a83:	mov    eax,DWORD PTR [rsp+0x28]
    4a87:	add    eax,0x1
    4a8a:	cmp    DWORD PTR [rsp+0x48],eax
    4a8e:	jle    4fb0 <img_convert+0x7f0>
    4a94:	movsxd r15,eax
    4a97:	mov    DWORD PTR [rsp+0x28],ebp
    4a9b:	mov    rbp,r15
    4a9e:	mov    r15,rbx
    4aa1:	jmp    4ab6 <img_convert+0x2f6>
    4aa3:	nop    DWORD PTR [rax+rax*1+0x0]
    4aa8:	add    rbp,0x1
    4aac:	cmp    DWORD PTR [rsp+0x48],ebp
    4ab0:	jle    4fb0 <img_convert+0x7f0>
    4ab6:	mov    rax,QWORD PTR [rsp+0x8]
    4abb:	mov    rsi,QWORD PTR [rsp+0x10]
    4ac0:	lea    r13,[r15+rdx*1]
    4ac4:	mov    ebx,ebp
    4ac6:	mov    r15,r13
    4ac9:	mov    r14,QWORD PTR [rax+rbp*8]
    4acd:	mov    rdi,r14
    4ad0:	call   191f0 <bdrv_get_geometry>
    4ad5:	mov    r8,r12
    4ad8:	mov    rdx,QWORD PTR [rsp+0x78]
    4add:	sub    r8,r13
    4ae0:	cmp    r8,rdx
    4ae3:	jae    4aa8 <img_convert+0x2e8>
    4ae5:	mov    ebp,DWORD PTR [rsp+0x28]
    4ae9:	mov    DWORD PTR [rsp+0x28],ebx
    4aed:	mov    rbx,r13
    4af0:	add    r13,rdx
    4af3:	add    edx,ebx
    4af5:	sub    edx,r12d
    4af8:	sub    r13,r12
    4afb:	cmp    QWORD PTR [rsp+0x20],r13
    4b00:	cmova  ebp,edx
    4b03:	cmp    QWORD PTR [rsp+0x18],0x0
    4b09:	je     4bac <img_convert+0x3ec>
    4b0f:	mov    rsi,r8
    4b12:	lea    rcx,[rsp+0x74]
    4b17:	mov    edx,ebp
    4b19:	mov    rdi,r14
    4b1c:	mov    QWORD PTR [rsp+0x20],r8
    4b21:	call   19810 <bdrv_is_allocated>
    4b26:	mov    r8,QWORD PTR [rsp+0x20]
    4b2b:	test   eax,eax
    4b2d:	jne    4ba8 <img_convert+0x3e8>
    4b2f:	movsxd rax,DWORD PTR [rsp+0x74]
    4b34:	add    r12,rax
    4b37:	mov    rax,QWORD PTR [rsp+0x30]
    4b3c:	sub    rax,r12
    4b3f:	test   rax,rax
    4b42:	jg     4a59 <img_convert+0x299>
    4b48:	mov    r15,QWORD PTR [rsp+0x8]
    4b4d:	mov    rdi,QWORD PTR [rsp+0x38]
    4b52:	xor    ebx,ebx
    4b54:	call   18130 <bdrv_delete>
    4b59:	mov    ebp,DWORD PTR [rsp+0x48]
    4b5d:	mov    rdi,QWORD PTR [r15+rbx*8]
    4b61:	add    rbx,0x1
    4b65:	call   18130 <bdrv_delete>
    4b6a:	cmp    ebp,ebx
    4b6c:	jg     4b5d <img_convert+0x39d>
    4b6e:	mov    rdi,r15
    4b71:	call   3070 <free@plt>
    4b76:	xor    eax,eax
    4b78:	mov    rbx,QWORD PTR [rsp+0x10098]
    4b80:	xor    rbx,QWORD PTR fs:0x28
    4b89:	jne    50bd <img_convert+0x8fd>
    4b8f:	add    rsp,0x100a8
    4b96:	pop    rbx
    4b97:	pop    rbp
    4b98:	pop    r12
    4b9a:	pop    r13
    4b9c:	pop    r14
    4b9e:	pop    r15
    4ba0:	ret
    4ba1:	nop    DWORD PTR [rax+0x0]
    4ba8:	mov    ebp,DWORD PTR [rsp+0x74]
    4bac:	mov    r13,QWORD PTR [rsp+0x40]
    4bb1:	mov    ecx,ebp
    4bb3:	mov    rsi,r8
    4bb6:	mov    rdi,r14
    4bb9:	mov    rdx,r13
    4bbc:	call   18210 <bdrv_read>
    4bc1:	test   eax,eax
    4bc3:	js     4ffc <img_convert+0x83c>
    4bc9:	test   ebp,ebp
    4bcb:	jle    4a48 <img_convert+0x288>
    4bd1:	mov    r14,QWORD PTR [rsp+0x18]
    4bd6:	mov    r15,QWORD PTR [rsp+0x38]
    4bdb:	jmp    4c17 <img_convert+0x457>
    4bdd:	nop    DWORD PTR [rax]
    4be0:	mov    ecx,DWORD PTR [rsp+0x74]
    4be4:	mov    rdx,r13
    4be7:	mov    rsi,r12
    4bea:	mov    rdi,r15
    4bed:	call   18650 <bdrv_write>
    4bf2:	test   eax,eax
    4bf4:	js     4fcf <img_convert+0x80f>
    4bfa:	mov    ecx,DWORD PTR [rsp+0x74]
    4bfe:	movsxd rax,ecx
    4c01:	sub    ebp,ecx
    4c03:	shl    ecx,0x9
    4c06:	movsxd rcx,ecx
    4c09:	add    r12,rax
    4c0c:	add    r13,rcx
    4c0f:	test   ebp,ebp
    4c11:	jle    4a48 <img_convert+0x288>
    4c17:	test   r14,r14
    4c1a:	jne    4be0 <img_convert+0x420>
    4c1c:	lea    rdx,[r13+0x200]
    4c23:	mov    rax,r13
    4c26:	nop    WORD PTR cs:[rax+rax*1+0x0]
    4c30:	mov    r8d,DWORD PTR [rax]
    4c33:	test   r8d,r8d
    4c36:	jne    4cd0 <img_convert+0x510>
    4c3c:	add    rax,0x4
    4c40:	cmp    rdx,rax
    4c43:	jne    4c30 <img_convert+0x470>
    4c45:	cmp    ebp,0x1
    4c48:	je     4cf0 <img_convert+0x530>
    4c4e:	xor    esi,esi
    4c50:	lea    rdx,[r13+0x400]
    4c57:	mov    ecx,0x1
    4c5c:	nop    DWORD PTR [rax+0x0]
    4c60:	lea    rax,[rdx-0x200]
    4c67:	nop    WORD PTR [rax+rax*1+0x0]
    4c70:	mov    edi,DWORD PTR [rax]
    4c72:	test   edi,edi
    4c74:	jne    4cb0 <img_convert+0x4f0>
    4c76:	add    rax,0x4
    4c7a:	cmp    rdx,rax
    4c7d:	jne    4c70 <img_convert+0x4b0>
    4c7f:	xor    eax,eax
    4c81:	cmp    esi,eax
    4c83:	jne    4cb9 <img_convert+0x4f9>
    4c85:	add    ecx,0x1
    4c88:	add    rdx,0x200
    4c8f:	cmp    ecx,ebp
    4c91:	jl     4c60 <img_convert+0x4a0>
    4c93:	mov    DWORD PTR [rsp+0x74],ecx
    4c97:	test   esi,esi
    4c99:	jne    4be4 <img_convert+0x424>
    4c9f:	movsxd rcx,ecx
    4ca2:	add    r12,rcx
    4ca5:	jmp    4a48 <img_convert+0x288>
    4caa:	nop    WORD PTR [rax+rax*1+0x0]
    4cb0:	mov    eax,0x1
    4cb5:	cmp    esi,eax
    4cb7:	je     4c85 <img_convert+0x4c5>
    4cb9:	mov    DWORD PTR [rsp+0x74],ecx
    4cbd:	test   esi,esi
    4cbf:	je     4bfe <img_convert+0x43e>
    4cc5:	jmp    4be4 <img_convert+0x424>
    4cca:	nop    WORD PTR [rax+rax*1+0x0]
    4cd0:	mov    esi,0x1
    4cd5:	cmp    ebp,0x1
    4cd8:	jne    4c50 <img_convert+0x490>
    4cde:	mov    DWORD PTR [rsp+0x74],0x1
    4ce6:	mov    ecx,0x1
    4ceb:	jmp    4be4 <img_convert+0x424>
    4cf0:	mov    DWORD PTR [rsp+0x74],0x1
    4cf8:	add    r12,0x1
    4cfc:	jmp    4a48 <img_convert+0x288>
    4d01:	movsxd rax,DWORD PTR [rsp+0x28]
    4d06:	mov    rsi,QWORD PTR [rsp+0x8]
    4d0b:	mov    r13,rbx
    4d0e:	mov    r14,QWORD PTR [rsi+rax*8]
    4d12:	jmp    4af0 <img_convert+0x330>
    4d17:	mov    rsi,r12
    4d1a:	lea    rdi,[rip+0x18ecf]        # 1dbf0 <_IO_stdin_used+0xbf0>
    4d21:	xor    eax,eax
    4d23:	call   3da0 <error>
    4d28:	mov    rdi,QWORD PTR [rsp+0x38]
    4d2d:	lea    rsi,[rsp+0x80]
    4d35:	call   19ba0 <bdrv_get_info>
    4d3a:	test   eax,eax
    4d3c:	js     50af <img_convert+0x8ef>
    4d42:	mov    eax,DWORD PTR [rsp+0x80]
    4d49:	mov    DWORD PTR [rsp+0x68],eax
    4d4d:	sub    eax,0x1
    4d50:	cmp    eax,0xffff
    4d55:	ja     50a1 <img_convert+0x8e1>
    4d5b:	mov    eax,DWORD PTR [rsp+0x68]
    4d5f:	lea    rbx,[rsp+0x90]
    4d67:	mov    r12d,DWORD PTR [rsp+0x48]
    4d6c:	xor    ebp,ebp
    4d6e:	mov    QWORD PTR [rsp+0x40],0x0
    4d77:	mov    edi,eax
    4d79:	sar    eax,0x2
    4d7c:	mov    QWORD PTR [rsp+0x50],rbx
    4d81:	mov    DWORD PTR [rsp+0x6c],eax
    4d85:	sub    eax,0x1
    4d88:	sar    edi,0x9
    4d8b:	lea    rax,[rbx+rax*4+0x4]
    4d90:	mov    DWORD PTR [rsp+0x4c],edi
    4d94:	xor    ebx,ebx
    4d96:	mov    QWORD PTR [rsp+0x60],rax
    4d9b:	movsxd rax,edi
    4d9e:	mov    QWORD PTR [rsp+0x58],rax
    4da3:	mov    rax,QWORD PTR [rsp+0x30]
    4da8:	mov    rsi,QWORD PTR [rsp+0x40]
    4dad:	sub    rax,rsi
    4db0:	test   rax,rax
    4db3:	jle    508c <img_convert+0x8cc>
    4db9:	sub    rsi,rbp
    4dbc:	mov    r9,rsi
    4dbf:	cmp    QWORD PTR [rsp+0x58],rax
    4dc4:	jle    4f44 <img_convert+0x784>
    4dca:	mov    DWORD PTR [rsp+0x28],eax
    4dce:	test   rsi,rsi
    4dd1:	js     506d <img_convert+0x8ad>
    4dd7:	mov    eax,DWORD PTR [rsp+0x28]
    4ddb:	mov    DWORD PTR [rsp+0x8],eax
    4ddf:	mov    rax,QWORD PTR [rsp+0x50]
    4de4:	mov    QWORD PTR [rsp+0x10],rax
    4de9:	nop    DWORD PTR [rax+0x0]
    4df0:	mov    rdx,QWORD PTR [rsp+0x78]
    4df5:	cmp    r9,rdx
    4df8:	jne    4f19 <img_convert+0x759>
    4dfe:	add    ebx,0x1
    4e01:	cmp    r12d,ebx
    4e04:	jle    4f91 <img_convert+0x7d1>
    4e0a:	movsxd r13,ebx
    4e0d:	jmp    4e1d <img_convert+0x65d>
    4e0f:	nop
    4e10:	add    r13,0x1
    4e14:	cmp    r12d,r13d
    4e17:	jle    4f91 <img_convert+0x7d1>
    4e1d:	mov    rdi,QWORD PTR [r15+r13*8]
    4e21:	mov    rsi,r14
    4e24:	add    rbp,rdx
    4e27:	mov    ebx,r13d
    4e2a:	call   191f0 <bdrv_get_geometry>
    4e2f:	mov    rdx,QWORD PTR [rsp+0x78]
    4e34:	test   rdx,rdx
    4e37:	je     4e10 <img_convert+0x650>
    4e39:	xor    eax,eax
    4e3b:	xor    r9d,r9d
    4e3e:	movsxd r8,DWORD PTR [rsp+0x8]
    4e43:	sub    rdx,rax
    4e46:	movsxd rax,ebx
    4e49:	mov    rsi,r9
    4e4c:	mov    rdi,QWORD PTR [r15+rax*8]
    4e50:	mov    QWORD PTR [rsp+0x18],r9
    4e55:	cmp    rdx,r8
    4e58:	cmovbe r8,rdx
    4e5c:	mov    rdx,QWORD PTR [rsp+0x10]
    4e61:	mov    ecx,r8d
    4e64:	mov    QWORD PTR [rsp+0x20],r8
    4e69:	call   18210 <bdrv_read>
    4e6e:	mov    r9,QWORD PTR [rsp+0x18]
    4e73:	mov    r8,QWORD PTR [rsp+0x20]
    4e78:	test   eax,eax
    4e7a:	js     4ffc <img_convert+0x83c>
    4e80:	mov    eax,r8d
    4e83:	sub    DWORD PTR [rsp+0x8],r8d
    4e88:	add    r9,r8
    4e8b:	shl    eax,0x9
    4e8e:	cdqe
    4e90:	add    QWORD PTR [rsp+0x10],rax
    4e95:	mov    eax,DWORD PTR [rsp+0x8]
    4e99:	test   eax,eax
    4e9b:	jg     4df0 <img_convert+0x630>
    4ea1:	jne    4fdd <img_convert+0x81d>
    4ea7:	mov    edi,DWORD PTR [rsp+0x28]
    4eab:	cmp    DWORD PTR [rsp+0x4c],edi
    4eaf:	jle    4ed0 <img_convert+0x710>
    4eb1:	mov    eax,edi
    4eb3:	mov    edx,DWORD PTR [rsp+0x68]
    4eb7:	mov    rdi,QWORD PTR [rsp+0x50]
    4ebc:	xor    esi,esi
    4ebe:	shl    eax,0x9
    4ec1:	sub    edx,eax
    4ec3:	cdqe
    4ec5:	movsxd rdx,edx
    4ec8:	add    rdi,rax
    4ecb:	call   3250 <memset@plt>
    4ed0:	cmp    DWORD PTR [rsp+0x6c],0x0
    4ed5:	je     4f0a <img_convert+0x74a>
    4ed7:	cmp    DWORD PTR [rsp+0x90],0x0
    4edf:	jne    4f62 <img_convert+0x7a2>
    4ee5:	mov    rax,QWORD PTR [rsp+0x50]
    4eea:	mov    rdx,QWORD PTR [rsp+0x60]
    4eef:	add    rax,0x4
    4ef3:	jmp    4f05 <img_convert+0x745>
    4ef5:	nop    DWORD PTR [rax]
    4ef8:	add    rax,0x4
    4efc:	mov    r9d,DWORD PTR [rax-0x4]
    4f00:	test   r9d,r9d
    4f03:	jne    4f62 <img_convert+0x7a2>
    4f05:	cmp    rdx,rax
    4f08:	jne    4ef8 <img_convert+0x738>
    4f0a:	movsxd rax,DWORD PTR [rsp+0x28]
    4f0f:	add    QWORD PTR [rsp+0x40],rax
    4f14:	jmp    4da3 <img_convert+0x5e3>
    4f19:	mov    rax,r9
    4f1c:	cmp    rdx,r9
    4f1f:	ja     4e3e <img_convert+0x67e>
    4f25:	lea    rcx,[rip+0x18f4c]        # 1de78 <__PRETTY_FUNCTION__.13895>
    4f2c:	mov    edx,0x211
    4f31:	lea    rsi,[rip+0x181e7]        # 1d11f <_IO_stdin_used+0x11f>
    4f38:	lea    rdi,[rip+0x18203]        # 1d142 <_IO_stdin_used+0x142>
    4f3f:	call   3230 <__assert_fail@plt>
    4f44:	test   rsi,rsi
    4f47:	js     506d <img_convert+0x8ad>
    4f4d:	mov    eax,DWORD PTR [rsp+0x4c]
    4f51:	mov    DWORD PTR [rsp+0x28],eax
    4f55:	test   eax,eax
    4f57:	jne    4dd7 <img_convert+0x617>
    4f5d:	jmp    4ed0 <img_convert+0x710>
    4f62:	mov    ecx,DWORD PTR [rsp+0x4c]
    4f66:	mov    rdx,QWORD PTR [rsp+0x50]
    4f6b:	mov    rsi,QWORD PTR [rsp+0x40]
    4f70:	mov    rdi,QWORD PTR [rsp+0x38]
    4f75:	call   19ad0 <bdrv_write_compressed>
    4f7a:	test   eax,eax
    4f7c:	je     4f0a <img_convert+0x74a>
    4f7e:	mov    rsi,QWORD PTR [rsp+0x40]
    4f83:	lea    rdi,[rip+0x18cb6]        # 1dc40 <_IO_stdin_used+0xc40>
    4f8a:	xor    eax,eax
    4f8c:	call   3da0 <error>
    4f91:	lea    rcx,[rip+0x18ee0]        # 1de78 <__PRETTY_FUNCTION__.13895>
    4f98:	mov    edx,0x209
    4f9d:	lea    rsi,[rip+0x1817b]        # 1d11f <_IO_stdin_used+0x11f>
    4fa4:	lea    rdi,[rip+0x1818b]        # 1d136 <_IO_stdin_used+0x136>
    4fab:	call   3230 <__assert_fail@plt>
    4fb0:	lea    rcx,[rip+0x18ec1]        # 1de78 <__PRETTY_FUNCTION__.13895>
    4fb7:	mov    edx,0x238
    4fbc:	lea    rsi,[rip+0x1815c]        # 1d11f <_IO_stdin_used+0x11f>
    4fc3:	lea    rdi,[rip+0x1816c]        # 1d136 <_IO_stdin_used+0x136>
    4fca:	call   3230 <__assert_fail@plt>
    4fcf:	lea    rdi,[rip+0x181a3]        # 1d179 <_IO_stdin_used+0x179>
    4fd6:	xor    eax,eax
    4fd8:	call   3da0 <error>
    4fdd:	lea    rcx,[rip+0x18e94]        # 1de78 <__PRETTY_FUNCTION__.13895>
    4fe4:	mov    edx,0x21d
    4fe9:	lea    rsi,[rip+0x1812f]        # 1d11f <_IO_stdin_used+0x11f>
    4ff0:	lea    rdi,[rip+0x18173]        # 1d16a <_IO_stdin_used+0x16a>
    4ff7:	call   3230 <__assert_fail@plt>
    4ffc:	lea    rdi,[rip+0x18153]        # 1d156 <_IO_stdin_used+0x156>
    5003:	xor    eax,eax
    5005:	call   3da0 <error>
    500a:	lea    rdi,[rip+0x18af7]        # 1db08 <_IO_stdin_used+0xb08>
    5011:	xor    eax,eax
    5013:	call   3da0 <error>
    5018:	lea    rdi,[rip+0x18aa9]        # 1dac8 <_IO_stdin_used+0xac8>
    501f:	xor    eax,eax
    5021:	call   3da0 <error>
    5026:	mov    eax,DWORD PTR [rip+0x252bc]        # 2a2e8 <optind@@GLIBC_2.2.5>
    502c:	lea    rdi,[rip+0x18032]        # 1d065 <_IO_stdin_used+0x65>
    5033:	add    eax,r12d
    5036:	cdqe
    5038:	mov    rsi,QWORD PTR [rbx+rax*8]
    503c:	xor    eax,eax
    503e:	call   3da0 <error>
    5043:	lea    rdi,[rip+0x18096]        # 1d0e0 <_IO_stdin_used+0xe0>
    504a:	xor    eax,eax
    504c:	call   3da0 <error>
    5051:	lea    rdi,[rip+0x18b10]        # 1db68 <_IO_stdin_used+0xb68>
    5058:	xor    eax,eax
    505a:	call   3da0 <error>
    505f:	lea    rdi,[rip+0x18ad2]        # 1db38 <_IO_stdin_used+0xb38>
    5066:	xor    eax,eax
    5068:	call   3da0 <error>
    506d:	lea    rcx,[rip+0x18e04]        # 1de78 <__PRETTY_FUNCTION__.13895>
    5074:	mov    edx,0x202
    5079:	lea    rsi,[rip+0x1809f]        # 1d11f <_IO_stdin_used+0x11f>
    5080:	lea    rdi,[rip+0x180a3]        # 1d12a <_IO_stdin_used+0x12a>
    5087:	call   3230 <__assert_fail@plt>
    508c:	mov    rdi,QWORD PTR [rsp+0x38]
    5091:	xor    ecx,ecx
    5093:	xor    edx,edx
    5095:	xor    esi,esi
    5097:	call   19ad0 <bdrv_write_compressed>
    509c:	jmp    4b4d <img_convert+0x38d>
    50a1:	lea    rdi,[rip+0x18062]        # 1d10a <_IO_stdin_used+0x10a>
    50a8:	xor    eax,eax
    50aa:	call   3da0 <error>
    50af:	lea    rdi,[rip+0x18b6a]        # 1dc20 <_IO_stdin_used+0xc20>
    50b6:	xor    eax,eax
    50b8:	call   3da0 <error>
    50bd:	call   31c0 <__stack_chk_fail@plt>
    50c2:	lea    rdi,[rip+0x18ae7]        # 1dbb0 <_IO_stdin_used+0xbb0>
    50c9:	xor    eax,eax
    50cb:	call   3da0 <error>
    50d0:	mov    rsi,QWORD PTR [rsp+0x28]
    50d5:	lea    rdi,[rip+0x17f70]        # 1d04c <_IO_stdin_used+0x4c>
    50dc:	call   3da0 <error>
    50e1:	call   3f60 <help>
    50e6:	nop    WORD PTR cs:[rax+rax*1+0x0]

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

0000000000005160 <qemu_bh_schedule>:
    5160:	mov    rax,rdi
    5163:	mov    rdi,QWORD PTR [rdi+0x8]
    5167:	jmp    QWORD PTR [rax]
    5169:	nop    DWORD PTR [rax+0x0]

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

0000000000006180 <qcow_make_empty>:
    6180:	push   r12
    6182:	xor    esi,esi
    6184:	push   rbp
    6185:	push   rbx
    6186:	mov    rbx,QWORD PTR [rdi+0x40]
    618a:	mov    eax,DWORD PTR [rbx+0x1c]
    618d:	mov    rdi,QWORD PTR [rbx+0x30]
    6191:	lea    r12d,[rax*8+0x0]
    6199:	mov    rdx,r12
    619c:	call   3250 <memset@plt>
    61a1:	mov    rdx,QWORD PTR [rbx+0x30]
    61a5:	mov    rsi,QWORD PTR [rbx+0x28]
    61a9:	mov    ecx,r12d
    61ac:	mov    rdi,QWORD PTR [rbx]
    61af:	call   19110 <bdrv_pwrite>
    61b4:	test   eax,eax
    61b6:	js     6240 <qcow_make_empty+0xc0>
    61bc:	mov    rsi,QWORD PTR [rbx+0x28]
    61c0:	mov    rdi,QWORD PTR [rbx]
    61c3:	add    rsi,r12
    61c6:	call   19190 <bdrv_truncate>
    61cb:	test   eax,eax
    61cd:	js     6234 <qcow_make_empty+0xb4>
    61cf:	mov    edx,DWORD PTR [rbx+0x18]
    61d2:	mov    rdi,QWORD PTR [rbx+0x38]
    61d6:	xor    esi,esi
    61d8:	shl    edx,0x4
    61db:	movsxd rdx,edx
    61de:	shl    rdx,0x3
    61e2:	call   3250 <memset@plt>
    61e7:	lea    rdi,[rbx+0x48]
    61eb:	mov    eax,ebx
    61ed:	pxor   xmm0,xmm0
    61f1:	and    rdi,0xfffffffffffffff8
    61f5:	mov    QWORD PTR [rbx+0x40],0x0
    61fd:	mov    QWORD PTR [rbx+0xb8],0x0
    6208:	sub    eax,edi
    620a:	lea    ecx,[rax+0xc0]
    6210:	xor    eax,eax
    6212:	shr    ecx,0x3
    6215:	rep stos QWORD PTR es:[rdi],rax
    6218:	movups XMMWORD PTR [rbx+0xc0],xmm0
    621f:	movups XMMWORD PTR [rbx+0xd0],xmm0
    6226:	movups XMMWORD PTR [rbx+0xe0],xmm0
    622d:	movups XMMWORD PTR [rbx+0xf0],xmm0
    6234:	pop    rbx
    6235:	pop    rbp
    6236:	pop    r12
    6238:	ret
    6239:	nop    DWORD PTR [rax+0x0]
    6240:	mov    eax,0xffffffff
    6245:	jmp    6234 <qcow_make_empty+0xb4>
    6247:	nop    WORD PTR [rax+rax*1+0x0]

0000000000006250 <qcow_aio_flush>:
    6250:	mov    rax,QWORD PTR [rdi+0x40]
    6254:	mov    rdi,QWORD PTR [rax]
    6257:	jmp    1a530 <bdrv_aio_flush>
    625c:	nop    DWORD PTR [rax+0x0]

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

0000000000006280 <qcow_flush>:
    6280:	mov    rax,QWORD PTR [rdi+0x40]
    6284:	mov    rdi,QWORD PTR [rax]
    6287:	jmp    19700 <bdrv_flush>
    628c:	nop    DWORD PTR [rax+0x0]

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

00000000000062d0 <qcow_open>:
    62d0:	push   r13
    62d2:	push   r12
    62d4:	push   rbp
    62d5:	mov    rbp,rdi
    62d8:	push   rbx
    62d9:	sub    rsp,0x58
    62dd:	mov    rbx,QWORD PTR [rdi+0x40]
    62e1:	mov    rax,QWORD PTR fs:0x28
    62ea:	mov    QWORD PTR [rsp+0x48],rax
    62ef:	xor    eax,eax
    62f1:	mov    rdi,rbx
    62f4:	call   19080 <bdrv_file_open>
    62f9:	mov    r12d,eax
    62fc:	test   eax,eax
    62fe:	js     654d <qcow_open+0x27d>
    6304:	mov    rdi,QWORD PTR [rbx]
    6307:	xor    esi,esi
    6309:	lea    rdx,[rsp+0x10]
    630e:	mov    ecx,0x30
    6313:	call   18b00 <bdrv_pread>
    6318:	cmp    eax,0x30
    631b:	jne    6670 <qcow_open+0x3a0>
    6321:	mov    eax,DWORD PTR [rsp+0x10]
    6325:	mov    rdx,QWORD PTR [rsp+0x28]
    632a:	mov    rcx,QWORD PTR [rsp+0x38]
    632f:	bswap  eax
    6331:	mov    DWORD PTR [rsp+0x10],eax
    6335:	mov    eax,DWORD PTR [rsp+0x14]
    6339:	bswap  rdx
    633c:	bswap  rcx
    633f:	mov    QWORD PTR [rsp+0x28],rdx
    6344:	bswap  eax
    6346:	mov    DWORD PTR [rsp+0x14],eax
    634a:	mov    rax,QWORD PTR [rsp+0x18]
    634f:	mov    QWORD PTR [rsp+0x38],rcx
    6354:	movabs rcx,0x1514649fb
    635e:	bswap  rax
    6361:	mov    QWORD PTR [rsp+0x18],rax
    6366:	mov    eax,DWORD PTR [rsp+0x20]
    636a:	bswap  eax
    636c:	mov    DWORD PTR [rsp+0x20],eax
    6370:	mov    eax,DWORD PTR [rsp+0x24]
    6374:	bswap  eax
    6376:	mov    DWORD PTR [rsp+0x24],eax
    637a:	mov    eax,DWORD PTR [rsp+0x34]
    637e:	bswap  eax
    6380:	mov    DWORD PTR [rsp+0x34],eax
    6384:	cmp    QWORD PTR [rsp+0x10],rcx
    6389:	jne    6670 <qcow_open+0x3a0>
    638f:	cmp    rdx,0x1
    6393:	jbe    6670 <qcow_open+0x3a0>
    6399:	movzx  ecx,BYTE PTR [rsp+0x30]
    639e:	cmp    cl,0x8
    63a1:	jbe    6670 <qcow_open+0x3a0>
    63a7:	cmp    eax,0x1
    63aa:	ja     6670 <qcow_open+0x3a0>
    63b0:	mov    DWORD PTR [rbx+0x11c],eax
    63b6:	test   eax,eax
    63b8:	jne    6570 <qcow_open+0x2a0>
    63be:	mov    eax,0x1
    63c3:	movzx  edx,cl
    63c6:	mov    esi,eax
    63c8:	mov    DWORD PTR [rbx+0x8],edx
    63cb:	shl    esi,cl
    63cd:	lea    ecx,[rdx-0x9]
    63d0:	mov    edx,eax
    63d2:	shl    edx,cl
    63d4:	mov    DWORD PTR [rbx+0xc],esi
    63d7:	mov    DWORD PTR [rbx+0x10],edx
    63da:	movzx  ecx,BYTE PTR [rsp+0x31]
    63df:	shl    eax,cl
    63e1:	mov    DWORD PTR [rbx+0x14],ecx
    63e4:	mov    DWORD PTR [rbx+0x18],eax
    63e7:	mov    rdx,QWORD PTR [rsp+0x28]
    63ec:	mov    rax,rdx
    63ef:	shr    rax,0x9
    63f3:	mov    QWORD PTR [rbp+0x0],rax
    63f7:	mov    ecx,DWORD PTR [rbx+0x8]
    63fa:	movabs rax,0x8000000000000000
    6404:	shr    rax,cl
    6407:	add    ecx,DWORD PTR [rbx+0x14]
    640a:	sub    rax,0x1
    640e:	mov    QWORD PTR [rbx+0x20],rax
    6412:	mov    eax,0x1
    6417:	shl    rax,cl
    641a:	lea    rdi,[rdx+rax*1-0x1]
    641f:	shr    rdi,cl
    6422:	mov    DWORD PTR [rbx+0x1c],edi
    6425:	mov    rax,QWORD PTR [rsp+0x38]
    642a:	movsxd rdi,edi
    642d:	shl    rdi,0x3
    6431:	mov    QWORD PTR [rbx+0x28],rax
    6435:	call   5970 <qemu_malloc>
    643a:	mov    QWORD PTR [rbx+0x30],rax
    643e:	test   rax,rax
    6441:	je     6674 <qcow_open+0x3a4>
    6447:	mov    esi,DWORD PTR [rbx+0x1c]
    644a:	mov    rdi,QWORD PTR [rbx]
    644d:	mov    rdx,rax
    6450:	lea    ecx,[rsi*8+0x0]
    6457:	mov    rsi,QWORD PTR [rbx+0x28]
    645b:	call   18b00 <bdrv_pread>
    6460:	movsxd r12,DWORD PTR [rbx+0x1c]
    6464:	cdqe
    6466:	mov    rdx,r12
    6469:	shl    r12,0x3
    646d:	cmp    rax,r12
    6470:	jne    6670 <qcow_open+0x3a0>
    6476:	cmp    QWORD PTR [rsp+0x18],0x0
    647c:	jne    648a <qcow_open+0x1ba>
    647e:	test   WORD PTR [rbx+0x28],0xfff
    6484:	je     6580 <qcow_open+0x2b0>
    648a:	xor    eax,eax
    648c:	test   edx,edx
    648e:	jle    64aa <qcow_open+0x1da>
    6490:	mov    rdx,QWORD PTR [rbx+0x30]
    6494:	lea    rcx,[rdx+rax*8]
    6498:	add    rax,0x1
    649c:	mov    rdx,QWORD PTR [rcx]
    649f:	bswap  rdx
    64a2:	mov    QWORD PTR [rcx],rdx
    64a5:	cmp    DWORD PTR [rbx+0x1c],eax
    64a8:	jg     6490 <qcow_open+0x1c0>
    64aa:	mov    edi,DWORD PTR [rbx+0x18]
    64ad:	shl    edi,0x4
    64b0:	movsxd rdi,edi
    64b3:	shl    rdi,0x3
    64b7:	call   5970 <qemu_malloc>
    64bc:	mov    QWORD PTR [rbx+0x38],rax
    64c0:	test   rax,rax
    64c3:	je     6670 <qcow_open+0x3a0>
    64c9:	movsxd rdi,DWORD PTR [rbx+0xc]
    64cd:	call   5970 <qemu_malloc>
    64d2:	mov    QWORD PTR [rbx+0x100],rax
    64d9:	test   rax,rax
    64dc:	je     6670 <qcow_open+0x3a0>
    64e2:	movsxd rdi,DWORD PTR [rbx+0xc]
    64e6:	call   5970 <qemu_malloc>
    64eb:	mov    QWORD PTR [rbx+0x108],rax
    64f2:	test   rax,rax
    64f5:	je     6670 <qcow_open+0x3a0>
    64fb:	mov    rsi,QWORD PTR [rsp+0x18]
    6500:	xor    r12d,r12d
    6503:	mov    QWORD PTR [rbx+0x110],0xffffffffffffffff
    650e:	test   rsi,rsi
    6511:	je     654d <qcow_open+0x27d>
    6513:	mov    r13d,DWORD PTR [rsp+0x20]
    6518:	mov    eax,0x3ff
    651d:	mov    rdi,QWORD PTR [rbx]
    6520:	lea    rdx,[rbp+0x448]
    6527:	cmp    r13d,0x3ff
    652e:	cmovg  r13d,eax
    6532:	mov    ecx,r13d
    6535:	call   18b00 <bdrv_pread>
    653a:	cmp    eax,r13d
    653d:	jne    6670 <qcow_open+0x3a0>
    6543:	cdqe
    6545:	mov    BYTE PTR [rbp+rax*1+0x448],0x0
    654d:	mov    rsi,QWORD PTR [rsp+0x48]
    6552:	xor    rsi,QWORD PTR fs:0x28
    655b:	mov    eax,r12d
    655e:	jne    66b8 <qcow_open+0x3e8>
    6564:	add    rsp,0x58
    6568:	pop    rbx
    6569:	pop    rbp
    656a:	pop    r12
    656c:	pop    r13
    656e:	ret
    656f:	nop
    6570:	mov    DWORD PTR [rbp+0x14],0x1
    6577:	jmp    63be <qcow_open+0xee>
    657c:	nop    DWORD PTR [rax+0x0]
    6580:	mov    r13,rsp
    6583:	mov    rdi,QWORD PTR [rbx]
    6586:	mov    ecx,0x10
    658b:	mov    esi,0x30
    6590:	mov    rdx,r13
    6593:	call   18b00 <bdrv_pread>
    6598:	cmp    eax,0x10
    659b:	jne    66b0 <qcow_open+0x3e0>
    65a1:	mov    eax,DWORD PTR [rsp]
    65a4:	bswap  eax
    65a6:	mov    DWORD PTR [rsp],eax
    65a9:	cmp    eax,0x58454efb
    65ae:	jne    66b0 <qcow_open+0x3e0>
    65b4:	mov    eax,DWORD PTR [rsp+0xc]
    65b8:	bswap  eax
    65ba:	mov    DWORD PTR [rsp+0xc],eax
    65be:	test   al,0x2
    65c0:	jne    66b0 <qcow_open+0x3e0>
    65c6:	mov    rcx,QWORD PTR [rip+0x23d33]        # 2a300 <stderr@@GLIBC_2.2.5>
    65cd:	mov    edx,0x2e
    65d2:	mov    esi,0x1
    65d7:	lea    rdi,[rip+0x178e2]        # 1dec0 <__PRETTY_FUNCTION__.13430+0x10>
    65de:	call   3640 <fwrite@plt>
    65e3:	mov    edx,DWORD PTR [rbx+0x1c]
    65e6:	xor    eax,eax
    65e8:	test   edx,edx
    65ea:	jle    660a <qcow_open+0x33a>
    65ec:	nop    DWORD PTR [rax+0x0]
    65f0:	mov    rdx,QWORD PTR [rbx+0x30]
    65f4:	lea    rcx,[rdx+rax*8]
    65f8:	add    rax,0x1
    65fc:	mov    rdx,QWORD PTR [rcx]
    65ff:	bswap  rdx
    6602:	mov    QWORD PTR [rcx],rdx
    6605:	cmp    DWORD PTR [rbx+0x1c],eax
    6608:	jg     65f0 <qcow_open+0x320>
    660a:	mov    rdx,QWORD PTR [rbx+0x30]
    660e:	mov    rsi,QWORD PTR [rbx+0x28]
    6612:	mov    ecx,r12d
    6615:	mov    rdi,QWORD PTR [rbx]
    6618:	call   19110 <bdrv_pwrite>
    661d:	cdqe
    661f:	cmp    r12,rax
    6622:	jne    66bd <qcow_open+0x3ed>
    6628:	mov    eax,DWORD PTR [rsp+0xc]
    662c:	mov    ecx,0x10
    6631:	mov    rdx,r13
    6634:	mov    esi,0x30
    6639:	or     eax,0x2
    663c:	bswap  eax
    663e:	mov    DWORD PTR [rsp+0xc],eax
    6642:	mov    rdi,QWORD PTR [rbx]
    6645:	call   19110 <bdrv_pwrite>
    664a:	cmp    eax,0x10
    664d:	je     66b0 <qcow_open+0x3e0>
    664f:	mov    rcx,QWORD PTR [rip+0x23caa]        # 2a300 <stderr@@GLIBC_2.2.5>
    6656:	mov    edx,0x26
    665b:	mov    esi,0x1
    6660:	lea    rdi,[rip+0x178b1]        # 1df18 <__PRETTY_FUNCTION__.13430+0x68>
    6667:	call   3640 <fwrite@plt>
    666c:	nop    DWORD PTR [rax+0x0]
    6670:	mov    rax,QWORD PTR [rbx+0x30]
    6674:	mov    rdi,rax
    6677:	mov    r12d,0xffffffff
    667d:	call   5960 <qemu_free>
    6682:	mov    rdi,QWORD PTR [rbx+0x38]
    6686:	call   5960 <qemu_free>
    668b:	mov    rdi,QWORD PTR [rbx+0x100]
    6692:	call   5960 <qemu_free>
    6697:	mov    rdi,QWORD PTR [rbx+0x108]
    669e:	call   5960 <qemu_free>
    66a3:	mov    rdi,QWORD PTR [rbx]
    66a6:	call   18130 <bdrv_delete>
    66ab:	jmp    654d <qcow_open+0x27d>
    66b0:	mov    edx,DWORD PTR [rbx+0x1c]
    66b3:	jmp    648a <qcow_open+0x1ba>
    66b8:	call   31c0 <__stack_chk_fail@plt>
    66bd:	mov    rcx,QWORD PTR [rip+0x23c3c]        # 2a300 <stderr@@GLIBC_2.2.5>
    66c4:	mov    edx,0x23
    66c9:	mov    esi,0x1
    66ce:	lea    rdi,[rip+0x1781b]        # 1def0 <__PRETTY_FUNCTION__.13430+0x40>
    66d5:	call   3640 <fwrite@plt>
    66da:	jmp    6670 <qcow_open+0x3a0>
    66dc:	nop    DWORD PTR [rax+0x0]

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

0000000000006790 <decompress_cluster>:
    6790:	push   r15
    6792:	push   r14
    6794:	push   r13
    6796:	push   r12
    6798:	push   rbp
    6799:	xor    ebp,ebp
    679b:	push   rbx
    679c:	sub    rsp,0x88
    67a3:	mov    r12,QWORD PTR [rdi+0x20]
    67a7:	mov    rax,QWORD PTR fs:0x28
    67b0:	mov    QWORD PTR [rsp+0x78],rax
    67b5:	xor    eax,eax
    67b7:	and    r12,rsi
    67ba:	cmp    QWORD PTR [rdi+0x110],r12
    67c1:	jne    67f0 <decompress_cluster+0x60>
    67c3:	mov    rdi,QWORD PTR [rsp+0x78]
    67c8:	xor    rdi,QWORD PTR fs:0x28
    67d1:	mov    eax,ebp
    67d3:	jne    68e7 <decompress_cluster+0x157>
    67d9:	add    rsp,0x88
    67e0:	pop    rbx
    67e1:	pop    rbp
    67e2:	pop    r12
    67e4:	pop    r13
    67e6:	pop    r14
    67e8:	pop    r15
    67ea:	ret
    67eb:	nop    DWORD PTR [rax+rax*1+0x0]
    67f0:	mov    eax,DWORD PTR [rdi+0xc]
    67f3:	mov    ecx,0x3f
    67f8:	sub    ecx,DWORD PTR [rdi+0x8]
    67fb:	mov    rbx,rdi
    67fe:	shr    rsi,cl
    6801:	mov    rdx,QWORD PTR [rdi+0x108]
    6808:	mov    rdi,QWORD PTR [rdi]
    680b:	lea    ebp,[rax-0x1]
    680e:	and    ebp,esi
    6810:	mov    rsi,r12
    6813:	mov    ecx,ebp
    6815:	call   18b00 <bdrv_pread>
    681a:	cmp    ebp,eax
    681c:	jne    68c8 <decompress_cluster+0x138>
    6822:	mov    r15,rsp
    6825:	xor    eax,eax
    6827:	mov    ecx,0xc
    682c:	mov    r13d,DWORD PTR [rbx+0xc]
    6830:	lea    rdi,[r15+0x10]
    6834:	mov    rdx,QWORD PTR [rbx+0x108]
    683b:	mov    esi,0xfffffff4
    6840:	mov    r14,QWORD PTR [rbx+0x100]
    6847:	mov    QWORD PTR [rsp+0xc],0x0
    6850:	mov    QWORD PTR [r15+0x68],0x0
    6858:	rep stos QWORD PTR es:[rdi],rax
    685b:	mov    QWORD PTR [rsp],rdx
    685f:	mov    ecx,0x70
    6864:	mov    rdi,r15
    6867:	lea    rdx,[rip+0x176d1]        # 1df3f <__PRETTY_FUNCTION__.13430+0x8f>
    686e:	mov    DWORD PTR [rsp+0x8],ebp
    6872:	mov    QWORD PTR [rsp+0x18],r14
    6877:	mov    DWORD PTR [rsp+0x20],r13d
    687c:	call   35a0 <inflateInit2_@plt>
    6881:	mov    ebp,eax
    6883:	test   eax,eax
    6885:	jne    68c8 <decompress_cluster+0x138>
    6887:	mov    rdi,r15
    688a:	mov    esi,0x4
    688f:	call   3110 <inflate@plt>
    6894:	mov    rdx,QWORD PTR [rsp+0x18]
    6899:	mov    rdi,r15
    689c:	sub    rdx,r14
    689f:	cmp    r13d,edx
    68a2:	jne    68d8 <decompress_cluster+0x148>
    68a4:	cmp    eax,0x1
    68a7:	setne  dl
    68aa:	cmp    eax,0xfffffffb
    68ad:	setne  al
    68b0:	test   dl,al
    68b2:	jne    68d8 <decompress_cluster+0x148>
    68b4:	call   33c0 <inflateEnd@plt>
    68b9:	mov    QWORD PTR [rbx+0x110],r12
    68c0:	jmp    67c3 <decompress_cluster+0x33>
    68c5:	nop    DWORD PTR [rax]
    68c8:	mov    ebp,0xffffffff
    68cd:	jmp    67c3 <decompress_cluster+0x33>
    68d2:	nop    WORD PTR [rax+rax*1+0x0]
    68d8:	call   33c0 <inflateEnd@plt>
    68dd:	mov    ebp,0xffffffff
    68e2:	jmp    67c3 <decompress_cluster+0x33>
    68e7:	call   31c0 <__stack_chk_fail@plt>
    68ec:	nop    DWORD PTR [rax+0x0]

00000000000069c0 <get_cluster_offset.isra.1>:
    69c0:	push   r15
    69c2:	mov    r15d,edx
    69c5:	push   r14
    69c7:	mov    r14,rsi
    69ca:	push   r13
    69cc:	push   r12
    69ce:	mov    r12,rsi
    69d1:	push   rbp
    69d2:	push   rbx
    69d3:	mov    rbx,rdi
    69d6:	sub    rsp,0x48
    69da:	mov    edi,DWORD PTR [rdi+0x14]
    69dd:	mov    DWORD PTR [rsp+0x10],ecx
    69e1:	mov    ecx,DWORD PTR [rbx+0x8]
    69e4:	mov    DWORD PTR [rsp+0x8],r8d
    69e9:	mov    DWORD PTR [rsp+0xc],r9d
    69ee:	add    ecx,edi
    69f0:	shr    r12,cl
    69f3:	movsxd r12,r12d
    69f6:	mov    rax,QWORD PTR fs:0x28
    69ff:	mov    QWORD PTR [rsp+0x38],rax
    6a04:	xor    eax,eax
    6a06:	mov    rax,QWORD PTR [rbx+0x30]
    6a0a:	mov    rbp,QWORD PTR [rax+r12*8]
    6a0e:	test   rbp,rbp
    6a11:	jne    6a48 <get_cluster_offset.isra.1+0x88>
    6a13:	test   edx,edx
    6a15:	jne    6af0 <get_cluster_offset.isra.1+0x130>
    6a1b:	xor    r12d,r12d
    6a1e:	mov    rdi,QWORD PTR [rsp+0x38]
    6a23:	xor    rdi,QWORD PTR fs:0x28
    6a2c:	mov    rax,r12
    6a2f:	jne    6e3d <get_cluster_offset.isra.1+0x47d>
    6a35:	add    rsp,0x48
    6a39:	pop    rbx
    6a3a:	pop    rbp
    6a3b:	pop    r12
    6a3d:	pop    r13
    6a3f:	pop    r14
    6a41:	pop    r15
    6a43:	ret
    6a44:	nop    DWORD PTR [rax+0x0]
    6a48:	xor    esi,esi
    6a4a:	xor    eax,eax
    6a4c:	nop    DWORD PTR [rax+0x0]
    6a50:	mov    edx,eax
    6a52:	cmp    QWORD PTR [rbx+rax*8+0x40],rbp
    6a57:	je     6b60 <get_cluster_offset.isra.1+0x1a0>
    6a5d:	add    rax,0x1
    6a61:	cmp    rax,0x10
    6a65:	jne    6a50 <get_cluster_offset.isra.1+0x90>
    6a67:	xor    eax,eax
    6a69:	xor    r12d,r12d
    6a6c:	mov    ecx,0xffffffff
    6a71:	nop    DWORD PTR [rax+0x0]
    6a78:	mov    edx,DWORD PTR [rbx+rax*4+0xc0]
    6a7f:	cmp    edx,ecx
    6a81:	jae    6a88 <get_cluster_offset.isra.1+0xc8>
    6a83:	mov    ecx,edx
    6a85:	movsxd r12,eax
    6a88:	add    rax,0x1
    6a8c:	cmp    rax,0x10
    6a90:	jne    6a78 <get_cluster_offset.isra.1+0xb8>
    6a92:	mov    ecx,edi
    6a94:	mov    eax,r12d
    6a97:	mov    rdx,QWORD PTR [rbx+0x38]
    6a9b:	shl    eax,cl
    6a9d:	cdqe
    6a9f:	lea    r13,[rdx+rax*8]
    6aa3:	movsxd rdx,DWORD PTR [rbx+0x18]
    6aa7:	mov    rcx,rdx
    6aaa:	test   esi,esi
    6aac:	jne    6d90 <get_cluster_offset.isra.1+0x3d0>
    6ab2:	mov    rdi,QWORD PTR [rbx]
    6ab5:	shl    ecx,0x3
    6ab8:	mov    rdx,r13
    6abb:	mov    rsi,rbp
    6abe:	call   18b00 <bdrv_pread>
    6ac3:	movsxd rcx,DWORD PTR [rbx+0x18]
    6ac7:	cdqe
    6ac9:	mov    rdx,rcx
    6acc:	shl    rcx,0x3
    6ad0:	cmp    rax,rcx
    6ad3:	jne    6a1b <get_cluster_offset.isra.1+0x5b>
    6ad9:	mov    QWORD PTR [rbx+r12*8+0x40],rbp
    6ade:	mov    DWORD PTR [rbx+r12*4+0xc0],0x1
    6aea:	jmp    6b90 <get_cluster_offset.isra.1+0x1d0>
    6aef:	nop
    6af0:	mov    rdi,QWORD PTR [rbx]
    6af3:	lea    r13,[r12*8+0x0]
    6afb:	call   191c0 <bdrv_getlength>
    6b00:	movsxd rcx,DWORD PTR [rbx+0xc]
    6b04:	mov    rdx,rcx
    6b07:	lea    rsi,[rax+rcx*1-0x1]
    6b0c:	mov    rax,QWORD PTR [rbx+0x30]
    6b10:	mov    ecx,0x8
    6b15:	neg    edx
    6b17:	movsxd rbp,edx
    6b1a:	lea    rdx,[rsp+0x30]
    6b1f:	and    rbp,rsi
    6b22:	mov    QWORD PTR [rax+r12*8],rbp
    6b26:	mov    rsi,QWORD PTR [rbx+0x28]
    6b2a:	mov    rax,rbp
    6b2d:	mov    rdi,QWORD PTR [rbx]
    6b30:	bswap  rax
    6b33:	mov    QWORD PTR [rsp+0x30],rax
    6b38:	add    rsi,r13
    6b3b:	call   19110 <bdrv_pwrite>
    6b40:	cmp    eax,0x8
    6b43:	jne    6a1b <get_cluster_offset.isra.1+0x5b>
    6b49:	mov    edi,DWORD PTR [rbx+0x14]
    6b4c:	mov    esi,0x1
    6b51:	jmp    6a4a <get_cluster_offset.isra.1+0x8a>
    6b56:	nop    WORD PTR cs:[rax+rax*1+0x0]
    6b60:	cdqe
    6b62:	lea    rcx,[rbx+rax*4]
    6b66:	mov    eax,DWORD PTR [rcx+0xc0]
    6b6c:	add    eax,0x1
    6b6f:	mov    DWORD PTR [rcx+0xc0],eax
    6b75:	cmp    eax,0xffffffff
    6b78:	je     6dc0 <get_cluster_offset.isra.1+0x400>
    6b7e:	mov    ecx,edi
    6b80:	mov    rax,QWORD PTR [rbx+0x38]
    6b84:	shl    edx,cl
    6b86:	movsxd rdx,edx
    6b89:	lea    r13,[rax+rdx*8]
    6b8d:	mov    edx,DWORD PTR [rbx+0x18]
    6b90:	mov    ecx,DWORD PTR [rbx+0x8]
    6b93:	mov    rsi,r14
    6b96:	sub    edx,0x1
    6b99:	shr    rsi,cl
    6b9c:	and    edx,esi
    6b9e:	movsxd rsi,edx
    6ba1:	lea    rax,[rsi*8+0x0]
    6ba9:	add    r13,rax
    6bac:	mov    QWORD PTR [rsp+0x18],rax
    6bb1:	mov    r12,QWORD PTR [r13+0x0]
    6bb5:	bswap  r12
    6bb8:	test   r12,r12
    6bbb:	je     6d20 <get_cluster_offset.isra.1+0x360>
    6bc1:	jns    6a1e <get_cluster_offset.isra.1+0x5e>
    6bc7:	cmp    r15d,0x1
    6bcb:	jne    6a1e <get_cluster_offset.isra.1+0x5e>
    6bd1:	mov    eax,DWORD PTR [rsp+0xc]
    6bd5:	sub    eax,DWORD PTR [rsp+0x8]
    6bd9:	cmp    eax,DWORD PTR [rbx+0x10]
    6bdc:	jl     6de0 <get_cluster_offset.isra.1+0x420>
    6be2:	mov    rdi,QWORD PTR [rbx]
    6be5:	call   191c0 <bdrv_getlength>
    6bea:	mov    rcx,rax
    6bed:	movsxd rax,DWORD PTR [rbx+0xc]
    6bf1:	mov    rdi,QWORD PTR [rbx]
    6bf4:	mov    rdx,rax
    6bf7:	lea    rcx,[rcx+rax*1-0x1]
    6bfc:	neg    edx
    6bfe:	movsxd r12,edx
    6c01:	and    r12,rcx
    6c04:	lea    rsi,[rax+r12*1]
    6c08:	call   19190 <bdrv_truncate>
    6c0d:	mov    edx,DWORD PTR [rbx+0x118]
    6c13:	test   edx,edx
    6c15:	je     6d59 <get_cluster_offset.isra.1+0x399>
    6c1b:	mov    eax,DWORD PTR [rsp+0xc]
    6c1f:	sub    eax,DWORD PTR [rsp+0x8]
    6c23:	cmp    eax,DWORD PTR [rbx+0x10]
    6c26:	jge    6d59 <get_cluster_offset.isra.1+0x399>
    6c2c:	mov    eax,DWORD PTR [rbx+0xc]
    6c2f:	neg    eax
    6c31:	cdqe
    6c33:	and    rax,r14
    6c36:	mov    r10,rax
    6c39:	mov    rax,QWORD PTR [rbx+0x108]
    6c40:	shr    r10,0x9
    6c44:	lea    rdi,[rax+0x208]
    6c4b:	mov    QWORD PTR [rsp+0x10],r10
    6c50:	mov    QWORD PTR [rax+0x200],0x0
    6c5b:	and    rdi,0xfffffffffffffff8
    6c5f:	mov    QWORD PTR [rax+0x3f8],0x0
    6c6a:	sub    eax,edi
    6c6c:	lea    ecx,[rax+0x400]
    6c72:	xor    eax,eax
    6c74:	shr    ecx,0x3
    6c77:	rep stos QWORD PTR es:[rdi],rax
    6c7a:	mov    eax,DWORD PTR [rbx+0x10]
    6c7d:	test   eax,eax
    6c7f:	jle    6d59 <get_cluster_offset.isra.1+0x399>
    6c85:	lea    rax,[rbx+0x120]
    6c8c:	mov    QWORD PTR [rsp+0x28],rbp
    6c91:	xor    r14d,r14d
    6c94:	mov    ebp,DWORD PTR [rsp+0x8]
    6c98:	mov    QWORD PTR [rsp+0x20],rax
    6c9d:	mov    r15d,DWORD PTR [rsp+0xc]
    6ca2:	jmp    6cbb <get_cluster_offset.isra.1+0x2fb>
    6ca4:	nop    DWORD PTR [rax+0x0]
    6ca8:	cmp    r15d,r14d
    6cab:	jle    6cc0 <get_cluster_offset.isra.1+0x300>
    6cad:	add    r14,0x1
    6cb1:	cmp    DWORD PTR [rbx+0x10],r14d
    6cb5:	jle    6e33 <get_cluster_offset.isra.1+0x473>
    6cbb:	cmp    ebp,r14d
    6cbe:	jle    6ca8 <get_cluster_offset.isra.1+0x2e8>
    6cc0:	mov    rax,QWORD PTR [rsp+0x10]
    6cc5:	mov    r9,QWORD PTR [rsp+0x20]
    6cca:	mov    ecx,0x1
    6ccf:	mov    r8d,0x1
    6cd5:	mov    rsi,QWORD PTR [rbx+0x108]
    6cdc:	lea    rdi,[rax+r14*1]
    6ce0:	lea    rdx,[rsi+0x200]
    6ce7:	call   66e0 <encrypt_sectors.isra.0>
    6cec:	mov    esi,r14d
    6cef:	mov    rdi,QWORD PTR [rbx]
    6cf2:	mov    ecx,0x200
    6cf7:	shl    esi,0x9
    6cfa:	mov    rdx,QWORD PTR [rbx+0x108]
    6d01:	movsxd rsi,esi
    6d04:	add    rsi,r12
    6d07:	call   19110 <bdrv_pwrite>
    6d0c:	cmp    eax,0x200
    6d11:	je     6cad <get_cluster_offset.isra.1+0x2ed>
    6d13:	mov    r12,0xffffffffffffffff
    6d1a:	jmp    6a1e <get_cluster_offset.isra.1+0x5e>
    6d1f:	nop
    6d20:	test   r15d,r15d
    6d23:	je     6a1b <get_cluster_offset.isra.1+0x5b>
    6d29:	mov    rdi,QWORD PTR [rbx]
    6d2c:	call   191c0 <bdrv_getlength>
    6d31:	mov    rcx,rax
    6d34:	cmp    r15d,0x1
    6d38:	je     6bed <get_cluster_offset.isra.1+0x22d>
    6d3e:	movsxd r14,DWORD PTR [rsp+0x10]
    6d43:	mov    ecx,0x3f
    6d48:	sub    ecx,DWORD PTR [rbx+0x8]
    6d4b:	shl    r14,cl
    6d4e:	or     r14,rax
    6d51:	bts    r14,0x3f
    6d56:	mov    r12,r14
    6d59:	mov    rax,r12
    6d5c:	mov    rsi,QWORD PTR [rsp+0x18]
    6d61:	lea    rdx,[rsp+0x30]
    6d66:	mov    ecx,0x8
    6d6b:	bswap  rax
    6d6e:	mov    QWORD PTR [rsp+0x30],rax
    6d73:	mov    QWORD PTR [r13+0x0],rax
    6d77:	mov    rdi,QWORD PTR [rbx]
    6d7a:	add    rsi,rbp
    6d7d:	call   19110 <bdrv_pwrite>
    6d82:	cmp    eax,0x8
    6d85:	jne    6a1b <get_cluster_offset.isra.1+0x5b>
    6d8b:	jmp    6a1e <get_cluster_offset.isra.1+0x5e>
    6d90:	shl    rdx,0x3
    6d94:	xor    esi,esi
    6d96:	mov    rdi,r13
    6d99:	call   3250 <memset@plt>
    6d9e:	mov    eax,DWORD PTR [rbx+0x18]
    6da1:	mov    rdi,QWORD PTR [rbx]
    6da4:	mov    rdx,r13
    6da7:	mov    rsi,rbp
    6daa:	lea    ecx,[rax*8+0x0]
    6db1:	call   19110 <bdrv_pwrite>
    6db6:	jmp    6ac3 <get_cluster_offset.isra.1+0x103>
    6dbb:	nop    DWORD PTR [rax+rax*1+0x0]
    6dc0:	lea    rax,[rbx+0xc0]
    6dc7:	lea    rcx,[rbx+0x100]
    6dce:	xchg   ax,ax
    6dd0:	shr    DWORD PTR [rax],1
    6dd2:	add    rax,0x4
    6dd6:	cmp    rcx,rax
    6dd9:	jne    6dd0 <get_cluster_offset.isra.1+0x410>
    6ddb:	jmp    6b7e <get_cluster_offset.isra.1+0x1be>
    6de0:	mov    rsi,r12
    6de3:	mov    rdi,rbx
    6de6:	call   6790 <decompress_cluster>
    6deb:	test   eax,eax
    6ded:	js     6a1b <get_cluster_offset.isra.1+0x5b>
    6df3:	mov    rdi,QWORD PTR [rbx]
    6df6:	call   191c0 <bdrv_getlength>
    6dfb:	movsxd rdx,DWORD PTR [rbx+0xc]
    6dff:	mov    rdi,QWORD PTR [rbx]
    6e02:	mov    r12d,edx
    6e05:	lea    rax,[rax+rdx*1-0x1]
    6e0a:	mov    rcx,rdx
    6e0d:	mov    rdx,QWORD PTR [rbx+0x100]
    6e14:	neg    r12d
    6e17:	movsxd r12,r12d
    6e1a:	and    r12,rax
    6e1d:	mov    rsi,r12
    6e20:	call   19110 <bdrv_pwrite>
    6e25:	cmp    eax,DWORD PTR [rbx+0xc]
    6e28:	je     6d59 <get_cluster_offset.isra.1+0x399>
    6e2e:	jmp    6d13 <get_cluster_offset.isra.1+0x353>
    6e33:	mov    rbp,QWORD PTR [rsp+0x28]
    6e38:	jmp    6d59 <get_cluster_offset.isra.1+0x399>
    6e3d:	call   31c0 <__stack_chk_fail@plt>
    6e42:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    6e4d:	nop    DWORD PTR [rax]

0000000000006e50 <qcow_write_compressed>:
    6e50:	push   r15
    6e52:	push   r14
    6e54:	push   r13
    6e56:	push   r12
    6e58:	mov    r12,rsi
    6e5b:	push   rbp
    6e5c:	push   rbx
    6e5d:	sub    rsp,0xb8
    6e64:	mov    rbx,QWORD PTR [rdi+0x40]
    6e68:	mov    QWORD PTR [rsp+0x8],rdi
    6e6d:	mov    rsi,QWORD PTR fs:0x28
    6e76:	mov    QWORD PTR [rsp+0xa8],rsi
    6e7e:	xor    esi,esi
    6e80:	cmp    DWORD PTR [rbx+0x10],ecx
    6e83:	jne    7128 <qcow_write_compressed+0x2d8>
    6e89:	mov    ecx,DWORD PTR [rbx+0xc]
    6e8c:	mov    r13,rdx
    6e8f:	mov    edx,0x10624dd3
    6e94:	mov    eax,ecx
    6e96:	imul   edx
    6e98:	mov    eax,ecx
    6e9a:	sar    eax,0x1f
    6e9d:	sar    edx,0x6
    6ea0:	sub    edx,eax
    6ea2:	lea    edi,[rcx+rdx*1+0x80]
    6ea9:	movsxd rdi,edi
    6eac:	call   5970 <qemu_malloc>
    6eb1:	mov    r14,rax
    6eb4:	test   rax,rax
    6eb7:	je     7155 <qcow_write_compressed+0x305>
    6ebd:	lea    r15,[rsp+0x30]
    6ec2:	xor    eax,eax
    6ec4:	mov    ecx,0xe
    6ec9:	xor    r9d,r9d
    6ecc:	mov    rdi,r15
    6ecf:	mov    esi,0xffffffff
    6ed4:	mov    r8d,0x9
    6eda:	mov    edx,0x8
    6edf:	rep stos QWORD PTR es:[rdi],rax
    6ee2:	lea    rax,[rip+0x17056]        # 1df3f <__PRETTY_FUNCTION__.13430+0x8f>
    6ee9:	push   0x70
    6eeb:	mov    rdi,r15
    6eee:	push   rax
    6eef:	mov    ecx,0xfffffff4
    6ef4:	call   32c0 <deflateInit2_@plt>
    6ef9:	mov    DWORD PTR [rsp+0x24],eax
    6efd:	pop    rcx
    6efe:	pop    rsi
    6eff:	test   eax,eax
    6f01:	jne    7110 <qcow_write_compressed+0x2c0>
    6f07:	mov    eax,DWORD PTR [rbx+0xc]
    6f0a:	mov    esi,0x4
    6f0f:	mov    rdi,r15
    6f12:	mov    QWORD PTR [rsp+0x30],r13
    6f17:	mov    QWORD PTR [rsp+0x48],r14
    6f1c:	mov    DWORD PTR [rsp+0x38],eax
    6f20:	mov    DWORD PTR [rsp+0x50],eax
    6f24:	call   3240 <deflate@plt>
    6f29:	mov    ebp,eax
    6f2b:	cmp    eax,0x1
    6f2e:	ja     7138 <qcow_write_compressed+0x2e8>
    6f34:	mov    rax,QWORD PTR [rsp+0x48]
    6f39:	mov    rdi,r15
    6f3c:	mov    QWORD PTR [rsp+0x18],rax
    6f41:	call   3490 <deflateEnd@plt>
    6f46:	cmp    ebp,0x1
    6f49:	jne    70a8 <qcow_write_compressed+0x258>
    6f4f:	mov    rbp,QWORD PTR [rsp+0x18]
    6f54:	mov    rax,QWORD PTR [rsp+0x8]
    6f59:	sub    rbp,r14
    6f5c:	mov    r15,QWORD PTR [rax+0x40]
    6f60:	cmp    DWORD PTR [rbx+0xc],ebp
    6f63:	jg     70d8 <qcow_write_compressed+0x288>
    6f69:	mov    ebp,DWORD PTR [rbx+0x10]
    6f6c:	test   ebp,ebp
    6f6e:	jle    70c8 <qcow_write_compressed+0x278>
    6f74:	lea    rax,[r15+0x120]
    6f7b:	mov    QWORD PTR [rsp+0x28],r14
    6f80:	mov    rdi,r15
    6f83:	mov    r14,r15
    6f86:	mov    QWORD PTR [rsp+0x20],rax
    6f8b:	jmp    6ff5 <qcow_write_compressed+0x1a5>
    6f8d:	nop    DWORD PTR [rax]
    6f90:	mov    rsi,QWORD PTR [r14+0x108]
    6f97:	mov    ecx,ebx
    6f99:	mov    rdx,r13
    6f9c:	mov    rdi,r12
    6f9f:	mov    r9,QWORD PTR [rsp+0x20]
    6fa4:	mov    r8d,0x1
    6faa:	mov    QWORD PTR [rsp+0x18],rax
    6faf:	call   66e0 <encrypt_sectors.isra.0>
    6fb4:	mov    rax,QWORD PTR [rsp+0x18]
    6fb9:	mov    rdi,QWORD PTR [r14]
    6fbc:	mov    ecx,r15d
    6fbf:	mov    rdx,QWORD PTR [r14+0x108]
    6fc6:	mov    rsi,rax
    6fc9:	call   19110 <bdrv_pwrite>
    6fce:	cmp    eax,r15d
    6fd1:	jne    706b <qcow_write_compressed+0x21b>
    6fd7:	sub    ebp,ebx
    6fd9:	cdqe
    6fdb:	movsxd rbx,ebx
    6fde:	add    r12,rbx
    6fe1:	add    r13,rax
    6fe4:	test   ebp,ebp
    6fe6:	jle    70c0 <qcow_write_compressed+0x270>
    6fec:	mov    rax,QWORD PTR [rsp+0x8]
    6ff1:	mov    rdi,QWORD PTR [rax+0x40]
    6ff5:	mov    ebx,DWORD PTR [r14+0x10]
    6ff9:	mov    rsi,r12
    6ffc:	mov    edx,0x1
    7001:	lea    r10d,[rbx-0x1]
    7005:	and    r10d,r12d
    7008:	sub    ebx,r10d
    700b:	mov    r8d,r10d
    700e:	mov    DWORD PTR [rsp+0x18],r10d
    7013:	cmp    ebx,ebp
    7015:	cmovg  ebx,ebp
    7018:	shl    rsi,0x9
    701c:	xor    ecx,ecx
    701e:	lea    r9d,[r10+rbx*1]
    7022:	call   69c0 <get_cluster_offset.isra.1>
    7027:	test   rax,rax
    702a:	je     706b <qcow_write_compressed+0x21b>
    702c:	mov    r10d,DWORD PTR [rsp+0x18]
    7031:	mov    edx,DWORD PTR [r14+0x118]
    7038:	mov    r15d,ebx
    703b:	shl    r15d,0x9
    703f:	shl    r10d,0x9
    7043:	movsxd r10,r10d
    7046:	add    rax,r10
    7049:	test   edx,edx
    704b:	jne    6f90 <qcow_write_compressed+0x140>
    7051:	mov    rdi,QWORD PTR [r14]
    7054:	mov    ecx,r15d
    7057:	mov    rdx,r13
    705a:	mov    rsi,rax
    705d:	call   19110 <bdrv_pwrite>
    7062:	cmp    eax,r15d
    7065:	je     6fd7 <qcow_write_compressed+0x187>
    706b:	mov    r14,QWORD PTR [rsp+0x28]
    7070:	mov    rdi,r14
    7073:	call   5960 <qemu_free>
    7078:	mov    rcx,QWORD PTR [rsp+0xa8]
    7080:	xor    rcx,QWORD PTR fs:0x28
    7089:	mov    eax,DWORD PTR [rsp+0x14]
    708d:	jne    7162 <qcow_write_compressed+0x312>
    7093:	add    rsp,0xb8
    709a:	pop    rbx
    709b:	pop    rbp
    709c:	pop    r12
    709e:	pop    r13
    70a0:	pop    r14
    70a2:	pop    r15
    70a4:	ret
    70a5:	nop    DWORD PTR [rax]
    70a8:	mov    rax,QWORD PTR [rsp+0x8]
    70ad:	mov    r15,QWORD PTR [rax+0x40]
    70b1:	jmp    6f69 <qcow_write_compressed+0x119>
    70b6:	nop    WORD PTR cs:[rax+rax*1+0x0]
    70c0:	mov    r15,r14
    70c3:	mov    r14,QWORD PTR [rsp+0x28]
    70c8:	mov    QWORD PTR [r15+0x110],0xffffffffffffffff
    70d3:	jmp    7070 <qcow_write_compressed+0x220>
    70d5:	nop    DWORD PTR [rax]
    70d8:	mov    rsi,r12
    70db:	xor    r9d,r9d
    70de:	xor    r8d,r8d
    70e1:	mov    ecx,ebp
    70e3:	shl    rsi,0x9
    70e7:	mov    edx,0x2
    70ec:	mov    rdi,r15
    70ef:	call   69c0 <get_cluster_offset.isra.1>
    70f4:	mov    rdi,QWORD PTR [rbx]
    70f7:	and    rax,QWORD PTR [rbx+0x20]
    70fb:	mov    ecx,ebp
    70fd:	mov    rsi,rax
    7100:	mov    rdx,r14
    7103:	call   19110 <bdrv_pwrite>
    7108:	cmp    eax,ebp
    710a:	je     7070 <qcow_write_compressed+0x220>
    7110:	mov    rdi,r14
    7113:	call   5960 <qemu_free>
    7118:	mov    DWORD PTR [rsp+0x14],0xffffffff
    7120:	jmp    7078 <qcow_write_compressed+0x228>
    7125:	nop    DWORD PTR [rax]
    7128:	mov    DWORD PTR [rsp+0x14],0xffffffea
    7130:	jmp    7078 <qcow_write_compressed+0x228>
    7135:	nop    DWORD PTR [rax]
    7138:	mov    rdi,r14
    713b:	call   5960 <qemu_free>
    7140:	mov    rdi,r15
    7143:	call   3490 <deflateEnd@plt>
    7148:	mov    DWORD PTR [rsp+0x14],0xffffffff
    7150:	jmp    7078 <qcow_write_compressed+0x228>
    7155:	mov    DWORD PTR [rsp+0x14],0xffffffff
    715d:	jmp    7078 <qcow_write_compressed+0x228>
    7162:	call   31c0 <__stack_chk_fail@plt>
    7167:	nop    WORD PTR [rax+rax*1+0x0]

00000000000071d0 <qcow_aio_write_cb>:
    71d0:	push   r14
    71d2:	push   r13
    71d4:	push   r12
    71d6:	push   rbp
    71d7:	mov    ebp,esi
    71d9:	push   rbx
    71da:	mov    rcx,QWORD PTR [rdi+0x8]
    71de:	mov    rbx,rdi
    71e1:	mov    r12,QWORD PTR [rcx+0x40]
    71e5:	mov    QWORD PTR [rdi+0x50],0x0
    71ed:	test   esi,esi
    71ef:	js     72f0 <qcow_aio_write_cb+0x120>
    71f5:	movsxd rsi,DWORD PTR [rdi+0x3c]
    71f9:	mov    edx,DWORD PTR [rdi+0x38]
    71fc:	mov    rax,rsi
    71ff:	sub    edx,esi
    7201:	add    rsi,QWORD PTR [rdi+0x28]
    7205:	shl    eax,0x9
    7208:	mov    DWORD PTR [rdi+0x38],edx
    720b:	cdqe
    720d:	mov    QWORD PTR [rdi+0x28],rsi
    7211:	add    QWORD PTR [rdi+0x30],rax
    7215:	test   edx,edx
    7217:	je     72b0 <qcow_aio_write_cb+0xe0>
    721d:	mov    r9d,DWORD PTR [r12+0x10]
    7222:	lea    r13d,[r9-0x1]
    7226:	mov    eax,r9d
    7229:	and    r13d,esi
    722c:	sub    eax,r13d
    722f:	cmp    edx,eax
    7231:	jl     7300 <qcow_aio_write_cb+0x130>
    7237:	mov    DWORD PTR [rdi+0x3c],eax
    723a:	mov    rdi,QWORD PTR [rcx+0x40]
    723e:	shl    rsi,0x9
    7242:	mov    r8d,r13d
    7245:	xor    ecx,ecx
    7247:	mov    edx,0x1
    724c:	call   69c0 <get_cluster_offset.isra.1>
    7251:	mov    r14,rax
    7254:	test   rax,rax
    7257:	je     7340 <qcow_aio_write_cb+0x170>
    725d:	test   eax,0x1ff
    7262:	jne    7340 <qcow_aio_write_cb+0x170>
    7268:	mov    eax,DWORD PTR [r12+0x118]
    7270:	test   eax,eax
    7272:	jne    7310 <qcow_aio_write_cb+0x140>
    7278:	mov    rdx,QWORD PTR [rbx+0x30]
    727c:	mov    ecx,DWORD PTR [rbx+0x3c]
    727f:	shr    r14,0x9
    7283:	movsxd rsi,r13d
    7286:	mov    rdi,QWORD PTR [r12]
    728a:	add    rsi,r14
    728d:	mov    r9,rbx
    7290:	lea    r8,[rip+0xffffffffffffff39]        # 71d0 <qcow_aio_write_cb>
    7297:	call   1a1a0 <bdrv_aio_write>
    729c:	mov    QWORD PTR [rbx+0x50],rax
    72a0:	test   rax,rax
    72a3:	je     72f0 <qcow_aio_write_cb+0x120>
    72a5:	pop    rbx
    72a6:	pop    rbp
    72a7:	pop    r12
    72a9:	pop    r13
    72ab:	pop    r14
    72ad:	ret
    72ae:	xchg   ax,ax
    72b0:	mov    rdi,QWORD PTR [rdi+0x18]
    72b4:	xor    esi,esi
    72b6:	call   QWORD PTR [rbx+0x10]
    72b9:	mov    rdi,rbx
    72bc:	pop    rbx
    72bd:	pop    rbp
    72be:	pop    r12
    72c0:	pop    r13
    72c2:	pop    r14
    72c4:	jmp    1a860 <qemu_aio_release>
    72c9:	nop    DWORD PTR [rax+0x0]
    72d0:	movsxd rdi,DWORD PTR [r12+0xc]
    72d5:	call   59c0 <qemu_mallocz>
    72da:	mov    rsi,rax
    72dd:	mov    QWORD PTR [rbx+0x48],rax
    72e1:	test   rax,rax
    72e4:	jne    7319 <qcow_aio_write_cb+0x149>
    72e6:	mov    ebp,0xfffffff4
    72eb:	nop    DWORD PTR [rax+rax*1+0x0]
    72f0:	mov    rdi,QWORD PTR [rbx+0x18]
    72f4:	mov    esi,ebp
    72f6:	jmp    72b6 <qcow_aio_write_cb+0xe6>
    72f8:	nop    DWORD PTR [rax+rax*1+0x0]
    7300:	mov    DWORD PTR [rdi+0x3c],edx
    7303:	lea    r9d,[rdx+r13*1]
    7307:	jmp    723a <qcow_aio_write_cb+0x6a>
    730c:	nop    DWORD PTR [rax+0x0]
    7310:	mov    rsi,QWORD PTR [rbx+0x48]
    7314:	test   rsi,rsi
    7317:	je     72d0 <qcow_aio_write_cb+0x100>
    7319:	mov    rdx,QWORD PTR [rbx+0x30]
    731d:	mov    ecx,DWORD PTR [rbx+0x3c]
    7320:	lea    r9,[r12+0x120]
    7328:	mov    r8d,0x1
    732e:	mov    rdi,QWORD PTR [rbx+0x28]
    7332:	call   66e0 <encrypt_sectors.isra.0>
    7337:	mov    rdx,QWORD PTR [rbx+0x48]
    733b:	jmp    727c <qcow_aio_write_cb+0xac>
    7340:	mov    ebp,0xfffffffb
    7345:	mov    rdi,QWORD PTR [rbx+0x18]
    7349:	mov    esi,ebp
    734b:	jmp    72b6 <qcow_aio_write_cb+0xe6>

00000000000073c0 <qcow_aio_read_cb>:
    73c0:	push   r15
    73c2:	push   r14
    73c4:	push   r13
    73c6:	mov    r13d,esi
    73c9:	push   r12
    73cb:	push   rbp
    73cc:	push   rbx
    73cd:	mov    rbx,rdi
    73d0:	sub    rsp,0x8
    73d4:	mov    r12,QWORD PTR [rdi+0x8]
    73d8:	mov    rbp,QWORD PTR [r12+0x40]
    73dd:	mov    QWORD PTR [rdi+0x50],0x0
    73e5:	lea    r14,[rbp+0x214]
    73ec:	test   esi,esi
    73ee:	js     7510 <qcow_aio_read_cb+0x150>
    73f4:	nop    DWORD PTR [rax+0x0]
    73f8:	cmp    QWORD PTR [rbx+0x40],0x0
    73fd:	mov    ecx,DWORD PTR [rbx+0x3c]
    7400:	mov    rax,QWORD PTR [rbx+0x30]
    7404:	mov    rdi,QWORD PTR [rbx+0x28]
    7408:	jle    7418 <qcow_aio_read_cb+0x58>
    740a:	mov    edx,DWORD PTR [rbp+0x118]
    7410:	test   edx,edx
    7412:	jne    74e8 <qcow_aio_read_cb+0x128>
    7418:	mov    edx,DWORD PTR [rbx+0x38]
    741b:	movsxd rsi,ecx
    741e:	add    rsi,rdi
    7421:	sub    edx,ecx
    7423:	shl    ecx,0x9
    7426:	mov    QWORD PTR [rbx+0x28],rsi
    742a:	movsxd rcx,ecx
    742d:	mov    DWORD PTR [rbx+0x38],edx
    7430:	add    rcx,rax
    7433:	mov    QWORD PTR [rbx+0x30],rcx
    7437:	test   edx,edx
    7439:	je     7530 <qcow_aio_read_cb+0x170>
    743f:	mov    rdi,QWORD PTR [r12+0x40]
    7444:	shl    rsi,0x9
    7448:	xor    ecx,ecx
    744a:	xor    edx,edx
    744c:	xor    r9d,r9d
    744f:	xor    r8d,r8d
    7452:	call   69c0 <get_cluster_offset.isra.1>
    7457:	mov    rsi,QWORD PTR [rbx+0x28]
    745b:	mov    edx,DWORD PTR [rbx+0x38]
    745e:	mov    QWORD PTR [rbx+0x40],rax
    7462:	mov    ecx,DWORD PTR [rbp+0x10]
    7465:	lea    r15d,[rcx-0x1]
    7469:	and    r15d,esi
    746c:	sub    ecx,r15d
    746f:	cmp    ecx,edx
    7471:	cmovg  ecx,edx
    7474:	mov    DWORD PTR [rbx+0x3c],ecx
    7477:	test   rax,rax
    747a:	jne    74a8 <qcow_aio_read_cb+0xe8>
    747c:	mov    rax,QWORD PTR [r12+0x850]
    7484:	mov    rdi,QWORD PTR [rbx+0x30]
    7488:	test   rax,rax
    748b:	jne    7580 <qcow_aio_read_cb+0x1c0>
    7491:	shl    ecx,0x9
    7494:	xor    esi,esi
    7496:	movsxd rdx,ecx
    7499:	call   3250 <memset@plt>
    749e:	jmp    73f8 <qcow_aio_read_cb+0x38>
    74a3:	nop    DWORD PTR [rax+rax*1+0x0]
    74a8:	jns    7540 <qcow_aio_read_cb+0x180>
    74ae:	mov    rsi,rax
    74b1:	mov    rdi,rbp
    74b4:	call   6790 <decompress_cluster>
    74b9:	test   eax,eax
    74bb:	js     7510 <qcow_aio_read_cb+0x150>
    74bd:	mov    edx,DWORD PTR [rbx+0x3c]
    74c0:	shl    r15d,0x9
    74c4:	mov    rdi,QWORD PTR [rbx+0x30]
    74c8:	movsxd rsi,r15d
    74cb:	add    rsi,QWORD PTR [rbp+0x100]
    74d2:	shl    edx,0x9
    74d5:	movsxd rdx,edx
    74d8:	call   33b0 <memcpy@plt>
    74dd:	jmp    73f8 <qcow_aio_read_cb+0x38>
    74e2:	nop    WORD PTR [rax+rax*1+0x0]
    74e8:	mov    rdx,rax
    74eb:	mov    rsi,rax
    74ee:	mov    r9,r14
    74f1:	xor    r8d,r8d
    74f4:	call   66e0 <encrypt_sectors.isra.0>
    74f9:	mov    ecx,DWORD PTR [rbx+0x3c]
    74fc:	mov    rdi,QWORD PTR [rbx+0x28]
    7500:	mov    rax,QWORD PTR [rbx+0x30]
    7504:	jmp    7418 <qcow_aio_read_cb+0x58>
    7509:	mov    r13d,0xfffffffb
    750f:	nop
    7510:	mov    rdi,QWORD PTR [rbx+0x18]
    7514:	mov    esi,r13d
    7517:	call   QWORD PTR [rbx+0x10]
    751a:	add    rsp,0x8
    751e:	mov    rdi,rbx
    7521:	pop    rbx
    7522:	pop    rbp
    7523:	pop    r12
    7525:	pop    r13
    7527:	pop    r14
    7529:	pop    r15
    752b:	jmp    1a860 <qemu_aio_release>
    7530:	mov    rdi,QWORD PTR [rbx+0x18]
    7534:	xor    esi,esi
    7536:	jmp    7517 <qcow_aio_read_cb+0x157>
    7538:	nop    DWORD PTR [rax+rax*1+0x0]
    7540:	test   eax,0x1ff
    7545:	jne    7509 <qcow_aio_read_cb+0x149>
    7547:	shr    rax,0x9
    754b:	mov    rdx,QWORD PTR [rbx+0x30]
    754f:	movsxd rsi,r15d
    7552:	mov    rdi,QWORD PTR [rbp+0x0]
    7556:	add    rsi,rax
    7559:	mov    r9,rbx
    755c:	lea    r8,[rip+0xfffffffffffffe5d]        # 73c0 <qcow_aio_read_cb>
    7563:	call   1a070 <bdrv_aio_read>
    7568:	mov    QWORD PTR [rbx+0x50],rax
    756c:	test   rax,rax
    756f:	je     7510 <qcow_aio_read_cb+0x150>
    7571:	add    rsp,0x8
    7575:	pop    rbx
    7576:	pop    rbp
    7577:	pop    r12
    7579:	pop    r13
    757b:	pop    r14
    757d:	pop    r15
    757f:	ret
    7580:	mov    rdx,rdi
    7583:	mov    r9,rbx
    7586:	lea    r8,[rip+0xfffffffffffffe33]        # 73c0 <qcow_aio_read_cb>
    758d:	mov    rdi,rax
    7590:	call   1a070 <bdrv_aio_read>
    7595:	mov    QWORD PTR [rbx+0x50],rax
    7599:	test   rax,rax
    759c:	je     7510 <qcow_aio_read_cb+0x150>
    75a2:	add    rsp,0x8
    75a6:	pop    rbx
    75a7:	pop    rbp
    75a8:	pop    r12
    75aa:	pop    r13
    75ac:	pop    r14
    75ae:	pop    r15
    75b0:	ret
    75b1:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    75bc:	nop    DWORD PTR [rax+0x0]

0000000000007660 <qcow_create>:
    7660:	push   r15
    7662:	mov    r15,rdx
    7665:	mov    edx,0x1a4
    766a:	push   r14
    766c:	push   r13
    766e:	push   r12
    7670:	push   rbp
    7671:	push   rbx
    7672:	mov    rbx,rsi
    7675:	mov    esi,0x241
    767a:	sub    rsp,0x68
    767e:	mov    DWORD PTR [rsp+0x4],ecx
    7682:	mov    rax,QWORD PTR fs:0x28
    768b:	mov    QWORD PTR [rsp+0x58],rax
    7690:	xor    eax,eax
    7692:	call   3500 <open64@plt>
    7697:	test   eax,eax
    7699:	js     7871 <qcow_create+0x211>
    769f:	mov    ebp,eax
    76a1:	shl    rbx,0x9
    76a5:	lea    r9,[rsp+0x20]
    76aa:	pxor   xmm0,xmm0
    76ae:	movabs rax,0x1000000fb494651
    76b8:	movups XMMWORD PTR [rsp+0x28],xmm0
    76bd:	mov    QWORD PTR [rsp+0x20],rax
    76c2:	mov    rax,rbx
    76c5:	movups XMMWORD PTR [r9+0x18],xmm0
    76ca:	bswap  rax
    76cd:	mov    QWORD PTR [r9+0x28],0x0
    76d5:	mov    QWORD PTR [rsp+0x38],rax
    76da:	test   r15,r15
    76dd:	je     7850 <qcow_create+0x1f0>
    76e3:	mov    ecx,0x5
    76e8:	lea    rdi,[rip+0x16857]        # 1df46 <__PRETTY_FUNCTION__.13430+0x96>
    76ef:	mov    rsi,r15
    76f2:	repz cmps BYTE PTR ds:[rsi],BYTE PTR es:[rdi]
    76f4:	seta   dl
    76f7:	sbb    dl,0x0
    76fa:	movsx  ecx,dl
    76fd:	test   ecx,ecx
    76ff:	jne    7800 <qcow_create+0x1a0>
    7705:	movabs rax,0x3000000000000000
    770f:	mov    r12d,0x30
    7715:	xor    r15d,r15d
    7718:	mov    edx,0xc09
    771d:	mov    WORD PTR [rsp+0x40],dx
    7722:	lea    r13,[rbx+0x1fffff]
    7729:	mov    QWORD PTR [rsp+0x48],rax
    772e:	sar    r13,0x15
    7732:	mov    r14d,r13d
    7735:	test   BYTE PTR [rsp+0x4],0x1
    773a:	je     7744 <qcow_create+0xe4>
    773c:	mov    DWORD PTR [rsp+0x44],0x1000000
    7744:	mov    edx,0x30
    7749:	mov    rsi,r9
    774c:	mov    edi,ebp
    774e:	mov    DWORD PTR [rsp+0x4],ecx
    7752:	call   5390 <qemu_write_ok>
    7757:	test   eax,eax
    7759:	js     77bf <qcow_create+0x15f>
    775b:	test   r15,r15
    775e:	mov    ecx,DWORD PTR [rsp+0x4]
    7762:	je     7775 <qcow_create+0x115>
    7764:	movsxd rdx,ecx
    7767:	mov    rsi,r15
    776a:	mov    edi,ebp
    776c:	call   5390 <qemu_write_ok>
    7771:	test   eax,eax
    7773:	js     77bf <qcow_create+0x15f>
    7775:	movsxd rsi,r12d
    7778:	xor    edx,edx
    777a:	mov    edi,ebp
    777c:	xor    ebx,ebx
    777e:	call   3650 <lseek64@plt>
    7783:	lea    r12,[rsp+0x18]
    7788:	mov    QWORD PTR [rsp+0x18],0x0
    7791:	test   r13d,r13d
    7794:	jg     77ac <qcow_create+0x14c>
    7796:	jmp    7840 <qcow_create+0x1e0>
    779b:	nop    DWORD PTR [rax+rax*1+0x0]
    77a0:	add    ebx,0x1
    77a3:	cmp    r14d,ebx
    77a6:	je     7840 <qcow_create+0x1e0>
    77ac:	mov    edx,0x8
    77b1:	mov    rsi,r12
    77b4:	mov    edi,ebp
    77b6:	call   5390 <qemu_write_ok>
    77bb:	test   eax,eax
    77bd:	jns    77a0 <qcow_create+0x140>
    77bf:	call   30d0 <__errno_location@plt>
    77c4:	mov    edi,ebp
    77c6:	mov    r12d,DWORD PTR [rax]
    77c9:	mov    rbx,rax
    77cc:	call   3270 <close@plt>
    77d1:	mov    eax,0xffffffff
    77d6:	mov    DWORD PTR [rbx],r12d
    77d9:	mov    rcx,QWORD PTR [rsp+0x58]
    77de:	xor    rcx,QWORD PTR fs:0x28
    77e7:	jne    787b <qcow_create+0x21b>
    77ed:	add    rsp,0x68
    77f1:	pop    rbx
    77f2:	pop    rbp
    77f3:	pop    r12
    77f5:	pop    r13
    77f7:	pop    r14
    77f9:	pop    r15
    77fb:	ret
    77fc:	nop    DWORD PTR [rax+0x0]
    7800:	movabs rax,0x3000000000000000
    780a:	mov    rdi,r15
    780d:	mov    QWORD PTR [rsp+0x8],r9
    7812:	mov    QWORD PTR [rsp+0x28],rax
    7817:	call   31b0 <strlen@plt>
    781c:	mov    r9,QWORD PTR [rsp+0x8]
    7821:	lea    r12d,[rax+0x37]
    7825:	mov    edx,eax
    7827:	mov    ecx,eax
    7829:	and    r12d,0xfffffff8
    782d:	bswap  edx
    782f:	mov    DWORD PTR [rsp+0x30],edx
    7833:	movsxd rax,r12d
    7836:	bswap  rax
    7839:	jmp    7718 <qcow_create+0xb8>
    783e:	xchg   ax,ax
    7840:	mov    edi,ebp
    7842:	call   3270 <close@plt>
    7847:	xor    eax,eax
    7849:	jmp    77d9 <qcow_create+0x179>
    784b:	nop    DWORD PTR [rax+rax*1+0x0]
    7850:	mov    eax,0x90c
    7855:	mov    r12d,0x30
    785b:	xor    ecx,ecx
    785d:	mov    WORD PTR [rsp+0x40],ax
    7862:	movabs rax,0x3000000000000000
    786c:	jmp    7722 <qcow_create+0xc2>
    7871:	mov    eax,0xffffffff
    7876:	jmp    77d9 <qcow_create+0x179>
    787b:	call   31c0 <__stack_chk_fail@plt>

0000000000007880 <AES_set_encrypt_key>:
    7880:	test   rdi,rdi
    7883:	je     7c99 <AES_set_encrypt_key+0x419>
    7889:	test   rdx,rdx
    788c:	je     7c99 <AES_set_encrypt_key+0x419>
    7892:	mov    eax,esi
    7894:	and    eax,0xffffffbf
    7897:	cmp    eax,0x80
    789c:	jne    7a20 <AES_set_encrypt_key+0x1a0>
    78a2:	cmp    esi,0x80
    78a8:	jne    7a40 <AES_set_encrypt_key+0x1c0>
    78ae:	mov    DWORD PTR [rdx+0xf0],0xa
    78b8:	push   r14
    78ba:	push   r12
    78bc:	push   rbp
    78bd:	push   rbx
    78be:	movzx  eax,BYTE PTR [rdi]
    78c1:	movzx  r8d,BYTE PTR [rdi+0x1]
    78c6:	shl    eax,0x18
    78c9:	shl    r8d,0x10
    78cd:	xor    eax,r8d
    78d0:	movzx  r8d,BYTE PTR [rdi+0x3]
    78d5:	xor    eax,r8d
    78d8:	movzx  r8d,BYTE PTR [rdi+0x2]
    78dd:	shl    r8d,0x8
    78e1:	xor    r8d,eax
    78e4:	mov    DWORD PTR [rdx],r8d
    78e7:	movzx  r9d,BYTE PTR [rdi+0x4]
    78ec:	movzx  eax,BYTE PTR [rdi+0x5]
    78f0:	shl    r9d,0x18
    78f4:	shl    eax,0x10
    78f7:	xor    r9d,eax
    78fa:	movzx  eax,BYTE PTR [rdi+0x7]
    78fe:	xor    r9d,eax
    7901:	movzx  eax,BYTE PTR [rdi+0x6]
    7905:	shl    eax,0x8
    7908:	xor    r9d,eax
    790b:	mov    DWORD PTR [rdx+0x4],r9d
    790f:	movzx  r10d,BYTE PTR [rdi+0x8]
    7914:	movzx  eax,BYTE PTR [rdi+0x9]
    7918:	shl    r10d,0x18
    791c:	shl    eax,0x10
    791f:	xor    r10d,eax
    7922:	movzx  eax,BYTE PTR [rdi+0xb]
    7926:	xor    r10d,eax
    7929:	movzx  eax,BYTE PTR [rdi+0xa]
    792d:	shl    eax,0x8
    7930:	xor    r10d,eax
    7933:	mov    DWORD PTR [rdx+0x8],r10d
    7937:	movzx  ecx,BYTE PTR [rdi+0xc]
    793b:	movzx  eax,BYTE PTR [rdi+0xd]
    793f:	shl    ecx,0x18
    7942:	shl    eax,0x10
    7945:	xor    ecx,eax
    7947:	movzx  eax,BYTE PTR [rdi+0xf]
    794b:	xor    ecx,eax
    794d:	movzx  eax,BYTE PTR [rdi+0xe]
    7951:	shl    eax,0x8
    7954:	xor    ecx,eax
    7956:	mov    DWORD PTR [rdx+0xc],ecx
    7959:	cmp    esi,0x80
    795f:	je     7a60 <AES_set_encrypt_key+0x1e0>
    7965:	movzx  eax,BYTE PTR [rdi+0x10]
    7969:	movzx  r11d,BYTE PTR [rdi+0x11]
    796e:	shl    eax,0x18
    7971:	shl    r11d,0x10
    7975:	xor    eax,r11d
    7978:	movzx  r11d,BYTE PTR [rdi+0x13]
    797d:	xor    eax,r11d
    7980:	movzx  r11d,BYTE PTR [rdi+0x12]
    7985:	shl    r11d,0x8
    7989:	xor    eax,r11d
    798c:	mov    DWORD PTR [rdx+0x10],eax
    798f:	movzx  ebx,BYTE PTR [rdi+0x14]
    7993:	movzx  eax,BYTE PTR [rdi+0x15]
    7997:	shl    ebx,0x18
    799a:	shl    eax,0x10
    799d:	xor    ebx,eax
    799f:	movzx  eax,BYTE PTR [rdi+0x17]
    79a3:	xor    ebx,eax
    79a5:	movzx  eax,BYTE PTR [rdi+0x16]
    79a9:	shl    eax,0x8
    79ac:	xor    ebx,eax
    79ae:	mov    DWORD PTR [rdx+0x14],ebx
    79b1:	cmp    esi,0xc0
    79b7:	je     7af0 <AES_set_encrypt_key+0x270>
    79bd:	movzx  eax,BYTE PTR [rdi+0x18]
    79c1:	movzx  r11d,BYTE PTR [rdi+0x19]
    79c6:	shl    eax,0x18
    79c9:	shl    r11d,0x10
    79cd:	xor    eax,r11d
    79d0:	movzx  r11d,BYTE PTR [rdi+0x1b]
    79d5:	xor    eax,r11d
    79d8:	movzx  r11d,BYTE PTR [rdi+0x1a]
    79dd:	shl    r11d,0x8
    79e1:	xor    eax,r11d
    79e4:	mov    DWORD PTR [rdx+0x18],eax
    79e7:	movzx  ebx,BYTE PTR [rdi+0x1c]
    79eb:	movzx  eax,BYTE PTR [rdi+0x1d]
    79ef:	shl    ebx,0x18
    79f2:	shl    eax,0x10
    79f5:	xor    ebx,eax
    79f7:	movzx  eax,BYTE PTR [rdi+0x1f]
    79fb:	xor    ebx,eax
    79fd:	movzx  eax,BYTE PTR [rdi+0x1e]
    7a01:	shl    eax,0x8
    7a04:	xor    ebx,eax
    7a06:	mov    DWORD PTR [rdx+0x1c],ebx
    7a09:	cmp    esi,0x100
    7a0f:	je     7ba0 <AES_set_encrypt_key+0x320>
    7a15:	pop    rbx
    7a16:	xor    eax,eax
    7a18:	pop    rbp
    7a19:	pop    r12
    7a1b:	pop    r14
    7a1d:	ret
    7a1e:	xchg   ax,ax
    7a20:	cmp    esi,0x100
    7a26:	jne    7c9f <AES_set_encrypt_key+0x41f>
    7a2c:	mov    DWORD PTR [rdx+0xf0],0xe
    7a36:	jmp    78b8 <AES_set_encrypt_key+0x38>
    7a3b:	nop    DWORD PTR [rax+rax*1+0x0]
    7a40:	cmp    esi,0xc0
    7a46:	jne    7a2c <AES_set_encrypt_key+0x1ac>
    7a48:	mov    DWORD PTR [rdx+0xf0],0xc
    7a52:	jmp    78b8 <AES_set_encrypt_key+0x38>
    7a57:	nop    WORD PTR [rax+rax*1+0x0]
    7a60:	lea    rdi,[rip+0x164fd]        # 1df64 <rcon+0x4>
    7a67:	add    rdx,0x10
    7a6b:	mov    r11d,0x1000000
    7a71:	lea    rbx,[rdi+0x24]
    7a75:	lea    rsi,[rip+0x17924]        # 1f3a0 <Te4>
    7a7c:	jmp    7a8b <AES_set_encrypt_key+0x20b>
    7a7e:	xchg   ax,ax
    7a80:	mov    r11d,DWORD PTR [rdi]
    7a83:	add    rdx,0x10
    7a87:	add    rdi,0x4
    7a8b:	movzx  eax,cl
    7a8e:	mov    ebp,ecx
    7a90:	mov    eax,DWORD PTR [rsi+rax*4]
    7a93:	shr    ebp,0x18
    7a96:	movzx  ebp,BYTE PTR [rsi+rbp*4]
    7a9a:	and    eax,0xff00
    7a9f:	or     eax,ebp
    7aa1:	mov    ebp,ecx
    7aa3:	shr    ebp,0x10
    7aa6:	movzx  ebp,bpl
    7aaa:	mov    ebp,DWORD PTR [rsi+rbp*4]
    7aad:	and    ebp,0xff000000
    7ab3:	xor    eax,ebp
    7ab5:	movzx  ebp,ch
    7ab8:	mov    ebp,DWORD PTR [rsi+rbp*4]
    7abb:	and    ebp,0xff0000
    7ac1:	xor    eax,ebp
    7ac3:	xor    eax,r8d
    7ac6:	xor    eax,r11d
    7ac9:	xor    r9d,eax
    7acc:	mov    r8d,eax
    7acf:	mov    DWORD PTR [rdx],eax
    7ad1:	xor    r10d,r9d
    7ad4:	mov    DWORD PTR [rdx+0x4],r9d
    7ad8:	xor    ecx,r10d
    7adb:	mov    DWORD PTR [rdx+0x8],r10d
    7adf:	mov    DWORD PTR [rdx+0xc],ecx
    7ae2:	cmp    rbx,rdi
    7ae5:	jne    7a80 <AES_set_encrypt_key+0x200>
    7ae7:	pop    rbx
    7ae8:	xor    eax,eax
    7aea:	pop    rbp
    7aeb:	pop    r12
    7aed:	pop    r14
    7aef:	ret
    7af0:	lea    rdi,[rip+0x16469]        # 1df60 <rcon>
    7af7:	add    rdx,0x18
    7afb:	mov    r11d,0x1000000
    7b01:	lea    r14,[rdi+0x20]
    7b05:	lea    rsi,[rip+0x17894]        # 1f3a0 <Te4>
    7b0c:	jmp    7b24 <AES_set_encrypt_key+0x2a4>
    7b0e:	xchg   ax,ax
    7b10:	mov    eax,DWORD PTR [rdx-0x8]
    7b13:	add    rdx,0x18
    7b17:	xor    eax,ecx
    7b19:	xor    ebx,eax
    7b1b:	mov    DWORD PTR [rdx-0x8],eax
    7b1e:	mov    DWORD PTR [rdx-0x4],ebx
    7b21:	mov    r11d,DWORD PTR [rdi]
    7b24:	movzx  eax,bl
    7b27:	mov    r12d,ebx
    7b2a:	movzx  ebp,bh
    7b2d:	add    rdi,0x4
    7b31:	mov    eax,DWORD PTR [rsi+rax*4]
    7b34:	shr    r12d,0x18
    7b38:	movzx  r12d,BYTE PTR [rsi+r12*4]
    7b3d:	and    eax,0xff00
    7b42:	or     eax,r12d
    7b45:	mov    r12d,ebx
    7b48:	shr    r12d,0x10
    7b4c:	movzx  r12d,r12b
    7b50:	mov    r12d,DWORD PTR [rsi+r12*4]
    7b54:	and    r12d,0xff000000
    7b5b:	xor    eax,r12d
    7b5e:	mov    r12d,DWORD PTR [rsi+rbp*4]
    7b62:	and    r12d,0xff0000
    7b69:	xor    eax,r12d
    7b6c:	xor    eax,r8d
    7b6f:	xor    eax,r11d
    7b72:	xor    r9d,eax
    7b75:	mov    r8d,eax
    7b78:	mov    DWORD PTR [rdx],eax
    7b7a:	xor    r10d,r9d
    7b7d:	mov    DWORD PTR [rdx+0x4],r9d
    7b81:	xor    ecx,r10d
    7b84:	mov    DWORD PTR [rdx+0x8],r10d
    7b88:	mov    DWORD PTR [rdx+0xc],ecx
    7b8b:	cmp    r14,rdi
    7b8e:	jne    7b10 <AES_set_encrypt_key+0x290>
    7b90:	pop    rbx
    7b91:	xor    eax,eax
    7b93:	pop    rbp
    7b94:	pop    r12
    7b96:	pop    r14
    7b98:	ret
    7b99:	nop    DWORD PTR [rax+0x0]
    7ba0:	lea    rdi,[rip+0x163b9]        # 1df60 <rcon>
    7ba7:	add    rdx,0x20
    7bab:	mov    r11d,0x1000000
    7bb1:	lea    r14,[rdi+0x1c]
    7bb5:	lea    rsi,[rip+0x177e4]        # 1f3a0 <Te4>
    7bbc:	jmp    7c20 <AES_set_encrypt_key+0x3a0>
    7bbe:	xchg   ax,ax
    7bc0:	mov    eax,ecx
    7bc2:	movzx  ebp,ch
    7bc5:	movzx  r12d,cl
    7bc9:	add    rdx,0x20
    7bcd:	shr    eax,0x10
    7bd0:	mov    r11d,DWORD PTR [rsi+rbp*4]
    7bd4:	movzx  r12d,BYTE PTR [rsi+r12*4]
    7bd9:	movzx  eax,al
    7bdc:	mov    eax,DWORD PTR [rsi+rax*4]
    7bdf:	and    r11d,0xff00
    7be6:	and    eax,0xff0000
    7beb:	or     eax,r11d
    7bee:	mov    r11d,ecx
    7bf1:	xor    eax,DWORD PTR [rdx-0x30]
    7bf4:	shr    r11d,0x18
    7bf8:	mov    r11d,DWORD PTR [rsi+r11*4]
    7bfc:	and    r11d,0xff000000
    7c03:	or     r11d,r12d
    7c06:	xor    eax,r11d
    7c09:	mov    DWORD PTR [rdx-0x10],eax
    7c0c:	xor    eax,DWORD PTR [rdx-0x2c]
    7c0f:	mov    DWORD PTR [rdx-0xc],eax
    7c12:	xor    eax,DWORD PTR [rdx-0x28]
    7c15:	xor    ebx,eax
    7c17:	mov    DWORD PTR [rdx-0x8],eax
    7c1a:	mov    DWORD PTR [rdx-0x4],ebx
    7c1d:	mov    r11d,DWORD PTR [rdi]
    7c20:	movzx  eax,bl
    7c23:	mov    r12d,ebx
    7c26:	movzx  ebp,bh
    7c29:	add    rdi,0x4
    7c2d:	mov    eax,DWORD PTR [rsi+rax*4]
    7c30:	shr    r12d,0x18
    7c34:	movzx  r12d,BYTE PTR [rsi+r12*4]
    7c39:	and    eax,0xff00
    7c3e:	or     eax,r12d
    7c41:	mov    r12d,ebx
    7c44:	shr    r12d,0x10
    7c48:	movzx  r12d,r12b
    7c4c:	mov    r12d,DWORD PTR [rsi+r12*4]
    7c50:	and    r12d,0xff000000
    7c57:	xor    eax,r12d
    7c5a:	mov    r12d,DWORD PTR [rsi+rbp*4]
    7c5e:	and    r12d,0xff0000
    7c65:	xor    eax,r12d
    7c68:	xor    eax,r8d
    7c6b:	xor    eax,r11d
    7c6e:	xor    r9d,eax
    7c71:	mov    r8d,eax
    7c74:	mov    DWORD PTR [rdx],eax
    7c76:	xor    r10d,r9d
    7c79:	mov    DWORD PTR [rdx+0x4],r9d
    7c7d:	xor    ecx,r10d
    7c80:	mov    DWORD PTR [rdx+0x8],r10d
    7c84:	mov    DWORD PTR [rdx+0xc],ecx
    7c87:	cmp    r14,rdi
    7c8a:	jne    7bc0 <AES_set_encrypt_key+0x340>
    7c90:	pop    rbx
    7c91:	xor    eax,eax
    7c93:	pop    rbp
    7c94:	pop    r12
    7c96:	pop    r14
    7c98:	ret
    7c99:	mov    eax,0xffffffff
    7c9e:	ret
    7c9f:	mov    eax,0xfffffffe
    7ca4:	ret
    7ca5:	data16 nop WORD PTR cs:[rax+rax*1+0x0]

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

0000000000007ea0 <AES_encrypt>:
    7ea0:	push   r15
    7ea2:	lea    r11,[rip+0x184f7]        # 203a0 <Te0>
    7ea9:	lea    r10,[rip+0x178f0]        # 1f7a0 <Te3>
    7eb0:	push   r14
    7eb2:	lea    r9,[rip+0x180e7]        # 1ffa0 <Te1>
    7eb9:	lea    r8,[rip+0x17ce0]        # 1fba0 <Te2>
    7ec0:	push   r13
    7ec2:	push   r12
    7ec4:	push   rbp
    7ec5:	push   rbx
    7ec6:	mov    rbx,rdx
    7ec9:	movzx  eax,BYTE PTR [rdi]
    7ecc:	movzx  ebp,BYTE PTR [rdi+0x4]
    7ed0:	movzx  r12d,BYTE PTR [rdi+0x8]
    7ed5:	shl    eax,0x18
    7ed8:	mov    QWORD PTR [rsp-0x18],rdx
    7edd:	movzx  edx,BYTE PTR [rdi+0x1]
    7ee1:	shl    ebp,0x18
    7ee4:	shl    r12d,0x18
    7ee8:	mov    QWORD PTR [rsp-0x10],rsi
    7eed:	movzx  esi,BYTE PTR [rdi+0xc]
    7ef1:	shl    edx,0x10
    7ef4:	xor    eax,edx
    7ef6:	movzx  edx,BYTE PTR [rdi+0x3]
    7efa:	shl    esi,0x18
    7efd:	xor    eax,edx
    7eff:	movzx  edx,BYTE PTR [rdi+0x2]
    7f03:	shl    edx,0x8
    7f06:	xor    eax,edx
    7f08:	movzx  edx,BYTE PTR [rdi+0x5]
    7f0c:	xor    eax,DWORD PTR [rbx]
    7f0e:	shl    edx,0x10
    7f11:	xor    ebp,edx
    7f13:	movzx  edx,BYTE PTR [rdi+0x7]
    7f17:	xor    ebp,edx
    7f19:	movzx  edx,BYTE PTR [rdi+0x6]
    7f1d:	shl    edx,0x8
    7f20:	xor    ebp,edx
    7f22:	movzx  edx,BYTE PTR [rdi+0x9]
    7f26:	xor    ebp,DWORD PTR [rbx+0x4]
    7f29:	shl    edx,0x10
    7f2c:	xor    r12d,edx
    7f2f:	movzx  edx,BYTE PTR [rdi+0xb]
    7f33:	xor    r12d,edx
    7f36:	movzx  edx,BYTE PTR [rdi+0xa]
    7f3a:	shl    edx,0x8
    7f3d:	xor    r12d,edx
    7f40:	movzx  edx,BYTE PTR [rdi+0xd]
    7f44:	xor    r12d,DWORD PTR [rbx+0x8]
    7f48:	shl    edx,0x10
    7f4b:	xor    esi,edx
    7f4d:	movzx  edx,BYTE PTR [rdi+0xf]
    7f51:	xor    esi,edx
    7f53:	movzx  edx,BYTE PTR [rdi+0xe]
    7f57:	mov    rdi,rbx
    7f5a:	shl    edx,0x8
    7f5d:	xor    esi,edx
    7f5f:	xor    esi,DWORD PTR [rbx+0xc]
    7f62:	mov    ebx,DWORD PTR [rbx+0xf0]
    7f68:	mov    edx,ebx
    7f6a:	mov    DWORD PTR [rsp-0x40],ebx
    7f6e:	sar    edx,1
    7f70:	sub    edx,0x1
    7f73:	mov    DWORD PTR [rsp-0x4],edx
    7f77:	add    rdx,0x1
    7f7b:	shl    rdx,0x5
    7f7f:	add    rdx,rdi
    7f82:	mov    QWORD PTR [rsp-0x20],rdx
    7f87:	jmp    8006 <AES_encrypt+0x166>
    7f89:	nop    DWORD PTR [rax+0x0]
    7f90:	mov    edx,DWORD PTR [rsp-0x3c]
    7f94:	mov    eax,DWORD PTR [r11+r12*4]
    7f98:	mov    esi,esi
    7f9a:	mov    ebx,ebx
    7f9c:	xor    eax,DWORD PTR [r10+r13*4]
    7fa0:	xor    eax,r14d
    7fa3:	xor    eax,DWORD PTR [r9+rbp*4]
    7fa7:	mov    ebp,DWORD PTR [r11+rdx*4]
    7fab:	xor    eax,DWORD PTR [r8+rsi*4]
    7faf:	mov    edx,DWORD PTR [rsp-0x38]
    7fb3:	mov    esi,DWORD PTR [rsp-0x30]
    7fb7:	xor    ebp,DWORD PTR [r10+rsi*4]
    7fbb:	xor    ebp,DWORD PTR [rdi+0x4]
    7fbe:	xor    ebp,DWORD PTR [r9+rdx*4]
    7fc2:	mov    edx,DWORD PTR [rsp-0x34]
    7fc6:	xor    ebp,DWORD PTR [r8+rdx*4]
    7fca:	mov    edx,DWORD PTR [rsp-0x2c]
    7fce:	mov    r12d,DWORD PTR [r11+rdx*4]
    7fd2:	mov    edx,DWORD PTR [rsp-0x24]
    7fd6:	xor    r12d,DWORD PTR [r10+r15*4]
    7fda:	mov    r15d,DWORD PTR [rsp-0x28]
    7fdf:	xor    r12d,DWORD PTR [rdi+0x8]
    7fe3:	xor    r12d,DWORD PTR [r9+r15*4]
    7fe7:	xor    r12d,DWORD PTR [r8+rdx*4]
    7feb:	mov    edx,DWORD PTR [rsp-0x8]
    7fef:	mov    esi,DWORD PTR [r11+rdx*4]
    7ff3:	mov    edx,DWORD PTR [rsp-0x40]
    7ff7:	xor    esi,DWORD PTR [r10+rcx*4]
    7ffb:	xor    esi,DWORD PTR [rdi+0xc]
    7ffe:	xor    esi,DWORD PTR [r9+rdx*4]
    8002:	xor    esi,DWORD PTR [r8+rbx*4]
    8006:	mov    edx,eax
    8008:	movzx  ecx,sil
    800c:	mov    ebx,r12d
    800f:	movzx  r13d,al
    8013:	shr    edx,0x18
    8016:	add    rdi,0x20
    801a:	mov    edx,DWORD PTR [r11+rdx*4]
    801e:	xor    edx,DWORD PTR [r10+rcx*4]
    8022:	mov    ecx,ebp
    8024:	shr    ecx,0x10
    8027:	xor    edx,DWORD PTR [rdi-0x10]
    802a:	movzx  ecx,cl
    802d:	xor    edx,DWORD PTR [r9+rcx*4]
    8031:	movzx  ecx,bh
    8034:	xor    edx,DWORD PTR [r8+rcx*4]
    8038:	mov    ecx,ebp
    803a:	shr    ecx,0x18
    803d:	mov    r14d,edx
    8040:	movzx  edx,ah
    8043:	shr    eax,0x10
    8046:	mov    ebx,DWORD PTR [r11+rcx*4]
    804a:	mov    ecx,r12d
    804d:	xor    ebx,DWORD PTR [r10+r13*4]
    8051:	movzx  r13d,bpl
    8055:	shr    ecx,0x10
    8058:	xor    ebx,DWORD PTR [rdi-0xc]
    805b:	mov    DWORD PTR [rsp-0x40],r14d
    8060:	movzx  eax,al
    8063:	movzx  ecx,cl
    8066:	xor    ebx,DWORD PTR [r9+rcx*4]
    806a:	mov    ecx,esi
    806c:	movzx  ecx,ch
    806f:	xor    ebx,DWORD PTR [r8+rcx*4]
    8073:	mov    ecx,r12d
    8076:	movzx  r12d,r12b
    807a:	shr    ecx,0x18
    807d:	mov    ecx,DWORD PTR [r11+rcx*4]
    8081:	xor    ecx,DWORD PTR [r10+r13*4]
    8085:	mov    r13d,esi
    8088:	shr    esi,0x18
    808b:	shr    r13d,0x10
    808f:	xor    ecx,DWORD PTR [rdi-0x8]
    8092:	mov    esi,DWORD PTR [r11+rsi*4]
    8096:	movzx  r13d,r13b
    809a:	xor    esi,DWORD PTR [r10+r12*4]
    809e:	xor    esi,DWORD PTR [rdi-0x4]
    80a1:	mov    r12d,r14d
    80a4:	xor    ecx,DWORD PTR [r9+r13*4]
    80a8:	xor    ecx,DWORD PTR [r8+rdx*4]
    80ac:	mov    edx,ebp
    80ae:	mov    ebp,ebx
    80b0:	mov    r15d,ecx
    80b3:	xor    esi,DWORD PTR [r9+rax*4]
    80b7:	mov    r14d,DWORD PTR [rdi]
    80ba:	shr    ebp,0x10
    80bd:	shr    r15d,0x10
    80c1:	mov    eax,esi
    80c3:	movzx  esi,dh
    80c6:	mov    edx,ebx
    80c8:	movzx  r15d,r15b
    80cc:	xor    eax,DWORD PTR [r8+rsi*4]
    80d0:	shr    edx,0x18
    80d3:	movzx  esi,ch
    80d6:	mov    DWORD PTR [rsp-0x3c],edx
    80da:	movzx  edx,ah
    80dd:	movzx  r13d,al
    80e1:	shr    r12d,0x18
    80e5:	mov    DWORD PTR [rsp-0x38],r15d
    80ea:	movzx  r15d,BYTE PTR [rsp-0x40]
    80f0:	movzx  ebp,bpl
    80f4:	mov    DWORD PTR [rsp-0x34],edx
    80f8:	mov    DWORD PTR [rsp-0x30],r15d
    80fd:	mov    r15d,ecx
    8100:	movzx  ecx,cl
    8103:	shr    r15d,0x18
    8107:	mov    DWORD PTR [rsp-0x2c],r15d
    810c:	mov    r15d,eax
    810f:	shr    eax,0x18
    8112:	shr    r15d,0x10
    8116:	mov    DWORD PTR [rsp-0x8],eax
    811a:	movzx  edx,r15b
    811e:	movzx  r15d,bl
    8122:	movzx  ebx,bh
    8125:	mov    DWORD PTR [rsp-0x28],edx
    8129:	mov    edx,DWORD PTR [rsp-0x40]
    812d:	movzx  edx,dh
    8130:	mov    DWORD PTR [rsp-0x24],edx
    8134:	mov    edx,DWORD PTR [rsp-0x40]
    8138:	shr    edx,0x10
    813b:	movzx  eax,dl
    813e:	mov    DWORD PTR [rsp-0x40],eax
    8142:	cmp    rdi,QWORD PTR [rsp-0x20]
    8147:	jne    7f90 <AES_encrypt+0xf0>
    814d:	mov    edx,DWORD PTR [rsp-0x4]
    8151:	mov    r8,QWORD PTR [rsp-0x18]
    8156:	mov    eax,r14d
    8159:	mov    r14d,esi
    815c:	lea    rdi,[rip+0x1723d]        # 1f3a0 <Te4>
    8163:	mov    r9,QWORD PTR [rsp-0x10]
    8168:	mov    ebx,ebx
    816a:	add    rdx,0x1
    816e:	movzx  esi,BYTE PTR [rdi+r13*4]
    8173:	shl    rdx,0x5
    8177:	add    r8,rdx
    817a:	mov    edx,DWORD PTR [rdi+r14*4]
    817e:	and    edx,0xff00
    8184:	or     edx,esi
    8186:	mov    esi,edx
    8188:	mov    edx,DWORD PTR [rdi+rbp*4]
    818b:	xor    esi,eax
    818d:	mov    eax,DWORD PTR [rdi+r12*4]
    8191:	and    edx,0xff0000
    8197:	and    eax,0xff000000
    819c:	or     eax,edx
    819e:	xor    eax,esi
    81a0:	bswap  eax
    81a2:	mov    DWORD PTR [r9],eax
    81a5:	mov    eax,DWORD PTR [rsp-0x34]
    81a9:	mov    edx,DWORD PTR [rdi+rax*4]
    81ac:	mov    eax,DWORD PTR [rsp-0x30]
    81b0:	movzx  eax,BYTE PTR [rdi+rax*4]
    81b4:	and    edx,0xff00
    81ba:	or     edx,eax
    81bc:	mov    eax,DWORD PTR [rsp-0x3c]
    81c0:	xor    edx,DWORD PTR [r8+0x4]
    81c4:	mov    eax,DWORD PTR [rdi+rax*4]
    81c7:	and    eax,0xff000000
    81cc:	mov    esi,eax
    81ce:	mov    eax,DWORD PTR [rsp-0x38]
    81d2:	mov    eax,DWORD PTR [rdi+rax*4]
    81d5:	and    eax,0xff0000
    81da:	or     eax,esi
    81dc:	xor    edx,eax
    81de:	mov    eax,DWORD PTR [rsp-0x24]
    81e2:	bswap  edx
    81e4:	mov    DWORD PTR [r9+0x4],edx
    81e8:	movzx  edx,BYTE PTR [rdi+r15*4]
    81ed:	mov    eax,DWORD PTR [rdi+rax*4]
    81f0:	mov    r15d,DWORD PTR [rsp-0x28]
    81f5:	and    eax,0xff00
    81fa:	mov    esi,DWORD PTR [rdi+r15*4]
    81fe:	or     eax,edx
    8200:	xor    eax,DWORD PTR [r8+0x8]
    8204:	mov    edx,eax
    8206:	mov    eax,DWORD PTR [rsp-0x2c]
    820a:	and    esi,0xff0000
    8210:	mov    eax,DWORD PTR [rdi+rax*4]
    8213:	and    eax,0xff000000
    8218:	or     eax,esi
    821a:	mov    esi,DWORD PTR [rsp-0x8]
    821e:	xor    eax,edx
    8220:	movzx  edx,BYTE PTR [rdi+rcx*4]
    8224:	bswap  eax
    8226:	mov    DWORD PTR [r9+0x8],eax
    822a:	mov    eax,DWORD PTR [rdi+rbx*4]
    822d:	and    eax,0xff00
    8232:	or     eax,edx
    8234:	mov    edx,DWORD PTR [rdi+rsi*4]
    8237:	xor    eax,DWORD PTR [r8+0xc]
    823b:	mov    ecx,edx
    823d:	mov    edx,DWORD PTR [rsp-0x40]
    8241:	and    ecx,0xff000000
    8247:	mov    edx,DWORD PTR [rdi+rdx*4]
    824a:	and    edx,0xff0000
    8250:	or     edx,ecx
    8252:	xor    eax,edx
    8254:	bswap  eax
    8256:	mov    DWORD PTR [r9+0xc],eax
    825a:	pop    rbx
    825b:	pop    rbp
    825c:	pop    r12
    825e:	pop    r13
    8260:	pop    r14
    8262:	pop    r15
    8264:	ret
    8265:	data16 nop WORD PTR cs:[rax+rax*1+0x0]

0000000000008270 <AES_decrypt>:
    8270:	push   r15
    8272:	lea    r11,[rip+0x16d27]        # 1efa0 <Td0>
    8279:	lea    r10,[rip+0x16120]        # 1e3a0 <Td3>
    8280:	push   r14
    8282:	lea    r9,[rip+0x16917]        # 1eba0 <Td1>
    8289:	lea    r8,[rip+0x16510]        # 1e7a0 <Td2>
    8290:	push   r13
    8292:	push   r12
    8294:	push   rbp
    8295:	push   rbx
    8296:	mov    rbx,rdx
    8299:	movzx  eax,BYTE PTR [rdi]
    829c:	movzx  ebp,BYTE PTR [rdi+0x4]
    82a0:	movzx  r12d,BYTE PTR [rdi+0x8]
    82a5:	shl    eax,0x18
    82a8:	mov    QWORD PTR [rsp-0x18],rdx
    82ad:	movzx  edx,BYTE PTR [rdi+0x1]
    82b1:	shl    ebp,0x18
    82b4:	shl    r12d,0x18
    82b8:	mov    QWORD PTR [rsp-0x10],rsi
    82bd:	movzx  esi,BYTE PTR [rdi+0xc]
    82c1:	shl    edx,0x10
    82c4:	xor    eax,edx
    82c6:	movzx  edx,BYTE PTR [rdi+0x3]
    82ca:	shl    esi,0x18
    82cd:	xor    eax,edx
    82cf:	movzx  edx,BYTE PTR [rdi+0x2]
    82d3:	shl    edx,0x8
    82d6:	xor    eax,edx
    82d8:	movzx  edx,BYTE PTR [rdi+0x5]
    82dc:	xor    eax,DWORD PTR [rbx]
    82de:	shl    edx,0x10
    82e1:	xor    ebp,edx
    82e3:	movzx  edx,BYTE PTR [rdi+0x7]
    82e7:	xor    ebp,edx
    82e9:	movzx  edx,BYTE PTR [rdi+0x6]
    82ed:	shl    edx,0x8
    82f0:	xor    ebp,edx
    82f2:	movzx  edx,BYTE PTR [rdi+0x9]
    82f6:	xor    ebp,DWORD PTR [rbx+0x4]
    82f9:	shl    edx,0x10
    82fc:	xor    r12d,edx
    82ff:	movzx  edx,BYTE PTR [rdi+0xb]
    8303:	xor    r12d,edx
    8306:	movzx  edx,BYTE PTR [rdi+0xa]
    830a:	shl    edx,0x8
    830d:	xor    r12d,edx
    8310:	movzx  edx,BYTE PTR [rdi+0xd]
    8314:	xor    r12d,DWORD PTR [rbx+0x8]
    8318:	shl    edx,0x10
    831b:	xor    esi,edx
    831d:	movzx  edx,BYTE PTR [rdi+0xf]
    8321:	xor    esi,edx
    8323:	movzx  edx,BYTE PTR [rdi+0xe]
    8327:	mov    rdi,rbx
    832a:	shl    edx,0x8
    832d:	xor    esi,edx
    832f:	xor    esi,DWORD PTR [rbx+0xc]
    8332:	mov    ebx,DWORD PTR [rbx+0xf0]
    8338:	mov    edx,ebx
    833a:	mov    DWORD PTR [rsp-0x44],ebx
    833e:	sar    edx,1
    8340:	sub    edx,0x1
    8343:	mov    DWORD PTR [rsp-0x4],edx
    8347:	add    rdx,0x1
    834b:	shl    rdx,0x5
    834f:	add    rdx,rdi
    8352:	mov    QWORD PTR [rsp-0x20],rdx
    8357:	jmp    83d6 <AES_decrypt+0x166>
    8359:	nop    DWORD PTR [rax+0x0]
    8360:	mov    edx,DWORD PTR [rsp-0x40]
    8364:	mov    eax,DWORD PTR [r11+r12*4]
    8368:	mov    esi,esi
    836a:	mov    ebx,ebx
    836c:	xor    eax,DWORD PTR [r10+r13*4]
    8370:	xor    eax,r14d
    8373:	xor    eax,DWORD PTR [r9+rbp*4]
    8377:	mov    ebp,DWORD PTR [r11+rdx*4]
    837b:	xor    eax,DWORD PTR [r8+rsi*4]
    837f:	mov    edx,DWORD PTR [rsp-0x3c]
    8383:	mov    esi,DWORD PTR [rsp-0x34]
    8387:	xor    ebp,DWORD PTR [r10+rsi*4]
    838b:	xor    ebp,DWORD PTR [rdi+0x4]
    838e:	xor    ebp,DWORD PTR [r9+rdx*4]
    8392:	mov    edx,DWORD PTR [rsp-0x38]
    8396:	xor    ebp,DWORD PTR [r8+rdx*4]
    839a:	mov    edx,DWORD PTR [rsp-0x30]
    839e:	mov    r12d,DWORD PTR [r11+rdx*4]
    83a2:	mov    edx,DWORD PTR [rsp-0x28]
    83a6:	xor    r12d,DWORD PTR [r10+r15*4]
    83aa:	mov    r15d,DWORD PTR [rsp-0x2c]
    83af:	xor    r12d,DWORD PTR [rdi+0x8]
    83b3:	xor    r12d,DWORD PTR [r9+r15*4]
    83b7:	xor    r12d,DWORD PTR [r8+rdx*4]
    83bb:	mov    edx,DWORD PTR [rsp-0x24]
    83bf:	mov    esi,DWORD PTR [r11+rdx*4]
    83c3:	mov    edx,DWORD PTR [rsp-0x8]
    83c7:	xor    esi,DWORD PTR [r10+rcx*4]
    83cb:	xor    esi,DWORD PTR [rdi+0xc]
    83ce:	xor    esi,DWORD PTR [r9+rdx*4]
    83d2:	xor    esi,DWORD PTR [r8+rbx*4]
    83d6:	mov    edx,eax
    83d8:	movzx  ebx,bpl
    83dc:	movzx  r13d,r12b
    83e0:	movzx  r14d,al
    83e4:	shr    edx,0x18
    83e7:	add    rdi,0x20
    83eb:	mov    ecx,DWORD PTR [r11+rdx*4]
    83ef:	mov    edx,esi
    83f1:	xor    ecx,DWORD PTR [r10+rbx*4]
    83f5:	mov    ebx,r12d
    83f8:	shr    edx,0x10
    83fb:	xor    ecx,DWORD PTR [rdi-0x10]
    83fe:	movzx  edx,dl
    8401:	xor    ecx,DWORD PTR [r9+rdx*4]
    8405:	movzx  edx,bh
    8408:	xor    ecx,DWORD PTR [r8+rdx*4]
    840c:	mov    edx,ebp
    840e:	shr    edx,0x18
    8411:	mov    r15d,ecx
    8414:	movzx  ecx,ah
    8417:	mov    ebx,DWORD PTR [r11+rdx*4]
    841b:	mov    edx,eax
    841d:	xor    ebx,DWORD PTR [r10+r13*4]
    8421:	movzx  r13d,sil
    8425:	shr    edx,0x10
    8428:	xor    ebx,DWORD PTR [rdi-0xc]
    842b:	mov    DWORD PTR [rsp-0x44],r15d
    8430:	movzx  edx,dl
    8433:	xor    ebx,DWORD PTR [r9+rdx*4]
    8437:	mov    edx,esi
    8439:	shr    esi,0x18
    843c:	movzx  edx,dh
    843f:	mov    eax,DWORD PTR [r11+rsi*4]
    8443:	xor    eax,DWORD PTR [r10+r14*4]
    8447:	xor    ebx,DWORD PTR [r8+rdx*4]
    844b:	mov    edx,r12d
    844e:	shr    r12d,0x10
    8452:	xor    eax,DWORD PTR [rdi-0x4]
    8455:	shr    edx,0x18
    8458:	movzx  r12d,r12b
    845c:	mov    edx,DWORD PTR [r11+rdx*4]
    8460:	xor    edx,DWORD PTR [r10+r13*4]
    8464:	mov    r13d,ebp
    8467:	shr    r13d,0x10
    846b:	xor    eax,DWORD PTR [r9+r12*4]
    846f:	mov    r12d,r15d
    8472:	shr    r15d,0x10
    8476:	movzx  r13d,r13b
    847a:	xor    edx,DWORD PTR [rdi-0x8]
    847d:	movzx  r15d,r15b
    8481:	shr    r12d,0x18
    8485:	xor    edx,DWORD PTR [r9+r13*4]
    8489:	mov    r14d,DWORD PTR [rdi]
    848c:	mov    DWORD PTR [rsp-0x3c],r15d
    8491:	movzx  r13d,bl
    8495:	xor    edx,DWORD PTR [r8+rcx*4]
    8499:	mov    ecx,ebp
    849b:	movzx  r15d,dl
    849f:	movzx  esi,ch
    84a2:	mov    ecx,ebx
    84a4:	mov    DWORD PTR [rsp-0x34],r15d
    84a9:	mov    r15d,edx
    84ac:	xor    eax,DWORD PTR [r8+rsi*4]
    84b0:	shr    ecx,0x18
    84b3:	shr    r15d,0x18
    84b7:	mov    DWORD PTR [rsp-0x40],ecx
    84bb:	movzx  ecx,ah
    84be:	mov    ebp,eax
    84c0:	mov    DWORD PTR [rsp-0x30],r15d
    84c5:	mov    r15d,ebx
    84c8:	shr    ebp,0x10
    84cb:	movzx  esi,dh
    84ce:	shr    r15d,0x10
    84d2:	mov    DWORD PTR [rsp-0x38],ecx
    84d6:	movzx  ebp,bpl
    84da:	movzx  ebx,bh
    84dd:	movzx  ecx,r15b
    84e1:	movzx  r15d,al
    84e5:	shr    eax,0x18
    84e8:	mov    DWORD PTR [rsp-0x2c],ecx
    84ec:	mov    ecx,DWORD PTR [rsp-0x44]
    84f0:	shr    edx,0x10
    84f3:	mov    DWORD PTR [rsp-0x24],eax
    84f7:	movzx  eax,dl
    84fa:	movzx  ecx,ch
    84fd:	mov    DWORD PTR [rsp-0x8],eax
    8501:	mov    DWORD PTR [rsp-0x28],ecx
    8505:	movzx  ecx,BYTE PTR [rsp-0x44]
    850a:	cmp    rdi,QWORD PTR [rsp-0x20]
    850f:	jne    8360 <AES_decrypt+0xf0>
    8515:	mov    edx,DWORD PTR [rsp-0x4]
    8519:	mov    r8,QWORD PTR [rsp-0x18]
    851e:	mov    eax,r14d
    8521:	mov    r14d,esi
    8524:	lea    rdi,[rip+0x15a75]        # 1dfa0 <Td4>
    852b:	mov    r9,QWORD PTR [rsp-0x10]
    8530:	mov    ebx,ebx
    8532:	add    rdx,0x1
    8536:	movzx  esi,BYTE PTR [rdi+r13*4]
    853b:	shl    rdx,0x5
    853f:	add    r8,rdx
    8542:	mov    edx,DWORD PTR [rdi+r14*4]
    8546:	and    edx,0xff00
    854c:	or     edx,esi
    854e:	mov    esi,edx
    8550:	mov    edx,DWORD PTR [rdi+rbp*4]
    8553:	xor    esi,eax
    8555:	mov    eax,DWORD PTR [rdi+r12*4]
    8559:	and    edx,0xff0000
    855f:	and    eax,0xff000000
    8564:	or     eax,edx
    8566:	xor    eax,esi
    8568:	bswap  eax
    856a:	mov    DWORD PTR [r9],eax
    856d:	mov    eax,DWORD PTR [rsp-0x38]
    8571:	mov    edx,DWORD PTR [rdi+rax*4]
    8574:	mov    eax,DWORD PTR [rsp-0x34]
    8578:	movzx  eax,BYTE PTR [rdi+rax*4]
    857c:	and    edx,0xff00
    8582:	or     edx,eax
    8584:	mov    eax,DWORD PTR [rsp-0x40]
    8588:	xor    edx,DWORD PTR [r8+0x4]
    858c:	mov    eax,DWORD PTR [rdi+rax*4]
    858f:	and    eax,0xff000000
    8594:	mov    esi,eax
    8596:	mov    eax,DWORD PTR [rsp-0x3c]
    859a:	mov    eax,DWORD PTR [rdi+rax*4]
    859d:	and    eax,0xff0000
    85a2:	or     eax,esi
    85a4:	xor    edx,eax
    85a6:	mov    eax,DWORD PTR [rsp-0x28]
    85aa:	bswap  edx
    85ac:	mov    DWORD PTR [r9+0x4],edx
    85b0:	movzx  edx,BYTE PTR [rdi+r15*4]
    85b5:	mov    eax,DWORD PTR [rdi+rax*4]
    85b8:	mov    r15d,DWORD PTR [rsp-0x2c]
    85bd:	and    eax,0xff00
    85c2:	mov    esi,DWORD PTR [rdi+r15*4]
    85c6:	or     eax,edx
    85c8:	xor    eax,DWORD PTR [r8+0x8]
    85cc:	mov    edx,eax
    85ce:	mov    eax,DWORD PTR [rsp-0x30]
    85d2:	and    esi,0xff0000
    85d8:	mov    eax,DWORD PTR [rdi+rax*4]
    85db:	and    eax,0xff000000
    85e0:	or     eax,esi
    85e2:	mov    esi,DWORD PTR [rsp-0x24]
    85e6:	xor    eax,edx
    85e8:	movzx  edx,BYTE PTR [rdi+rcx*4]
    85ec:	bswap  eax
    85ee:	mov    DWORD PTR [r9+0x8],eax
    85f2:	mov    eax,DWORD PTR [rdi+rbx*4]
    85f5:	and    eax,0xff00
    85fa:	or     eax,edx
    85fc:	mov    edx,DWORD PTR [rdi+rsi*4]
    85ff:	xor    eax,DWORD PTR [r8+0xc]
    8603:	mov    ecx,edx
    8605:	mov    edx,DWORD PTR [rsp-0x8]
    8609:	and    ecx,0xff000000
    860f:	mov    edx,DWORD PTR [rdi+rdx*4]
    8612:	and    edx,0xff0000
    8618:	or     edx,ecx
    861a:	xor    eax,edx
    861c:	bswap  eax
    861e:	mov    DWORD PTR [r9+0xc],eax
    8622:	pop    rbx
    8623:	pop    rbp
    8624:	pop    r12
    8626:	pop    r13
    8628:	pop    r14
    862a:	pop    r15
    862c:	ret
    862d:	nop    DWORD PTR [rax]

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

0000000000008860 <vmdk_flush>:
    8860:	mov    rax,QWORD PTR [rdi+0x40]
    8864:	mov    rdi,QWORD PTR [rax]
    8867:	jmp    19700 <bdrv_flush>
    886c:	nop    DWORD PTR [rax+0x0]

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

0000000000008e00 <get_cluster_offset>:
    8e00:	push   rbp
    8e01:	mov    r8,rdi
    8e04:	mov    r9,rdx
    8e07:	mov    r10d,ecx
    8e0a:	mov    rbp,rsp
    8e0d:	push   r15
    8e0f:	push   r14
    8e11:	mov    r14,rsi
    8e14:	push   r13
    8e16:	push   r12
    8e18:	push   rbx
    8e19:	sub    rsp,0x58
    8e1d:	mov    rbx,QWORD PTR [rdi+0x40]
    8e21:	mov    rax,QWORD PTR fs:0x28
    8e2a:	mov    QWORD PTR [rbp-0x38],rax
    8e2e:	xor    eax,eax
    8e30:	test   rsi,rsi
    8e33:	je     8e3c <get_cluster_offset+0x3c>
    8e35:	mov    DWORD PTR [rsi+0x10],0x0
    8e3c:	mov    r13,r9
    8e3f:	mov    ecx,DWORD PTR [rbx+0x2c]
    8e42:	xor    edx,edx
    8e44:	shr    r13,0x9
    8e48:	mov    rax,r13
    8e4b:	div    rcx
    8e4e:	mov    r11,rax
    8e51:	cmp    DWORD PTR [rbx+0x28],eax
    8e54:	jbe    8f00 <get_cluster_offset+0x100>
    8e5a:	mov    rdx,QWORD PTR [rbx+0x18]
    8e5e:	mov    eax,eax
    8e60:	mov    r12d,DWORD PTR [rdx+rax*4]
    8e64:	test   r12d,r12d
    8e67:	je     8f00 <get_cluster_offset+0x100>
    8e6d:	xor    eax,eax
    8e6f:	nop
    8e70:	movsxd rdx,eax
    8e73:	cmp    DWORD PTR [rbx+rax*4+0x40],r12d
    8e78:	je     8f30 <get_cluster_offset+0x130>
    8e7e:	add    rax,0x1
    8e82:	cmp    rax,0x10
    8e86:	jne    8e70 <get_cluster_offset+0x70>
    8e88:	xor    eax,eax
    8e8a:	mov    ecx,0xffffffff
    8e8f:	xor    r15d,r15d
    8e92:	nop    WORD PTR [rax+rax*1+0x0]
    8e98:	mov    edx,DWORD PTR [rbx+rax*4+0x80]
    8e9f:	cmp    edx,ecx
    8ea1:	jae    8ea8 <get_cluster_offset+0xa8>
    8ea3:	mov    ecx,edx
    8ea5:	movsxd r15,eax
    8ea8:	add    rax,0x1
    8eac:	cmp    rax,0x10
    8eb0:	jne    8e98 <get_cluster_offset+0x98>
    8eb2:	mov    ecx,DWORD PTR [rbx+0x30]
    8eb5:	mov    edx,r15d
    8eb8:	mov    rax,QWORD PTR [rbx+0x38]
    8ebc:	mov    esi,r12d
    8ebf:	mov    rdi,QWORD PTR [rbx]
    8ec2:	shl    rsi,0x9
    8ec6:	mov    QWORD PTR [rbp-0x68],r8
    8eca:	imul   edx,ecx
    8ecd:	shl    ecx,0x2
    8ed0:	mov    QWORD PTR [rbp-0x60],r9
    8ed4:	mov    DWORD PTR [rbp-0x58],r10d
    8ed8:	mov    QWORD PTR [rbp-0x50],r11
    8edc:	lea    rdx,[rax+rdx*4]
    8ee0:	mov    QWORD PTR [rbp-0x48],rdx
    8ee4:	call   18b00 <bdrv_pread>
    8ee9:	mov    ecx,DWORD PTR [rbx+0x30]
    8eec:	cdqe
    8eee:	lea    rdx,[rcx*4+0x0]
    8ef6:	cmp    rax,rdx
    8ef9:	je     9068 <get_cluster_offset+0x268>
    8eff:	nop
    8f00:	xor    r13d,r13d
    8f03:	mov    rdi,QWORD PTR [rbp-0x38]
    8f07:	xor    rdi,QWORD PTR fs:0x28
    8f10:	mov    rax,r13
    8f13:	jne    919a <get_cluster_offset+0x39a>
    8f19:	lea    rsp,[rbp-0x28]
    8f1d:	pop    rbx
    8f1e:	pop    r12
    8f20:	pop    r13
    8f22:	pop    r14
    8f24:	pop    r15
    8f26:	pop    rbp
    8f27:	ret
    8f28:	nop    DWORD PTR [rax+rax*1+0x0]
    8f30:	lea    rcx,[rbx+rdx*4]
    8f34:	mov    edi,DWORD PTR [rcx+0x80]
    8f3a:	lea    edx,[rdi+0x1]
    8f3d:	mov    DWORD PTR [rcx+0x80],edx
    8f43:	cmp    edx,0xffffffff
    8f46:	je     9090 <get_cluster_offset+0x290>
    8f4c:	mov    ecx,DWORD PTR [rbx+0x30]
    8f4f:	mov    rdx,QWORD PTR [rbx+0x38]
    8f53:	imul   eax,ecx
    8f56:	lea    rax,[rdx+rax*4]
    8f5a:	mov    QWORD PTR [rbp-0x48],rax
    8f5e:	mov    esi,DWORD PTR [rbx+0xc0]
    8f64:	mov    rax,r13
    8f67:	xor    edx,edx
    8f69:	div    rsi
    8f6c:	xor    edx,edx
    8f6e:	div    rcx
    8f71:	mov    rax,QWORD PTR [rbp-0x48]
    8f75:	mov    r15,rdx
    8f78:	lea    rdx,[rax+rdx*4]
    8f7c:	mov    r13d,DWORD PTR [rdx]
    8f7f:	test   r13,r13
    8f82:	jne    9058 <get_cluster_offset+0x258>
    8f88:	test   r10d,r10d
    8f8b:	je     8f00 <get_cluster_offset+0x100>
    8f91:	mov    eax,DWORD PTR [rbx+0xc8]
    8f97:	xor    r10d,r10d
    8f9a:	mov    DWORD PTR [rbp-0x48],0x0
    8fa1:	test   eax,eax
    8fa3:	je     9138 <get_cluster_offset+0x338>
    8fa9:	mov    rdx,QWORD PTR [r8+0x40]
    8fad:	mov    rdi,rsp
    8fb0:	mov    QWORD PTR [rbp-0x50],rdi
    8fb4:	mov    eax,DWORD PTR [rdx+0xc0]
    8fba:	shl    eax,0x9
    8fbd:	mov    ebx,eax
    8fbf:	mov    DWORD PTR [rbp-0x58],eax
    8fc2:	mov    rax,QWORD PTR [rdx]
    8fc5:	sub    rsp,rbx
    8fc8:	mov    rax,QWORD PTR [rax+0x850]
    8fcf:	test   rax,rax
    8fd2:	je     9130 <get_cluster_offset+0x330>
    8fd8:	mov    rax,QWORD PTR [rax+0x40]
    8fdc:	mov    rdi,rdx
    8fdf:	mov    QWORD PTR [rbp-0x78],r11
    8fe3:	mov    QWORD PTR [rbp-0x70],r9
    8fe7:	mov    QWORD PTR [rbp-0x68],r10
    8feb:	mov    QWORD PTR [rbp-0x80],rax
    8fef:	mov    QWORD PTR [rbp-0x60],rdx
    8ff3:	call   8dc0 <vmdk_is_cid_valid.isra.3>
    8ff8:	test   eax,eax
    8ffa:	je     9124 <get_cluster_offset+0x324>
    9000:	mov    rdx,QWORD PTR [rbp-0x60]
    9004:	mov    r9,QWORD PTR [rbp-0x70]
    9008:	xor    esi,esi
    900a:	mov    ecx,0x1
    900f:	mov    rax,QWORD PTR [rdx]
    9012:	mov    rdx,r9
    9015:	mov    rdi,QWORD PTR [rax+0x850]
    901c:	call   8e00 <get_cluster_offset>
    9021:	mov    r10,QWORD PTR [rbp-0x68]
    9025:	mov    r11,QWORD PTR [rbp-0x78]
    9029:	test   rax,rax
    902c:	jne    90b0 <get_cluster_offset+0x2b0>
    9032:	mov    rsp,QWORD PTR [rbp-0x50]
    9036:	mov    r13,r10
    9039:	test   r14,r14
    903c:	je     9058 <get_cluster_offset+0x258>
    903e:	mov    eax,DWORD PTR [rbp-0x48]
    9041:	mov    DWORD PTR [r14+0x4],r11d
    9045:	mov    DWORD PTR [r14+0x8],r15d
    9049:	mov    DWORD PTR [r14],eax
    904c:	mov    DWORD PTR [r14+0xc],r12d
    9050:	mov    DWORD PTR [r14+0x10],0x1
    9058:	shl    r13,0x9
    905c:	jmp    8f03 <get_cluster_offset+0x103>
    9061:	nop    DWORD PTR [rax+0x0]
    9068:	lea    rax,[rbx+r15*4]
    906c:	mov    r8,QWORD PTR [rbp-0x68]
    9070:	mov    r9,QWORD PTR [rbp-0x60]
    9074:	mov    r10d,DWORD PTR [rbp-0x58]
    9078:	mov    r11,QWORD PTR [rbp-0x50]
    907c:	mov    DWORD PTR [rax+0x40],r12d
    9080:	mov    DWORD PTR [rax+0x80],0x1
    908a:	jmp    8f5e <get_cluster_offset+0x15e>
    908f:	nop
    9090:	lea    rdx,[rbx+0x80]
    9097:	lea    rcx,[rbx+0xc0]
    909e:	xchg   ax,ax
    90a0:	shr    DWORD PTR [rdx],1
    90a2:	add    rdx,0x4
    90a6:	cmp    rcx,rdx
    90a9:	jne    90a0 <get_cluster_offset+0x2a0>
    90ab:	jmp    8f4c <get_cluster_offset+0x14c>
    90b0:	mov    rdi,QWORD PTR [rbp-0x80]
    90b4:	mov    rdx,QWORD PTR [rip+0x212b5]        # 2a370 <activeBDRV>
    90bb:	mov    QWORD PTR [rbp-0x70],r10
    90bf:	mov    esi,DWORD PTR [rdi+0xc0]
    90c5:	mov    r8,QWORD PTR [rdx+0x40]
    90c9:	mov    rdx,rsp
    90cc:	mov    rdi,QWORD PTR [rdi]
    90cf:	mov    ecx,esi
    90d1:	mov    DWORD PTR [rbp-0x60],esi
    90d4:	mov    rsi,rax
    90d7:	shl    ecx,0x9
    90da:	mov    QWORD PTR [rbp-0x68],r8
    90de:	call   18b00 <bdrv_pread>
    90e3:	mov    rdi,QWORD PTR [rbp-0x80]
    90e7:	mov    edx,DWORD PTR [rdi+0xc0]
    90ed:	shl    edx,0x9
    90f0:	cmp    eax,edx
    90f2:	jne    9124 <get_cluster_offset+0x324>
    90f4:	mov    r8,QWORD PTR [rbp-0x68]
    90f8:	mov    rsi,QWORD PTR [rip+0x21279]        # 2a378 <activeBDRV+0x8>
    90ff:	mov    rdx,rsp
    9102:	mov    ecx,DWORD PTR [rbp-0x58]
    9105:	mov    rdi,QWORD PTR [r8]
    9108:	shl    rsi,0x9
    910c:	call   19110 <bdrv_pwrite>
    9111:	mov    r10,QWORD PTR [rbp-0x70]
    9115:	mov    r11,QWORD PTR [rbp-0x78]
    9119:	cdqe
    911b:	cmp    rbx,rax
    911e:	je     9032 <get_cluster_offset+0x232>
    9124:	mov    rsp,QWORD PTR [rbp-0x50]
    9128:	jmp    8f03 <get_cluster_offset+0x103>
    912d:	nop    DWORD PTR [rax]
    9130:	mov    rsp,rdi
    9133:	jmp    9036 <get_cluster_offset+0x236>
    9138:	mov    rdi,QWORD PTR [rbx]
    913b:	mov    QWORD PTR [rbp-0x68],r11
    913f:	mov    QWORD PTR [rbp-0x60],r9
    9143:	mov    QWORD PTR [rbp-0x58],r8
    9147:	mov    QWORD PTR [rbp-0x50],rdx
    914b:	call   191c0 <bdrv_getlength>
    9150:	mov    esi,DWORD PTR [rbx+0xc0]
    9156:	mov    rdi,QWORD PTR [rbx]
    9159:	mov    QWORD PTR [rbp-0x48],rax
    915d:	shl    esi,0x9
    9160:	add    rsi,rax
    9163:	call   19190 <bdrv_truncate>
    9168:	mov    r10,QWORD PTR [rbp-0x48]
    916c:	mov    rdx,QWORD PTR [rbp-0x50]
    9170:	mov    r8,QWORD PTR [rbp-0x58]
    9174:	mov    r11,QWORD PTR [rbp-0x68]
    9178:	shr    r10,0x9
    917c:	mov    r9,QWORD PTR [rbp-0x60]
    9180:	mov    DWORD PTR [rbp-0x48],r10d
    9184:	mov    DWORD PTR [rdx],r10d
    9187:	mov    QWORD PTR [rip+0x211ea],r10        # 2a378 <activeBDRV+0x8>
    918e:	mov    QWORD PTR [rip+0x211db],r8        # 2a370 <activeBDRV>
    9195:	jmp    8fa9 <get_cluster_offset+0x1a9>
    919a:	call   31c0 <__stack_chk_fail@plt>
    919f:	nop

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

0000000000009e30 <cloop_read>:
    9e30:	push   r15
    9e32:	push   r14
    9e34:	push   r13
    9e36:	push   r12
    9e38:	push   rbp
    9e39:	push   rbx
    9e3a:	sub    rsp,0x18
    9e3e:	mov    rbp,QWORD PTR [rdi+0x40]
    9e42:	test   ecx,ecx
    9e44:	jle    9f5a <cloop_read+0x12a>
    9e4a:	lea    eax,[rcx-0x1]
    9e4d:	mov    r13,rsi
    9e50:	mov    r12,rdx
    9e53:	lea    rax,[rsi+rax*1+0x1]
    9e58:	mov    QWORD PTR [rsp],rax
    9e5c:	lea    rax,[rbp+0x30]
    9e60:	mov    QWORD PTR [rsp+0x8],rax
    9e65:	nop    DWORD PTR [rax]
    9e68:	mov    ebx,DWORD PTR [rbp+0x18]
    9e6b:	mov    rax,r13
    9e6e:	cqo
    9e70:	idiv   rbx
    9e73:	mov    rbx,rdx
    9e76:	mov    r14,rax
    9e79:	cmp    eax,DWORD PTR [rbp+0x1c]
    9e7c:	je     9f07 <cloop_read+0xd7>
    9e82:	mov    rdx,QWORD PTR [rbp+0x10]
    9e86:	cdqe
    9e88:	mov    edi,DWORD PTR [rbp+0x0]
    9e8b:	add    rax,0x1
    9e8f:	mov    rsi,QWORD PTR [rdx+rax*8-0x8]
    9e94:	mov    r15,QWORD PTR [rdx+rax*8]
    9e98:	xor    edx,edx
    9e9a:	sub    r15d,esi
    9e9d:	call   3650 <lseek64@plt>
    9ea2:	mov    rsi,QWORD PTR [rbp+0x20]
    9ea6:	mov    edi,DWORD PTR [rbp+0x0]
    9ea9:	mov    edx,r15d
    9eac:	call   52c0 <qemu_read_ok>
    9eb1:	test   eax,eax
    9eb3:	js     9f70 <cloop_read+0x140>
    9eb9:	mov    rax,QWORD PTR [rbp+0x20]
    9ebd:	mov    DWORD PTR [rbp+0x38],r15d
    9ec1:	mov    r15,QWORD PTR [rsp+0x8]
    9ec6:	mov    QWORD PTR [rbp+0x30],rax
    9eca:	mov    rax,QWORD PTR [rbp+0x28]
    9ece:	mov    rdi,r15
    9ed1:	mov    QWORD PTR [rbp+0x48],rax
    9ed5:	mov    eax,DWORD PTR [rbp+0x4]
    9ed8:	mov    DWORD PTR [rbp+0x50],eax
    9edb:	call   3600 <inflateReset@plt>
    9ee0:	test   eax,eax
    9ee2:	jne    9f70 <cloop_read+0x140>
    9ee8:	mov    esi,0x4
    9eed:	mov    rdi,r15
    9ef0:	call   3110 <inflate@plt>
    9ef5:	cmp    eax,0x1
    9ef8:	jne    9f70 <cloop_read+0x140>
    9efa:	mov    eax,DWORD PTR [rbp+0x4]
    9efd:	cmp    QWORD PTR [rbp+0x58],rax
    9f01:	jne    9f70 <cloop_read+0x140>
    9f03:	mov    DWORD PTR [rbp+0x1c],r14d
    9f07:	shl    ebx,0x9
    9f0a:	lea    rdi,[r12+0x8]
    9f0f:	mov    rcx,r12
    9f12:	add    r13,0x1
    9f16:	mov    esi,ebx
    9f18:	add    rsi,QWORD PTR [rbp+0x28]
    9f1c:	and    rdi,0xfffffffffffffff8
    9f20:	add    r12,0x200
    9f27:	mov    rax,QWORD PTR [rsi]
    9f2a:	sub    rcx,rdi
    9f2d:	mov    QWORD PTR [r12-0x200],rax
    9f35:	mov    rax,QWORD PTR [rsi+0x1f8]
    9f3c:	sub    rsi,rcx
    9f3f:	add    ecx,0x200
    9f45:	shr    ecx,0x3
    9f48:	mov    QWORD PTR [r12-0x8],rax
    9f4d:	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
    9f50:	cmp    QWORD PTR [rsp],r13
    9f54:	jne    9e68 <cloop_read+0x38>
    9f5a:	add    rsp,0x18
    9f5e:	xor    eax,eax
    9f60:	pop    rbx
    9f61:	pop    rbp
    9f62:	pop    r12
    9f64:	pop    r13
    9f66:	pop    r14
    9f68:	pop    r15
    9f6a:	ret
    9f6b:	nop    DWORD PTR [rax+rax*1+0x0]
    9f70:	add    rsp,0x18
    9f74:	mov    eax,0xffffffff
    9f79:	pop    rbx
    9f7a:	pop    rbp
    9f7b:	pop    r12
    9f7d:	pop    r13
    9f7f:	pop    r14
    9f81:	pop    r15
    9f83:	ret
    9f84:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    9f8f:	nop

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

000000000000a4d0 <dmg_open>:
    a4d0:	push   r15
    a4d2:	xor    eax,eax
    a4d4:	push   r14
    a4d6:	push   r13
    a4d8:	mov    r13d,edx
    a4db:	push   r12
    a4dd:	push   rbp
    a4de:	mov    rbp,rsi
    a4e1:	xor    esi,esi
    a4e3:	push   rbx
    a4e4:	mov    rbx,rdi
    a4e7:	sub    rsp,0x38
    a4eb:	mov    r15,QWORD PTR [rdi+0x40]
    a4ef:	mov    rdi,rbp
    a4f2:	call   3500 <open64@plt>
    a4f7:	mov    DWORD PTR [r15],eax
    a4fa:	test   eax,eax
    a4fc:	js     a5b0 <dmg_open+0xe0>
    a502:	mov    DWORD PTR [rbx+0x8],0x1
    a509:	mov    edi,DWORD PTR [r15]
    a50c:	mov    edx,0x2
    a511:	mov    rsi,0xfffffffffffffe28
    a518:	mov    DWORD PTR [r15+0x4],0x0
    a520:	mov    QWORD PTR [r15+0x28],0x0
    a528:	mov    QWORD PTR [r15+0x20],0x0
    a530:	mov    QWORD PTR [r15+0x18],0x0
    a538:	mov    QWORD PTR [r15+0x10],0x0
    a540:	call   3650 <lseek64@plt>
    a545:	test   rax,rax
    a548:	js     a57c <dmg_open+0xac>
    a54a:	mov    edi,DWORD PTR [r15]
    a54d:	call   a480 <read_off>
    a552:	mov    r12,rax
    a555:	test   rax,rax
    a558:	je     a57c <dmg_open+0xac>
    a55a:	mov    edi,DWORD PTR [r15]
    a55d:	xor    edx,edx
    a55f:	mov    rsi,rax
    a562:	call   3650 <lseek64@plt>
    a567:	test   rax,rax
    a56a:	js     a57c <dmg_open+0xac>
    a56c:	mov    edi,DWORD PTR [r15]
    a56f:	call   a430 <read_uint32>
    a574:	cmp    rax,0x100
    a57a:	je     a5d0 <dmg_open+0x100>
    a57c:	mov    edi,DWORD PTR [r15]
    a57f:	call   3270 <close@plt>
    a584:	mov    edx,r13d
    a587:	mov    rsi,rbp
    a58a:	mov    rdi,rbx
    a58d:	lea    rax,[rip+0x1fc0c]        # 2a1a0 <bdrv_raw>
    a594:	mov    QWORD PTR [rbx+0x38],rax
    a598:	add    rsp,0x38
    a59c:	pop    rbx
    a59d:	pop    rbp
    a59e:	pop    r12
    a5a0:	pop    r13
    a5a2:	pop    r14
    a5a4:	pop    r15
    a5a6:	jmp    QWORD PTR [rip+0x1fc0c]        # 2a1b8 <bdrv_raw+0x18>
    a5ac:	nop    DWORD PTR [rax+0x0]
    a5b0:	call   30d0 <__errno_location@plt>
    a5b5:	mov    eax,DWORD PTR [rax]
    a5b7:	neg    eax
    a5b9:	add    rsp,0x38
    a5bd:	pop    rbx
    a5be:	pop    rbp
    a5bf:	pop    r12
    a5c1:	pop    r13
    a5c3:	pop    r14
    a5c5:	pop    r15
    a5c7:	ret
    a5c8:	nop    DWORD PTR [rax+rax*1+0x0]
    a5d0:	mov    edi,DWORD PTR [r15]
    a5d3:	call   a430 <read_uint32>
    a5d8:	test   eax,eax
    a5da:	je     a57c <dmg_open+0xac>
    a5dc:	mov    eax,eax
    a5de:	mov    edi,DWORD PTR [r15]
    a5e1:	mov    edx,0x1
    a5e6:	mov    esi,0xf8
    a5eb:	add    rax,r12
    a5ee:	mov    QWORD PTR [rsp+0x18],rax
    a5f3:	call   3650 <lseek64@plt>
    a5f8:	test   rax,rax
    a5fb:	js     a57c <dmg_open+0xac>
    a601:	mov    DWORD PTR [rsp+0x10],0x1
    a609:	mov    DWORD PTR [rsp+0x14],0x1
    a611:	mov    QWORD PTR [rsp+0x28],0x0
    a61a:	mov    QWORD PTR [rsp+0x20],0x0
    a623:	mov    edi,DWORD PTR [r15]
    a626:	xor    esi,esi
    a628:	mov    edx,0x1
    a62d:	call   3650 <lseek64@plt>
    a632:	cmp    rax,QWORD PTR [rsp+0x18]
    a637:	jge    a857 <dmg_open+0x387>
    a63d:	mov    edi,DWORD PTR [r15]
    a640:	call   a430 <read_uint32>
    a645:	mov    r12,rax
    a648:	test   eax,eax
    a64a:	je     a57c <dmg_open+0xac>
    a650:	mov    edi,DWORD PTR [r15]
    a653:	call   a430 <read_uint32>
    a658:	cmp    eax,0x6d697368
    a65d:	jne    a668 <dmg_open+0x198>
    a65f:	cmp    r12d,0xf3
    a666:	ja     a680 <dmg_open+0x1b0>
    a668:	mov    edi,DWORD PTR [r15]
    a66b:	lea    esi,[r12-0x4]
    a670:	mov    edx,0x1
    a675:	call   3650 <lseek64@plt>
    a67a:	jmp    a623 <dmg_open+0x153>
    a67c:	nop    DWORD PTR [rax+0x0]
    a680:	mov    edi,DWORD PTR [r15]
    a683:	mov    edx,0x1
    a688:	mov    esi,0xc8
    a68d:	call   3650 <lseek64@plt>
    a692:	test   rax,rax
    a695:	js     a57c <dmg_open+0xac>
    a69b:	sub    r12d,0xcc
    a6a2:	mov    eax,0xcccccccd
    a6a7:	mov    r14d,DWORD PTR [r15+0x4]
    a6ab:	mov    rdi,QWORD PTR [r15+0x8]
    a6af:	mul    r12d
    a6b2:	mov    r12d,edx
    a6b5:	shr    r12d,0x5
    a6b9:	add    r14d,r12d
    a6bc:	mov    DWORD PTR [rsp+0xc],r12d
    a6c1:	shl    r14d,0x3
    a6c5:	mov    esi,r14d
    a6c8:	movsxd r14,r14d
    a6cb:	sar    esi,1
    a6cd:	movsxd rsi,esi
    a6d0:	call   5990 <qemu_realloc>
    a6d5:	mov    rdi,QWORD PTR [r15+0x10]
    a6d9:	mov    rsi,r14
    a6dc:	mov    QWORD PTR [r15+0x8],rax
    a6e0:	call   5990 <qemu_realloc>
    a6e5:	mov    rdi,QWORD PTR [r15+0x18]
    a6e9:	mov    rsi,r14
    a6ec:	mov    QWORD PTR [r15+0x10],rax
    a6f0:	call   5990 <qemu_realloc>
    a6f5:	mov    rdi,QWORD PTR [r15+0x20]
    a6f9:	mov    rsi,r14
    a6fc:	mov    QWORD PTR [r15+0x18],rax
    a700:	call   5990 <qemu_realloc>
    a705:	mov    rdi,QWORD PTR [r15+0x28]
    a709:	mov    rsi,r14
    a70c:	mov    QWORD PTR [r15+0x20],rax
    a710:	call   5990 <qemu_realloc>
    a715:	mov    r14d,DWORD PTR [r15+0x4]
    a719:	mov    QWORD PTR [r15+0x28],rax
    a71d:	lea    eax,[r12+r14*1]
    a721:	cmp    r14d,eax
    a724:	jae    a7c0 <dmg_open+0x2f0>
    a72a:	nop    WORD PTR [rax+rax*1+0x0]
    a730:	mov    edi,DWORD PTR [r15]
    a733:	mov    r12d,r14d
    a736:	call   a430 <read_uint32>
    a73b:	mov    rsi,QWORD PTR [r15+0x8]
    a73f:	mov    DWORD PTR [rsi+r12*4],eax
    a743:	mov    rax,QWORD PTR [r15+0x8]
    a747:	mov    eax,DWORD PTR [rax+r12*4]
    a74b:	lea    esi,[rax-0x1]
    a74e:	cmp    esi,0x1
    a751:	jbe    a7d0 <dmg_open+0x300>
    a753:	cmp    eax,0x80000005
    a758:	je     a7d0 <dmg_open+0x300>
    a75a:	lea    edx,[r14-0x1]
    a75e:	cmp    eax,0xffffffff
    a761:	jne    a78f <dmg_open+0x2bf>
    a763:	mov    eax,edx
    a765:	mov    rsi,QWORD PTR [r15+0x10]
    a769:	mov    rdx,QWORD PTR [r15+0x18]
    a76d:	mov    rdx,QWORD PTR [rdx+rax*8]
    a771:	add    rdx,QWORD PTR [rsi+rax*8]
    a775:	mov    QWORD PTR [rsp+0x20],rdx
    a77a:	mov    rsi,QWORD PTR [r15+0x20]
    a77e:	mov    rdx,QWORD PTR [r15+0x28]
    a782:	mov    rdx,QWORD PTR [rdx+rax*8]
    a786:	add    rdx,QWORD PTR [rsi+rax*8]
    a78a:	mov    QWORD PTR [rsp+0x28],rdx
    a78f:	mov    edi,DWORD PTR [r15]
    a792:	mov    edx,0x1
    a797:	mov    esi,0x24
    a79c:	call   3650 <lseek64@plt>
    a7a1:	test   rax,rax
    a7a4:	js     a57c <dmg_open+0xac>
    a7aa:	sub    DWORD PTR [rsp+0xc],0x1
    a7af:	mov    eax,DWORD PTR [rsp+0xc]
    a7b3:	add    eax,DWORD PTR [r15+0x4]
    a7b7:	cmp    eax,r14d
    a7ba:	ja     a730 <dmg_open+0x260>
    a7c0:	mov    DWORD PTR [r15+0x4],eax
    a7c4:	jmp    a623 <dmg_open+0x153>
    a7c9:	nop    DWORD PTR [rax+0x0]
    a7d0:	mov    edi,DWORD PTR [r15]
    a7d3:	call   a430 <read_uint32>
    a7d8:	mov    edi,DWORD PTR [r15]
    a7db:	call   a480 <read_off>
    a7e0:	mov    rsi,QWORD PTR [r15+0x20]
    a7e4:	add    rax,QWORD PTR [rsp+0x28]
    a7e9:	mov    QWORD PTR [rsi+r12*8],rax
    a7ed:	mov    edi,DWORD PTR [r15]
    a7f0:	call   a480 <read_off>
    a7f5:	mov    rsi,QWORD PTR [r15+0x28]
    a7f9:	mov    QWORD PTR [rsi+r12*8],rax
    a7fd:	mov    edi,DWORD PTR [r15]
    a800:	call   a480 <read_off>
    a805:	mov    rsi,QWORD PTR [r15+0x10]
    a809:	add    rax,QWORD PTR [rsp+0x20]
    a80e:	mov    QWORD PTR [rsi+r12*8],rax
    a812:	mov    edi,DWORD PTR [r15]
    a815:	call   a480 <read_off>
    a81a:	mov    rsi,QWORD PTR [r15+0x18]
    a81e:	mov    edx,DWORD PTR [rsp+0x10]
    a822:	mov    QWORD PTR [rsi+r12*8],rax
    a826:	mov    rax,QWORD PTR [r15+0x18]
    a82a:	mov    esi,DWORD PTR [rsp+0x14]
    a82e:	mov    rax,QWORD PTR [rax+r12*8]
    a832:	cmp    rax,rsi
    a835:	cmovbe eax,esi
    a838:	add    r14d,0x1
    a83c:	mov    DWORD PTR [rsp+0x14],eax
    a840:	mov    rax,QWORD PTR [r15+0x28]
    a844:	mov    rax,QWORD PTR [rax+r12*8]
    a848:	cmp    rax,rdx
    a84b:	cmovbe eax,edx
    a84e:	mov    DWORD PTR [rsp+0x10],eax
    a852:	jmp    a7af <dmg_open+0x2df>
    a857:	mov    eax,DWORD PTR [rsp+0x14]
    a85b:	lea    edi,[rax+0x1]
    a85e:	call   5970 <qemu_malloc>
    a863:	mov    edi,DWORD PTR [rsp+0x10]
    a867:	mov    QWORD PTR [r15+0x38],rax
    a86b:	shl    edi,0x9
    a86e:	call   5970 <qemu_malloc>
    a873:	lea    rdi,[r15+0x48]
    a877:	mov    edx,0x70
    a87c:	lea    rsi,[rip+0x136bc]        # 1df3f <__PRETTY_FUNCTION__.13430+0x8f>
    a883:	mov    QWORD PTR [r15+0x40],rax
    a887:	call   34e0 <inflateInit_@plt>
    a88c:	test   eax,eax
    a88e:	jne    a57c <dmg_open+0xac>
    a894:	mov    edx,DWORD PTR [r15+0x4]
    a898:	mov    DWORD PTR [r15+0x30],edx
    a89c:	jmp    a5b9 <dmg_open+0xe9>
    a8a1:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    a8ac:	nop    DWORD PTR [rax+0x0]

000000000000a8b0 <dmg_probe>:
    a8b0:	push   rbx
    a8b1:	mov    rdi,rdx
    a8b4:	mov    rbx,rdx
    a8b7:	call   31b0 <strlen@plt>
    a8bc:	xor    ecx,ecx
    a8be:	cmp    eax,0x4
    a8c1:	jle    a8e6 <dmg_probe+0x36>
    a8c3:	cdqe
    a8c5:	mov    ecx,0x5
    a8ca:	lea    rdi,[rip+0x16191]        # 20a62 <desc_template.13939+0x182>
    a8d1:	lea    rsi,[rbx+rax*1-0x4]
    a8d6:	repz cmps BYTE PTR ds:[rsi],BYTE PTR es:[rdi]
    a8d8:	seta   al
    a8db:	sbb    al,0x0
    a8dd:	xor    ecx,ecx
    a8df:	test   al,al
    a8e1:	sete   cl
    a8e4:	add    ecx,ecx
    a8e6:	mov    eax,ecx
    a8e8:	pop    rbx
    a8e9:	ret
    a8ea:	nop    WORD PTR [rax+rax*1+0x0]

000000000000a8f0 <bochs_close>:
    a8f0:	push   rbx
    a8f1:	mov    rbx,QWORD PTR [rdi+0x40]
    a8f5:	mov    rdi,QWORD PTR [rbx+0x8]
    a8f9:	call   5960 <qemu_free>
    a8fe:	mov    edi,DWORD PTR [rbx]
    a900:	pop    rbx
    a901:	jmp    3270 <close@plt>
    a906:	nop    WORD PTR cs:[rax+rax*1+0x0]

000000000000a910 <bochs_read>:
    a910:	push   r15
    a912:	mov    rax,rdi
    a915:	push   r14
    a917:	push   r13
    a919:	push   r12
    a91b:	push   rbp
    a91c:	push   rbx
    a91d:	sub    rsp,0x38
    a921:	mov    r13,QWORD PTR [rax+0x40]
    a925:	mov    QWORD PTR [rsp+0x18],rdi
    a92a:	mov    rdi,QWORD PTR fs:0x28
    a933:	mov    QWORD PTR [rsp+0x28],rdi
    a938:	xor    edi,edi
    a93a:	test   ecx,ecx
    a93c:	jle    aa70 <bochs_read+0x160>
    a942:	lea    eax,[rcx-0x1]
    a945:	shl    rsi,0x9
    a949:	mov    rbp,rdx
    a94c:	mov    r15,r13
    a94f:	add    rax,0x1
    a953:	sub    rsi,rdx
    a956:	shl    rax,0x9
    a95a:	mov    QWORD PTR [rsp],rsi
    a95e:	add    rax,rdx
    a961:	mov    QWORD PTR [rsp+0x10],rax
    a966:	lea    rax,[rsp+0x27]
    a96b:	mov    QWORD PTR [rsp+0x8],rax
    a970:	jmp    a993 <bochs_read+0x83>
    a972:	nop    WORD PTR [rax+rax*1+0x0]
    a978:	add    rbp,0x200
    a97f:	cmp    rbp,QWORD PTR [rsp+0x10]
    a984:	je     aa70 <bochs_read+0x160>
    a98a:	mov    rax,QWORD PTR [rsp+0x18]
    a98f:	mov    r15,QWORD PTR [rax+0x40]
    a993:	mov    rax,QWORD PTR [rsp]
    a997:	movsxd rcx,DWORD PTR [r15+0x20]
    a99b:	mov    rsi,QWORD PTR [r15+0x8]
    a99f:	add    rax,rbp
    a9a2:	cqo
    a9a4:	idiv   rcx
    a9a7:	test   rdx,rdx
    a9aa:	lea    rcx,[rdx+0x1ff]
    a9b1:	mov    eax,DWORD PTR [rsi+rax*4]
    a9b4:	cmovns rcx,rdx
    a9b8:	mov    r12,rcx
    a9bb:	mov    r14,rcx
    a9be:	sar    r12,0x9
    a9c2:	cmp    eax,0xffffffff
    a9c5:	je     aa9c <bochs_read+0x18c>
    a9cb:	movsxd rbx,DWORD PTR [r15+0x18]
    a9cf:	mov    esi,DWORD PTR [r15+0x1c]
    a9d3:	mov    edi,DWORD PTR [r15]
    a9d6:	add    esi,ebx
    a9d8:	add    rbx,r12
    a9db:	imul   esi,eax
    a9de:	shl    rbx,0x9
    a9e2:	lea    rax,[rdx+0xfff]
    a9e9:	shl    esi,0x9
    a9ec:	add    esi,DWORD PTR [r15+0x14]
    a9f0:	add    rbx,rsi
    a9f3:	test   rdx,rdx
    a9f6:	cmovs  rdx,rax
    a9fa:	sar    rdx,0xc
    a9fe:	add    rsi,rdx
    aa01:	xor    edx,edx
    aa03:	call   3650 <lseek64@plt>
    aa08:	mov    rsi,QWORD PTR [rsp+0x8]
    aa0d:	mov    edi,DWORD PTR [r15]
    aa10:	mov    edx,0x1
    aa15:	call   32e0 <read@plt>
    aa1a:	test   eax,eax
    aa1c:	js     aa9c <bochs_read+0x18c>
    aa1e:	je     aa91 <bochs_read+0x181>
    aa20:	mov    rcx,r14
    aa23:	movsx  eax,BYTE PTR [rsp+0x27]
    aa28:	sar    rcx,0x3f
    aa2c:	shr    rcx,0x3d
    aa30:	lea    r9,[r12+rcx*1]
    aa34:	and    r9d,0x7
    aa38:	sub    r9,rcx
    aa3b:	bt     eax,r9d
    aa3f:	jae    aa9c <bochs_read+0x18c>
    aa41:	mov    edi,DWORD PTR [r15]
    aa44:	xor    edx,edx
    aa46:	mov    rsi,rbx
    aa49:	call   3650 <lseek64@plt>
    aa4e:	mov    edi,DWORD PTR [r13+0x0]
    aa52:	mov    edx,0x200
    aa57:	mov    rsi,rbp
    aa5a:	call   52c0 <qemu_read_ok>
    aa5f:	test   eax,eax
    aa61:	jns    a978 <bochs_read+0x68>
    aa67:	mov    eax,0xffffffff
    aa6c:	jmp    aa72 <bochs_read+0x162>
    aa6e:	xchg   ax,ax
    aa70:	xor    eax,eax
    aa72:	mov    rdi,QWORD PTR [rsp+0x28]
    aa77:	xor    rdi,QWORD PTR fs:0x28
    aa80:	jne    aad0 <bochs_read+0x1c0>
    aa82:	add    rsp,0x38
    aa86:	pop    rbx
    aa87:	pop    rbp
    aa88:	pop    r12
    aa8a:	pop    r13
    aa8c:	pop    r14
    aa8e:	pop    r15
    aa90:	ret
    aa91:	call   30d0 <__errno_location@plt>
    aa96:	mov    DWORD PTR [rax],0x5
    aa9c:	lea    rdi,[rbp+0x8]
    aaa0:	mov    rcx,rbp
    aaa3:	xor    eax,eax
    aaa5:	mov    QWORD PTR [rbp+0x0],0x0
    aaad:	mov    QWORD PTR [rbp+0x1f8],0x0
    aab8:	and    rdi,0xfffffffffffffff8
    aabc:	sub    rcx,rdi
    aabf:	add    ecx,0x200
    aac5:	shr    ecx,0x3
    aac8:	rep stos QWORD PTR es:[rdi],rax
    aacb:	jmp    a978 <bochs_read+0x68>
    aad0:	call   31c0 <__stack_chk_fail@plt>
    aad5:	data16 nop WORD PTR cs:[rax+rax*1+0x0]

000000000000aae0 <bochs_open>:
    aae0:	push   r14
    aae2:	mov    r14,rdi
    aae5:	push   r13
    aae7:	push   r12
    aae9:	push   rbp
    aaea:	mov    rbp,rsi
    aaed:	mov    esi,0x2
    aaf2:	push   rbx
    aaf3:	sub    rsp,0x410
    aafa:	mov    rbx,QWORD PTR [rdi+0x40]
    aafe:	mov    rdi,rbp
    ab01:	mov    rax,QWORD PTR fs:0x28
    ab0a:	mov    QWORD PTR [rsp+0x408],rax
    ab12:	xor    eax,eax
    ab14:	call   3500 <open64@plt>
    ab19:	mov    r12d,eax
    ab1c:	test   eax,eax
    ab1e:	js     acb8 <bochs_open+0x1d8>
    ab24:	mov    DWORD PTR [r14+0x8],0x1
    ab2c:	mov    r13,rsp
    ab2f:	mov    edx,0x200
    ab34:	mov    edi,r12d
    ab37:	mov    DWORD PTR [rbx],r12d
    ab3a:	mov    rsi,r13
    ab3d:	call   5210 <qemu_read>
    ab42:	cmp    rax,0x200
    ab48:	jne    ace0 <bochs_open+0x200>
    ab4e:	mov    ecx,0x17
    ab53:	lea    rdi,[rip+0x15f0d]        # 20a67 <desc_template.13939+0x187>
    ab5a:	mov    rsi,r13
    ab5d:	repz cmps BYTE PTR ds:[rsi],BYTE PTR es:[rdi]
    ab5f:	seta   al
    ab62:	sbb    al,0x0
    ab64:	test   al,al
    ab66:	jne    ace0 <bochs_open+0x200>
    ab6c:	lea    rsi,[r13+0x20]
    ab70:	mov    ecx,0x8
    ab75:	lea    rdi,[rip+0x15f02]        # 20a7e <desc_template.13939+0x19e>
    ab7c:	repz cmps BYTE PTR ds:[rsi],BYTE PTR es:[rdi]
    ab7e:	seta   al
    ab81:	sbb    al,0x0
    ab83:	test   al,al
    ab85:	jne    ace0 <bochs_open+0x200>
    ab8b:	lea    rsi,[r13+0x30]
    ab8f:	mov    ecx,0x8
    ab94:	lea    rdi,[rip+0x15eeb]        # 20a86 <desc_template.13939+0x1a6>
    ab9b:	repz cmps BYTE PTR ds:[rsi],BYTE PTR es:[rdi]
    ab9d:	seta   bpl
    aba1:	sbb    bpl,0x0
    aba5:	movsx  ebp,bpl
    aba9:	test   ebp,ebp
    abab:	jne    ace0 <bochs_open+0x200>
    abb1:	mov    eax,DWORD PTR [rsp+0x40]
    abb5:	cmp    eax,0x20000
    abba:	je     aca0 <bochs_open+0x1c0>
    abc0:	cmp    eax,0x10000
    abc5:	jne    ace0 <bochs_open+0x200>
    abcb:	lea    rdi,[rsp+0x200]
    abd3:	mov    ecx,0x40
    abd8:	mov    rsi,r13
    abdb:	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
    abde:	mov    rax,QWORD PTR [rsp+0x258]
    abe6:	shr    rax,0x9
    abea:	mov    QWORD PTR [r14],rax
    abed:	mov    esi,DWORD PTR [rsp+0x44]
    abf1:	mov    edi,DWORD PTR [rbx]
    abf3:	xor    edx,edx
    abf5:	call   3650 <lseek64@plt>
    abfa:	mov    edi,DWORD PTR [rsp+0x48]
    abfe:	mov    DWORD PTR [rbx+0x10],edi
    ac01:	shl    edi,0x2
    ac04:	movsxd rdi,edi
    ac07:	call   5970 <qemu_malloc>
    ac0c:	mov    QWORD PTR [rbx+0x8],rax
    ac10:	test   rax,rax
    ac13:	je     ace0 <bochs_open+0x200>
    ac19:	mov    ecx,DWORD PTR [rbx+0x10]
    ac1c:	mov    edi,DWORD PTR [rbx]
    ac1e:	mov    rsi,rax
    ac21:	lea    edx,[rcx*4+0x0]
    ac28:	movsxd rdx,edx
    ac2b:	call   32e0 <read@plt>
    ac30:	mov    ecx,DWORD PTR [rbx+0x10]
    ac33:	lea    edx,[rcx*4+0x0]
    ac3a:	movsxd rcx,edx
    ac3d:	cmp    rcx,rax
    ac40:	jne    ace0 <bochs_open+0x200>
    ac46:	add    edx,DWORD PTR [rsp+0x44]
    ac4a:	mov    DWORD PTR [rbx+0x14],edx
    ac4d:	mov    eax,DWORD PTR [rsp+0x4c]
    ac51:	sub    eax,0x1
    ac54:	shr    eax,0x9
    ac57:	add    eax,0x1
    ac5a:	mov    DWORD PTR [rbx+0x18],eax
    ac5d:	mov    eax,DWORD PTR [rsp+0x50]
    ac61:	sub    eax,0x1
    ac64:	shr    eax,0x9
    ac67:	add    eax,0x1
    ac6a:	mov    DWORD PTR [rbx+0x1c],eax
    ac6d:	mov    eax,DWORD PTR [rsp+0x50]
    ac71:	mov    DWORD PTR [rbx+0x20],eax
    ac74:	mov    rdx,QWORD PTR [rsp+0x408]
    ac7c:	xor    rdx,QWORD PTR fs:0x28
    ac85:	mov    eax,ebp
    ac87:	jne    acef <bochs_open+0x20f>
    ac89:	add    rsp,0x410
    ac90:	pop    rbx
    ac91:	pop    rbp
    ac92:	pop    r12
    ac94:	pop    r13
    ac96:	pop    r14
    ac98:	ret
    ac99:	nop    DWORD PTR [rax+0x0]
    aca0:	mov    rax,QWORD PTR [rsp+0x58]
    aca5:	shr    rax,0x9
    aca9:	mov    QWORD PTR [r14],rax
    acac:	jmp    abed <bochs_open+0x10d>
    acb1:	nop    DWORD PTR [rax+0x0]
    acb8:	xor    esi,esi
    acba:	mov    rdi,rbp
    acbd:	xor    eax,eax
    acbf:	call   3500 <open64@plt>
    acc4:	mov    r12d,eax
    acc7:	test   eax,eax
    acc9:	jns    ab24 <bochs_open+0x44>
    accf:	mov    ebp,0xffffffff
    acd4:	jmp    ac74 <bochs_open+0x194>
    acd6:	nop    WORD PTR cs:[rax+rax*1+0x0]
    ace0:	mov    edi,r12d
    ace3:	mov    ebp,0xffffffff
    ace8:	call   3270 <close@plt>
    aced:	jmp    ac74 <bochs_open+0x194>
    acef:	call   31c0 <__stack_chk_fail@plt>
    acf4:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    acff:	nop

000000000000ad00 <bochs_probe>:
    ad00:	mov    r8,rdi
    ad03:	xor    eax,eax
    ad05:	cmp    esi,0x1ff
    ad0b:	jle    ad82 <bochs_probe+0x82>
    ad0d:	mov    ecx,0x17
    ad12:	lea    rdi,[rip+0x15d4e]        # 20a67 <desc_template.13939+0x187>
    ad19:	mov    rsi,r8
    ad1c:	repz cmps BYTE PTR ds:[rsi],BYTE PTR es:[rdi]
    ad1e:	seta   al
    ad21:	sbb    al,0x0
    ad23:	movsx  eax,al
    ad26:	test   eax,eax
    ad28:	jne    ad80 <bochs_probe+0x80>
    ad2a:	lea    rsi,[r8+0x20]
    ad2e:	mov    ecx,0x8
    ad33:	lea    rdi,[rip+0x15d44]        # 20a7e <desc_template.13939+0x19e>
    ad3a:	repz cmps BYTE PTR ds:[rsi],BYTE PTR es:[rdi]
    ad3c:	seta   dl
    ad3f:	sbb    dl,0x0
    ad42:	test   dl,dl
    ad44:	jne    ad82 <bochs_probe+0x82>
    ad46:	lea    rsi,[r8+0x30]
    ad4a:	mov    ecx,0x8
    ad4f:	lea    rdi,[rip+0x15d30]        # 20a86 <desc_template.13939+0x1a6>
    ad56:	repz cmps BYTE PTR ds:[rsi],BYTE PTR es:[rdi]
    ad58:	seta   al
    ad5b:	sbb    al,0x0
    ad5d:	movsx  eax,al
    ad60:	test   eax,eax
    ad62:	jne    ad80 <bochs_probe+0x80>
    ad64:	mov    edx,DWORD PTR [r8+0x40]
    ad68:	sub    edx,0x10000
    ad6e:	and    edx,0xfffeffff
    ad74:	mov    edx,0x64
    ad79:	cmove  eax,edx
    ad7c:	ret
    ad7d:	nop    DWORD PTR [rax]
    ad80:	xor    eax,eax
    ad82:	ret
    ad83:	nop    WORD PTR cs:[rax+rax*1+0x0]
    ad8d:	nop    DWORD PTR [rax]

000000000000ad90 <vpc_close>:
    ad90:	push   rbx
    ad91:	mov    rbx,QWORD PTR [rdi+0x40]
    ad95:	mov    rdi,QWORD PTR [rbx+0x218]
    ad9c:	call   5960 <qemu_free>
    ada1:	mov    rdi,QWORD PTR [rbx]
    ada4:	pop    rbx
    ada5:	jmp    18130 <bdrv_delete>
    adaa:	nop    WORD PTR [rax+rax*1+0x0]

000000000000adb0 <vpc_write>:
    adb0:	push   rbp
    adb1:	mov    rbp,rsp
    adb4:	push   r15
    adb6:	push   r14
    adb8:	push   r13
    adba:	push   r12
    adbc:	push   rbx
    adbd:	sub    rsp,0x48
    adc1:	mov    r12,QWORD PTR [rdi+0x40]
    adc5:	mov    rax,QWORD PTR fs:0x28
    adce:	mov    QWORD PTR [rbp-0x38],rax
    add2:	xor    eax,eax
    add4:	test   ecx,ecx
    add6:	jle    aef0 <vpc_write+0x140>
    addc:	lea    eax,[rcx-0x1]
    addf:	mov    r13,rdi
    ade2:	mov    r15,rsi
    ade5:	mov    rbx,rdx
    ade8:	lea    rax,[rsi+rax*1+0x1]
    aded:	mov    r14,r12
    adf0:	mov    QWORD PTR [rbp-0x48],rax
    adf4:	lea    rax,[rbp-0x3c]
    adf8:	mov    QWORD PTR [rbp-0x68],rax
    adfc:	jmp    ae19 <vpc_write+0x69>
    adfe:	xchg   ax,ax
    ae00:	add    r15,0x1
    ae04:	add    rbx,0x200
    ae0b:	cmp    r15,QWORD PTR [rbp-0x48]
    ae0f:	je     aef0 <vpc_write+0x140>
    ae15:	mov    r14,QWORD PTR [r13+0x40]
    ae19:	mov    r10,r15
    ae1c:	mov    edi,DWORD PTR [r14+0x230]
    ae23:	xor    edx,edx
    ae25:	shl    r10,0x9
    ae29:	mov    rax,r10
    ae2c:	div    rdi
    ae2f:	mov    rcx,rdx
    ae32:	mov    edx,DWORD PTR [r14+0x234]
    ae39:	shr    rcx,0x9
    ae3d:	cmp    DWORD PTR [r14+0x210],eax
    ae44:	jbe    af18 <vpc_write+0x168>
    ae4a:	mov    rsi,QWORD PTR [r14+0x218]
    ae51:	mov    eax,eax
    ae53:	mov    eax,DWORD PTR [rsi+rax*4]
    ae56:	cmp    eax,0xffffffff
    ae59:	je     af18 <vpc_write+0x168>
    ae5f:	mov    r10d,eax
    ae62:	shl    rcx,0x9
    ae66:	shl    r10,0x9
    ae6a:	lea    r11,[rcx+rdx*1]
    ae6e:	add    r11,r10
    ae71:	cmp    r10,QWORD PTR [r14+0x228]
    ae78:	je     aeca <vpc_write+0x11a>
    ae7a:	lea    rax,[rdx+0xf]
    ae7e:	mov    QWORD PTR [rbp-0x50],rsp
    ae82:	mov    esi,0xff
    ae87:	shr    rax,0x4
    ae8b:	mov    QWORD PTR [r14+0x228],r10
    ae92:	shl    rax,0x4
    ae96:	mov    QWORD PTR [rbp-0x60],r11
    ae9a:	sub    rsp,rax
    ae9d:	mov    QWORD PTR [rbp-0x58],r10
    aea1:	mov    rdi,rsp
    aea4:	call   3250 <memset@plt>
    aea9:	mov    r10,QWORD PTR [rbp-0x58]
    aead:	mov    rdi,QWORD PTR [r14]
    aeb0:	mov    rdx,rsp
    aeb3:	mov    ecx,DWORD PTR [r14+0x234]
    aeba:	mov    rsi,r10
    aebd:	call   19110 <bdrv_pwrite>
    aec2:	mov    rsp,QWORD PTR [rbp-0x50]
    aec6:	mov    r11,QWORD PTR [rbp-0x60]
    aeca:	mov    rsi,r11
    aecd:	mov    rdi,QWORD PTR [r12]
    aed1:	mov    ecx,0x200
    aed6:	mov    rdx,rbx
    aed9:	call   19110 <bdrv_pwrite>
    aede:	cmp    eax,0x200
    aee3:	je     ae00 <vpc_write+0x50>
    aee9:	mov    eax,0xffffffff
    aeee:	jmp    aef2 <vpc_write+0x142>
    aef0:	xor    eax,eax
    aef2:	mov    rbx,QWORD PTR [rbp-0x38]
    aef6:	xor    rbx,QWORD PTR fs:0x28
    aeff:	jne    b090 <vpc_write+0x2e0>
    af05:	lea    rsp,[rbp-0x28]
    af09:	pop    rbx
    af0a:	pop    r12
    af0c:	pop    r13
    af0e:	pop    r14
    af10:	pop    r15
    af12:	pop    rbp
    af13:	ret
    af14:	nop    DWORD PTR [rax+0x0]
    af18:	add    rdx,0xf
    af1c:	mov    QWORD PTR [rbp-0x50],rsp
    af20:	shr    rdx,0x4
    af24:	shl    rdx,0x4
    af28:	sub    rsp,rdx
    af2b:	test   r15,r15
    af2e:	js     b082 <vpc_write+0x2d2>
    af34:	cmp    QWORD PTR [r13+0x0],r15
    af38:	jl     b082 <vpc_write+0x2d2>
    af3e:	mov    rax,r10
    af41:	mov    QWORD PTR [rbp-0x70],r10
    af45:	cqo
    af47:	idiv   rdi
    af4a:	mov    r11d,eax
    af4d:	mov    QWORD PTR [rbp-0x60],rax
    af51:	mov    rax,QWORD PTR [r14+0x218]
    af58:	mov    QWORD PTR [rbp-0x58],r11
    af5c:	lea    rdx,[rax+r11*4]
    af60:	cmp    DWORD PTR [rdx],0xffffffff
    af63:	jne    b082 <vpc_write+0x2d2>
    af69:	mov    rax,QWORD PTR [r14+0x208]
    af70:	mov    esi,0xff
    af75:	mov    rdi,rsp
    af78:	shr    rax,0x9
    af7c:	mov    DWORD PTR [rdx],eax
    af7e:	mov    edx,DWORD PTR [r14+0x234]
    af85:	call   3250 <memset@plt>
    af8a:	mov    ecx,DWORD PTR [r14+0x234]
    af91:	mov    rdi,QWORD PTR [r14]
    af94:	mov    rdx,rsp
    af97:	mov    rsi,QWORD PTR [r14+0x208]
    af9e:	call   19110 <bdrv_pwrite>
    afa3:	mov    eax,DWORD PTR [r14+0x234]
    afaa:	mov    ecx,0x200
    afaf:	add    eax,DWORD PTR [r14+0x230]
    afb6:	add    QWORD PTR [r14+0x208],rax
    afbd:	mov    rax,QWORD PTR [r13+0x40]
    afc1:	mov    rsi,QWORD PTR [rax+0x208]
    afc8:	mov    rdi,QWORD PTR [rax]
    afcb:	lea    rdx,[rax+0x8]
    afcf:	call   19110 <bdrv_pwrite>
    afd4:	test   eax,eax
    afd6:	js     b06d <vpc_write+0x2bd>
    afdc:	mov    rax,QWORD PTR [r14+0x218]
    afe3:	mov    r11,QWORD PTR [rbp-0x58]
    afe7:	mov    ecx,0x4
    afec:	mov    r8,QWORD PTR [rbp-0x60]
    aff0:	mov    rdx,QWORD PTR [rbp-0x68]
    aff4:	mov    eax,DWORD PTR [rax+r11*4]
    aff8:	lea    esi,[r8*4+0x0]
    b000:	add    rsi,QWORD PTR [r14+0x220]
    b007:	bswap  eax
    b009:	mov    DWORD PTR [rbp-0x3c],eax
    b00c:	mov    rdi,QWORD PTR [r14]
    b00f:	call   19110 <bdrv_pwrite>
    b014:	test   eax,eax
    b016:	js     b06d <vpc_write+0x2bd>
    b018:	mov    r8,QWORD PTR [r13+0x40]
    b01c:	mov    r10,QWORD PTR [rbp-0x70]
    b020:	xor    edx,edx
    b022:	mov    ecx,DWORD PTR [r8+0x230]
    b029:	mov    rax,r10
    b02c:	div    rcx
    b02f:	shr    rdx,0x9
    b033:	cmp    DWORD PTR [r8+0x210],eax
    b03a:	jbe    b082 <vpc_write+0x2d2>
    b03c:	mov    ecx,eax
    b03e:	mov    rax,QWORD PTR [r8+0x218]
    b045:	mov    edi,DWORD PTR [rax+rcx*4]
    b048:	cmp    edi,0xffffffff
    b04b:	je     b082 <vpc_write+0x2d2>
    b04d:	mov    ecx,DWORD PTR [r8+0x234]
    b054:	shl    rdx,0x9
    b058:	shl    rdi,0x9
    b05c:	mov    rsp,QWORD PTR [rbp-0x50]
    b060:	lea    rax,[rcx+rdx*1]
    b064:	lea    rsi,[rax+rdi*1]
    b068:	jmp    aecd <vpc_write+0x11d>
    b06d:	mov    eax,DWORD PTR [r14+0x234]
    b074:	add    eax,DWORD PTR [r14+0x230]
    b07b:	sub    QWORD PTR [r14+0x208],rax
    b082:	mov    eax,0xffffffff
    b087:	mov    rsp,QWORD PTR [rbp-0x50]
    b08b:	jmp    aef2 <vpc_write+0x142>
    b090:	call   31c0 <__stack_chk_fail@plt>
    b095:	data16 nop WORD PTR cs:[rax+rax*1+0x0]

000000000000b1b0 <vpc_open>:
    b1b0:	push   r13
    b1b2:	mov    r13,rsi
    b1b5:	push   r12
    b1b7:	mov    r12,rdi
    b1ba:	push   rbp
    b1bb:	push   rbx
    b1bc:	sub    rsp,0x218
    b1c3:	mov    rbx,QWORD PTR [rdi+0x40]
    b1c7:	mov    rax,QWORD PTR fs:0x28
    b1d0:	mov    QWORD PTR [rsp+0x208],rax
    b1d8:	xor    eax,eax
    b1da:	mov    rdi,rbx
    b1dd:	call   19080 <bdrv_file_open>
    b1e2:	mov    ebp,eax
    b1e4:	test   eax,eax
    b1e6:	js     b3c6 <vpc_open+0x216>
    b1ec:	lea    rbp,[rbx+0x8]
    b1f0:	mov    rdi,QWORD PTR [rbx]
    b1f3:	xor    esi,esi
    b1f5:	mov    ecx,0x200
    b1fa:	mov    rdx,rbp
    b1fd:	call   18b00 <bdrv_pread>
    b202:	cmp    eax,0x200
    b207:	jne    b412 <vpc_open+0x262>
    b20d:	mov    ecx,0x8
    b212:	lea    rdi,[rip+0x1587b]        # 20a94 <desc_template.13939+0x1b4>
    b219:	mov    rsi,rbp
    b21c:	repz cmps BYTE PTR ds:[rsi],BYTE PTR es:[rdi]
    b21e:	seta   al
    b221:	sbb    al,0x0
    b223:	test   al,al
    b225:	jne    b412 <vpc_open+0x262>
    b22b:	mov    edi,DWORD PTR [rbx+0x48]
    b22e:	mov    DWORD PTR [rbx+0x48],0x0
    b235:	mov    rsi,rbp
    b238:	xor    eax,eax
    b23a:	lea    rcx,[rbx+0x208]
    b241:	bswap  edi
    b243:	nop    DWORD PTR [rax+rax*1+0x0]
    b248:	movzx  edx,BYTE PTR [rsi]
    b24b:	add    rsi,0x1
    b24f:	add    eax,edx
    b251:	cmp    rcx,rsi
    b254:	jne    b248 <vpc_open+0x98>
    b256:	not    eax
    b258:	cmp    edi,eax
    b25a:	jne    b3f0 <vpc_open+0x240>
    b260:	movzx  edx,WORD PTR [rbx+0x40]
    b264:	movzx  eax,BYTE PTR [rbx+0x42]
    b268:	mov    rbp,rsp
    b26b:	mov    ecx,0x200
    b270:	rol    dx,0x8
    b274:	movzx  edx,dx
    b277:	imul   rax,rdx
    b27b:	movzx  edx,BYTE PTR [rbx+0x43]
    b27f:	imul   rax,rdx
    b283:	mov    rdx,rbp
    b286:	mov    QWORD PTR [r12],rax
    b28a:	mov    rsi,QWORD PTR [rbx+0x18]
    b28e:	mov    rdi,QWORD PTR [rbx]
    b291:	bswap  rsi
    b294:	call   18b00 <bdrv_pread>
    b299:	cmp    eax,0x200
    b29e:	jne    b412 <vpc_open+0x262>
    b2a4:	mov    rsi,rbp
    b2a7:	mov    ecx,0x8
    b2ac:	lea    rdi,[rip+0x157ea]        # 20a9d <desc_template.13939+0x1bd>
    b2b3:	repz cmps BYTE PTR ds:[rsi],BYTE PTR es:[rdi]
    b2b5:	seta   bpl
    b2b9:	sbb    bpl,0x0
    b2bd:	movsx  ebp,bpl
    b2c1:	test   ebp,ebp
    b2c3:	jne    b412 <vpc_open+0x262>
    b2c9:	mov    eax,DWORD PTR [rsp+0x20]
    b2cd:	mov    edi,DWORD PTR [rsp+0x1c]
    b2d1:	bswap  eax
    b2d3:	mov    DWORD PTR [rbx+0x230],eax
    b2d9:	shr    eax,0xc
    b2dc:	bswap  edi
    b2de:	add    eax,0x1ff
    b2e3:	mov    DWORD PTR [rbx+0x210],edi
    b2e9:	shl    edi,0x2
    b2ec:	and    eax,0xfffffe00
    b2f1:	movsxd rdi,edi
    b2f4:	mov    DWORD PTR [rbx+0x234],eax
    b2fa:	call   5970 <qemu_malloc>
    b2ff:	mov    rsi,QWORD PTR [rsp+0x10]
    b304:	mov    edi,DWORD PTR [rbx+0x210]
    b30a:	mov    QWORD PTR [rbx+0x218],rax
    b311:	mov    rdx,rax
    b314:	bswap  rsi
    b317:	mov    QWORD PTR [rbx+0x220],rsi
    b31e:	lea    ecx,[rdi*4+0x0]
    b325:	mov    rdi,QWORD PTR [rbx]
    b328:	call   18b00 <bdrv_pread>
    b32d:	mov    edx,DWORD PTR [rbx+0x210]
    b333:	lea    ecx,[rdx*4+0x0]
    b33a:	cmp    eax,ecx
    b33c:	jne    b412 <vpc_open+0x262>
    b342:	mov    rcx,QWORD PTR [rbx+0x220]
    b349:	cdqe
    b34b:	lea    rax,[rcx+rax*1+0x1ff]
    b353:	and    rax,0xfffffffffffffe00
    b359:	mov    QWORD PTR [rbx+0x208],rax
    b360:	test   edx,edx
    b362:	jle    b3bb <vpc_open+0x20b>
    b364:	mov    rcx,QWORD PTR [rbx+0x218]
    b36b:	xor    edx,edx
    b36d:	nop    DWORD PTR [rax]
    b370:	lea    rcx,[rcx+rdx*4]
    b374:	mov    eax,DWORD PTR [rcx]
    b376:	bswap  eax
    b378:	mov    DWORD PTR [rcx],eax
    b37a:	mov    rcx,QWORD PTR [rbx+0x218]
    b381:	mov    eax,DWORD PTR [rcx+rdx*4]
    b384:	cmp    eax,0xffffffff
    b387:	je     b3af <vpc_open+0x1ff>
    b389:	mov    esi,DWORD PTR [rbx+0x234]
    b38f:	shl    rax,0x9
    b393:	add    rax,rsi
    b396:	mov    esi,DWORD PTR [rbx+0x230]
    b39c:	add    rax,rsi
    b39f:	cmp    QWORD PTR [rbx+0x208],rax
    b3a6:	jae    b3af <vpc_open+0x1ff>
    b3a8:	mov    QWORD PTR [rbx+0x208],rax
    b3af:	add    rdx,0x1
    b3b3:	cmp    DWORD PTR [rbx+0x210],edx
    b3b9:	jg     b370 <vpc_open+0x1c0>
    b3bb:	mov    QWORD PTR [rbx+0x228],0xffffffffffffffff
    b3c6:	mov    rdi,QWORD PTR [rsp+0x208]
    b3ce:	xor    rdi,QWORD PTR fs:0x28
    b3d7:	mov    eax,ebp
    b3d9:	jne    b421 <vpc_open+0x271>
    b3db:	add    rsp,0x218
    b3e2:	pop    rbx
    b3e3:	pop    rbp
    b3e4:	pop    r12
    b3e6:	pop    r13
    b3e8:	ret
    b3e9:	nop    DWORD PTR [rax+0x0]
    b3f0:	mov    rdi,QWORD PTR [rip+0x1ef09]        # 2a300 <stderr@@GLIBC_2.2.5>
    b3f7:	mov    rcx,r13
    b3fa:	mov    esi,0x1
    b3ff:	xor    eax,eax
    b401:	lea    rdx,[rip+0x156a8]        # 20ab0 <desc_template.13939+0x1d0>
    b408:	call   3660 <__fprintf_chk@plt>
    b40d:	jmp    b260 <vpc_open+0xb0>
    b412:	mov    rdi,QWORD PTR [rbx]
    b415:	mov    ebp,0xffffffff
    b41a:	call   18130 <bdrv_delete>
    b41f:	jmp    b3c6 <vpc_open+0x216>
    b421:	call   31c0 <__stack_chk_fail@plt>
    b426:	nop    WORD PTR cs:[rax+rax*1+0x0]

000000000000b430 <vpc_probe>:
    b430:	mov    rdx,rdi
    b433:	xor    eax,eax
    b435:	cmp    esi,0x7
    b438:	jle    b45b <vpc_probe+0x2b>
    b43a:	mov    ecx,0x8
    b43f:	lea    rdi,[rip+0x1564e]        # 20a94 <desc_template.13939+0x1b4>
    b446:	mov    rsi,rdx
    b449:	repz cmps BYTE PTR ds:[rsi],BYTE PTR es:[rdi]
    b44b:	seta   al
    b44e:	sbb    al,0x0
    b450:	movsx  eax,al
    b453:	cmp    eax,0x1
    b456:	sbb    eax,eax
    b458:	and    eax,0x64
    b45b:	ret
    b45c:	nop    DWORD PTR [rax+0x0]

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

000000000000c2a0 <vvfat_read>:
    c2a0:	push   r15
    c2a2:	push   r14
    c2a4:	push   r13
    c2a6:	push   r12
    c2a8:	push   rbp
    c2a9:	push   rbx
    c2aa:	sub    rsp,0x38
    c2ae:	mov    r12,QWORD PTR [rdi+0x40]
    c2b2:	mov    QWORD PTR [rsp],rdx
    c2b6:	mov    rax,QWORD PTR fs:0x28
    c2bf:	mov    QWORD PTR [rsp+0x28],rax
    c2c4:	xor    eax,eax
    c2c6:	test   ecx,ecx
    c2c8:	jle    c41b <vvfat_read+0x17b>
    c2ce:	mov    eax,DWORD PTR [r12+0x8070]
    c2d6:	mov    r13,rsi
    c2d9:	cmp    rsi,rax
    c2dc:	jge    c7d7 <vvfat_read+0x537>
    c2e2:	lea    rax,[rsp+0x24]
    c2e7:	xor    r14d,r14d
    c2ea:	mov    ebp,ecx
    c2ec:	mov    QWORD PTR [rsp+0x8],rax
    c2f1:	jmp    c354 <vvfat_read+0xb4>
    c2f3:	nop    DWORD PTR [rax+rax*1+0x0]
    c2f8:	mov    rdi,QWORD PTR [r12+0x80b0]
    c300:	mov    edx,r14d
    c303:	mov    ecx,DWORD PTR [rsp+0x24]
    c307:	mov    rsi,r13
    c30a:	shl    edx,0x9
    c30d:	mov    rax,QWORD PTR [rdi+0x38]
    c311:	movsxd rdx,edx
    c314:	add    rdx,QWORD PTR [rsp]
    c318:	call   QWORD PTR [rax+0x20]
    c31b:	test   eax,eax
    c31d:	jne    c7d7 <vvfat_read+0x537>
    c323:	mov    eax,DWORD PTR [rsp+0x24]
    c327:	sub    eax,0x1
    c32a:	add    r14d,eax
    c32d:	cdqe
    c32f:	add    r13,rax
    c332:	add    r14d,0x1
    c336:	add    r13,0x1
    c33a:	cmp    ebp,r14d
    c33d:	jle    c41b <vvfat_read+0x17b>
    c343:	mov    eax,DWORD PTR [r12+0x8070]
    c34b:	cmp    rax,r13
    c34e:	jle    c7d7 <vvfat_read+0x537>
    c354:	mov    rdi,QWORD PTR [r12+0x80b0]
    c35c:	test   rdi,rdi
    c35f:	je     c37d <vvfat_read+0xdd>
    c361:	mov    rax,QWORD PTR [rdi+0x38]
    c365:	mov    edx,ebp
    c367:	mov    rcx,QWORD PTR [rsp+0x8]
    c36c:	mov    rsi,r13
    c36f:	sub    edx,r14d
    c372:	call   QWORD PTR [rax+0x48]
    c375:	test   eax,eax
    c377:	jne    c2f8 <vvfat_read+0x58>
    c37d:	mov    edx,DWORD PTR [r12+0x806c]
    c385:	cmp    rdx,r13
    c388:	jle    c428 <vvfat_read+0x188>
    c38e:	mov    eax,DWORD PTR [r12+0x8]
    c393:	cmp    rax,r13
    c396:	jg     c6c0 <vvfat_read+0x420>
    c39c:	mov    rsi,r13
    c39f:	mov    edx,DWORD PTR [r12+0x8060]
    c3a7:	sub    rsi,rax
    c3aa:	mov    rax,rsi
    c3ad:	cmp    rsi,rdx
    c3b0:	jl     c3be <vvfat_read+0x11e>
    c3b2:	sub    rax,rdx
    c3b5:	cmp    rdx,rax
    c3b8:	jle    c332 <vvfat_read+0x92>
    c3be:	mov    edx,r14d
    c3c1:	shl    rax,0x9
    c3c5:	add    rax,QWORD PTR [r12+0x8010]
    c3cd:	shl    edx,0x9
    c3d0:	mov    rsi,rax
    c3d3:	movsxd rdx,edx
    c3d6:	add    rdx,QWORD PTR [rsp]
    c3da:	mov    rax,QWORD PTR [rsi]
    c3dd:	lea    rdi,[rdx+0x8]
    c3e1:	add    r14d,0x1
    c3e5:	add    r13,0x1
    c3e9:	and    rdi,0xfffffffffffffff8
    c3ed:	mov    QWORD PTR [rdx],rax
    c3f0:	mov    rax,QWORD PTR [rsi+0x1f8]
    c3f7:	mov    QWORD PTR [rdx+0x1f8],rax
    c3fe:	sub    rdx,rdi
    c401:	sub    rsi,rdx
    c404:	add    edx,0x200
    c40a:	shr    edx,0x3
    c40d:	mov    ecx,edx
    c40f:	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
    c412:	cmp    ebp,r14d
    c415:	jg     c343 <vvfat_read+0xa3>
    c41b:	xor    eax,eax
    c41d:	jmp    c7dc <vvfat_read+0x53c>
    c422:	nop    WORD PTR [rax+rax*1+0x0]
    c428:	mov    esi,r13d
    c42b:	sub    esi,edx
    c42d:	xor    edx,edx
    c42f:	mov    eax,esi
    c431:	div    DWORD PTR [r12+0x805c]
    c439:	mov    DWORD PTR [rsp+0x14],edx
    c43d:	mov    r15d,eax
    c440:	cmp    eax,DWORD PTR [r12+0x8098]
    c448:	je     c680 <vvfat_read+0x3e0>
    c44e:	mov    r11,QWORD PTR [r12+0x8080]
    c456:	test   r11,r11
    c459:	je     c530 <vvfat_read+0x290>
    c45f:	mov    ecx,DWORD PTR [r12+0x807c]
    c467:	test   ecx,ecx
    c469:	jne    c476 <vvfat_read+0x1d6>
    c46b:	test   BYTE PTR [r11+0x20],0x4
    c470:	je     c8cf <vvfat_read+0x62f>
    c476:	mov    esi,DWORD PTR [r11]
    c479:	cmp    r15d,esi
    c47c:	jb     c530 <vvfat_read+0x290>
    c482:	cmp    r15d,DWORD PTR [r11+0x4]
    c486:	jae    c530 <vvfat_read+0x290>
    c48c:	test   BYTE PTR [r11+0x20],0x4
    c491:	jne    c7cf <vvfat_read+0x52f>
    c497:	nop    WORD PTR [rax+rax*1+0x0]
    c4a0:	test   ecx,ecx
    c4a2:	je     c8b0 <vvfat_read+0x610>
    c4a8:	mov    rax,QWORD PTR [r12+0x8080]
    c4b0:	mov    ebx,r15d
    c4b3:	xor    edx,edx
    c4b5:	mov    edi,ecx
    c4b7:	sub    ebx,DWORD PTR [rax]
    c4b9:	imul   ebx,DWORD PTR [r12+0x8058]
    c4c2:	add    ebx,DWORD PTR [rax+0x10]
    c4c5:	mov    rsi,rbx
    c4c8:	call   3650 <lseek64@plt>
    c4cd:	cmp    rbx,rax
    c4d0:	jne    c76b <vvfat_read+0x4cb>
    c4d6:	mov    rsi,QWORD PTR [r12+0x8090]
    c4de:	mov    edx,DWORD PTR [r12+0x8058]
    c4e6:	mov    edi,DWORD PTR [r12+0x807c]
    c4ee:	mov    QWORD PTR [r12+0x8088],rsi
    c4f6:	call   52c0 <qemu_read_ok>
    c4fb:	test   eax,eax
    c4fd:	js     c87b <vvfat_read+0x5db>
    c503:	mov    DWORD PTR [r12+0x8098],r15d
    c50b:	mov    rsi,QWORD PTR [r12+0x8088]
    c513:	mov    eax,DWORD PTR [rsp+0x14]
    c517:	mov    edx,r14d
    c51a:	shl    edx,0x9
    c51d:	shl    eax,0x9
    c520:	movsxd rdx,edx
    c523:	add    rdx,QWORD PTR [rsp]
    c527:	add    rsi,rax
    c52a:	jmp    c3da <vvfat_read+0x13a>
    c52f:	nop
    c530:	mov    r10d,DWORD PTR [r12+0x804c]
    c538:	xor    esi,esi
    c53a:	mov    ecx,r10d
    c53d:	jmp    c55a <vvfat_read+0x2ba>
    c53f:	nop
    c540:	cmp    ecx,edx
    c542:	jne    c54c <vvfat_read+0x2ac>
    c544:	test   ecx,ecx
    c546:	jne    c85c <vvfat_read+0x5bc>
    c54c:	cmp    ecx,edx
    c54e:	je     c5af <vvfat_read+0x30f>
    c550:	mov    ecx,edx
    c552:	cmp    esi,ecx
    c554:	jg     c83d <vvfat_read+0x59d>
    c55a:	lea    eax,[rcx+rsi*1]
    c55d:	mov    edx,eax
    c55f:	shr    edx,0x1f
    c562:	add    edx,eax
    c564:	sar    edx,1
    c566:	cmp    r10d,edx
    c569:	jbe    c7ff <vvfat_read+0x55f>
    c56f:	mov    r8d,DWORD PTR [r12+0x8050]
    c577:	mov    ebx,edx
    c579:	mov    rax,QWORD PTR [r12+0x8040]
    c581:	imul   ebx,r8d
    c585:	add    rbx,rax
    c588:	mov    edi,DWORD PTR [rbx]
    c58a:	mov    r9d,DWORD PTR [rbx+0x4]
    c58e:	cmp    edi,r9d
    c591:	jae    c81e <vvfat_read+0x57e>
    c597:	cmp    r15d,edi
    c59a:	jbe    c540 <vvfat_read+0x2a0>
    c59c:	cmp    esi,edx
    c59e:	je     c5a4 <vvfat_read+0x304>
    c5a0:	mov    esi,edx
    c5a2:	jmp    c552 <vvfat_read+0x2b2>
    c5a4:	cmp    r15d,r9d
    c5a7:	jb     c762 <vvfat_read+0x4c2>
    c5ad:	mov    esi,ecx
    c5af:	cmp    r10d,esi
    c5b2:	jbe    c76b <vvfat_read+0x4cb>
    c5b8:	imul   esi,r8d
    c5bc:	lea    rbx,[rax+rsi*1]
    c5c0:	cmp    r15d,DWORD PTR [rbx]
    c5c3:	jb     c76b <vvfat_read+0x4cb>
    c5c9:	cmp    r15d,DWORD PTR [rbx+0x4]
    c5cd:	jae    c90d <vvfat_read+0x66d>
    c5d3:	test   BYTE PTR [rbx+0x20],0x4
    c5d7:	je     c68d <vvfat_read+0x3ed>
    c5dd:	test   r11,r11
    c5e0:	je     c5fe <vvfat_read+0x35e>
    c5e2:	mov    edi,DWORD PTR [r12+0x807c]
    c5ea:	mov    QWORD PTR [r12+0x8080],0x0
    c5f6:	test   edi,edi
    c5f8:	jne    c7b9 <vvfat_read+0x519>
    c5fe:	mov    DWORD PTR [r12+0x8098],0xffffffff
    c60a:	mov    QWORD PTR [r12+0x8080],rbx
    c612:	mov    esi,DWORD PTR [rbx]
    c614:	mov    eax,DWORD PTR [rbx+0x14]
    c617:	mov    edi,DWORD PTR [r12+0x8058]
    c61f:	mov    rcx,QWORD PTR [r12+0x8028]
    c627:	shl    eax,0x5
    c62a:	movsxd rdx,eax
    c62d:	mov    eax,r15d
    c630:	sub    eax,esi
    c632:	imul   eax,edi
    c635:	add    rax,rdx
    c638:	cqo
    c63a:	lea    rsi,[rcx+rax*1]
    c63e:	idiv   rdi
    c641:	mov    QWORD PTR [r12+0x8088],rsi
    c649:	test   rdx,rdx
    c64c:	jne    c8ee <vvfat_read+0x64e>
    c652:	mov    eax,DWORD PTR [r12+0x8034]
    c65a:	add    rdi,rsi
    c65d:	imul   eax,DWORD PTR [r12+0x8038]
    c666:	add    rcx,rax
    c669:	cmp    rdi,rcx
    c66c:	ja     c88c <vvfat_read+0x5ec>
    c672:	mov    DWORD PTR [r12+0x8098],r15d
    c67a:	jmp    c513 <vvfat_read+0x273>
    c67f:	nop
    c680:	mov    rsi,QWORD PTR [r12+0x8088]
    c688:	jmp    c513 <vvfat_read+0x273>
    c68d:	mov    rdx,QWORD PTR [rbx+0x18]
    c691:	test   r11,r11
    c694:	je     c70c <vvfat_read+0x46c>
    c696:	mov    rdi,QWORD PTR [r11+0x18]
    c69a:	mov    rsi,rdx
    c69d:	mov    QWORD PTR [rsp+0x18],rdx
    c6a2:	call   3350 <strcmp@plt>
    c6a7:	mov    rdx,QWORD PTR [rsp+0x18]
    c6ac:	test   eax,eax
    c6ae:	jne    c70c <vvfat_read+0x46c>
    c6b0:	mov    ecx,DWORD PTR [r12+0x807c]
    c6b8:	jmp    c4a0 <vvfat_read+0x200>
    c6bd:	nop    DWORD PTR [rax]
    c6c0:	mov    rdx,r13
    c6c3:	mov    eax,r14d
    c6c6:	shl    rdx,0x9
    c6ca:	shl    eax,0x9
    c6cd:	lea    rsi,[r12+rdx*1+0xc]
    c6d2:	cdqe
    c6d4:	add    rax,QWORD PTR [rsp]
    c6d8:	mov    rdx,QWORD PTR [rsi]
    c6db:	lea    rdi,[rax+0x8]
    c6df:	and    rdi,0xfffffffffffffff8
    c6e3:	mov    QWORD PTR [rax],rdx
    c6e6:	mov    rdx,QWORD PTR [rsi+0x1f8]
    c6ed:	mov    QWORD PTR [rax+0x1f8],rdx
    c6f4:	sub    rax,rdi
    c6f7:	sub    rsi,rax
    c6fa:	add    eax,0x200
    c6ff:	shr    eax,0x3
    c702:	mov    ecx,eax
    c704:	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
    c707:	jmp    c332 <vvfat_read+0x92>
    c70c:	xor    esi,esi
    c70e:	mov    rdi,rdx
    c711:	xor    eax,eax
    c713:	call   3500 <open64@plt>
    c718:	mov    ecx,eax
    c71a:	test   eax,eax
    c71c:	js     c76b <vvfat_read+0x4cb>
    c71e:	cmp    QWORD PTR [r12+0x8080],0x0
    c727:	je     c741 <vvfat_read+0x4a1>
    c729:	mov    edi,DWORD PTR [r12+0x807c]
    c731:	mov    QWORD PTR [r12+0x8080],0x0
    c73d:	test   edi,edi
    c73f:	jne    c7aa <vvfat_read+0x50a>
    c741:	mov    DWORD PTR [r12+0x8098],0xffffffff
    c74d:	mov    DWORD PTR [r12+0x807c],ecx
    c755:	mov    QWORD PTR [r12+0x8080],rbx
    c75d:	jmp    c4a0 <vvfat_read+0x200>
    c762:	cmp    r15d,edi
    c765:	jae    c5d3 <vvfat_read+0x333>
    c76b:	mov    eax,r14d
    c76e:	shl    eax,0x9
    c771:	cdqe
    c773:	add    rax,QWORD PTR [rsp]
    c777:	lea    rdi,[rax+0x8]
    c77b:	mov    QWORD PTR [rax],0x0
    c782:	mov    QWORD PTR [rax+0x1f8],0x0
    c78d:	and    rdi,0xfffffffffffffff8
    c791:	sub    rax,rdi
    c794:	mov    rcx,rax
    c797:	xor    eax,eax
    c799:	add    ecx,0x200
    c79f:	shr    ecx,0x3
    c7a2:	rep stos QWORD PTR es:[rdi],rax
    c7a5:	jmp    c332 <vvfat_read+0x92>
    c7aa:	mov    DWORD PTR [rsp+0x18],eax
    c7ae:	call   3270 <close@plt>
    c7b3:	mov    ecx,DWORD PTR [rsp+0x18]
    c7b7:	jmp    c741 <vvfat_read+0x4a1>
    c7b9:	call   3270 <close@plt>
    c7be:	mov    DWORD PTR [r12+0x807c],0x0
    c7ca:	jmp    c5fe <vvfat_read+0x35e>
    c7cf:	mov    rbx,r11
    c7d2:	jmp    c614 <vvfat_read+0x374>
    c7d7:	mov    eax,0xffffffff
    c7dc:	mov    rsi,QWORD PTR [rsp+0x28]
    c7e1:	xor    rsi,QWORD PTR fs:0x28
    c7ea:	jne    c8ab <vvfat_read+0x60b>
    c7f0:	add    rsp,0x38
    c7f4:	pop    rbx
    c7f5:	pop    rbp
    c7f6:	pop    r12
    c7f8:	pop    r13
    c7fa:	pop    r14
    c7fc:	pop    r15
    c7fe:	ret
    c7ff:	lea    rcx,[rip+0x14c6a]        # 21470 <__PRETTY_FUNCTION__.13830>
    c806:	mov    edx,0x60
    c80b:	lea    rsi,[rip+0x142d4]        # 20ae6 <desc_template.13939+0x206>
    c812:	lea    rdi,[rip+0x14302]        # 20b1b <desc_template.13939+0x23b>
    c819:	call   3230 <__assert_fail@plt>
    c81e:	lea    rcx,[rip+0x14c5b]        # 21480 <__PRETTY_FUNCTION__.14249>
    c825:	mov    edx,0x45a
    c82a:	lea    rsi,[rip+0x142b5]        # 20ae6 <desc_template.13939+0x206>
    c831:	lea    rdi,[rip+0x142f7]        # 20b2f <desc_template.13939+0x24f>
    c838:	call   3230 <__assert_fail@plt>
    c83d:	lea    rcx,[rip+0x14c3c]        # 21480 <__PRETTY_FUNCTION__.14249>
    c844:	mov    edx,0x465
    c849:	lea    rsi,[rip+0x14296]        # 20ae6 <desc_template.13939+0x206>
    c850:	lea    rdi,[rip+0x14312]        # 20b69 <desc_template.13939+0x289>
    c857:	call   3230 <__assert_fail@plt>
    c85c:	lea    rcx,[rip+0x14c1d]        # 21480 <__PRETTY_FUNCTION__.14249>
    c863:	mov    edx,0x45c
    c868:	lea    rsi,[rip+0x14277]        # 20ae6 <desc_template.13939+0x206>
    c86f:	lea    rdi,[rip+0x142d7]        # 20b4d <desc_template.13939+0x26d>
    c876:	call   3230 <__assert_fail@plt>
    c87b:	mov    DWORD PTR [r12+0x8098],0xffffffff
    c887:	jmp    c76b <vvfat_read+0x4cb>
    c88c:	lea    rcx,[rip+0x14ab5]        # 21348 <__PRETTY_FUNCTION__.14277>
    c893:	mov    edx,0x4b4
    c898:	lea    rsi,[rip+0x14247]        # 20ae6 <desc_template.13939+0x206>
    c89f:	lea    rdi,[rip+0x1461a]        # 20ec0 <desc_template.13939+0x5e0>
    c8a6:	call   3230 <__assert_fail@plt>
    c8ab:	call   31c0 <__stack_chk_fail@plt>
    c8b0:	lea    rcx,[rip+0x14a91]        # 21348 <__PRETTY_FUNCTION__.14277>
    c8b7:	mov    edx,0x4be
    c8bc:	lea    rsi,[rip+0x14223]        # 20ae6 <desc_template.13939+0x206>
    c8c3:	lea    rdi,[rip+0x142b8]        # 20b82 <desc_template.13939+0x2a2>
    c8ca:	call   3230 <__assert_fail@plt>
    c8cf:	lea    rcx,[rip+0x14a72]        # 21348 <__PRETTY_FUNCTION__.14277>
    c8d6:	mov    edx,0x4a3
    c8db:	lea    rsi,[rip+0x14204]        # 20ae6 <desc_template.13939+0x206>
    c8e2:	lea    rdi,[rip+0x144ff]        # 20de8 <desc_template.13939+0x508>
    c8e9:	call   3230 <__assert_fail@plt>
    c8ee:	lea    rcx,[rip+0x14a53]        # 21348 <__PRETTY_FUNCTION__.14277>
    c8f5:	mov    edx,0x4b3
    c8fa:	lea    rsi,[rip+0x141e5]        # 20ae6 <desc_template.13939+0x206>
    c901:	lea    rdi,[rip+0x14570]        # 20e78 <desc_template.13939+0x598>
    c908:	call   3230 <__assert_fail@plt>
    c90d:	lea    rcx,[rip+0x14b8c]        # 214a0 <__PRETTY_FUNCTION__.14257>
    c914:	mov    edx,0x477
    c919:	lea    rsi,[rip+0x141c6]        # 20ae6 <desc_template.13939+0x206>
    c920:	lea    rdi,[rip+0x14519]        # 20e40 <desc_template.13939+0x560>
    c927:	call   3230 <__assert_fail@plt>
    c92c:	nop    DWORD PTR [rax+0x0]

000000000000c930 <write_target_close>:
    c930:	push   rbx
    c931:	mov    rbx,QWORD PTR [rdi+0x40]
    c935:	mov    rdi,QWORD PTR [rbx+0x80b0]
    c93c:	call   18130 <bdrv_delete>
    c941:	mov    rdi,QWORD PTR [rbx+0x80a8]
    c948:	pop    rbx
    c949:	jmp    3070 <free@plt>
    c94e:	xchg   ax,ax

000000000000c950 <schedule_rename>:
    c950:	push   r15
    c952:	mov    r15,rdx
    c955:	push   r14
    c957:	mov    r14d,esi
    c95a:	push   r13
    c95c:	push   r12
    c95e:	push   rbp
    c95f:	mov    rbp,rdi
    c962:	push   rbx
    c963:	sub    rsp,0x8
    c967:	mov    ebx,DWORD PTR [rdi+0x80d4]
    c96d:	mov    eax,DWORD PTR [rdi+0x80d8]
    c973:	lea    r12d,[rbx+0x1]
    c977:	mov    ecx,r12d
    c97a:	imul   ecx,eax
    c97d:	cmp    ecx,DWORD PTR [rdi+0x80d0]
    c983:	ja     c9c0 <schedule_rename+0x70>
    c985:	mov    DWORD PTR [rbp+0x80d4],r12d
    c98c:	cmp    ebx,r12d
    c98f:	jae    c9f5 <schedule_rename+0xa5>
    c991:	imul   ebx,DWORD PTR [rbp+0x80d8]
    c998:	add    rbx,QWORD PTR [rbp+0x80c8]
    c99f:	mov    QWORD PTR [rbx],r15
    c9a2:	mov    DWORD PTR [rbx+0x8],r14d
    c9a6:	mov    DWORD PTR [rbx+0x10],0x0
    c9ad:	add    rsp,0x8
    c9b1:	pop    rbx
    c9b2:	pop    rbp
    c9b3:	pop    r12
    c9b5:	pop    r13
    c9b7:	pop    r14
    c9b9:	pop    r15
    c9bb:	ret
    c9bc:	nop    DWORD PTR [rax+0x0]
    c9c0:	mov    r13d,eax
    c9c3:	mov    rdi,QWORD PTR [rdi+0x80c8]
    c9ca:	shl    r13d,0x5
    c9ce:	sub    r13d,eax
    c9d1:	add    r13d,ecx
    c9d4:	movsxd rsi,r13d
    c9d7:	call   5990 <qemu_realloc>
    c9dc:	mov    QWORD PTR [rbp+0x80c8],rax
    c9e3:	test   rax,rax
    c9e6:	je     3737 <schedule_rename.cold.10>
    c9ec:	mov    DWORD PTR [rbp+0x80d0],r13d
    c9f3:	jmp    c985 <schedule_rename+0x35>
    c9f5:	lea    rcx,[rip+0x14a74]        # 21470 <__PRETTY_FUNCTION__.13830>
    c9fc:	mov    edx,0x60
    ca01:	lea    rsi,[rip+0x140de]        # 20ae6 <desc_template.13939+0x206>
    ca08:	lea    rdi,[rip+0x1410c]        # 20b1b <desc_template.13939+0x23b>
    ca0f:	call   3230 <__assert_fail@plt>
    ca14:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    ca1f:	nop

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

000000000000ca90 <commit_mappings>:
    ca90:	push   r15
    ca92:	xor    r8d,r8d
    ca95:	mov    r15d,esi
    ca98:	push   r14
    ca9a:	push   r13
    ca9c:	push   r12
    ca9e:	push   rbp
    ca9f:	mov    rbp,rdi
    caa2:	push   rbx
    caa3:	mov    ebx,edx
    caa5:	sub    rsp,0x18
    caa9:	mov    r10d,DWORD PTR [rdi+0x804c]
    cab0:	mov    edi,r10d
    cab3:	jmp    cad3 <commit_mappings+0x43>
    cab5:	nop    DWORD PTR [rax]
    cab8:	cmp    eax,edi
    caba:	jne    cac4 <commit_mappings+0x34>
    cabc:	test   edi,edi
    cabe:	jne    cdf7 <commit_mappings+0x367>
    cac4:	cmp    eax,edi
    cac6:	je     cb23 <commit_mappings+0x93>
    cac8:	mov    edi,eax
    caca:	cmp    r8d,edi
    cacd:	jg     cdb9 <commit_mappings+0x329>
    cad3:	lea    ecx,[r8+rdi*1]
    cad7:	mov    eax,ecx
    cad9:	shr    eax,0x1f
    cadc:	add    eax,ecx
    cade:	sar    eax,1
    cae0:	cmp    r10d,eax
    cae3:	jbe    cc93 <commit_mappings+0x203>
    cae9:	mov    edx,DWORD PTR [rbp+0x8050]
    caef:	mov    ecx,eax
    caf1:	mov    r14,QWORD PTR [rbp+0x8040]
    caf8:	imul   ecx,edx
    cafb:	add    rcx,r14
    cafe:	mov    r9d,DWORD PTR [rcx]
    cb01:	mov    ecx,DWORD PTR [rcx+0x4]
    cb04:	cmp    r9d,ecx
    cb07:	jae    cdd8 <commit_mappings+0x348>
    cb0d:	cmp    r15d,r9d
    cb10:	jbe    cab8 <commit_mappings+0x28>
    cb12:	cmp    eax,r8d
    cb15:	je     cb1c <commit_mappings+0x8c>
    cb17:	mov    r8d,eax
    cb1a:	jmp    caca <commit_mappings+0x3a>
    cb1c:	cmp    r15d,ecx
    cb1f:	cmovae r8d,edi
    cb23:	cmp    r10d,r8d
    cb26:	jbe    cdb1 <commit_mappings+0x321>
    cb2c:	imul   edx,r8d
    cb30:	add    r14,rdx
    cb33:	cmp    r15d,DWORD PTR [r14]
    cb36:	jb     cdb1 <commit_mappings+0x321>
    cb3c:	cmp    r15d,DWORD PTR [r14+0x4]
    cb40:	jae    d06a <commit_mappings+0x5da>
    cb46:	cmp    ebx,DWORD PTR [rbp+0x8034]
    cb4c:	jae    cc93 <commit_mappings+0x203>
    cb52:	cmp    QWORD PTR [rbp+0x8080],0x0
    cb5a:	mov    r12,QWORD PTR [rbp+0x8028]
    cb61:	mov    r13d,DWORD PTR [rbp+0x8038]
    cb68:	je     cb83 <commit_mappings+0xf3>
    cb6a:	mov    edi,DWORD PTR [rbp+0x807c]
    cb70:	mov    QWORD PTR [rbp+0x8080],0x0
    cb7b:	test   edi,edi
    cb7d:	jne    cd9d <commit_mappings+0x30d>
    cb83:	mov    DWORD PTR [rbp+0x8098],0xffffffff
    cb8d:	test   r14,r14
    cb90:	je     d04b <commit_mappings+0x5bb>
    cb96:	cmp    DWORD PTR [r14],r15d
    cb99:	jne    ce27 <commit_mappings+0x397>
    cb9f:	mov    DWORD PTR [r14+0xc],0xffffffff
    cba7:	mov    eax,0x4
    cbac:	mov    DWORD PTR [r14+0x8],ebx
    cbb0:	test   ebx,ebx
    cbb2:	jle    cbcb <commit_mappings+0x13b>
    cbb4:	imul   ebx,r13d
    cbb8:	add    rbx,r12
    cbbb:	test   BYTE PTR [rbx+0xb],0x10
    cbbf:	je     cbc6 <commit_mappings+0x136>
    cbc1:	cmp    BYTE PTR [rbx],0xe5
    cbc4:	jne    cbcb <commit_mappings+0x13b>
    cbc6:	mov    eax,0x1
    cbcb:	lea    rbx,[rbp+0x8040]
    cbd2:	mov    DWORD PTR [r14+0x20],eax
    cbd6:	mov    edi,DWORD PTR [rbp+0x8078]
    cbdc:	mov    QWORD PTR [rsp+0x8],rbx
    cbe1:	lea    eax,[rdi-0x8]
    cbe4:	nop    DWORD PTR [rax+0x0]
    cbe8:	cmp    r15d,eax
    cbeb:	ja     ce16 <commit_mappings+0x386>
    cbf1:	mov    edx,DWORD PTR [rbp+0x8068]
    cbf7:	cmp    r15d,edx
    cbfa:	jae    ccc8 <commit_mappings+0x238>
    cc00:	lea    r13d,[r15+0x1]
    cc04:	mov    r12d,edi
    cc07:	cmp    edx,r13d
    cc0a:	cmovne r12d,r13d
    cc0e:	jmp    cc23 <commit_mappings+0x193>
    cc10:	lea    eax,[r15+0x2]
    cc14:	cmp    edx,eax
    cc16:	cmove  eax,edi
    cc19:	mov    r15d,r12d
    cc1c:	mov    r12d,eax
    cc1f:	lea    r13d,[r15+0x1]
    cc23:	cmp    r13d,r12d
    cc26:	jne    cc78 <commit_mappings+0x1e8>
    cc28:	cmp    r12d,edx
    cc2b:	jb     cc10 <commit_mappings+0x180>
    cc2d:	mov    eax,DWORD PTR [rbp+0x800c]
    cc33:	mov    rcx,QWORD PTR [rbp+0x80b8]
    cc3a:	cmp    eax,0x20
    cc3d:	je     ccb8 <commit_mappings+0x228>
    cc3f:	cmp    eax,0x10
    cc42:	je     cc68 <commit_mappings+0x1d8>
    cc44:	lea    eax,[r12+r12*2]
    cc48:	shr    eax,1
    cc4a:	movzx  eax,WORD PTR [rcx+rax*1]
    cc4e:	lea    ecx,[r12*4+0x0]
    cc56:	and    ecx,0x4
    cc59:	sar    eax,cl
    cc5b:	and    eax,0xfff
    cc60:	jmp    cc19 <commit_mappings+0x189>
    cc62:	nop    WORD PTR [rax+rax*1+0x0]
    cc68:	mov    eax,r12d
    cc6b:	movzx  eax,WORD PTR [rcx+rax*2]
    cc6f:	jmp    cc19 <commit_mappings+0x189>
    cc71:	nop    DWORD PTR [rax+0x0]
    cc78:	mov    r15d,DWORD PTR [rbp+0x804c]
    cc7f:	cmp    r13d,DWORD PTR [r14+0x4]
    cc83:	ja     cd10 <commit_mappings+0x280>
    cc89:	add    r15d,0xffffffff
    cc8d:	jb     ce50 <commit_mappings+0x3c0>
    cc93:	lea    rcx,[rip+0x147d6]        # 21470 <__PRETTY_FUNCTION__.13830>
    cc9a:	mov    edx,0x60
    cc9f:	lea    rsi,[rip+0x13e40]        # 20ae6 <desc_template.13939+0x206>
    cca6:	lea    rdi,[rip+0x13e6e]        # 20b1b <desc_template.13939+0x23b>
    ccad:	call   3230 <__assert_fail@plt>
    ccb2:	nop    WORD PTR [rax+rax*1+0x0]
    ccb8:	mov    eax,r12d
    ccbb:	mov    eax,DWORD PTR [rcx+rax*4]
    ccbe:	jmp    cc19 <commit_mappings+0x189>
    ccc3:	nop    DWORD PTR [rax+rax*1+0x0]
    ccc8:	mov    eax,DWORD PTR [rbp+0x800c]
    ccce:	mov    rcx,QWORD PTR [rbp+0x80b8]
    ccd5:	cmp    eax,0x20
    ccd8:	je     cd8d <commit_mappings+0x2fd>
    ccde:	cmp    eax,0x10
    cce1:	je     cd7c <commit_mappings+0x2ec>
    cce7:	lea    eax,[r15+r15*2]
    cceb:	lea    r13d,[r15+0x1]
    ccef:	shr    eax,1
    ccf1:	movzx  r12d,WORD PTR [rcx+rax*1]
    ccf6:	lea    ecx,[r15*4+0x0]
    ccfe:	and    ecx,0x4
    cd01:	sar    r12d,cl
    cd04:	and    r12d,0xfff
    cd0b:	jmp    cc23 <commit_mappings+0x193>
    cd10:	mov    rdi,QWORD PTR [rsp+0x8]
    cd15:	mov    rsi,r14
    cd18:	call   ca20 <array_index>
    cd1d:	mov    edi,r15d
    cd20:	sub    edi,eax
    cd22:	cmp    edi,0x1
    cd25:	jle    cc89 <commit_mappings+0x1f9>
    cd2b:	cmp    r13d,DWORD PTR [r14+0x28]
    cd2f:	jbe    cc89 <commit_mappings+0x1f9>
    cd35:	lea    rcx,[r14+0x50]
    cd39:	mov    ebx,0x1
    cd3e:	jmp    cd4c <commit_mappings+0x2bc>
    cd40:	add    rcx,0x28
    cd44:	cmp    r13d,DWORD PTR [rcx-0x28]
    cd48:	jbe    cd53 <commit_mappings+0x2c3>
    cd4a:	mov    ebx,esi
    cd4c:	lea    esi,[rbx+0x1]
    cd4f:	cmp    edi,esi
    cd51:	jne    cd40 <commit_mappings+0x2b0>
    cd53:	lea    r15d,[rax+0x1]
    cd57:	nop    WORD PTR [rax+rax*1+0x0]
    cd60:	mov    esi,r15d
    cd63:	mov    rdi,rbp
    cd66:	call   bc10 <remove_mapping>
    cd6b:	sub    ebx,0x1
    cd6e:	jne    cd60 <commit_mappings+0x2d0>
    cd70:	mov    r15d,DWORD PTR [rbp+0x804c]
    cd77:	jmp    cc89 <commit_mappings+0x1f9>
    cd7c:	mov    eax,r15d
    cd7f:	lea    r13d,[r15+0x1]
    cd83:	movzx  r12d,WORD PTR [rcx+rax*2]
    cd88:	jmp    cc23 <commit_mappings+0x193>
    cd8d:	mov    eax,r15d
    cd90:	lea    r13d,[r15+0x1]
    cd94:	mov    r12d,DWORD PTR [rcx+rax*4]
    cd98:	jmp    cc23 <commit_mappings+0x193>
    cd9d:	call   3270 <close@plt>
    cda2:	mov    DWORD PTR [rbp+0x807c],0x0
    cdac:	jmp    cb83 <commit_mappings+0xf3>
    cdb1:	xor    r14d,r14d
    cdb4:	jmp    cb46 <commit_mappings+0xb6>
    cdb9:	lea    rcx,[rip+0x146c0]        # 21480 <__PRETTY_FUNCTION__.14249>
    cdc0:	mov    edx,0x465
    cdc5:	lea    rsi,[rip+0x13d1a]        # 20ae6 <desc_template.13939+0x206>
    cdcc:	lea    rdi,[rip+0x13d96]        # 20b69 <desc_template.13939+0x289>
    cdd3:	call   3230 <__assert_fail@plt>
    cdd8:	lea    rcx,[rip+0x146a1]        # 21480 <__PRETTY_FUNCTION__.14249>
    cddf:	mov    edx,0x45a
    cde4:	lea    rsi,[rip+0x13cfb]        # 20ae6 <desc_template.13939+0x206>
    cdeb:	lea    rdi,[rip+0x13d3d]        # 20b2f <desc_template.13939+0x24f>
    cdf2:	call   3230 <__assert_fail@plt>
    cdf7:	lea    rcx,[rip+0x14682]        # 21480 <__PRETTY_FUNCTION__.14249>
    cdfe:	mov    edx,0x45c
    ce03:	lea    rsi,[rip+0x13cdc]        # 20ae6 <desc_template.13939+0x206>
    ce0a:	lea    rdi,[rip+0x13d3c]        # 20b4d <desc_template.13939+0x26d>
    ce11:	call   3230 <__assert_fail@plt>
    ce16:	add    rsp,0x18
    ce1a:	xor    eax,eax
    ce1c:	pop    rbx
    ce1d:	pop    rbp
    ce1e:	pop    r12
    ce20:	pop    r13
    ce22:	pop    r14
    ce24:	pop    r15
    ce26:	ret
    ce27:	lea    rcx,[rip+0x14552]        # 21380 <__PRETTY_FUNCTION__.14545>
    ce2e:	mov    edx,0x812
    ce33:	lea    rsi,[rip+0x13cac]        # 20ae6 <desc_template.13939+0x206>
    ce3a:	lea    rdi,[rip+0x14137]        # 20f78 <desc_template.13939+0x698>
    ce41:	call   3230 <__assert_fail@plt>
    ce46:	nop    WORD PTR cs:[rax+rax*1+0x0]
    ce50:	imul   r15d,DWORD PTR [rbp+0x8050]
    ce58:	mov    rax,QWORD PTR [rbp+0x8040]
    ce5f:	add    rax,r15
    ce62:	cmp    r14,rax
    ce65:	je     ce71 <commit_mappings+0x3e1>
    ce67:	cmp    r13d,DWORD PTR [r14+0x28]
    ce6b:	ja     d02c <commit_mappings+0x59c>
    ce71:	mov    DWORD PTR [r14+0x4],r13d
    ce75:	mov    edi,DWORD PTR [rbp+0x8078]
    ce7b:	lea    eax,[rdi-0x8]
    ce7e:	cmp    r12d,eax
    ce81:	ja     cf91 <commit_mappings+0x501>
    ce87:	mov    r8d,DWORD PTR [rbp+0x804c]
    ce8e:	xor    esi,esi
    ce90:	mov    ecx,r8d
    ce93:	jmp    ceb2 <commit_mappings+0x422>
    ce95:	nop    DWORD PTR [rax]
    ce98:	cmp    ecx,eax
    ce9a:	jne    cea4 <commit_mappings+0x414>
    ce9c:	test   ecx,ecx
    ce9e:	jne    cdf7 <commit_mappings+0x367>
    cea4:	cmp    ecx,eax
    cea6:	je     cf01 <commit_mappings+0x471>
    cea8:	mov    ecx,eax
    ceaa:	cmp    esi,ecx
    ceac:	jg     cdb9 <commit_mappings+0x329>
    ceb2:	lea    edx,[rsi+rcx*1]
    ceb5:	mov    eax,edx
    ceb7:	shr    eax,0x1f
    ceba:	add    eax,edx
    cebc:	sar    eax,1
    cebe:	cmp    r8d,eax
    cec1:	jbe    cc93 <commit_mappings+0x203>
    cec7:	mov    r11d,DWORD PTR [rbp+0x8050]
    cece:	mov    edx,eax
    ced0:	mov    r9,QWORD PTR [rbp+0x8040]
    ced7:	imul   edx,r11d
    cedb:	add    rdx,r9
    cede:	mov    edi,DWORD PTR [rdx]
    cee0:	mov    r10d,DWORD PTR [rdx+0x4]
    cee4:	cmp    edi,r10d
    cee7:	jae    cdd8 <commit_mappings+0x348>
    ceed:	cmp    r12d,edi
    cef0:	jbe    ce98 <commit_mappings+0x408>
    cef2:	cmp    esi,eax
    cef4:	je     cefa <commit_mappings+0x46a>
    cef6:	mov    esi,eax
    cef8:	jmp    ceaa <commit_mappings+0x41a>
    cefa:	cmp    r12d,r10d
    cefd:	jb     cf1a <commit_mappings+0x48a>
    ceff:	mov    esi,ecx
    cf01:	cmp    r8d,esi
    cf04:	jbe    cfa0 <commit_mappings+0x510>
    cf0a:	imul   esi,r11d
    cf0e:	mov    rdx,r9
    cf11:	add    rdx,rsi
    cf14:	je     cfa0 <commit_mappings+0x510>
    cf1a:	cmp    DWORD PTR [rdx],r12d
    cf1d:	ja     cfa0 <commit_mappings+0x510>
    cf23:	mov    r15,r14
    cf26:	mov    r14,rdx
    cf29:	mov    eax,DWORD PTR [r15+0x8]
    cf2d:	mov    DWORD PTR [r14+0x8],eax
    cf31:	mov    eax,DWORD PTR [r15+0xc]
    cf35:	test   eax,eax
    cf37:	js     cffa <commit_mappings+0x56a>
    cf3d:	nop    DWORD PTR [rax]
    cf40:	mov    DWORD PTR [r14+0xc],eax
    cf44:	mov    rax,QWORD PTR [r15+0x18]
    cf48:	mov    QWORD PTR [r14+0x18],rax
    cf4c:	mov    eax,DWORD PTR [r15+0x20]
    cf50:	mov    DWORD PTR [r14+0x20],eax
    cf54:	mov    eax,DWORD PTR [r15+0x24]
    cf58:	mov    DWORD PTR [r14+0x24],eax
    cf5c:	test   BYTE PTR [r15+0x20],0x4
    cf61:	je     d00c <commit_mappings+0x57c>
    cf67:	mov    eax,DWORD PTR [r15+0x10]
    cf6b:	mov    DWORD PTR [r14+0x10],eax
    cf6f:	mov    eax,DWORD PTR [r15+0x4]
    cf73:	sub    eax,DWORD PTR [r15]
    cf76:	imul   eax,DWORD PTR [rbp+0x805c]
    cf7d:	shl    eax,0x4
    cf80:	add    eax,DWORD PTR [r15+0x14]
    cf84:	mov    DWORD PTR [r14+0x14],eax
    cf88:	mov    edi,DWORD PTR [rbp+0x8078]
    cf8e:	lea    eax,[rdi-0x8]
    cf91:	mov    r15d,r12d
    cf94:	jmp    cbe8 <commit_mappings+0x158>
    cf99:	nop    DWORD PTR [rax+0x0]
    cfa0:	mov    rdi,QWORD PTR [rsp+0x8]
    cfa5:	mov    rsi,r14
    cfa8:	call   ca20 <array_index>
    cfad:	lea    edx,[r12+0x1]
    cfb2:	mov    esi,r12d
    cfb5:	mov    rdi,rbp
    cfb8:	mov    r15d,eax
    cfbb:	call   bd20 <insert_mapping>
    cfc0:	cmp    r12d,r13d
    cfc3:	mov    r14,rax
    cfc6:	adc    r15d,0x0
    cfca:	cmp    r15d,DWORD PTR [rbp+0x804c]
    cfd1:	jae    cc93 <commit_mappings+0x203>
    cfd7:	imul   r15d,DWORD PTR [rbp+0x8050]
    cfdf:	add    r15,QWORD PTR [rbp+0x8040]
    cfe6:	mov    eax,DWORD PTR [r15+0x8]
    cfea:	mov    DWORD PTR [r14+0x8],eax
    cfee:	mov    eax,DWORD PTR [r15+0xc]
    cff2:	test   eax,eax
    cff4:	jns    cf40 <commit_mappings+0x4b0>
    cffa:	mov    rdi,QWORD PTR [rsp+0x8]
    cfff:	mov    rsi,r15
    d002:	call   ca20 <array_index>
    d007:	jmp    cf40 <commit_mappings+0x4b0>
    d00c:	mov    eax,DWORD PTR [r15+0x4]
    d010:	add    eax,DWORD PTR [r15+0x10]
    d014:	sub    eax,DWORD PTR [r15]
    d017:	mov    r15d,r12d
    d01a:	mov    DWORD PTR [r14+0x10],eax
    d01e:	mov    edi,DWORD PTR [rbp+0x8078]
    d024:	lea    eax,[rdi-0x8]
    d027:	jmp    cbe8 <commit_mappings+0x158>
    d02c:	lea    rcx,[rip+0x1434d]        # 21380 <__PRETTY_FUNCTION__.14545>
    d033:	mov    edx,0x827
    d038:	lea    rsi,[rip+0x13aa7]        # 20ae6 <desc_template.13939+0x206>
    d03f:	lea    rdi,[rip+0x13f52]        # 20f98 <desc_template.13939+0x6b8>
    d046:	call   3230 <__assert_fail@plt>
    d04b:	lea    rcx,[rip+0x1432e]        # 21380 <__PRETTY_FUNCTION__.14545>
    d052:	mov    edx,0x811
    d057:	lea    rsi,[rip+0x13a88]        # 20ae6 <desc_template.13939+0x206>
    d05e:	lea    rdi,[rip+0x13b2b]        # 20b90 <desc_template.13939+0x2b0>
    d065:	call   3230 <__assert_fail@plt>
    d06a:	lea    rcx,[rip+0x1442f]        # 214a0 <__PRETTY_FUNCTION__.14257>
    d071:	mov    edx,0x477
    d076:	lea    rsi,[rip+0x13a69]        # 20ae6 <desc_template.13939+0x206>
    d07d:	lea    rdi,[rip+0x13dbc]        # 20e40 <desc_template.13939+0x560>
    d084:	call   3230 <__assert_fail@plt>
    d089:	nop    DWORD PTR [rax+0x0]

000000000000d090 <commit_one_file>:
    d090:	push   r15
    d092:	push   r14
    d094:	push   r13
    d096:	push   r12
    d098:	push   rbp
    d099:	push   rbx
    d09a:	sub    rsp,0x28
    d09e:	mov    DWORD PTR [rsp+0x18],esi
    d0a2:	cmp    esi,DWORD PTR [rdi+0x8034]
    d0a8:	jae    d513 <commit_one_file+0x483>
    d0ae:	mov    r11d,DWORD PTR [rsp+0x18]
    d0b3:	mov    r13,rdi
    d0b6:	mov    r15d,edx
    d0b9:	xor    esi,esi
    d0bb:	imul   r11d,DWORD PTR [rdi+0x8038]
    d0c3:	add    r11,QWORD PTR [rdi+0x8028]
    d0ca:	movzx  ebx,WORD PTR [r11+0x14]
    d0cf:	movzx  eax,WORD PTR [r11+0x1a]
    d0d4:	mov    r10d,DWORD PTR [rdi+0x804c]
    d0db:	shl    ebx,0x10
    d0de:	or     ebx,eax
    d0e0:	mov    ecx,r10d
    d0e3:	jmp    d102 <commit_one_file+0x72>
    d0e5:	nop    DWORD PTR [rax]
    d0e8:	cmp    eax,ecx
    d0ea:	jne    d0f4 <commit_one_file+0x64>
    d0ec:	test   ecx,ecx
    d0ee:	jne    d532 <commit_one_file+0x4a2>
    d0f4:	cmp    eax,ecx
    d0f6:	je     d14b <commit_one_file+0xbb>
    d0f8:	mov    ecx,eax
    d0fa:	cmp    esi,ecx
    d0fc:	jg     d4d5 <commit_one_file+0x445>
    d102:	lea    edx,[rsi+rcx*1]
    d105:	mov    eax,edx
    d107:	shr    eax,0x1f
    d10a:	add    eax,edx
    d10c:	sar    eax,1
    d10e:	cmp    eax,r10d
    d111:	jae    d513 <commit_one_file+0x483>
    d117:	mov    ebp,DWORD PTR [r13+0x8050]
    d11e:	mov    edx,eax
    d120:	mov    r12,QWORD PTR [r13+0x8040]
    d127:	imul   edx,ebp
    d12a:	add    rdx,r12
    d12d:	mov    edi,DWORD PTR [rdx]
    d12f:	mov    edx,DWORD PTR [rdx+0x4]
    d132:	cmp    edi,edx
    d134:	jae    d4f4 <commit_one_file+0x464>
    d13a:	cmp    edi,ebx
    d13c:	jae    d0e8 <commit_one_file+0x58>
    d13e:	cmp    eax,esi
    d140:	je     d146 <commit_one_file+0xb6>
    d142:	mov    esi,eax
    d144:	jmp    d0fa <commit_one_file+0x6a>
    d146:	cmp    edx,ebx
    d148:	cmovbe esi,ecx
    d14b:	cmp    r10d,esi
    d14e:	jbe    d3a1 <commit_one_file+0x311>
    d154:	imul   esi,ebp
    d157:	lea    rbp,[r12+rsi*1]
    d15b:	cmp    DWORD PTR [rbp+0x0],ebx
    d15e:	ja     d3a1 <commit_one_file+0x311>
    d164:	cmp    DWORD PTR [rbp+0x4],ebx
    d167:	jbe    d551 <commit_one_file+0x4c1>
    d16d:	mov    edi,DWORD PTR [r13+0x8058]
    d174:	mov    r12d,DWORD PTR [r11+0x1c]
    d178:	call   5970 <qemu_malloc>
    d17d:	mov    QWORD PTR [rsp+0x8],rax
    d182:	cmp    r15d,r12d
    d185:	jae    d58f <commit_one_file+0x4ff>
    d18b:	mov    edi,DWORD PTR [r13+0x8058]
    d192:	mov    eax,r15d
    d195:	xor    edx,edx
    d197:	div    edi
    d199:	test   edx,edx
    d19b:	jne    d570 <commit_one_file+0x4e0>
    d1a1:	mov    r10d,ebx
    d1a4:	cmp    edi,r15d
    d1a7:	jae    d224 <commit_one_file+0x194>
    d1a9:	mov    edx,DWORD PTR [r13+0x8068]
    d1b0:	mov    eax,edi
    d1b2:	mov    r10d,ebx
    d1b5:	jmp    d1d7 <commit_one_file+0x147>
    d1b7:	nop    WORD PTR [rax+rax*1+0x0]
    d1c0:	add    r10d,0x1
    d1c4:	cmp    edx,r10d
    d1c7:	jne    d1d0 <commit_one_file+0x140>
    d1c9:	mov    r10d,DWORD PTR [r13+0x8078]
    d1d0:	add    eax,edi
    d1d2:	cmp    r15d,eax
    d1d5:	jbe    d224 <commit_one_file+0x194>
    d1d7:	cmp    edx,r10d
    d1da:	ja     d1c0 <commit_one_file+0x130>
    d1dc:	mov    ecx,DWORD PTR [r13+0x800c]
    d1e3:	mov    rsi,QWORD PTR [r13+0x80b8]
    d1ea:	cmp    ecx,0x20
    d1ed:	je     d398 <commit_one_file+0x308>
    d1f3:	cmp    ecx,0x10
    d1f6:	je     d368 <commit_one_file+0x2d8>
    d1fc:	lea    ecx,[r10+r10*2]
    d200:	add    eax,edi
    d202:	shr    ecx,1
    d204:	movzx  esi,WORD PTR [rsi+rcx*1]
    d208:	lea    ecx,[r10*4+0x0]
    d210:	and    ecx,0x4
    d213:	sar    esi,cl
    d215:	mov    r10d,esi
    d218:	and    r10d,0xfff
    d21f:	cmp    r15d,eax
    d222:	ja     d1d7 <commit_one_file+0x147>
    d224:	mov    rdi,QWORD PTR [rbp+0x18]
    d228:	xor    eax,eax
    d22a:	mov    edx,0x1b6
    d22f:	mov    esi,0x42
    d234:	mov    DWORD PTR [rsp+0x1c],r10d
    d239:	call   3500 <open64@plt>
    d23e:	mov    r10d,DWORD PTR [rsp+0x1c]
    d243:	test   eax,eax
    d245:	mov    DWORD PTR [rsp+0x14],eax
    d249:	js     d474 <commit_one_file+0x3e4>
    d24f:	test   r15d,r15d
    d252:	jne    d3a8 <commit_one_file+0x318>
    d258:	test   r12d,r12d
    d25b:	jne    d302 <commit_one_file+0x272>
    d261:	jmp    d3f0 <commit_one_file+0x360>
    d266:	nop    WORD PTR cs:[rax+rax*1+0x0]
    d270:	lea    ebp,[r10+0x1]
    d274:	cmp    eax,ebp
    d276:	jne    d280 <commit_one_file+0x1f0>
    d278:	mov    ebp,DWORD PTR [r13+0x8078]
    d27f:	nop
    d280:	cmp    r10d,0x1
    d284:	jbe    d4b6 <commit_one_file+0x426>
    d28a:	mov    eax,DWORD PTR [r13+0x8078]
    d291:	sub    eax,0x8
    d294:	cmp    eax,r10d
    d297:	jb     d4b6 <commit_one_file+0x426>
    d29d:	mov    eax,r14d
    d2a0:	lea    ecx,[r14+0x3fe]
    d2a7:	mov    rdx,QWORD PTR [rsp+0x8]
    d2ac:	mov    rdi,QWORD PTR [r13+0x0]
    d2b0:	add    eax,0x1ff
    d2b5:	cmovns ecx,eax
    d2b8:	imul   r10d,DWORD PTR [r13+0x805c]
    d2c0:	sar    ecx,0x9
    d2c3:	mov    esi,r10d
    d2c6:	add    esi,DWORD PTR [r13+0x806c]
    d2cd:	call   c2a0 <vvfat_read>
    d2d2:	test   eax,eax
    d2d4:	js     d42e <commit_one_file+0x39e>
    d2da:	mov    rsi,QWORD PTR [rsp+0x8]
    d2df:	mov    edi,DWORD PTR [rsp+0x14]
    d2e3:	movsxd rdx,r14d
    d2e6:	call   5390 <qemu_write_ok>
    d2eb:	test   eax,eax
    d2ed:	js     d45a <commit_one_file+0x3ca>
    d2f3:	add    r15d,r14d
    d2f6:	mov    r10d,ebp
    d2f9:	cmp    r12d,r15d
    d2fc:	jbe    d3f0 <commit_one_file+0x360>
    d302:	mov    eax,DWORD PTR [r13+0x8058]
    d309:	mov    r11d,r12d
    d30c:	sub    r11d,r15d
    d30f:	cmp    r11d,eax
    d312:	cmovbe eax,r11d
    d316:	mov    r14d,eax
    d319:	mov    eax,DWORD PTR [r13+0x8068]
    d320:	cmp    eax,r10d
    d323:	ja     d270 <commit_one_file+0x1e0>
    d329:	mov    eax,DWORD PTR [r13+0x800c]
    d330:	mov    rdx,QWORD PTR [r13+0x80b8]
    d337:	cmp    eax,0x20
    d33a:	je     d388 <commit_one_file+0x2f8>
    d33c:	cmp    eax,0x10
    d33f:	je     d378 <commit_one_file+0x2e8>
    d341:	lea    eax,[r10+r10*2]
    d345:	lea    ecx,[r10*4+0x0]
    d34d:	shr    eax,1
    d34f:	and    ecx,0x4
    d352:	movzx  ebp,WORD PTR [rdx+rax*1]
    d356:	sar    ebp,cl
    d358:	and    ebp,0xfff
    d35e:	jmp    d280 <commit_one_file+0x1f0>
    d363:	nop    DWORD PTR [rax+rax*1+0x0]
    d368:	movzx  r10d,WORD PTR [rsi+r10*2]
    d36d:	jmp    d1d0 <commit_one_file+0x140>
    d372:	nop    WORD PTR [rax+rax*1+0x0]
    d378:	mov    eax,r10d
    d37b:	movzx  ebp,WORD PTR [rdx+rax*2]
    d37f:	jmp    d280 <commit_one_file+0x1f0>
    d384:	nop    DWORD PTR [rax+0x0]
    d388:	mov    eax,r10d
    d38b:	mov    ebp,DWORD PTR [rdx+rax*4]
    d38e:	jmp    d280 <commit_one_file+0x1f0>
    d393:	nop    DWORD PTR [rax+rax*1+0x0]
    d398:	mov    r10d,DWORD PTR [rsi+r10*4]
    d39c:	jmp    d1d0 <commit_one_file+0x140>
    d3a1:	xor    ebp,ebp
    d3a3:	jmp    d16d <commit_one_file+0xdd>
    d3a8:	mov    ebp,r15d
    d3ab:	mov    edi,DWORD PTR [rsp+0x14]
    d3af:	xor    edx,edx
    d3b1:	mov    DWORD PTR [rsp+0x1c],r10d
    d3b6:	mov    rsi,rbp
    d3b9:	call   3650 <lseek64@plt>
    d3be:	mov    r10d,DWORD PTR [rsp+0x1c]
    d3c3:	cmp    rbp,rax
    d3c6:	je     d302 <commit_one_file+0x272>
    d3cc:	mov    edi,DWORD PTR [rsp+0x14]
    d3d0:	call   3270 <close@plt>
    d3d5:	mov    rdi,QWORD PTR [rsp+0x8]
    d3da:	call   5960 <qemu_free>
    d3df:	mov    edx,0xfffffffd
    d3e4:	jmp    d449 <commit_one_file+0x3b9>
    d3e6:	nop    WORD PTR cs:[rax+rax*1+0x0]
    d3f0:	mov    r15d,DWORD PTR [rsp+0x14]
    d3f5:	mov    esi,r12d
    d3f8:	mov    edi,r15d
    d3fb:	call   34c0 <ftruncate64@plt>
    d400:	mov    edi,r15d
    d403:	call   3270 <close@plt>
    d408:	mov    rdi,QWORD PTR [rsp+0x8]
    d40d:	call   5960 <qemu_free>
    d412:	mov    edx,DWORD PTR [rsp+0x18]
    d416:	add    rsp,0x28
    d41a:	mov    esi,ebx
    d41c:	mov    rdi,r13
    d41f:	pop    rbx
    d420:	pop    rbp
    d421:	pop    r12
    d423:	pop    r13
    d425:	pop    r14
    d427:	pop    r15
    d429:	jmp    ca90 <commit_mappings>
    d42e:	mov    edi,DWORD PTR [rsp+0x14]
    d432:	mov    DWORD PTR [rsp+0x18],eax
    d436:	call   3270 <close@plt>
    d43b:	mov    rdi,QWORD PTR [rsp+0x8]
    d440:	call   5960 <qemu_free>
    d445:	mov    edx,DWORD PTR [rsp+0x18]
    d449:	add    rsp,0x28
    d44d:	mov    eax,edx
    d44f:	pop    rbx
    d450:	pop    rbp
    d451:	pop    r12
    d453:	pop    r13
    d455:	pop    r14
    d457:	pop    r15
    d459:	ret
    d45a:	mov    edi,DWORD PTR [rsp+0x14]
    d45e:	call   3270 <close@plt>
    d463:	mov    rdi,QWORD PTR [rsp+0x8]
    d468:	call   5960 <qemu_free>
    d46d:	mov    edx,0xfffffffe
    d472:	jmp    d449 <commit_one_file+0x3b9>
    d474:	call   30d0 <__errno_location@plt>
    d479:	mov    ebx,DWORD PTR [rax]
    d47b:	mov    edi,ebx
    d47d:	call   3690 <strerror@plt>
    d482:	mov    rcx,QWORD PTR [rbp+0x18]
    d486:	mov    r9d,ebx
    d489:	mov    esi,0x1
    d48e:	mov    rdi,QWORD PTR [rip+0x1ce6b]        # 2a300 <stderr@@GLIBC_2.2.5>
    d495:	mov    r8,rax
    d498:	xor    eax,eax
    d49a:	lea    rdx,[rip+0x13b6f]        # 21010 <desc_template.13939+0x730>
    d4a1:	call   3660 <__fprintf_chk@plt>
    d4a6:	mov    rdi,QWORD PTR [rsp+0x8]
    d4ab:	call   5960 <qemu_free>
    d4b0:	mov    edx,DWORD PTR [rsp+0x14]
    d4b4:	jmp    d449 <commit_one_file+0x3b9>
    d4b6:	lea    rcx,[rip+0x13ea3]        # 21360 <__PRETTY_FUNCTION__.14610>
    d4bd:	mov    edx,0x8ce
    d4c2:	lea    rsi,[rip+0x1361d]        # 20ae6 <desc_template.13939+0x206>
    d4c9:	lea    rdi,[rip+0x13b60]        # 21030 <desc_template.13939+0x750>
    d4d0:	call   3230 <__assert_fail@plt>
    d4d5:	lea    rcx,[rip+0x13fa4]        # 21480 <__PRETTY_FUNCTION__.14249>
    d4dc:	mov    edx,0x465
    d4e1:	lea    rsi,[rip+0x135fe]        # 20ae6 <desc_template.13939+0x206>
    d4e8:	lea    rdi,[rip+0x1367a]        # 20b69 <desc_template.13939+0x289>
    d4ef:	call   3230 <__assert_fail@plt>
    d4f4:	lea    rcx,[rip+0x13f85]        # 21480 <__PRETTY_FUNCTION__.14249>
    d4fb:	mov    edx,0x45a
    d500:	lea    rsi,[rip+0x135df]        # 20ae6 <desc_template.13939+0x206>
    d507:	lea    rdi,[rip+0x13621]        # 20b2f <desc_template.13939+0x24f>
    d50e:	call   3230 <__assert_fail@plt>
    d513:	lea    rcx,[rip+0x13f56]        # 21470 <__PRETTY_FUNCTION__.13830>
    d51a:	mov    edx,0x60
    d51f:	lea    rsi,[rip+0x135c0]        # 20ae6 <desc_template.13939+0x206>
    d526:	lea    rdi,[rip+0x135ee]        # 20b1b <desc_template.13939+0x23b>
    d52d:	call   3230 <__assert_fail@plt>
    d532:	lea    rcx,[rip+0x13f47]        # 21480 <__PRETTY_FUNCTION__.14249>
    d539:	mov    edx,0x45c
    d53e:	lea    rsi,[rip+0x135a1]        # 20ae6 <desc_template.13939+0x206>
    d545:	lea    rdi,[rip+0x13601]        # 20b4d <desc_template.13939+0x26d>
    d54c:	call   3230 <__assert_fail@plt>
    d551:	lea    rcx,[rip+0x13f48]        # 214a0 <__PRETTY_FUNCTION__.14257>
    d558:	mov    edx,0x477
    d55d:	lea    rsi,[rip+0x13582]        # 20ae6 <desc_template.13939+0x206>
    d564:	lea    rdi,[rip+0x138d5]        # 20e40 <desc_template.13939+0x560>
    d56b:	call   3230 <__assert_fail@plt>
    d570:	lea    rcx,[rip+0x13de9]        # 21360 <__PRETTY_FUNCTION__.14610>
    d577:	mov    edx,0x8b2
    d57c:	lea    rsi,[rip+0x13563]        # 20ae6 <desc_template.13939+0x206>
    d583:	lea    rdi,[rip+0x13a66]        # 20ff0 <desc_template.13939+0x710>
    d58a:	call   3230 <__assert_fail@plt>
    d58f:	lea    rcx,[rip+0x13dca]        # 21360 <__PRETTY_FUNCTION__.14610>
    d596:	mov    edx,0x8b1
    d59b:	lea    rsi,[rip+0x13544]        # 20ae6 <desc_template.13939+0x206>
    d5a2:	lea    rdi,[rip+0x135ef]        # 20b98 <desc_template.13939+0x2b8>
    d5a9:	call   3230 <__assert_fail@plt>
    d5ae:	xchg   ax,ax

000000000000d5b0 <commit_direntries>:
    d5b0:	push   r15
    d5b2:	push   r14
    d5b4:	push   r13
    d5b6:	push   r12
    d5b8:	push   rbp
    d5b9:	push   rbx
    d5ba:	sub    rsp,0x18
    d5be:	mov    r10d,DWORD PTR [rdi+0x8034]
    d5c5:	mov    DWORD PTR [rsp+0xc],esi
    d5c9:	cmp    esi,r10d
    d5cc:	jae    db88 <commit_direntries+0x5d8>
    d5d2:	mov    eax,DWORD PTR [rsp+0xc]
    d5d6:	mov    rbx,rdi
    d5d9:	xor    r14d,r14d
    d5dc:	mov    r9d,eax
    d5df:	imul   r9d,DWORD PTR [rdi+0x8038]
    d5e7:	add    r9,QWORD PTR [rdi+0x8028]
    d5ee:	test   eax,eax
    d5f0:	jne    d8c0 <commit_direntries+0x310>
    d5f6:	mov    r11d,DWORD PTR [rbx+0x804c]
    d5fd:	xor    r8d,r8d
    d600:	mov    esi,r11d
    d603:	jmp    d623 <commit_direntries+0x73>
    d605:	nop    DWORD PTR [rax]
    d608:	cmp    esi,eax
    d60a:	jne    d614 <commit_direntries+0x64>
    d60c:	test   esi,esi
    d60e:	jne    dbf6 <commit_direntries+0x646>
    d614:	cmp    esi,eax
    d616:	je     d678 <commit_direntries+0xc8>
    d618:	mov    esi,eax
    d61a:	cmp    r8d,esi
    d61d:	jg     dbd7 <commit_direntries+0x627>
    d623:	lea    ecx,[r8+rsi*1]
    d627:	mov    eax,ecx
    d629:	shr    eax,0x1f
    d62c:	add    eax,ecx
    d62e:	sar    eax,1
    d630:	cmp    r11d,eax
    d633:	jbe    db88 <commit_direntries+0x5d8>
    d639:	mov    ebp,DWORD PTR [rbx+0x8050]
    d63f:	mov    ecx,eax
    d641:	mov    r13,QWORD PTR [rbx+0x8040]
    d648:	imul   ecx,ebp
    d64b:	add    rcx,r13
    d64e:	mov    edi,DWORD PTR [rcx]
    d650:	mov    r15d,DWORD PTR [rcx+0x4]
    d654:	cmp    edi,r15d
    d657:	jae    dbb8 <commit_direntries+0x608>
    d65d:	cmp    r14d,edi
    d660:	jbe    d608 <commit_direntries+0x58>
    d662:	cmp    r8d,eax
    d665:	je     d66c <commit_direntries+0xbc>
    d667:	mov    r8d,eax
    d66a:	jmp    d61a <commit_direntries+0x6a>
    d66c:	cmp    r14d,r15d
    d66f:	jb     db1c <commit_direntries+0x56c>
    d675:	mov    r8d,esi
    d678:	cmp    r11d,r8d
    d67b:	jbe    3741 <commit_direntries.cold.11>
    d681:	imul   r8d,ebp
    d685:	lea    rcx,[r13+r8*1+0x0]
    d68a:	mov    edi,DWORD PTR [rcx]
    d68c:	cmp    r14d,edi
    d68f:	jb     3741 <commit_direntries.cold.11>
    d695:	cmp    r14d,DWORD PTR [rcx+0x4]
    d699:	jae    dcd9 <commit_direntries+0x729>
    d69f:	mov    eax,DWORD PTR [rbx+0x805c]
    d6a5:	mov    r13d,DWORD PTR [rcx+0x14]
    d6a9:	shl    eax,0x4
    d6ac:	mov    DWORD PTR [rsp+0x8],eax
    d6b0:	test   r9,r9
    d6b3:	je     dcba <commit_direntries+0x70a>
    d6b9:	cmp    r14d,edi
    d6bc:	jne    dc9b <commit_direntries+0x6eb>
    d6c2:	mov    ebp,r13d
    d6c5:	cmp    r13d,r10d
    d6c8:	jae    dc34 <commit_direntries+0x684>
    d6ce:	test   BYTE PTR [rcx+0x20],0x4
    d6d2:	je     dc5d <commit_direntries+0x6ad>
    d6d8:	mov    eax,DWORD PTR [rsp+0xc]
    d6dc:	test   eax,eax
    d6de:	je     d710 <commit_direntries+0x160>
    d6e0:	test   BYTE PTR [r9+0xb],0x10
    d6e5:	je     d6ed <commit_direntries+0x13d>
    d6e7:	cmp    BYTE PTR [r9],0xe5
    d6eb:	jne    d710 <commit_direntries+0x160>
    d6ed:	lea    rcx,[rip+0x13c9c]        # 21390 <__PRETTY_FUNCTION__.14582>
    d6f4:	mov    edx,0x86a
    d6f9:	lea    rsi,[rip+0x133e6]        # 20ae6 <desc_template.13939+0x206>
    d700:	lea    rdi,[rip+0x13a09]        # 21110 <desc_template.13939+0x830>
    d707:	call   3230 <__assert_fail@plt>
    d70c:	nop    DWORD PTR [rax+0x0]
    d710:	mov    DWORD PTR [rcx+0x10],edx
    d713:	test   r14d,r14d
    d716:	jne    d8d6 <commit_direntries+0x326>
    d71c:	mov    r12d,DWORD PTR [rbx+0x8068]
    d723:	mov    eax,DWORD PTR [rbx+0x8078]
    d729:	mov    r15d,r14d
    d72c:	nop    DWORD PTR [rax+0x0]
    d730:	sub    eax,0x8
    d733:	cmp    r15d,eax
    d736:	ja     d7d1 <commit_direntries+0x221>
    d73c:	cmp    DWORD PTR [rbx+0x8034],r13d
    d743:	jbe    db88 <commit_direntries+0x5d8>
    d749:	mov    ecx,DWORD PTR [rbx+0x805c]
    d74f:	mov    rdi,QWORD PTR [rbx]
    d752:	mov    edx,r13d
    d755:	imul   edx,DWORD PTR [rbx+0x8038]
    d75c:	add    rdx,QWORD PTR [rbx+0x8028]
    d763:	mov    esi,ecx
    d765:	imul   esi,r15d
    d769:	add    esi,DWORD PTR [rbx+0x806c]
    d76f:	call   c2a0 <vvfat_read>
    d774:	mov    ecx,eax
    d776:	test   eax,eax
    d778:	jne    da37 <commit_direntries+0x487>
    d77e:	mov    rsi,QWORD PTR [rbx+0x8028]
    d785:	mov    ecx,0x4
    d78a:	lea    rdi,[rip+0x1341e]        # 20baf <desc_template.13939+0x2cf>
    d791:	repz cmps BYTE PTR ds:[rsi],BYTE PTR es:[rdi]
    d793:	seta   al
    d796:	sbb    al,0x0
    d798:	test   al,al
    d79a:	jne    dc15 <commit_direntries+0x665>
    d7a0:	mov    edx,DWORD PTR [rbx+0x8068]
    d7a6:	add    r13d,DWORD PTR [rsp+0x8]
    d7ab:	mov    eax,DWORD PTR [rbx+0x8078]
    d7b1:	cmp    r15d,edx
    d7b4:	jae    daa0 <commit_direntries+0x4f0>
    d7ba:	add    r15d,0x1
    d7be:	cmp    edx,r15d
    d7c1:	cmove  r15d,eax
    d7c5:	sub    eax,0x8
    d7c8:	cmp    r15d,eax
    d7cb:	jbe    d73c <commit_direntries+0x18c>
    d7d1:	mov    edx,DWORD PTR [rsp+0xc]
    d7d5:	mov    esi,r14d
    d7d8:	mov    rdi,rbx
    d7db:	call   ca90 <commit_mappings>
    d7e0:	mov    ecx,eax
    d7e2:	test   eax,eax
    d7e4:	jne    da37 <commit_direntries+0x487>
    d7ea:	mov    r13d,DWORD PTR [rsp+0x8]
    d7ef:	imul   r13d,r12d
    d7f3:	test   r13d,r13d
    d7f6:	jle    da37 <commit_direntries+0x487>
    d7fc:	cmp    ebp,DWORD PTR [rbx+0x8034]
    d802:	jae    db88 <commit_direntries+0x5d8>
    d808:	lea    r12d,[r13+rbp*1-0x1]
    d80d:	nop    DWORD PTR [rax]
    d810:	mov    eax,ebp
    d812:	imul   eax,DWORD PTR [rbx+0x8038]
    d819:	add    rax,QWORD PTR [rbx+0x8028]
    d820:	movzx  edx,BYTE PTR [rax]
    d823:	movzx  eax,BYTE PTR [rax+0xb]
    d827:	test   al,0x10
    d829:	je     db70 <commit_direntries+0x5c0>
    d82f:	cmp    dl,0xe5
    d832:	je     db70 <commit_direntries+0x5c0>
    d838:	cmp    al,0x28
    d83a:	jne    db60 <commit_direntries+0x5b0>
    d840:	mov    r9d,DWORD PTR [rbx+0x804c]
    d847:	xor    r8d,r8d
    d84a:	mov    edi,r9d
    d84d:	jmp    d86f <commit_direntries+0x2bf>
    d84f:	nop
    d850:	cmp    edi,eax
    d852:	jne    d85c <commit_direntries+0x2ac>
    d854:	test   edi,edi
    d856:	jne    dbf6 <commit_direntries+0x646>
    d85c:	cmp    edi,eax
    d85e:	je     d9df <commit_direntries+0x42f>
    d864:	mov    edi,eax
    d866:	cmp    r8d,edi
    d869:	jg     dbd7 <commit_direntries+0x627>
    d86f:	lea    edx,[rdi+r8*1]
    d873:	mov    eax,edx
    d875:	shr    eax,0x1f
    d878:	add    eax,edx
    d87a:	sar    eax,1
    d87c:	cmp    r9d,eax
    d87f:	jbe    db88 <commit_direntries+0x5d8>
    d885:	mov    r10d,DWORD PTR [rbx+0x8050]
    d88c:	mov    esi,eax
    d88e:	mov    r11,QWORD PTR [rbx+0x8040]
    d895:	imul   esi,r10d
    d899:	add    rsi,r11
    d89c:	mov    edx,DWORD PTR [rsi]
    d89e:	mov    r13d,DWORD PTR [rsi+0x4]
    d8a2:	cmp    edx,r13d
    d8a5:	jae    dbb8 <commit_direntries+0x608>
    d8ab:	cmp    r14d,edx
    d8ae:	jbe    d850 <commit_direntries+0x2a0>
    d8b0:	cmp    r8d,eax
    d8b3:	je     d9d3 <commit_direntries+0x423>
    d8b9:	mov    r8d,eax
    d8bc:	jmp    d866 <commit_direntries+0x2b6>
    d8be:	xchg   ax,ax
    d8c0:	movzx  r14d,WORD PTR [r9+0x14]
    d8c5:	movzx  eax,WORD PTR [r9+0x1a]
    d8ca:	shl    r14d,0x10
    d8ce:	or     r14d,eax
    d8d1:	jmp    d5f6 <commit_direntries+0x46>
    d8d6:	mov    eax,DWORD PTR [rbx+0x8078]
    d8dc:	mov    ecx,r14d
    d8df:	xor    esi,esi
    d8e1:	lea    edi,[rax-0x8]
    d8e4:	nop    DWORD PTR [rax+0x0]
    d8e8:	cmp    ecx,edi
    d8ea:	ja     d929 <commit_direntries+0x379>
    d8ec:	mov    edx,DWORD PTR [rbx+0x800c]
    d8f2:	add    esi,0x1
    d8f5:	cmp    edx,0x20
    d8f8:	je     da50 <commit_direntries+0x4a0>
    d8fe:	cmp    edx,0x10
    d901:	jne    da78 <commit_direntries+0x4c8>
    d907:	cmp    ecx,DWORD PTR [rbx+0x801c]
    d90d:	jae    db88 <commit_direntries+0x5d8>
    d913:	imul   ecx,DWORD PTR [rbx+0x8020]
    d91a:	mov    rdx,QWORD PTR [rbx+0x8010]
    d921:	movzx  ecx,WORD PTR [rdx+rcx*1]
    d925:	cmp    ecx,edi
    d927:	jbe    d8ec <commit_direntries+0x33c>
    d929:	cmp    r14d,edi
    d92c:	ja     db30 <commit_direntries+0x580>
    d932:	mov    r10d,DWORD PTR [rbx+0x8068]
    d939:	mov    ecx,r14d
    d93c:	xor    r12d,r12d
    d93f:	jmp    d956 <commit_direntries+0x3a6>
    d941:	nop    DWORD PTR [rax+0x0]
    d948:	add    ecx,0x1
    d94b:	cmp    r10d,ecx
    d94e:	cmove  rcx,rax
    d952:	cmp    ecx,edi
    d954:	ja     d99c <commit_direntries+0x3ec>
    d956:	add    r12d,0x1
    d95a:	cmp    r10d,ecx
    d95d:	ja     d948 <commit_direntries+0x398>
    d95f:	mov    edx,DWORD PTR [rbx+0x800c]
    d965:	mov    r11,QWORD PTR [rbx+0x80b8]
    d96c:	cmp    edx,0x20
    d96f:	je     daf0 <commit_direntries+0x540>
    d975:	cmp    edx,0x10
    d978:	je     dae0 <commit_direntries+0x530>
    d97e:	lea    edx,[rcx+rcx*2]
    d981:	shl    ecx,0x2
    d984:	shr    edx,1
    d986:	and    ecx,0x4
    d989:	movzx  edx,WORD PTR [r11+rdx*1]
    d98e:	sar    edx,cl
    d990:	mov    ecx,edx
    d992:	and    ecx,0xfff
    d998:	cmp    ecx,edi
    d99a:	jbe    d956 <commit_direntries+0x3a6>
    d99c:	cmp    esi,r12d
    d99f:	jge    db33 <commit_direntries+0x583>
    d9a5:	mov    eax,DWORD PTR [rsp+0x8]
    d9a9:	mov    edx,r12d
    d9ac:	mov    rdi,rbx
    d9af:	sub    edx,esi
    d9b1:	imul   esi,eax
    d9b4:	imul   edx,eax
    d9b7:	add    esi,r13d
    d9ba:	call   c030 <insert_direntries>
    d9bf:	test   rax,rax
    d9c2:	je     dc53 <commit_direntries+0x6a3>
    d9c8:	mov    eax,DWORD PTR [rbx+0x8078]
    d9ce:	jmp    d729 <commit_direntries+0x179>
    d9d3:	cmp    r14d,r13d
    d9d6:	jb     dba7 <commit_direntries+0x5f7>
    d9dc:	mov    r8d,edi
    d9df:	cmp    r9d,r8d
    d9e2:	jbe    374a <commit_direntries.cold.11+0x9>
    d9e8:	imul   r8d,r10d
    d9ec:	lea    rsi,[r11+r8*1]
    d9f0:	cmp    r14d,DWORD PTR [rsi]
    d9f3:	jb     374a <commit_direntries.cold.11+0x9>
    d9f9:	cmp    r14d,DWORD PTR [rsi+0x4]
    d9fd:	jae    dcd9 <commit_direntries+0x729>
    da03:	test   BYTE PTR [rsi+0x20],0x4
    da07:	je     dc7c <commit_direntries+0x6cc>
    da0d:	lea    rdi,[rbx+0x8040]
    da14:	mov    DWORD PTR [rsp+0x8],ecx
    da18:	call   ca20 <array_index>
    da1d:	mov    esi,ebp
    da1f:	mov    rdi,rbx
    da22:	mov    edx,eax
    da24:	call   d5b0 <commit_direntries>
    da29:	mov    ecx,DWORD PTR [rsp+0x8]
    da2d:	test   eax,eax
    da2f:	je     db70 <commit_direntries+0x5c0>
    da35:	mov    ecx,eax
    da37:	add    rsp,0x18
    da3b:	mov    eax,ecx
    da3d:	pop    rbx
    da3e:	pop    rbp
    da3f:	pop    r12
    da41:	pop    r13
    da43:	pop    r14
    da45:	pop    r15
    da47:	ret
    da48:	nop    DWORD PTR [rax+rax*1+0x0]
    da50:	cmp    ecx,DWORD PTR [rbx+0x801c]
    da56:	jae    db88 <commit_direntries+0x5d8>
    da5c:	imul   ecx,DWORD PTR [rbx+0x8020]
    da63:	mov    rdx,QWORD PTR [rbx+0x8010]
    da6a:	mov    ecx,DWORD PTR [rdx+rcx*1]
    da6d:	jmp    d8e8 <commit_direntries+0x338>
    da72:	nop    WORD PTR [rax+rax*1+0x0]
    da78:	lea    edx,[rcx+rcx*2]
    da7b:	mov    r9,QWORD PTR [rbx+0x8010]
    da82:	shl    ecx,0x2
    da85:	shr    edx,1
    da87:	and    ecx,0x4
    da8a:	movzx  edx,WORD PTR [r9+rdx*1]
    da8f:	sar    edx,cl
    da91:	mov    ecx,edx
    da93:	and    ecx,0xfff
    da99:	jmp    d8e8 <commit_direntries+0x338>
    da9e:	xchg   ax,ax
    daa0:	mov    edx,DWORD PTR [rbx+0x800c]
    daa6:	mov    rsi,QWORD PTR [rbx+0x80b8]
    daad:	cmp    edx,0x20
    dab0:	je     db10 <commit_direntries+0x560>
    dab2:	cmp    edx,0x10
    dab5:	je     db00 <commit_direntries+0x550>
    dab7:	lea    edx,[r15+r15*2]
    dabb:	lea    ecx,[r15*4+0x0]
    dac3:	shr    edx,1
    dac5:	and    ecx,0x4
    dac8:	movzx  edx,WORD PTR [rsi+rdx*1]
    dacc:	sar    edx,cl
    dace:	mov    r10d,edx
    dad1:	and    r10d,0xfff
    dad8:	mov    r15d,r10d
    dadb:	jmp    d730 <commit_direntries+0x180>
    dae0:	movzx  ecx,WORD PTR [r11+rcx*2]
    dae5:	jmp    d952 <commit_direntries+0x3a2>
    daea:	nop    WORD PTR [rax+rax*1+0x0]
    daf0:	mov    ecx,DWORD PTR [r11+rcx*4]
    daf4:	jmp    d952 <commit_direntries+0x3a2>
    daf9:	nop    DWORD PTR [rax+0x0]
    db00:	mov    r10d,r15d
    db03:	movzx  r15d,WORD PTR [rsi+r10*2]
    db08:	jmp    d730 <commit_direntries+0x180>
    db0d:	nop    DWORD PTR [rax]
    db10:	mov    r10d,r15d
    db13:	mov    r15d,DWORD PTR [rsi+r10*4]
    db17:	jmp    d730 <commit_direntries+0x180>
    db1c:	cmp    r14d,edi
    db1f:	jae    d69f <commit_direntries+0xef>
    db25:	jmp    3741 <commit_direntries.cold.11>
    db2a:	nop    WORD PTR [rax+rax*1+0x0]
    db30:	xor    r12d,r12d
    db33:	cmp    esi,r12d
    db36:	jle    d729 <commit_direntries+0x179>
    db3c:	sub    esi,r12d
    db3f:	mov    eax,DWORD PTR [rsp+0x8]
    db43:	mov    rdi,rbx
    db46:	mov    edx,esi
    db48:	imul   edx,eax
    db4b:	imul   eax,r12d
    db4f:	mov    esi,eax
    db51:	add    esi,r13d
    db54:	call   c100 <remove_direntries>
    db59:	jmp    d9c8 <commit_direntries+0x418>
    db5e:	xchg   ax,ax
    db60:	cmp    dl,0x2e
    db63:	jne    d840 <commit_direntries+0x290>
    db69:	nop    DWORD PTR [rax+0x0]
    db70:	cmp    r12d,ebp
    db73:	je     da37 <commit_direntries+0x487>
    db79:	add    ebp,0x1
    db7c:	cmp    DWORD PTR [rbx+0x8034],ebp
    db82:	ja     d810 <commit_direntries+0x260>
    db88:	lea    rcx,[rip+0x138e1]        # 21470 <__PRETTY_FUNCTION__.13830>
    db8f:	mov    edx,0x60
    db94:	lea    rsi,[rip+0x12f4b]        # 20ae6 <desc_template.13939+0x206>
    db9b:	lea    rdi,[rip+0x12f79]        # 20b1b <desc_template.13939+0x23b>
    dba2:	call   3230 <__assert_fail@plt>
    dba7:	cmp    r14d,edx
    dbaa:	jae    da03 <commit_direntries+0x453>
    dbb0:	jmp    374a <commit_direntries.cold.11+0x9>
    dbb5:	nop    DWORD PTR [rax]
    dbb8:	lea    rcx,[rip+0x138c1]        # 21480 <__PRETTY_FUNCTION__.14249>
    dbbf:	mov    edx,0x45a
    dbc4:	lea    rsi,[rip+0x12f1b]        # 20ae6 <desc_template.13939+0x206>
    dbcb:	lea    rdi,[rip+0x12f5d]        # 20b2f <desc_template.13939+0x24f>
    dbd2:	call   3230 <__assert_fail@plt>
    dbd7:	lea    rcx,[rip+0x138a2]        # 21480 <__PRETTY_FUNCTION__.14249>
    dbde:	mov    edx,0x465
    dbe3:	lea    rsi,[rip+0x12efc]        # 20ae6 <desc_template.13939+0x206>
    dbea:	lea    rdi,[rip+0x12f78]        # 20b69 <desc_template.13939+0x289>
    dbf1:	call   3230 <__assert_fail@plt>
    dbf6:	lea    rcx,[rip+0x13883]        # 21480 <__PRETTY_FUNCTION__.14249>
    dbfd:	mov    edx,0x45c
    dc02:	lea    rsi,[rip+0x12edd]        # 20ae6 <desc_template.13939+0x206>
    dc09:	lea    rdi,[rip+0x12f3d]        # 20b4d <desc_template.13939+0x26d>
    dc10:	call   3230 <__assert_fail@plt>
    dc15:	lea    rcx,[rip+0x13774]        # 21390 <__PRETTY_FUNCTION__.14582>
    dc1c:	mov    edx,0x88b
    dc21:	lea    rsi,[rip+0x12ebe]        # 20ae6 <desc_template.13939+0x206>
    dc28:	lea    rdi,[rip+0x134b1]        # 210e0 <desc_template.13939+0x800>
    dc2f:	call   3230 <__assert_fail@plt>
    dc34:	lea    rcx,[rip+0x13755]        # 21390 <__PRETTY_FUNCTION__.14582>
    dc3b:	mov    edx,0x868
    dc40:	lea    rsi,[rip+0x12e9f]        # 20ae6 <desc_template.13939+0x206>
    dc47:	lea    rdi,[rip+0x1343a]        # 21088 <desc_template.13939+0x7a8>
    dc4e:	call   3230 <__assert_fail@plt>
    dc53:	mov    ecx,0xffffffff
    dc58:	jmp    da37 <commit_direntries+0x487>
    dc5d:	lea    rcx,[rip+0x1372c]        # 21390 <__PRETTY_FUNCTION__.14582>
    dc64:	mov    edx,0x869
    dc69:	lea    rsi,[rip+0x12e76]        # 20ae6 <desc_template.13939+0x206>
    dc70:	lea    rdi,[rip+0x13449]        # 210c0 <desc_template.13939+0x7e0>
    dc77:	call   3230 <__assert_fail@plt>
    dc7c:	lea    rcx,[rip+0x1370d]        # 21390 <__PRETTY_FUNCTION__.14582>
    dc83:	mov    edx,0x898
    dc88:	lea    rsi,[rip+0x12e57]        # 20ae6 <desc_template.13939+0x206>
    dc8f:	lea    rdi,[rip+0x1342a]        # 210c0 <desc_template.13939+0x7e0>
    dc96:	call   3230 <__assert_fail@plt>
    dc9b:	lea    rcx,[rip+0x136ee]        # 21390 <__PRETTY_FUNCTION__.14582>
    dca2:	mov    edx,0x867
    dca7:	lea    rsi,[rip+0x12e38]        # 20ae6 <desc_template.13939+0x206>
    dcae:	lea    rdi,[rip+0x132c3]        # 20f78 <desc_template.13939+0x698>
    dcb5:	call   3230 <__assert_fail@plt>
    dcba:	lea    rcx,[rip+0x136cf]        # 21390 <__PRETTY_FUNCTION__.14582>
    dcc1:	mov    edx,0x865
    dcc6:	lea    rsi,[rip+0x12e19]        # 20ae6 <desc_template.13939+0x206>
    dccd:	lea    rdi,[rip+0x12ed2]        # 20ba6 <desc_template.13939+0x2c6>
    dcd4:	call   3230 <__assert_fail@plt>
    dcd9:	lea    rcx,[rip+0x137c0]        # 214a0 <__PRETTY_FUNCTION__.14257>
    dce0:	mov    edx,0x477
    dce5:	lea    rsi,[rip+0x12dfa]        # 20ae6 <desc_template.13939+0x206>
    dcec:	lea    rdi,[rip+0x1314d]        # 20e40 <desc_template.13939+0x560>
    dcf3:	call   3230 <__assert_fail@plt>
    dcf8:	nop    DWORD PTR [rax+rax*1+0x0]

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

000000000000de90 <check_directory_consistency>:
    de90:	push   r15
    de92:	mov    r15,rdi
    de95:	push   r14
    de97:	push   r13
    de99:	push   r12
    de9b:	push   rbp
    de9c:	push   rbx
    de9d:	mov    ebx,esi
    de9f:	sub    rsp,0x13d8
    dea6:	mov    edi,DWORD PTR [rdi+0x8058]
    deac:	mov    DWORD PTR [rsp+0x10],esi
    deb0:	mov    QWORD PTR [rsp+0x40],rdx
    deb5:	mov    rax,QWORD PTR fs:0x28
    debe:	mov    QWORD PTR [rsp+0x13c8],rax
    dec6:	xor    eax,eax
    dec8:	call   5970 <qemu_malloc>
    decd:	mov    r9d,DWORD PTR [r15+0x804c]
    ded4:	xor    esi,esi
    ded6:	mov    r11d,ebx
    ded9:	mov    QWORD PTR [rsp+0x28],rax
    dede:	mov    ecx,r9d
    dee1:	jmp    df02 <check_directory_consistency+0x72>
    dee3:	nop    DWORD PTR [rax+rax*1+0x0]
    dee8:	cmp    eax,ecx
    deea:	jne    def4 <check_directory_consistency+0x64>
    deec:	test   ecx,ecx
    deee:	jne    ef1e <check_directory_consistency+0x108e>
    def4:	cmp    eax,ecx
    def6:	je     df4f <check_directory_consistency+0xbf>
    def8:	mov    ecx,eax
    defa:	cmp    esi,ecx
    defc:	jg     ee74 <check_directory_consistency+0xfe4>
    df02:	lea    edx,[rsi+rcx*1]
    df05:	mov    eax,edx
    df07:	shr    eax,0x1f
    df0a:	add    eax,edx
    df0c:	sar    eax,1
    df0e:	cmp    eax,r9d
    df11:	jae    ee55 <check_directory_consistency+0xfc5>
    df17:	mov    r8d,DWORD PTR [r15+0x8050]
    df1e:	mov    r10,QWORD PTR [r15+0x8040]
    df25:	mov    edx,r8d
    df28:	imul   edx,eax
    df2b:	add    rdx,r10
    df2e:	mov    edi,DWORD PTR [rdx]
    df30:	mov    edx,DWORD PTR [rdx+0x4]
    df33:	cmp    edx,edi
    df35:	jbe    ee93 <check_directory_consistency+0x1003>
    df3b:	cmp    r11d,edi
    df3e:	jbe    dee8 <check_directory_consistency+0x58>
    df40:	cmp    eax,esi
    df42:	je     df48 <check_directory_consistency+0xb8>
    df44:	mov    esi,eax
    df46:	jmp    defa <check_directory_consistency+0x6a>
    df48:	cmp    DWORD PTR [rsp+0x10],edx
    df4c:	cmovae esi,ecx
    df4f:	cmp    r9d,esi
    df52:	jbe    ea19 <check_directory_consistency+0xb89>
    df58:	imul   esi,r8d
    df5c:	mov    eax,DWORD PTR [rsp+0x10]
    df60:	lea    rbp,[r10+rsi*1]
    df64:	cmp    eax,DWORD PTR [rbp+0x0]
    df67:	jb     ea19 <check_directory_consistency+0xb89>
    df6d:	cmp    eax,DWORD PTR [rbp+0x4]
    df70:	jae    eb6b <check_directory_consistency+0xcdb>
    df76:	mov    rdi,QWORD PTR [rsp+0x40]
    df7b:	call   31b0 <strlen@plt>
    df80:	mov    r12,rax
    df83:	mov    ebx,eax
    df85:	cmp    eax,0xfff
    df8a:	jg     ed81 <check_directory_consistency+0xef1>
    df90:	mov    r14,QWORD PTR [rsp+0x40]
    df95:	lea    rax,[rsp+0x3c0]
    df9d:	mov    esi,0x1000
    dfa2:	mov    rdi,rax
    dfa5:	mov    QWORD PTR [rsp+0x20],rax
    dfaa:	mov    rdx,r14
    dfad:	call   5560 <pstrcpy>
    dfb2:	movsxd rax,r12d
    dfb5:	mov    esi,0x2f
    dfba:	mov    BYTE PTR [rsp+rax*1+0x3c0],0x2f
    dfc2:	lea    eax,[r12+0x1]
    dfc7:	mov    DWORD PTR [rsp+0x50],eax
    dfcb:	cdqe
    dfcd:	mov    BYTE PTR [rsp+rax*1+0x3c0],0x0
    dfd5:	mov    r12,QWORD PTR [rbp+0x18]
    dfd9:	mov    rdi,r12
    dfdc:	call   3210 <strrchr@plt>
    dfe1:	mov    esi,0x2f
    dfe6:	mov    rdi,r14
    dfe9:	lea    rdx,[rax+0x1]
    dfed:	test   rax,rax
    dff0:	cmovne r12,rdx
    dff4:	call   3210 <strrchr@plt>
    dff9:	lea    rdx,[rax+0x1]
    dffd:	test   rax,rax
    e000:	mov    eax,DWORD PTR [rbp+0x20]
    e003:	mov    rsi,rdx
    e006:	cmove  rsi,r14
    e00a:	test   al,0x4
    e00c:	je     f04a <check_directory_consistency+0x11ba>
    e012:	test   al,0x10
    e014:	je     f069 <check_directory_consistency+0x11d9>
    e01a:	and    eax,0xffffffef
    e01d:	mov    rdi,r12
    e020:	mov    DWORD PTR [rbp+0x20],eax
    e023:	call   3350 <strcmp@plt>
    e028:	test   eax,eax
    e02a:	jne    eb05 <check_directory_consistency+0xc75>
    e030:	movsxd rdi,ebx
    e033:	mov    eax,0xfff
    e038:	mov    DWORD PTR [rsp+0x3b4],0x100
    e043:	sub    rax,rdi
    e046:	mov    DWORD PTR [rsp+0x14],0x0
    e04e:	mov    QWORD PTR [rsp+0x3b8],0x0
    e05a:	mov    QWORD PTR [rsp+0x30],rdi
    e05f:	mov    QWORD PTR [rsp+0x38],rax
    e064:	movsxd rax,DWORD PTR [rsp+0x10]
    e069:	add    rax,QWORD PTR [r15+0x80c0]
    e070:	add    DWORD PTR [rsp+0x14],0x1
    e075:	test   BYTE PTR [rax],0x3
    e078:	jne    ed3c <check_directory_consistency+0xeac>
    e07e:	mov    esi,DWORD PTR [rsp+0x10]
    e082:	mov    r14,QWORD PTR [rsp+0x28]
    e087:	mov    BYTE PTR [rax],0x1
    e08a:	mov    ecx,DWORD PTR [r15+0x805c]
    e091:	mov    rdi,QWORD PTR [r15]
    e094:	mov    rdx,r14
    e097:	imul   esi,ecx
    e09a:	add    esi,DWORD PTR [r15+0x806c]
    e0a1:	call   c2a0 <vvfat_read>
    e0a6:	test   eax,eax
    e0a8:	jne    ed5f <check_directory_consistency+0xecf>
    e0ae:	mov    esi,DWORD PTR [r15+0x805c]
    e0b5:	xor    r13d,r13d
    e0b8:	mov    eax,esi
    e0ba:	shl    eax,0x4
    e0bd:	je     e22d <check_directory_consistency+0x39d>
    e0c3:	nop    DWORD PTR [rax+rax*1+0x0]
    e0c8:	movzx  edx,BYTE PTR [r14+0xb]
    e0cd:	cmp    dl,0x28
    e0d0:	je     e217 <check_directory_consistency+0x387>
    e0d6:	movzx  ecx,BYTE PTR [r14]
    e0da:	test   cl,cl
    e0dc:	sete   al
    e0df:	cmp    cl,0xe5
    e0e2:	sete   dil
    e0e6:	or     eax,edi
    e0e8:	cmp    dl,0xf
    e0eb:	je     e580 <check_directory_consistency+0x6f0>
    e0f1:	test   al,al
    e0f3:	jne    e217 <check_directory_consistency+0x387>
    e0f9:	cmp    cl,0x2e
    e0fc:	je     e217 <check_directory_consistency+0x387>
    e102:	lea    rbp,[rsp+0x80]
    e10a:	mov    rsi,r14
    e10d:	mov    rdi,rbp
    e110:	call   dd00 <parse_long_name>
    e115:	test   eax,eax
    e117:	js     e963 <check_directory_consistency+0xad3>
    e11d:	je     e210 <check_directory_consistency+0x380>
    e123:	movzx  ebx,BYTE PTR [r14]
    e127:	cmp    bl,0xe5
    e12a:	je     e210 <check_directory_consistency+0x380>
    e130:	test   bl,bl
    e132:	je     e210 <check_directory_consistency+0x380>
    e138:	mov    rdx,r14
    e13b:	xor    eax,eax
    e13d:	lea    rcx,[r14+0x8]
    e141:	nop    DWORD PTR [rax+0x0]
    e148:	ror    al,1
    e14a:	add    rdx,0x1
    e14e:	add    al,BYTE PTR [rdx-0x1]
    e151:	cmp    rcx,rdx
    e154:	jne    e148 <check_directory_consistency+0x2b8>
    e156:	xor    edx,edx
    e158:	nop    DWORD PTR [rax+rax*1+0x0]
    e160:	ror    al,1
    e162:	add    rdx,0x1
    e166:	add    al,BYTE PTR [rdx+r14*1+0x7]
    e16b:	cmp    rdx,0x3
    e16f:	jne    e160 <check_directory_consistency+0x2d0>
    e171:	movzx  eax,al
    e174:	cmp    DWORD PTR [rsp+0x3b4],eax
    e17b:	jne    e270 <check_directory_consistency+0x3e0>
    e181:	mov    eax,DWORD PTR [rsp+0x3b8]
    e188:	mov    DWORD PTR [rsp+0x3b4],0x100
    e193:	add    eax,DWORD PTR [rsp+0x50]
    e197:	cmp    eax,0xfff
    e19c:	jg     ecc9 <check_directory_consistency+0xe39>
    e1a2:	mov    rax,QWORD PTR [rsp+0x20]
    e1a7:	mov    rdi,QWORD PTR [rsp+0x30]
    e1ac:	mov    rdx,rbp
    e1af:	mov    rsi,QWORD PTR [rsp+0x38]
    e1b4:	lea    rdi,[rax+rdi*1+0x1]
    e1b9:	call   5560 <pstrcpy>
    e1be:	test   BYTE PTR [r14+0xb],0x10
    e1c3:	je     e368 <check_directory_consistency+0x4d8>
    e1c9:	cmp    BYTE PTR [r14],0xe5
    e1cd:	je     e368 <check_directory_consistency+0x4d8>
    e1d3:	movzx  esi,WORD PTR [r14+0x14]
    e1d8:	movzx  eax,WORD PTR [r14+0x1a]
    e1dd:	shl    esi,0x10
    e1e0:	or     esi,eax
    e1e2:	je     e540 <check_directory_consistency+0x6b0>
    e1e8:	mov    rdx,QWORD PTR [rsp+0x20]
    e1ed:	mov    rdi,r15
    e1f0:	call   de90 <check_directory_consistency>
    e1f5:	mov    DWORD PTR [rsp+0xc],eax
    e1f9:	test   eax,eax
    e1fb:	je     e540 <check_directory_consistency+0x6b0>
    e201:	mov    edi,DWORD PTR [rsp+0xc]
    e205:	add    DWORD PTR [rsp+0x14],edi
    e209:	nop    DWORD PTR [rax+0x0]
    e210:	mov    esi,DWORD PTR [r15+0x805c]
    e217:	mov    eax,esi
    e219:	add    r13d,0x1
    e21d:	add    r14,0x20
    e221:	shl    eax,0x4
    e224:	cmp    eax,r13d
    e227:	ja     e0c8 <check_directory_consistency+0x238>
    e22d:	mov    ecx,DWORD PTR [r15+0x8068]
    e234:	mov    edi,DWORD PTR [rsp+0x10]
    e238:	mov    eax,DWORD PTR [r15+0x8078]
    e23f:	cmp    edi,ecx
    e241:	jae    e470 <check_directory_consistency+0x5e0>
    e247:	add    edi,0x1
    e24a:	mov    edx,edi
    e24c:	cmp    ecx,edi
    e24e:	cmove  edx,eax
    e251:	sub    eax,0x8
    e254:	mov    DWORD PTR [rsp+0x10],edx
    e258:	cmp    eax,edx
    e25a:	jae    e064 <check_directory_consistency+0x1d4>
    e260:	mov    rdi,QWORD PTR [rsp+0x28]
    e265:	call   3070 <free@plt>
    e26a:	jmp    e552 <check_directory_consistency+0x6c2>
    e26f:	nop
    e270:	movzx  eax,BYTE PTR [r14+0xb]
    e275:	cmp    al,0x28
    e277:	je     e210 <check_directory_consistency+0x380>
    e279:	cmp    al,0xf
    e27b:	je     e210 <check_directory_consistency+0x380>
    e27d:	cmp    BYTE PTR [r14+0x7],0x20
    e282:	mov    eax,0x6
    e287:	mov    esi,0x7
    e28c:	jne    e4b4 <check_directory_consistency+0x624>
    e292:	nop    WORD PTR [rax+rax*1+0x0]
    e298:	cmp    BYTE PTR [r14+rax*1],0x20
    e29d:	mov    esi,eax
    e29f:	jne    e4b4 <check_directory_consistency+0x624>
    e2a5:	sub    rax,0x1
    e2a9:	cmp    rax,0xffffffffffffffff
    e2ad:	jne    e298 <check_directory_consistency+0x408>
    e2af:	xor    eax,eax
    e2b1:	cmp    BYTE PTR [r14+0xa],0x20
    e2b6:	jne    ee44 <check_directory_consistency+0xfb4>
    e2bc:	cmp    BYTE PTR [r14+0x9],0x20
    e2c1:	jne    eda0 <check_directory_consistency+0xf10>
    e2c7:	cmp    BYTE PTR [r14+0x8],0x20
    e2cc:	jne    ee4e <check_directory_consistency+0xfbe>
    e2d2:	mov    BYTE PTR [rsp+rax*1+0x80],0x0
    e2da:	mov    rdx,rbp
    e2dd:	mov    ecx,DWORD PTR [rdx]
    e2df:	add    rdx,0x4
    e2e3:	lea    eax,[rcx-0x1010101]
    e2e9:	not    ecx
    e2eb:	and    eax,ecx
    e2ed:	and    eax,0x80808080
    e2f2:	je     e2dd <check_directory_consistency+0x44d>
    e2f4:	mov    ecx,eax
    e2f6:	mov    rsi,rbp
    e2f9:	shr    ecx,0x10
    e2fc:	test   eax,0x8080
    e301:	cmove  eax,ecx
    e304:	lea    rcx,[rdx+0x2]
    e308:	cmove  rdx,rcx
    e30c:	mov    ecx,0x2
    e311:	mov    edi,eax
    e313:	add    dil,al
    e316:	lea    rdi,[rip+0x128f8]        # 20c15 <desc_template.13939+0x335>
    e31d:	sbb    rdx,0x3
    e321:	sub    rdx,rbp
    e324:	mov    DWORD PTR [rsp+0x3b8],edx
    e32b:	mov    eax,edx
    e32d:	repz cmps BYTE PTR ds:[rsi],BYTE PTR es:[rdi]
    e32f:	seta   dl
    e332:	sbb    dl,0x0
    e335:	test   dl,dl
    e337:	je     e210 <check_directory_consistency+0x380>
    e33d:	mov    ecx,0x3
    e342:	lea    rdi,[rip+0x128cb]        # 20c14 <desc_template.13939+0x334>
    e349:	mov    rsi,rbp
    e34c:	repz cmps BYTE PTR ds:[rsi],BYTE PTR es:[rdi]
    e34e:	seta   dl
    e351:	sbb    dl,0x0
    e354:	test   dl,dl
    e356:	jne    e188 <check_directory_consistency+0x2f8>
    e35c:	jmp    e210 <check_directory_consistency+0x380>
    e361:	nop    DWORD PTR [rax+0x0]
    e368:	mov    rdi,r14
    e36b:	call   b940 <is_file>
    e370:	test   al,al
    e372:	je     efc9 <check_directory_consistency+0x1139>
    e378:	movzx  r10d,WORD PTR [r14+0x14]
    e37d:	movzx  eax,WORD PTR [r14+0x1a]
    e382:	shl    r10d,0x10
    e386:	or     r10d,eax
    e389:	cmp    QWORD PTR [r15+0x8080],0x0
    e391:	mov    r12d,r10d
    e394:	je     e3b0 <check_directory_consistency+0x520>
    e396:	mov    edi,DWORD PTR [r15+0x807c]
    e39d:	mov    QWORD PTR [r15+0x8080],0x0
    e3a8:	test   edi,edi
    e3aa:	jne    e985 <check_directory_consistency+0xaf5>
    e3b0:	mov    DWORD PTR [r15+0x8098],0xffffffff
    e3bb:	test   r12d,r12d
    e3be:	je     e59a <check_directory_consistency+0x70a>
    e3c4:	mov    rax,QWORD PTR [r15+0x80b0]
    e3cb:	test   rax,rax
    e3ce:	je     ead9 <check_directory_consistency+0xc49>
    e3d4:	mov    rbx,QWORD PTR [rsp+0x20]
    e3d9:	mov    esi,0x2f
    e3de:	mov    rdi,rbx
    e3e1:	call   3210 <strrchr@plt>
    e3e6:	mov    ebp,DWORD PTR [r15+0x804c]
    e3ed:	test   rax,rax
    e3f0:	lea    rdx,[rax+0x1]
    e3f4:	cmove  rdx,rbx
    e3f8:	xor    ecx,ecx
    e3fa:	mov    QWORD PTR [rsp+0x58],rdx
    e3ff:	mov    edx,ebp
    e401:	jmp    e426 <check_directory_consistency+0x596>
    e403:	nop    DWORD PTR [rax+rax*1+0x0]
    e408:	cmp    edx,eax
    e40a:	jne    e414 <check_directory_consistency+0x584>
    e40c:	test   edx,edx
    e40e:	jne    ef1e <check_directory_consistency+0x108e>
    e414:	cmp    edx,eax
    e416:	je     e5cb <check_directory_consistency+0x73b>
    e41c:	mov    edx,eax
    e41e:	cmp    ecx,edx
    e420:	jg     ee74 <check_directory_consistency+0xfe4>
    e426:	lea    esi,[rdx+rcx*1]
    e429:	mov    eax,esi
    e42b:	shr    eax,0x1f
    e42e:	add    eax,esi
    e430:	sar    eax,1
    e432:	cmp    ebp,eax
    e434:	jbe    ee55 <check_directory_consistency+0xfc5>
    e43a:	mov    edi,DWORD PTR [r15+0x8050]
    e441:	mov    ebx,eax
    e443:	mov    r8,QWORD PTR [r15+0x8040]
    e44a:	imul   ebx,edi
    e44d:	add    rbx,r8
    e450:	mov    esi,DWORD PTR [rbx]
    e452:	mov    r11d,DWORD PTR [rbx+0x4]
    e456:	cmp    esi,r11d
    e459:	jae    ee93 <check_directory_consistency+0x1003>
    e45f:	cmp    r12d,esi
    e462:	jbe    e408 <check_directory_consistency+0x578>
    e464:	cmp    ecx,eax
    e466:	je     e5c0 <check_directory_consistency+0x730>
    e46c:	mov    ecx,eax
    e46e:	jmp    e41e <check_directory_consistency+0x58e>
    e470:	mov    edx,DWORD PTR [r15+0x800c]
    e477:	mov    rcx,QWORD PTR [r15+0x80b8]
    e47e:	cmp    edx,0x20
    e481:	je     ec7f <check_directory_consistency+0xdef>
    e487:	cmp    edx,0x10
    e48a:	je     e58d <check_directory_consistency+0x6fd>
    e490:	mov    edi,DWORD PTR [rsp+0x10]
    e494:	lea    edx,[rdi+rdi*2]
    e497:	shr    edx,1
    e499:	movzx  edx,WORD PTR [rcx+rdx*1]
    e49d:	lea    ecx,[rdi*4+0x0]
    e4a4:	and    ecx,0x4
    e4a7:	sar    edx,cl
    e4a9:	and    edx,0xfff
    e4af:	jmp    e251 <check_directory_consistency+0x3c1>
    e4b4:	lea    eax,[rbx-0x21]
    e4b7:	cmp    al,0x5e
    e4b9:	ja     e519 <check_directory_consistency+0x689>
    e4bb:	lea    rdx,[rsp+0x7f]
    e4c0:	mov    DWORD PTR [rsp+0xc],r13d
    e4c5:	mov    r12d,0x1
    e4cb:	mov    ecx,DWORD PTR [r15+0x80e8]
    e4d2:	mov    QWORD PTR [rsp+0x18],r15
    e4d7:	mov    r15,rdx
    e4da:	mov    QWORD PTR [rsp+0x48],rbp
    e4df:	mov    r13d,ecx
    e4e2:	mov    ebp,esi
    e4e4:	nop    DWORD PTR [rax+0x0]
    e4e8:	test   r13d,r13d
    e4eb:	je     e4f9 <check_directory_consistency+0x669>
    e4ed:	call   36d0 <__ctype_tolower_loc@plt>
    e4f2:	mov    rax,QWORD PTR [rax]
    e4f5:	movzx  ebx,BYTE PTR [rax+rbx*4]
    e4f9:	mov    BYTE PTR [r15+r12*1],bl
    e4fd:	movsxd rax,r12d
    e500:	cmp    ebp,r12d
    e503:	jl     f088 <check_directory_consistency+0x11f8>
    e509:	movzx  ebx,BYTE PTR [r14+r12*1]
    e50e:	add    r12,0x1
    e512:	lea    eax,[rbx-0x21]
    e515:	cmp    al,0x5e
    e517:	jbe    e4e8 <check_directory_consistency+0x658>
    e519:	mov    ecx,0xffffffff
    e51e:	mov    rdi,QWORD PTR [rip+0x1bddb]        # 2a300 <stderr@@GLIBC_2.2.5>
    e525:	lea    rdx,[rip+0x1271d]        # 20c49 <desc_template.13939+0x369>
    e52c:	mov    esi,0x1
    e531:	xor    eax,eax
    e533:	call   3660 <__fprintf_chk@plt>
    e538:	nop    DWORD PTR [rax+rax*1+0x0]
    e540:	mov    rdi,QWORD PTR [rsp+0x28]
    e545:	call   3070 <free@plt>
    e54a:	mov    DWORD PTR [rsp+0x14],0x0
    e552:	mov    rdi,QWORD PTR [rsp+0x13c8]
    e55a:	xor    rdi,QWORD PTR fs:0x28
    e563:	mov    eax,DWORD PTR [rsp+0x14]
    e567:	jne    f026 <check_directory_consistency+0x1196>
    e56d:	add    rsp,0x13d8
    e574:	pop    rbx
    e575:	pop    rbp
    e576:	pop    r12
    e578:	pop    r13
    e57a:	pop    r14
    e57c:	pop    r15
    e57e:	ret
    e57f:	nop
    e580:	test   al,al
    e582:	je     e102 <check_directory_consistency+0x272>
    e588:	jmp    e217 <check_directory_consistency+0x387>
    e58d:	mov    edx,DWORD PTR [rsp+0x10]
    e591:	movzx  edx,WORD PTR [rcx+rdx*2]
    e595:	jmp    e251 <check_directory_consistency+0x3c1>
    e59a:	mov    DWORD PTR [rsp+0xc],0x0
    e5a2:	mov    ecx,DWORD PTR [r15+0x8058]
    e5a9:	mov    eax,DWORD PTR [r14+0x1c]
    e5ad:	xor    edx,edx
    e5af:	lea    eax,[rcx+rax*1-0x1]
    e5b3:	div    ecx
    e5b5:	cmp    eax,r12d
    e5b8:	je     e201 <check_directory_consistency+0x371>
    e5be:	jmp    e540 <check_directory_consistency+0x6b0>
    e5c0:	cmp    r12d,r11d
    e5c3:	jb     ebaa <check_directory_consistency+0xd1a>
    e5c9:	mov    ecx,edx
    e5cb:	cmp    ebp,ecx
    e5cd:	jbe    ebb3 <check_directory_consistency+0xd23>
    e5d3:	imul   ecx,edi
    e5d6:	lea    rbx,[r8+rcx*1]
    e5da:	cmp    r12d,DWORD PTR [rbx]
    e5dd:	jb     ebb3 <check_directory_consistency+0xd23>
    e5e3:	cmp    r12d,DWORD PTR [rbx+0x4]
    e5e7:	jae    eb6b <check_directory_consistency+0xcdb>
    e5ed:	mov    ecx,DWORD PTR [rbx+0x20]
    e5f0:	test   cl,0x10
    e5f3:	je     f007 <check_directory_consistency+0x1177>
    e5f9:	mov    eax,ecx
    e5fb:	mov    rbp,QWORD PTR [rbx+0x18]
    e5ff:	mov    esi,0x2f
    e604:	mov    DWORD PTR [rsp+0xc],ecx
    e608:	and    eax,0xffffffef
    e60b:	mov    DWORD PTR [rbx+0x20],eax
    e60e:	mov    rdi,rbp
    e611:	call   3210 <strrchr@plt>
    e616:	mov    ecx,DWORD PTR [rsp+0xc]
    e61a:	test   rax,rax
    e61d:	lea    rdx,[rax+0x1]
    e621:	cmovne rbp,rdx
    e625:	and    ecx,0x1
    e628:	je     efe8 <check_directory_consistency+0x1158>
    e62e:	mov    rsi,QWORD PTR [rsp+0x58]
    e633:	mov    rdi,rbp
    e636:	call   3350 <strcmp@plt>
    e63b:	test   eax,eax
    e63d:	jne    ec8b <check_directory_consistency+0xdfb>
    e643:	mov    rax,QWORD PTR [r15+0x80b0]
    e64a:	mov    DWORD PTR [rsp+0xc],0x0
    e652:	lea    rdi,[rsp+0x7c]
    e657:	xor    ebp,ebp
    e659:	mov    DWORD PTR [rsp+0x60],0x0
    e661:	mov    DWORD PTR [rsp+0x64],0xffffffff
    e669:	mov    DWORD PTR [rsp+0x18],0x0
    e671:	mov    QWORD PTR [rsp+0x48],r14
    e676:	mov    DWORD PTR [rsp+0x54],r13d
    e67b:	mov    r13,rdi
    e67e:	xchg   ax,ax
    e680:	test   rax,rax
    e683:	je     e880 <check_directory_consistency+0x9f0>
    e689:	test   ebp,ebp
    e68b:	je     e778 <check_directory_consistency+0x8e8>
    e691:	mov    eax,DWORD PTR [r15+0x805c]
    e698:	mov    ebp,r12d
    e69b:	imul   ebp,eax
    e69e:	add    ebp,DWORD PTR [r15+0x806c]
    e6a5:	cmp    QWORD PTR [r15+0x8080],0x0
    e6ad:	je     e6c9 <check_directory_consistency+0x839>
    e6af:	mov    edi,DWORD PTR [r15+0x807c]
    e6b6:	mov    QWORD PTR [r15+0x8080],0x0
    e6c1:	test   edi,edi
    e6c3:	jne    eae9 <check_directory_consistency+0xc59>
    e6c9:	mov    DWORD PTR [r15+0x8098],0xffffffff
    e6d4:	xor    r14d,r14d
    e6d7:	test   eax,eax
    e6d9:	jne    e6f1 <check_directory_consistency+0x861>
    e6db:	jmp    e950 <check_directory_consistency+0xac0>
    e6e0:	add    r14,0x1
    e6e4:	cmp    DWORD PTR [r15+0x805c],r14d
    e6eb:	jbe    e950 <check_directory_consistency+0xac0>
    e6f1:	mov    rdi,QWORD PTR [r15+0x80b0]
    e6f8:	lea    rsi,[rbp+r14*1+0x0]
    e6fd:	mov    rcx,r13
    e700:	mov    edx,0x1
    e705:	mov    rax,QWORD PTR [rdi+0x38]
    e709:	call   QWORD PTR [rax+0x48]
    e70c:	test   eax,eax
    e70e:	jne    e6e0 <check_directory_consistency+0x850>
    e710:	mov    rdx,QWORD PTR [r15+0x8090]
    e717:	mov    rdi,QWORD PTR [r15]
    e71a:	mov    ecx,0x1
    e71f:	mov    rsi,rbp
    e722:	call   c2a0 <vvfat_read>
    e727:	test   eax,eax
    e729:	jne    eb23 <check_directory_consistency+0xc93>
    e72f:	mov    rdi,QWORD PTR [r15+0x80b0]
    e736:	mov    rdx,QWORD PTR [r15+0x8090]
    e73d:	mov    ecx,0x1
    e742:	mov    rsi,rbp
    e745:	mov    rax,QWORD PTR [rdi+0x38]
    e749:	call   QWORD PTR [rax+0x28]
    e74c:	test   eax,eax
    e74e:	je     e6e0 <check_directory_consistency+0x850>
    e750:	mov    r12d,0xfffffffe
    e756:	mov    r13d,DWORD PTR [rsp+0x54]
    e75b:	mov    r14,QWORD PTR [rsp+0x48]
    e760:	mov    DWORD PTR [rsp+0xc],r12d
    e765:	mov    ecx,DWORD PTR [r15+0x8058]
    e76c:	jmp    e5a9 <check_directory_consistency+0x719>
    e771:	nop    DWORD PTR [rax+0x0]
    e778:	xor    r14d,r14d
    e77b:	nop    DWORD PTR [rax+rax*1+0x0]
    e780:	mov    esi,DWORD PTR [r15+0x805c]
    e787:	cmp    esi,r14d
    e78a:	jbe    e880 <check_directory_consistency+0x9f0>
    e790:	mov    rdi,QWORD PTR [r15+0x80b0]
    e797:	imul   esi,r12d
    e79b:	mov    rcx,r13
    e79e:	add    esi,DWORD PTR [r15+0x806c]
    e7a5:	add    rsi,r14
    e7a8:	mov    edx,0x1
    e7ad:	add    r14,0x1
    e7b1:	mov    rax,QWORD PTR [rdi+0x38]
    e7b5:	call   QWORD PTR [rax+0x48]
    e7b8:	test   eax,eax
    e7ba:	je     e780 <check_directory_consistency+0x8f0>
    e7bc:	test   rbx,rbx
    e7bf:	je     e99a <check_directory_consistency+0xb0a>
    e7c5:	cmp    r12d,DWORD PTR [rbx]
    e7c8:	jb     e99a <check_directory_consistency+0xb0a>
    e7ce:	cmp    r12d,DWORD PTR [rbx+0x4]
    e7d2:	jae    e99a <check_directory_consistency+0xb0a>
    e7d8:	test   BYTE PTR [rbx+0x20],0x4
    e7dc:	jne    e880 <check_directory_consistency+0x9f0>
    e7e2:	mov    eax,r12d
    e7e5:	sub    eax,DWORD PTR [rbx]
    e7e7:	mov    r14d,DWORD PTR [rbx+0x10]
    e7eb:	imul   eax,DWORD PTR [r15+0x8058]
    e7f3:	add    eax,r14d
    e7f6:	cmp    eax,DWORD PTR [rsp+0x18]
    e7fa:	jne    f02b <check_directory_consistency+0x119b>
    e800:	mov    edx,DWORD PTR [rsp+0x18]
    e804:	test   edx,edx
    e806:	jne    e84c <check_directory_consistency+0x9bc>
    e808:	mov    rbp,QWORD PTR [rbx+0x18]
    e80c:	mov    esi,0x2f
    e811:	mov    rdi,rbp
    e814:	call   3210 <strrchr@plt>
    e819:	mov    rsi,QWORD PTR [rsp+0x58]
    e81e:	test   rax,rax
    e821:	lea    rcx,[rax+0x1]
    e825:	cmovne rbp,rcx
    e829:	mov    rdi,rbp
    e82c:	xor    ebp,ebp
    e82e:	call   3350 <strcmp@plt>
    e833:	lea    rdi,[r15+0x8040]
    e83a:	mov    rsi,rbx
    e83d:	test   eax,eax
    e83f:	setne  bpl
    e843:	call   ca20 <array_index>
    e848:	mov    DWORD PTR [rsp+0x64],eax
    e84c:	mov    eax,DWORD PTR [rsp+0x64]
    e850:	cmp    DWORD PTR [rbx+0xc],eax
    e853:	je     e85e <check_directory_consistency+0x9ce>
    e855:	test   r14d,r14d
    e858:	jne    ef8b <check_directory_consistency+0x10fb>
    e85e:	mov    eax,DWORD PTR [rsp+0x60]
    e862:	test   eax,eax
    e864:	jne    e878 <check_directory_consistency+0x9e8>
    e866:	mov    rdi,QWORD PTR [rsp+0x48]
    e86b:	call   b940 <is_file>
    e870:	test   al,al
    e872:	jne    eeb2 <check_directory_consistency+0x1022>
    e878:	test   ebp,ebp
    e87a:	jne    e691 <check_directory_consistency+0x801>
    e880:	mov    rax,QWORD PTR [r15+0x80c0]
    e887:	mov    ecx,r12d
    e88a:	add    DWORD PTR [rsp+0xc],0x1
    e88f:	add    rax,rcx
    e892:	test   BYTE PTR [rax],0x3
    e895:	jne    eca8 <check_directory_consistency+0xe18>
    e89b:	mov    BYTE PTR [rax],0x2
    e89e:	mov    edx,DWORD PTR [r15+0x8068]
    e8a5:	cmp    r12d,edx
    e8a8:	jae    e8f8 <check_directory_consistency+0xa68>
    e8aa:	add    r12d,0x1
    e8ae:	mov    eax,DWORD PTR [r15+0x8078]
    e8b5:	cmp    edx,r12d
    e8b8:	cmove  r12d,eax
    e8bc:	lea    edx,[rax-0x8]
    e8bf:	mov    ecx,DWORD PTR [r15+0x8058]
    e8c6:	cmp    edx,r12d
    e8c9:	jb     ecf0 <check_directory_consistency+0xe60>
    e8cf:	cmp    r12d,0x1
    e8d3:	jbe    eb90 <check_directory_consistency+0xd00>
    e8d9:	sub    eax,0x10
    e8dc:	cmp    r12d,eax
    e8df:	ja     eb90 <check_directory_consistency+0xd00>
    e8e5:	add    DWORD PTR [rsp+0x18],ecx
    e8e9:	mov    rax,QWORD PTR [r15+0x80b0]
    e8f0:	jmp    e680 <check_directory_consistency+0x7f0>
    e8f5:	nop    DWORD PTR [rax]
    e8f8:	mov    edx,DWORD PTR [r15+0x800c]
    e8ff:	mov    eax,DWORD PTR [r15+0x8078]
    e906:	mov    rsi,QWORD PTR [r15+0x80b8]
    e90d:	cmp    edx,0x20
    e910:	je     e95a <check_directory_consistency+0xaca>
    e912:	cmp    edx,0x10
    e915:	je     e940 <check_directory_consistency+0xab0>
    e917:	lea    edx,[r12+r12*2]
    e91b:	lea    ecx,[r12*4+0x0]
    e923:	shr    edx,1
    e925:	and    ecx,0x4
    e928:	movzx  edx,WORD PTR [rsi+rdx*1]
    e92c:	sar    edx,cl
    e92e:	mov    r12d,edx
    e931:	and    r12d,0xfff
    e938:	jmp    e8bc <check_directory_consistency+0xa2c>
    e93a:	nop    WORD PTR [rax+rax*1+0x0]
    e940:	movzx  r12d,WORD PTR [rsi+rcx*2]
    e945:	jmp    e8bc <check_directory_consistency+0xa2c>
    e94a:	nop    WORD PTR [rax+rax*1+0x0]
    e950:	mov    ebp,0x1
    e955:	jmp    e880 <check_directory_consistency+0x9f0>
    e95a:	mov    r12d,DWORD PTR [rsi+rcx*4]
    e95e:	jmp    e8bc <check_directory_consistency+0xa2c>
    e963:	mov    rcx,QWORD PTR [rip+0x1b996]        # 2a300 <stderr@@GLIBC_2.2.5>
    e96a:	mov    edx,0x13
    e96f:	mov    esi,0x1
    e974:	lea    rdi,[rip+0x12285]        # 20c00 <desc_template.13939+0x320>
    e97b:	call   3640 <fwrite@plt>
    e980:	jmp    e540 <check_directory_consistency+0x6b0>
    e985:	call   3270 <close@plt>
    e98a:	mov    DWORD PTR [r15+0x807c],0x0
    e995:	jmp    e3b0 <check_directory_consistency+0x520>
    e99a:	mov    edi,DWORD PTR [r15+0x804c]
    e9a1:	xor    ecx,ecx
    e9a3:	mov    edx,edi
    e9a5:	jmp    e9ce <check_directory_consistency+0xb3e>
    e9a7:	nop    WORD PTR [rax+rax*1+0x0]
    e9b0:	cmp    edx,eax
    e9b2:	jne    e9bc <check_directory_consistency+0xb2c>
    e9b4:	test   edx,edx
    e9b6:	jne    ef1e <check_directory_consistency+0x108e>
    e9bc:	cmp    edx,eax
    e9be:	je     eb48 <check_directory_consistency+0xcb8>
    e9c4:	mov    edx,eax
    e9c6:	cmp    ecx,edx
    e9c8:	jg     ee74 <check_directory_consistency+0xfe4>
    e9ce:	lea    esi,[rdx+rcx*1]
    e9d1:	mov    eax,esi
    e9d3:	shr    eax,0x1f
    e9d6:	add    eax,esi
    e9d8:	sar    eax,1
    e9da:	cmp    edi,eax
    e9dc:	jbe    ee55 <check_directory_consistency+0xfc5>
    e9e2:	mov    r9d,DWORD PTR [r15+0x8050]
    e9e9:	mov    ebx,eax
    e9eb:	mov    r10,QWORD PTR [r15+0x8040]
    e9f2:	imul   ebx,r9d
    e9f6:	add    rbx,r10
    e9f9:	mov    esi,DWORD PTR [rbx]
    e9fb:	mov    r11d,DWORD PTR [rbx+0x4]
    e9ff:	cmp    esi,r11d
    ea02:	jae    ee93 <check_directory_consistency+0x1003>
    ea08:	cmp    r12d,esi
    ea0b:	jbe    e9b0 <check_directory_consistency+0xb20>
    ea0d:	cmp    ecx,eax
    ea0f:	je     eb3d <check_directory_consistency+0xcad>
    ea15:	mov    ecx,eax
    ea17:	jmp    e9c6 <check_directory_consistency+0xb36>
    ea19:	mov    rdi,QWORD PTR [rsp+0x40]
    ea1e:	call   31b0 <strlen@plt>
    ea23:	mov    rbp,rax
    ea26:	mov    ebx,eax
    ea28:	cmp    eax,0xfff
    ea2d:	jg     ed81 <check_directory_consistency+0xef1>
    ea33:	mov    r14,QWORD PTR [rsp+0x40]
    ea38:	lea    rax,[rsp+0x3c0]
    ea40:	mov    esi,0x1000
    ea45:	mov    rdi,rax
    ea48:	mov    QWORD PTR [rsp+0x20],rax
    ea4d:	mov    rdx,r14
    ea50:	call   5560 <pstrcpy>
    ea55:	movsxd rax,ebp
    ea58:	mov    rdi,r14
    ea5b:	mov    BYTE PTR [rsp+rax*1+0x3c0],0x2f
    ea63:	lea    eax,[rbp+0x1]
    ea66:	mov    DWORD PTR [rsp+0x50],eax
    ea6a:	cdqe
    ea6c:	mov    BYTE PTR [rsp+rax*1+0x3c0],0x0
    ea74:	call   3680 <strdup@plt>
    ea79:	mov    ebp,DWORD PTR [r15+0x80d4]
    ea80:	mov    edx,DWORD PTR [r15+0x80d8]
    ea87:	mov    r12,rax
    ea8a:	lea    r14d,[rbp+0x1]
    ea8e:	mov    eax,r14d
    ea91:	imul   eax,edx
    ea94:	cmp    eax,DWORD PTR [r15+0x80d0]
    ea9b:	ja     ed04 <check_directory_consistency+0xe74>
    eaa1:	mov    DWORD PTR [r15+0x80d4],r14d
    eaa8:	cmp    ebp,r14d
    eaab:	jae    ee55 <check_directory_consistency+0xfc5>
    eab1:	imul   ebp,DWORD PTR [r15+0x80d8]
    eab9:	mov    rax,QWORD PTR [r15+0x80c8]
    eac0:	mov    edi,DWORD PTR [rsp+0x10]
    eac4:	add    rax,rbp
    eac7:	mov    QWORD PTR [rax],r12
    eaca:	mov    DWORD PTR [rax+0x8],edi
    eacd:	mov    DWORD PTR [rax+0x10],0x3
    ead4:	jmp    e030 <check_directory_consistency+0x1a0>
    ead9:	mov    QWORD PTR [rsp+0x58],0x0
    eae2:	xor    ebx,ebx
    eae4:	jmp    e64a <check_directory_consistency+0x7ba>
    eae9:	call   3270 <close@plt>
    eaee:	mov    eax,DWORD PTR [r15+0x805c]
    eaf5:	mov    DWORD PTR [r15+0x807c],0x0
    eb00:	jmp    e6c9 <check_directory_consistency+0x839>
    eb05:	mov    rdi,QWORD PTR [rsp+0x40]
    eb0a:	call   3680 <strdup@plt>
    eb0f:	mov    esi,DWORD PTR [rsp+0x10]
    eb13:	mov    rdi,r15
    eb16:	mov    rdx,rax
    eb19:	call   c950 <schedule_rename>
    eb1e:	jmp    e030 <check_directory_consistency+0x1a0>
    eb23:	mov    r12d,0xffffffff
    eb29:	mov    r13d,DWORD PTR [rsp+0x54]
    eb2e:	mov    r14,QWORD PTR [rsp+0x48]
    eb33:	mov    DWORD PTR [rsp+0xc],r12d
    eb38:	jmp    e765 <check_directory_consistency+0x8d5>
    eb3d:	cmp    r12d,r11d
    eb40:	jb     ec6f <check_directory_consistency+0xddf>
    eb46:	mov    ecx,edx
    eb48:	cmp    edi,ecx
    eb4a:	jbe    ec78 <check_directory_consistency+0xde8>
    eb50:	imul   ecx,r9d
    eb54:	lea    rbx,[r10+rcx*1]
    eb58:	cmp    r12d,DWORD PTR [rbx]
    eb5b:	jb     ec78 <check_directory_consistency+0xde8>
    eb61:	cmp    r12d,DWORD PTR [rbx+0x4]
    eb65:	jb     e7d8 <check_directory_consistency+0x948>
    eb6b:	lea    rcx,[rip+0x1292e]        # 214a0 <__PRETTY_FUNCTION__.14257>
    eb72:	mov    edx,0x477
    eb77:	lea    rsi,[rip+0x11f68]        # 20ae6 <desc_template.13939+0x206>
    eb7e:	lea    rdi,[rip+0x122bb]        # 20e40 <desc_template.13939+0x560>
    eb85:	call   3230 <__assert_fail@plt>
    eb8a:	nop    WORD PTR [rax+rax*1+0x0]
    eb90:	mov    r12d,0xffffffff
    eb96:	mov    r13d,DWORD PTR [rsp+0x54]
    eb9b:	mov    r14,QWORD PTR [rsp+0x48]
    eba0:	mov    DWORD PTR [rsp+0xc],r12d
    eba5:	jmp    e5a9 <check_directory_consistency+0x719>
    ebaa:	cmp    r12d,esi
    ebad:	jae    e5ed <check_directory_consistency+0x75d>
    ebb3:	mov    rdi,r14
    ebb6:	call   b940 <is_file>
    ebbb:	test   al,al
    ebbd:	je     efaa <check_directory_consistency+0x111a>
    ebc3:	mov    rdi,QWORD PTR [rsp+0x20]
    ebc8:	call   3680 <strdup@plt>
    ebcd:	mov    ebx,DWORD PTR [r15+0x80d4]
    ebd4:	mov    r8,rax
    ebd7:	mov    eax,DWORD PTR [r15+0x80d8]
    ebde:	lea    ebp,[rbx+0x1]
    ebe1:	mov    edx,ebp
    ebe3:	imul   edx,eax
    ebe6:	cmp    edx,DWORD PTR [r15+0x80d0]
    ebed:	ja     ec2c <check_directory_consistency+0xd9c>
    ebef:	mov    DWORD PTR [r15+0x80d4],ebp
    ebf6:	cmp    ebx,ebp
    ebf8:	jae    ee55 <check_directory_consistency+0xfc5>
    ebfe:	imul   ebx,DWORD PTR [r15+0x80d8]
    ec06:	mov    rax,QWORD PTR [r15+0x80c8]
    ec0d:	add    rax,rbx
    ec10:	xor    ebx,ebx
    ec12:	mov    QWORD PTR [rax],r8
    ec15:	mov    DWORD PTR [rax+0x8],r12d
    ec19:	mov    DWORD PTR [rax+0x10],0x2
    ec20:	mov    rax,QWORD PTR [r15+0x80b0]
    ec27:	jmp    e64a <check_directory_consistency+0x7ba>
    ec2c:	mov    ecx,eax
    ec2e:	mov    rdi,QWORD PTR [r15+0x80c8]
    ec35:	mov    QWORD PTR [rsp+0x18],r8
    ec3a:	shl    ecx,0x5
    ec3d:	sub    ecx,eax
    ec3f:	add    edx,ecx
    ec41:	movsxd rsi,edx
    ec44:	mov    DWORD PTR [rsp+0xc],edx
    ec48:	call   5990 <qemu_realloc>
    ec4d:	mov    r8,QWORD PTR [rsp+0x18]
    ec52:	test   rax,rax
    ec55:	mov    QWORD PTR [r15+0x80c8],rax
    ec5c:	je     3761 <check_directory_consistency.cold.12+0xe>
    ec62:	mov    edx,DWORD PTR [rsp+0xc]
    ec66:	mov    DWORD PTR [r15+0x80d0],edx
    ec6d:	jmp    ebef <check_directory_consistency+0xd5f>
    ec6f:	cmp    r12d,esi
    ec72:	jae    e7d8 <check_directory_consistency+0x948>
    ec78:	xor    ebx,ebx
    ec7a:	jmp    e880 <check_directory_consistency+0x9f0>
    ec7f:	mov    edx,DWORD PTR [rsp+0x10]
    ec83:	mov    edx,DWORD PTR [rcx+rdx*4]
    ec86:	jmp    e251 <check_directory_consistency+0x3c1>
    ec8b:	mov    rdi,QWORD PTR [rsp+0x20]
    ec90:	call   3680 <strdup@plt>
    ec95:	mov    esi,r12d
    ec98:	mov    rdi,r15
    ec9b:	mov    rdx,rax
    ec9e:	call   c950 <schedule_rename>
    eca3:	jmp    e643 <check_directory_consistency+0x7b3>
    eca8:	mov    r13d,DWORD PTR [rsp+0x54]
    ecad:	mov    r14,QWORD PTR [rsp+0x48]
    ecb2:	xor    r12d,r12d
    ecb5:	mov    DWORD PTR [rsp+0xc],0x0
    ecbd:	mov    ecx,DWORD PTR [r15+0x8058]
    ecc4:	jmp    e5a9 <check_directory_consistency+0x719>
    ecc9:	mov    rcx,QWORD PTR [rsp+0x40]
    ecce:	mov    r8,rbp
    ecd1:	mov    esi,0x1
    ecd6:	xor    eax,eax
    ecd8:	mov    rdi,QWORD PTR [rip+0x1b621]        # 2a300 <stderr@@GLIBC_2.2.5>
    ecdf:	lea    rdx,[rip+0x11f31]        # 20c17 <desc_template.13939+0x337>
    ece6:	call   3660 <__fprintf_chk@plt>
    eceb:	jmp    e540 <check_directory_consistency+0x6b0>
    ecf0:	mov    r13d,DWORD PTR [rsp+0x54]
    ecf5:	mov    r14,QWORD PTR [rsp+0x48]
    ecfa:	mov    r12d,DWORD PTR [rsp+0xc]
    ecff:	jmp    e5a9 <check_directory_consistency+0x719>
    ed04:	mov    r13d,edx
    ed07:	mov    rdi,QWORD PTR [r15+0x80c8]
    ed0e:	shl    r13d,0x5
    ed12:	sub    r13d,edx
    ed15:	add    r13d,eax
    ed18:	movsxd rsi,r13d
    ed1b:	call   5990 <qemu_realloc>
    ed20:	mov    QWORD PTR [r15+0x80c8],rax
    ed27:	test   rax,rax
    ed2a:	je     376b <check_directory_consistency.cold.12+0x18>
    ed30:	mov    DWORD PTR [r15+0x80d0],r13d
    ed37:	jmp    eaa1 <check_directory_consistency+0xc11>
    ed3c:	mov    ecx,DWORD PTR [rsp+0x10]
    ed40:	mov    rdi,QWORD PTR [rip+0x1b5b9]        # 2a300 <stderr@@GLIBC_2.2.5>
    ed47:	lea    rdx,[rip+0x123f2]        # 21140 <desc_template.13939+0x860>
    ed4e:	xor    eax,eax
    ed50:	mov    esi,0x1
    ed55:	call   3660 <__fprintf_chk@plt>
    ed5a:	jmp    e540 <check_directory_consistency+0x6b0>
    ed5f:	mov    rcx,QWORD PTR [rip+0x1b59a]        # 2a300 <stderr@@GLIBC_2.2.5>
    ed66:	mov    edx,0x1a
    ed6b:	mov    esi,0x1
    ed70:	lea    rdi,[rip+0x11e6e]        # 20be5 <desc_template.13939+0x305>
    ed77:	call   3640 <fwrite@plt>
    ed7c:	jmp    e540 <check_directory_consistency+0x6b0>
    ed81:	lea    rcx,[rip+0x126a8]        # 21430 <__PRETTY_FUNCTION__.14460>
    ed88:	mov    edx,0x6d2
    ed8d:	lea    rsi,[rip+0x11d52]        # 20ae6 <desc_template.13939+0x206>
    ed94:	lea    rdi,[rip+0x11e19]        # 20bb4 <desc_template.13939+0x2d4>
    ed9b:	call   3230 <__assert_fail@plt>
    eda0:	mov    ebx,0x1
    eda5:	movsxd rdx,eax
    eda8:	lea    eax,[rax+rbx*1+0x1]
    edac:	mov    DWORD PTR [rsp+0xc],r13d
    edb1:	mov    r13,r15
    edb4:	mov    BYTE PTR [rsp+rdx*1+0x80],0x2e
    edbc:	lea    edx,[rax+0x1]
    edbf:	cdqe
    edc1:	mov    r15,r14
    edc4:	movsxd rdx,edx
    edc7:	mov    r14,rbp
    edca:	mov    BYTE PTR [rsp+rdx*1+0x80],0x0
    edd2:	lea    rdx,[rbp+rax*1+0x0]
    edd7:	mov    rbp,rdx
    edda:	jmp    edfc <check_directory_consistency+0xf6c>
    eddc:	nop    DWORD PTR [rax+0x0]
    ede0:	call   36d0 <__ctype_tolower_loc@plt>
    ede5:	sub    rbx,0x1
    ede9:	sub    rbp,0x1
    eded:	mov    rax,QWORD PTR [rax]
    edf0:	mov    eax,DWORD PTR [rax+r12*4]
    edf4:	mov    BYTE PTR [rbp+0x1],al
    edf7:	cmp    ebx,0xffffffff
    edfa:	je     ee27 <check_directory_consistency+0xf97>
    edfc:	movzx  r12d,BYTE PTR [r15+rbx*1+0x8]
    ee02:	lea    eax,[r12-0x21]
    ee07:	cmp    al,0x5e
    ee09:	ja     ee3a <check_directory_consistency+0xfaa>
    ee0b:	mov    ecx,DWORD PTR [r13+0x80e8]
    ee12:	test   ecx,ecx
    ee14:	jne    ede0 <check_directory_consistency+0xf50>
    ee16:	sub    rbx,0x1
    ee1a:	mov    BYTE PTR [rbp+0x0],r12b
    ee1e:	sub    rbp,0x1
    ee22:	cmp    ebx,0xffffffff
    ee25:	jne    edfc <check_directory_consistency+0xf6c>
    ee27:	mov    rbp,r14
    ee2a:	mov    r14,r15
    ee2d:	mov    r15,r13
    ee30:	mov    r13d,DWORD PTR [rsp+0xc]
    ee35:	jmp    e2da <check_directory_consistency+0x44a>
    ee3a:	mov    ecx,0xfffffffe
    ee3f:	jmp    e51e <check_directory_consistency+0x68e>
    ee44:	mov    ebx,0x2
    ee49:	jmp    eda5 <check_directory_consistency+0xf15>
    ee4e:	xor    ebx,ebx
    ee50:	jmp    eda5 <check_directory_consistency+0xf15>
    ee55:	lea    rcx,[rip+0x12614]        # 21470 <__PRETTY_FUNCTION__.13830>
    ee5c:	mov    edx,0x60
    ee61:	lea    rsi,[rip+0x11c7e]        # 20ae6 <desc_template.13939+0x206>
    ee68:	lea    rdi,[rip+0x11cac]        # 20b1b <desc_template.13939+0x23b>
    ee6f:	call   3230 <__assert_fail@plt>
    ee74:	lea    rcx,[rip+0x12605]        # 21480 <__PRETTY_FUNCTION__.14249>
    ee7b:	mov    edx,0x465
    ee80:	lea    rsi,[rip+0x11c5f]        # 20ae6 <desc_template.13939+0x206>
    ee87:	lea    rdi,[rip+0x11cdb]        # 20b69 <desc_template.13939+0x289>
    ee8e:	call   3230 <__assert_fail@plt>
    ee93:	lea    rcx,[rip+0x125e6]        # 21480 <__PRETTY_FUNCTION__.14249>
    ee9a:	mov    edx,0x45a
    ee9f:	lea    rsi,[rip+0x11c40]        # 20ae6 <desc_template.13939+0x206>
    eea6:	lea    rdi,[rip+0x11c82]        # 20b2f <desc_template.13939+0x24f>
    eead:	call   3230 <__assert_fail@plt>
    eeb2:	mov    edx,DWORD PTR [r15+0x80d4]
    eeb9:	mov    eax,DWORD PTR [r15+0x80d8]
    eec0:	mov    r14d,DWORD PTR [rbx+0x8]
    eec4:	lea    r10d,[rdx+0x1]
    eec8:	mov    esi,r10d
    eecb:	imul   esi,eax
    eece:	cmp    esi,DWORD PTR [r15+0x80d0]
    eed5:	ja     ef3d <check_directory_consistency+0x10ad>
    eed7:	mov    DWORD PTR [r15+0x80d4],r10d
    eede:	cmp    edx,r10d
    eee1:	jae    ee55 <check_directory_consistency+0xfc5>
    eee7:	mov    edi,DWORD PTR [rsp+0x18]
    eeeb:	mov    eax,edx
    eeed:	imul   eax,DWORD PTR [r15+0x80d8]
    eef5:	mov    DWORD PTR [rsp+0x60],0x1
    eefd:	add    rax,QWORD PTR [r15+0x80c8]
    ef04:	mov    QWORD PTR [rax],0x0
    ef0b:	mov    DWORD PTR [rax+0x8],r14d
    ef0f:	mov    DWORD PTR [rax+0xc],edi
    ef12:	mov    DWORD PTR [rax+0x10],0x1
    ef19:	jmp    e878 <check_directory_consistency+0x9e8>
    ef1e:	lea    rcx,[rip+0x1255b]        # 21480 <__PRETTY_FUNCTION__.14249>
    ef25:	mov    edx,0x45c
    ef2a:	lea    rsi,[rip+0x11bb5]        # 20ae6 <desc_template.13939+0x206>
    ef31:	lea    rdi,[rip+0x11c15]        # 20b4d <desc_template.13939+0x26d>
    ef38:	call   3230 <__assert_fail@plt>
    ef3d:	mov    ecx,eax
    ef3f:	mov    rdi,QWORD PTR [r15+0x80c8]
    ef46:	mov    DWORD PTR [rsp+0x6c],r10d
    ef4b:	shl    ecx,0x5
    ef4e:	mov    DWORD PTR [rsp+0x68],edx
    ef52:	sub    ecx,eax
    ef54:	add    ecx,esi
    ef56:	movsxd rsi,ecx
    ef59:	mov    DWORD PTR [rsp+0x60],ecx
    ef5d:	call   5990 <qemu_realloc>
    ef62:	mov    QWORD PTR [r15+0x80c8],rax
    ef69:	test   rax,rax
    ef6c:	je     3753 <check_directory_consistency.cold.12>
    ef72:	mov    ecx,DWORD PTR [rsp+0x60]
    ef76:	mov    r10d,DWORD PTR [rsp+0x6c]
    ef7b:	mov    edx,DWORD PTR [rsp+0x68]
    ef7f:	mov    DWORD PTR [r15+0x80d0],ecx
    ef86:	jmp    eed7 <check_directory_consistency+0x1047>
    ef8b:	lea    rcx,[rip+0x1247e]        # 21410 <__PRETTY_FUNCTION__.14439>
    ef92:	mov    edx,0x68f
    ef97:	lea    rsi,[rip+0x11b48]        # 20ae6 <desc_template.13939+0x206>
    ef9e:	lea    rdi,[rip+0xe1d2]        # 1d177 <_IO_stdin_used+0x177>
    efa5:	call   3230 <__assert_fail@plt>
    efaa:	lea    rcx,[rip+0x1245f]        # 21410 <__PRETTY_FUNCTION__.14439>
    efb1:	mov    edx,0x66e
    efb6:	lea    rsi,[rip+0x11b29]        # 20ae6 <desc_template.13939+0x206>
    efbd:	lea    rdi,[rip+0xe1b3]        # 1d177 <_IO_stdin_used+0x177>
    efc4:	call   3230 <__assert_fail@plt>
    efc9:	lea    rcx,[rip+0x12460]        # 21430 <__PRETTY_FUNCTION__.14460>
    efd0:	mov    edx,0x735
    efd5:	lea    rsi,[rip+0x11b0a]        # 20ae6 <desc_template.13939+0x206>
    efdc:	lea    rdi,[rip+0xe194]        # 1d177 <_IO_stdin_used+0x177>
    efe3:	call   3230 <__assert_fail@plt>
    efe8:	lea    rcx,[rip+0x12421]        # 21410 <__PRETTY_FUNCTION__.14439>
    efef:	mov    edx,0x665
    eff4:	lea    rsi,[rip+0x11aeb]        # 20ae6 <desc_template.13939+0x206>
    effb:	lea    rdi,[rip+0x11c2b]        # 20c2d <desc_template.13939+0x34d>
    f002:	call   3230 <__assert_fail@plt>
    f007:	lea    rcx,[rip+0x12402]        # 21410 <__PRETTY_FUNCTION__.14439>
    f00e:	mov    edx,0x660
    f013:	lea    rsi,[rip+0x11acc]        # 20ae6 <desc_template.13939+0x206>
    f01a:	lea    rdi,[rip+0x11ba7]        # 20bc8 <desc_template.13939+0x2e8>
    f021:	call   3230 <__assert_fail@plt>
    f026:	call   31c0 <__stack_chk_fail@plt>
    f02b:	lea    rcx,[rip+0x123de]        # 21410 <__PRETTY_FUNCTION__.14439>
    f032:	mov    edx,0x683
    f037:	lea    rsi,[rip+0x11aa8]        # 20ae6 <desc_template.13939+0x206>
    f03e:	lea    rdi,[rip+0xe132]        # 1d177 <_IO_stdin_used+0x177>
    f045:	call   3230 <__assert_fail@plt>
    f04a:	lea    rcx,[rip+0x123df]        # 21430 <__PRETTY_FUNCTION__.14460>
    f051:	mov    edx,0x6db
    f056:	lea    rsi,[rip+0x11a89]        # 20ae6 <desc_template.13939+0x206>
    f05d:	lea    rdi,[rip+0x1205c]        # 210c0 <desc_template.13939+0x7e0>
    f064:	call   3230 <__assert_fail@plt>
    f069:	lea    rcx,[rip+0x123c0]        # 21430 <__PRETTY_FUNCTION__.14460>
    f070:	mov    edx,0x6dd
    f075:	lea    rsi,[rip+0x11a6a]        # 20ae6 <desc_template.13939+0x206>
    f07c:	lea    rdi,[rip+0x11b45]        # 20bc8 <desc_template.13939+0x2e8>
    f083:	call   3230 <__assert_fail@plt>
    f088:	mov    r13d,DWORD PTR [rsp+0xc]
    f08d:	mov    r15,QWORD PTR [rsp+0x18]
    f092:	mov    rbp,QWORD PTR [rsp+0x48]
    f097:	jmp    e2b1 <check_directory_consistency+0x421>
    f09c:	nop    DWORD PTR [rax+0x0]

000000000000f0a0 <try_commit>:
    f0a0:	push   r15
    f0a2:	push   r14
    f0a4:	push   r13
    f0a6:	push   r12
    f0a8:	mov    r12,rdi
    f0ab:	push   rbp
    f0ac:	push   rbx
    f0ad:	sub    rsp,0x68
    f0b1:	cmp    QWORD PTR [rdi+0x8080],0x0
    f0b9:	je     f0d4 <try_commit+0x34>
    f0bb:	mov    QWORD PTR [rdi+0x8080],0x0
    f0c6:	mov    edi,DWORD PTR [rdi+0x807c]
    f0cc:	test   edi,edi
    f0ce:	jne    f370 <try_commit+0x2d0>
    f0d4:	mov    rdx,QWORD PTR [r12+0x80b8]
    f0dc:	mov    ecx,DWORD PTR [r12+0x8060]
    f0e4:	mov    DWORD PTR [r12+0x8098],0xffffffff
    f0f0:	test   rdx,rdx
    f0f3:	je     fbd8 <try_commit+0xb38>
    f0f9:	mov    esi,DWORD PTR [r12+0x8]
    f0fe:	mov    rdi,QWORD PTR [r12]
    f102:	call   c2a0 <vvfat_read>
    f107:	mov    ebx,eax
    f109:	test   eax,eax
    f10b:	jne    fab0 <try_commit+0xa10>
    f111:	mov    rsi,QWORD PTR [r12+0x80c0]
    f119:	test   rsi,rsi
    f11c:	je     10226 <try_commit+0x1186>
    f122:	mov    edx,DWORD PTR [r12+0x806c]
    f12a:	mov    eax,DWORD PTR [r12+0x8070]
    f132:	mov    ecx,DWORD PTR [r12+0x805c]
    f13a:	sub    rax,rdx
    f13d:	cqo
    f13f:	idiv   rcx
    f142:	xor    ecx,ecx
    f144:	test   eax,eax
    f146:	jne    f158 <try_commit+0xb8>
    f148:	jmp    f184 <try_commit+0xe4>
    f14a:	nop    WORD PTR [rax+rax*1+0x0]
    f150:	mov    rsi,QWORD PTR [r12+0x80c0]
    f158:	and    BYTE PTR [rsi+rcx*1],0xfc
    f15c:	mov    edx,DWORD PTR [r12+0x806c]
    f164:	add    rcx,0x1
    f168:	mov    eax,DWORD PTR [r12+0x8070]
    f170:	mov    esi,DWORD PTR [r12+0x805c]
    f178:	sub    rax,rdx
    f17b:	cqo
    f17d:	idiv   rsi
    f180:	cmp    eax,ecx
    f182:	ja     f150 <try_commit+0xb0>
    f184:	mov    edi,DWORD PTR [r12+0x80d4]
    f18c:	xor    ebp,ebp
    f18e:	test   edi,edi
    f190:	jne    f1b3 <try_commit+0x113>
    f192:	jmp    f1f8 <try_commit+0x158>
    f194:	nop    DWORD PTR [rax+0x0]
    f198:	cmp    eax,0x1
    f19b:	je     101aa <try_commit+0x110a>
    f1a1:	call   3070 <free@plt>
    f1a6:	add    ebp,0x1
    f1a9:	cmp    DWORD PTR [r12+0x80d4],ebp
    f1b1:	jbe    f1f8 <try_commit+0x158>
    f1b3:	mov    eax,ebp
    f1b5:	imul   eax,DWORD PTR [r12+0x80d8]
    f1be:	add    rax,QWORD PTR [r12+0x80c8]
    f1c6:	mov    rdi,QWORD PTR [rax]
    f1c9:	mov    eax,DWORD PTR [rax+0x10]
    f1cc:	test   rdi,rdi
    f1cf:	jne    f198 <try_commit+0xf8>
    f1d1:	cmp    eax,0x1
    f1d4:	je     f1a6 <try_commit+0x106>
    f1d6:	lea    rcx,[rip+0x12273]        # 21450 <__PRETTY_FUNCTION__.14325>
    f1dd:	mov    edx,0x55f
    f1e2:	lea    rsi,[rip+0x118fd]        # 20ae6 <desc_template.13939+0x206>
    f1e9:	lea    rdi,[rip+0x11f70]        # 21160 <desc_template.13939+0x880>
    f1f0:	call   3230 <__assert_fail@plt>
    f1f5:	nop    DWORD PTR [rax]
    f1f8:	cmp    QWORD PTR [r12+0x80b0],0x0
    f201:	mov    DWORD PTR [r12+0x80d4],0x0
    f20d:	je     f24b <try_commit+0x1ab>
    f20f:	mov    esi,DWORD PTR [r12+0x804c]
    f217:	test   esi,esi
    f219:	je     f24b <try_commit+0x1ab>
    f21b:	xor    edx,edx
    f21d:	nop    DWORD PTR [rax]
    f220:	mov    eax,edx
    f222:	imul   eax,DWORD PTR [r12+0x8050]
    f22b:	add    rax,QWORD PTR [r12+0x8040]
    f233:	mov    ecx,DWORD PTR [rax+0xc]
    f236:	test   ecx,ecx
    f238:	jns    f23e <try_commit+0x19e>
    f23a:	or     DWORD PTR [rax+0x20],0x10
    f23e:	add    edx,0x1
    f241:	cmp    DWORD PTR [r12+0x804c],edx
    f249:	ja     f220 <try_commit+0x180>
    f24b:	mov    rdx,QWORD PTR [r12+0x80e0]
    f253:	xor    esi,esi
    f255:	mov    rdi,r12
    f258:	call   de90 <check_directory_consistency>
    f25d:	mov    r9d,eax
    f260:	test   eax,eax
    f262:	jle    f320 <try_commit+0x280>
    f268:	mov    edx,DWORD PTR [r12+0x806c]
    f270:	mov    eax,DWORD PTR [r12+0x8070]
    f278:	mov    ecx,DWORD PTR [r12+0x805c]
    f280:	mov    esi,DWORD PTR [r12+0x8068]
    f288:	sub    rax,rdx
    f28b:	cqo
    f28d:	mov    r8d,esi
    f290:	idiv   rcx
    f293:	mov    r10d,eax
    f296:	cmp    esi,eax
    f298:	jae    f390 <try_commit+0x2f0>
    f29e:	mov    r11,QWORD PTR [r12+0x80c0]
    f2a6:	movsxd rax,esi
    f2a9:	jmp    f2d7 <try_commit+0x237>
    f2ab:	nop    DWORD PTR [rax+rax*1+0x0]
    f2b0:	lea    edx,[rax+0x1]
    f2b3:	cmp    esi,edx
    f2b5:	je     f340 <try_commit+0x2a0>
    f2bb:	test   dil,dil
    f2be:	je     f320 <try_commit+0x280>
    f2c0:	add    r8d,0x1
    f2c4:	cmp    dil,0x4
    f2c8:	je     f320 <try_commit+0x280>
    f2ca:	add    rax,0x1
    f2ce:	cmp    r10d,eax
    f2d1:	jbe    f390 <try_commit+0x2f0>
    f2d7:	mov    ecx,eax
    f2d9:	movzx  edi,BYTE PTR [r11+rax*1]
    f2de:	cmp    esi,eax
    f2e0:	ja     f2b0 <try_commit+0x210>
    f2e2:	mov    edx,DWORD PTR [r12+0x800c]
    f2ea:	mov    rbp,QWORD PTR [r12+0x80b8]
    f2f2:	cmp    edx,0x20
    f2f5:	je     f360 <try_commit+0x2c0>
    f2f7:	cmp    edx,0x10
    f2fa:	je     f350 <try_commit+0x2b0>
    f2fc:	lea    edx,[rax+rax*2]
    f2ff:	shl    ecx,0x2
    f302:	shr    edx,1
    f304:	and    ecx,0x4
    f307:	movzx  edx,WORD PTR [rbp+rdx*1+0x0]
    f30c:	sar    edx,cl
    f30e:	and    edx,0xfff
    f314:	test   edx,edx
    f316:	jne    f2bb <try_commit+0x21b>
    f318:	cmp    dil,0x4
    f31c:	jne    f2ca <try_commit+0x22a>
    f31e:	xchg   ax,ax
    f320:	mov    ebx,0xffffffff
    f325:	add    rsp,0x68
    f329:	mov    eax,ebx
    f32b:	pop    rbx
    f32c:	pop    rbp
    f32d:	pop    r12
    f32f:	pop    r13
    f331:	pop    r14
    f333:	pop    r15
    f335:	ret
    f336:	nop    WORD PTR cs:[rax+rax*1+0x0]
    f340:	mov    edx,DWORD PTR [r12+0x8078]
    f348:	jmp    f314 <try_commit+0x274>
    f34a:	nop    WORD PTR [rax+rax*1+0x0]
    f350:	mov    edx,eax
    f352:	movzx  edx,WORD PTR [rbp+rdx*2+0x0]
    f357:	jmp    f314 <try_commit+0x274>
    f359:	nop    DWORD PTR [rax+0x0]
    f360:	mov    edx,eax
    f362:	mov    edx,DWORD PTR [rbp+rdx*4+0x0]
    f366:	jmp    f314 <try_commit+0x274>
    f368:	nop    DWORD PTR [rax+rax*1+0x0]
    f370:	call   3270 <close@plt>
    f375:	mov    DWORD PTR [r12+0x807c],0x0
    f381:	jmp    f0d4 <try_commit+0x34>
    f386:	nop    WORD PTR cs:[rax+rax*1+0x0]
    f390:	cmp    r9d,r8d
    f393:	jne    f320 <try_commit+0x280>
    f395:	mov    eax,DWORD PTR [r12+0x80d4]
    f39d:	test   eax,eax
    f39f:	je     f325 <try_commit+0x285>
    f3a1:	cmp    QWORD PTR [r12+0x8080],0x0
    f3aa:	je     f3c8 <try_commit+0x328>
    f3ac:	mov    edi,DWORD PTR [r12+0x807c]
    f3b4:	mov    QWORD PTR [r12+0x8080],0x0
    f3c0:	test   edi,edi
    f3c2:	jne    fc60 <try_commit+0xbc0>
    f3c8:	lea    rbx,[r12+0x80c8]
    f3d0:	mov    DWORD PTR [rsp+0x8],0x0
    f3d8:	mov    r13,r12
    f3db:	mov    DWORD PTR [r12+0x8098],0xffffffff
    f3e7:	mov    QWORD PTR [rsp+0x58],rbx
    f3ec:	cmp    DWORD PTR [rsp+0x8],eax
    f3f0:	jae    f424 <try_commit+0x384>
    f3f2:	mov    ebp,DWORD PTR [rsp+0x8]
    f3f6:	imul   ebp,DWORD PTR [r13+0x80d8]
    f3fe:	add    rbp,QWORD PTR [r13+0x80c8]
    f405:	mov    edx,DWORD PTR [rbp+0x10]
    f408:	test   edx,edx
    f40a:	je     f580 <try_commit+0x4e0>
    f410:	cmp    edx,0x3
    f413:	je     f950 <try_commit+0x8b0>
    f419:	add    DWORD PTR [rsp+0x8],0x1
    f41e:	cmp    DWORD PTR [rsp+0x8],eax
    f422:	jb     f3f2 <try_commit+0x352>
    f424:	mov    edx,DWORD PTR [r13+0x8060]
    f42b:	mov    rdi,QWORD PTR [r13+0x8010]
    f432:	mov    r12,r13
    f435:	mov    rsi,QWORD PTR [r13+0x80b8]
    f43c:	shl    edx,0x9
    f43f:	call   33b0 <memcpy@plt>
    f444:	mov    edx,0xffffffff
    f449:	xor    esi,esi
    f44b:	mov    rdi,r13
    f44e:	call   d5b0 <commit_direntries>
    f453:	mov    ebx,eax
    f455:	test   eax,eax
    f457:	jne    1033f <try_commit+0x129f>
    f45d:	cmp    QWORD PTR [r12+0x8080],0x0
    f466:	je     f484 <try_commit+0x3e4>
    f468:	mov    edi,DWORD PTR [r12+0x807c]
    f470:	mov    QWORD PTR [r12+0x8080],0x0
    f47c:	test   edi,edi
    f47e:	jne    10028 <try_commit+0xf88>
    f484:	mov    DWORD PTR [r12+0x8098],0xffffffff
    f490:	xor    r13d,r13d
    f493:	mov    DWORD PTR [rsp],ebx
    f496:	mov    r11d,DWORD PTR [r12+0x80d4]
    f49e:	mov    ebp,r13d
    f4a1:	cmp    r11d,r13d
    f4a4:	jbe    1018c <try_commit+0x10ec>
    f4aa:	mov    ebp,r13d
    f4ad:	imul   ebp,DWORD PTR [r12+0x80d8]
    f4b6:	add    rbp,QWORD PTR [r12+0x80c8]
    f4be:	mov    eax,DWORD PTR [rbp+0x10]
    f4c1:	cmp    eax,0x1
    f4c4:	jne    fb18 <try_commit+0xa78>
    f4ca:	mov    esi,DWORD PTR [rbp+0x8]
    f4cd:	cmp    esi,DWORD PTR [r12+0x8034]
    f4d5:	jae    fc20 <try_commit+0xb80>
    f4db:	mov    eax,esi
    f4dd:	mov    r10d,DWORD PTR [r12+0x804c]
    f4e5:	xor    edi,edi
    f4e7:	imul   eax,DWORD PTR [r12+0x8038]
    f4f0:	add    rax,QWORD PTR [r12+0x8028]
    f4f8:	movzx  r9d,WORD PTR [rax+0x14]
    f4fd:	movzx  eax,WORD PTR [rax+0x1a]
    f501:	mov    ecx,r10d
    f504:	shl    r9d,0x10
    f508:	or     r9d,eax
    f50b:	jmp    f52e <try_commit+0x48e>
    f50d:	nop    DWORD PTR [rax]
    f510:	cmp    ecx,edx
    f512:	jne    f51c <try_commit+0x47c>
    f514:	test   ecx,ecx
    f516:	jne    ffa8 <try_commit+0xf08>
    f51c:	cmp    ecx,edx
    f51e:	je     fcbb <try_commit+0xc1b>
    f524:	mov    ecx,edx
    f526:	cmp    edi,ecx
    f528:	jg     f7a6 <try_commit+0x706>
    f52e:	lea    eax,[rcx+rdi*1]
    f531:	mov    edx,eax
    f533:	shr    edx,0x1f
    f536:	add    edx,eax
    f538:	sar    edx,1
    f53a:	cmp    r10d,edx
    f53d:	jbe    fc20 <try_commit+0xb80>
    f543:	mov    r14d,DWORD PTR [r12+0x8050]
    f54b:	mov    eax,edx
    f54d:	mov    r11,QWORD PTR [r12+0x8040]
    f555:	imul   eax,r14d
    f559:	add    rax,r11
    f55c:	mov    r8d,DWORD PTR [rax]
    f55f:	mov    eax,DWORD PTR [rax+0x4]
    f562:	cmp    r8d,eax
    f565:	jae    fc40 <try_commit+0xba0>
    f56b:	cmp    r9d,r8d
    f56e:	jbe    f510 <try_commit+0x470>
    f570:	cmp    edi,edx
    f572:	je     fcb0 <try_commit+0xc10>
    f578:	mov    edi,edx
    f57a:	jmp    f526 <try_commit+0x486>
    f57c:	nop    DWORD PTR [rax+0x0]
    f580:	mov    r9d,DWORD PTR [r13+0x804c]
    f587:	mov    edi,DWORD PTR [rbp+0x8]
    f58a:	xor    ecx,ecx
    f58c:	mov    edx,r9d
    f58f:	jmp    f5b2 <try_commit+0x512>
    f591:	nop    DWORD PTR [rax+0x0]
    f598:	cmp    edx,eax
    f59a:	jne    f5a4 <try_commit+0x504>
    f59c:	test   edx,edx
    f59e:	jne    ffa8 <try_commit+0xf08>
    f5a4:	cmp    edx,eax
    f5a6:	je     f60b <try_commit+0x56b>
    f5a8:	mov    edx,eax
    f5aa:	cmp    ecx,edx
    f5ac:	jg     f7a6 <try_commit+0x706>
    f5b2:	lea    esi,[rcx+rdx*1]
    f5b5:	mov    eax,esi
    f5b7:	shr    eax,0x1f
    f5ba:	add    eax,esi
    f5bc:	sar    eax,1
    f5be:	cmp    r9d,eax
    f5c1:	jbe    fc20 <try_commit+0xb80>
    f5c7:	mov    esi,DWORD PTR [r13+0x8050]
    f5ce:	mov    ebx,eax
    f5d0:	mov    r11,QWORD PTR [r13+0x8040]
    f5d7:	imul   ebx,esi
    f5da:	add    rbx,r11
    f5dd:	mov    r10d,DWORD PTR [rbx]
    f5e0:	mov    r12d,DWORD PTR [rbx+0x4]
    f5e4:	cmp    r10d,r12d
    f5e7:	jae    fc40 <try_commit+0xba0>
    f5ed:	cmp    edi,r10d
    f5f0:	jbe    f598 <try_commit+0x4f8>
    f5f2:	cmp    ecx,eax
    f5f4:	je     f600 <try_commit+0x560>
    f5f6:	mov    ecx,eax
    f5f8:	jmp    f5aa <try_commit+0x50a>
    f5fa:	nop    WORD PTR [rax+rax*1+0x0]
    f600:	cmp    edi,r12d
    f603:	jb     f938 <try_commit+0x898>
    f609:	mov    ecx,edx
    f60b:	cmp    r9d,ecx
    f60e:	jbe    3775 <try_commit.cold.13>
    f614:	imul   ecx,esi
    f617:	lea    rbx,[r11+rcx*1]
    f61b:	cmp    edi,DWORD PTR [rbx]
    f61d:	jb     3775 <try_commit.cold.13>
    f623:	cmp    edi,DWORD PTR [rbx+0x4]
    f626:	jae    101e8 <try_commit+0x1148>
    f62c:	mov    rax,QWORD PTR [rbx+0x18]
    f630:	mov    rsi,QWORD PTR [rbp+0x0]
    f634:	mov    QWORD PTR [rsp+0x10],rax
    f639:	test   rsi,rsi
    f63c:	je     10207 <try_commit+0x1167>
    f642:	mov    QWORD PTR [rbx+0x18],rsi
    f646:	mov    rdi,QWORD PTR [rsp+0x10]
    f64b:	call   35c0 <rename@plt>
    f650:	test   eax,eax
    f652:	jne    10140 <try_commit+0x10a0>
    f658:	test   BYTE PTR [rbx+0x20],0x4
    f65c:	je     f910 <try_commit+0x870>
    f662:	mov    rdi,QWORD PTR [rbx+0x18]
    f666:	call   31b0 <strlen@plt>
    f66b:	mov    rdi,QWORD PTR [rsp+0x10]
    f670:	mov    rbp,rax
    f673:	mov    DWORD PTR [rsp+0x34],eax
    f677:	call   31b0 <strlen@plt>
    f67c:	mov    esi,ebp
    f67e:	sub    esi,eax
    f680:	mov    DWORD PTR [rsp+0x38],eax
    f684:	mov    eax,DWORD PTR [rbx+0x14]
    f687:	mov    DWORD PTR [rsp+0x3c],esi
    f68b:	cmp    eax,DWORD PTR [r13+0x8034]
    f692:	jae    fc20 <try_commit+0xb80>
    f698:	mov    rsi,QWORD PTR [r13+0x8028]
    f69f:	mov    DWORD PTR [rsp],0x0
    f6a6:	mov    QWORD PTR [rsp+0x40],rbx
    f6ab:	mov    QWORD PTR [rsp+0x48],rsi
    f6b0:	mov    esi,eax
    f6b2:	imul   esi,DWORD PTR [r13+0x8038]
    f6ba:	mov    eax,DWORD PTR [rbx]
    f6bc:	mov    QWORD PTR [rsp+0x50],rsi
    f6c1:	mov    DWORD PTR [rsp+0x18],eax
    f6c5:	mov    eax,DWORD PTR [r13+0x8078]
    f6cc:	sub    eax,0x8
    f6cf:	cmp    DWORD PTR [rsp+0x18],eax
    f6d3:	ja     f910 <try_commit+0x870>
    f6d9:	movsxd rcx,DWORD PTR [rsp]
    f6dd:	mov    rax,QWORD PTR [rsp+0x48]
    f6e2:	shl    rcx,0x5
    f6e6:	add    rcx,QWORD PTR [rsp+0x50]
    f6eb:	lea    rbx,[rax+rcx*1]
    f6ef:	nop
    f6f0:	mov    rdi,rbx
    f6f3:	call   b940 <is_file>
    f6f8:	test   al,al
    f6fa:	jne    f71d <try_commit+0x67d>
    f6fc:	movzx  edx,BYTE PTR [rbx+0xb]
    f700:	movzx  eax,BYTE PTR [rbx]
    f703:	test   dl,0x10
    f706:	je     f885 <try_commit+0x7e5>
    f70c:	cmp    al,0xe5
    f70e:	je     f885 <try_commit+0x7e5>
    f714:	cmp    dl,0x28
    f717:	jne    f8f0 <try_commit+0x850>
    f71d:	movzx  edx,WORD PTR [rbx+0x14]
    f721:	movzx  eax,WORD PTR [rbx+0x1a]
    f725:	xor    esi,esi
    f727:	mov    r11d,DWORD PTR [r13+0x804c]
    f72e:	shl    edx,0x10
    f731:	or     edx,eax
    f733:	mov    edi,r11d
    f736:	jmp    f75a <try_commit+0x6ba>
    f738:	nop    DWORD PTR [rax+rax*1+0x0]
    f740:	cmp    edi,eax
    f742:	jne    f74c <try_commit+0x6ac>
    f744:	test   edi,edi
    f746:	jne    ffa8 <try_commit+0xf08>
    f74c:	cmp    edi,eax
    f74e:	je     f7d3 <try_commit+0x733>
    f754:	mov    edi,eax
    f756:	cmp    esi,edi
    f758:	jg     f7a6 <try_commit+0x706>
    f75a:	lea    ecx,[rdi+rsi*1]
    f75d:	mov    eax,ecx
    f75f:	shr    eax,0x1f
    f762:	add    eax,ecx
    f764:	sar    eax,1
    f766:	cmp    r11d,eax
    f769:	jbe    fc20 <try_commit+0xb80>
    f76f:	mov    r9d,DWORD PTR [r13+0x8050]
    f776:	mov    r14d,eax
    f779:	mov    rbp,QWORD PTR [r13+0x8040]
    f780:	imul   r14d,r9d
    f784:	add    r14,rbp
    f787:	mov    r10d,DWORD PTR [r14]
    f78a:	mov    r12d,DWORD PTR [r14+0x4]
    f78e:	cmp    r10d,r12d
    f791:	jae    fc40 <try_commit+0xba0>
    f797:	cmp    edx,r10d
    f79a:	jbe    f740 <try_commit+0x6a0>
    f79c:	cmp    esi,eax
    f79e:	je     f7c8 <try_commit+0x728>
    f7a0:	mov    esi,eax
    f7a2:	cmp    esi,edi
    f7a4:	jle    f75a <try_commit+0x6ba>
    f7a6:	lea    rcx,[rip+0x11cd3]        # 21480 <__PRETTY_FUNCTION__.14249>
    f7ad:	mov    edx,0x465
    f7b2:	lea    rsi,[rip+0x1132d]        # 20ae6 <desc_template.13939+0x206>
    f7b9:	lea    rdi,[rip+0x113a9]        # 20b69 <desc_template.13939+0x289>
    f7c0:	call   3230 <__assert_fail@plt>
    f7c5:	nop    DWORD PTR [rax]
    f7c8:	cmp    edx,r12d
    f7cb:	jb     f900 <try_commit+0x860>
    f7d1:	mov    esi,edi
    f7d3:	cmp    r11d,esi
    f7d6:	jbe    3775 <try_commit.cold.13>
    f7dc:	imul   esi,r9d
    f7e0:	lea    r14,[rbp+rsi*1+0x0]
    f7e5:	cmp    edx,DWORD PTR [r14]
    f7e8:	jb     3775 <try_commit.cold.13>
    f7ee:	cmp    edx,DWORD PTR [r14+0x4]
    f7f2:	jae    101e8 <try_commit+0x1148>
    f7f8:	mov    rdi,QWORD PTR [r14+0x18]
    f7fc:	call   31b0 <strlen@plt>
    f801:	mov    esi,DWORD PTR [rsp+0x3c]
    f805:	lea    ebp,[rsi+rax*1+0x1]
    f809:	movsxd r9,ebp
    f80c:	mov    rdi,r9
    f80f:	mov    QWORD PTR [rsp+0x28],r9
    f814:	call   5970 <qemu_malloc>
    f819:	movsxd r12,DWORD PTR [rsp+0x38]
    f81e:	mov    rdi,QWORD PTR [r14+0x18]
    f822:	mov    r15,rax
    f825:	mov    rax,QWORD PTR [rsp+0x40]
    f82a:	mov    rdx,r12
    f82d:	mov    r10,QWORD PTR [rax+0x18]
    f831:	mov    rsi,r10
    f834:	mov    QWORD PTR [rsp+0x20],r10
    f839:	call   30f0 <strncmp@plt>
    f83e:	mov    r10,QWORD PTR [rsp+0x20]
    f843:	mov    r9,QWORD PTR [rsp+0x28]
    f848:	test   eax,eax
    f84a:	jne    101c9 <try_commit+0x1129>
    f850:	mov    rdx,r10
    f853:	mov    rsi,r9
    f856:	mov    rdi,r15
    f859:	call   5560 <pstrcpy>
    f85e:	movsxd rdi,DWORD PTR [rsp+0x34]
    f863:	mov    rdx,QWORD PTR [r14+0x18]
    f867:	sub    ebp,edi
    f869:	add    rdx,r12
    f86c:	add    rdi,r15
    f86f:	movsxd rsi,ebp
    f872:	call   5560 <pstrcpy>
    f877:	mov    esi,DWORD PTR [r14]
    f87a:	mov    rdx,r15
    f87d:	mov    rdi,r13
    f880:	call   c950 <schedule_rename>
    f885:	mov    ecx,DWORD PTR [r13+0x805c]
    f88c:	add    DWORD PTR [rsp],0x1
    f890:	xor    edx,edx
    f892:	add    rbx,0x20
    f896:	mov    eax,DWORD PTR [rsp]
    f899:	shl    ecx,0x4
    f89c:	div    ecx
    f89e:	test   edx,edx
    f8a0:	jne    f6f0 <try_commit+0x650>
    f8a6:	mov    eax,DWORD PTR [r13+0x800c]
    f8ad:	cmp    eax,0x20
    f8b0:	je     fc80 <try_commit+0xbe0>
    f8b6:	cmp    eax,0x10
    f8b9:	jne    fae0 <try_commit+0xa40>
    f8bf:	mov    eax,DWORD PTR [rsp+0x18]
    f8c3:	cmp    eax,DWORD PTR [r13+0x801c]
    f8ca:	jae    fc20 <try_commit+0xb80>
    f8d0:	mov    ebx,eax
    f8d2:	imul   ebx,DWORD PTR [r13+0x8020]
    f8da:	mov    rax,QWORD PTR [r13+0x8010]
    f8e1:	movzx  eax,WORD PTR [rax+rbx*1]
    f8e5:	mov    DWORD PTR [rsp+0x18],eax
    f8e9:	jmp    f6c5 <try_commit+0x625>
    f8ee:	xchg   ax,ax
    f8f0:	cmp    al,0x2e
    f8f2:	jne    f71d <try_commit+0x67d>
    f8f8:	jmp    f885 <try_commit+0x7e5>
    f8fa:	nop    WORD PTR [rax+rax*1+0x0]
    f900:	cmp    edx,r10d
    f903:	jae    f7f8 <try_commit+0x758>
    f909:	jmp    3775 <try_commit.cold.13>
    f90e:	xchg   ax,ax
    f910:	mov    rdi,QWORD PTR [rsp+0x10]
    f915:	call   3070 <free@plt>
    f91a:	mov    esi,DWORD PTR [rsp+0x8]
    f91e:	mov    rdi,QWORD PTR [rsp+0x58]
    f923:	call   bac0 <array_remove>
    f928:	mov    eax,DWORD PTR [r13+0x80d4]
    f92f:	jmp    f3ec <try_commit+0x34c>
    f934:	nop    DWORD PTR [rax+0x0]
    f938:	cmp    edi,r10d
    f93b:	jae    f62c <try_commit+0x58c>
    f941:	jmp    3775 <try_commit.cold.13>
    f946:	nop    WORD PTR cs:[rax+rax*1+0x0]
    f950:	mov    rdi,QWORD PTR [rbp+0x0]
    f954:	mov    esi,0x1ed
    f959:	call   3120 <mkdir@plt>
    f95e:	mov    ebx,eax
    f960:	test   eax,eax
    f962:	jne    101a0 <try_commit+0x1100>
    f968:	mov    esi,DWORD PTR [rbp+0x8]
    f96b:	mov    rdi,r13
    f96e:	lea    edx,[rsi+0x1]
    f971:	call   bd20 <insert_mapping>
    f976:	mov    r15,rax
    f979:	test   rax,rax
    f97c:	je     1003e <try_commit+0xf9e>
    f982:	mov    QWORD PTR [rax+0x20],0x4
    f98a:	mov    rax,QWORD PTR [rbp+0x0]
    f98e:	mov    QWORD PTR [r15+0x18],rax
    f992:	mov    r12d,DWORD PTR [r13+0x8034]
    f999:	test   r12d,r12d
    f99c:	je     10283 <try_commit+0x11e3>
    f9a2:	mov    edx,DWORD PTR [r13+0x805c]
    f9a9:	mov    esi,r12d
    f9ac:	mov    rdi,r13
    f9af:	shl    edx,0x4
    f9b2:	call   c030 <insert_direntries>
    f9b7:	mov    DWORD PTR [r15+0x14],r12d
    f9bb:	mov    r14,QWORD PTR [rbp+0x0]
    f9bf:	mov    esi,0x2f
    f9c4:	mov    ebp,0xffffffff
    f9c9:	mov    rdi,r14
    f9cc:	call   3210 <strrchr@plt>
    f9d1:	mov    r12,rax
    f9d4:	test   rax,rax
    f9d7:	je     f9f3 <try_commit+0x953>
    f9d9:	mov    rdi,r14
    f9dc:	call   31b0 <strlen@plt>
    f9e1:	lea    rdi,[r12+0x1]
    f9e6:	mov    rbp,rax
    f9e9:	call   31b0 <strlen@plt>
    f9ee:	sub    ebp,0x1
    f9f1:	sub    ebp,eax
    f9f3:	mov    eax,DWORD PTR [r13+0x804c]
    f9fa:	mov    DWORD PTR [rsp],eax
    f9fd:	test   eax,eax
    f9ff:	je     10264 <try_commit+0x11c4>
    fa05:	mov    rax,QWORD PTR [r13+0x8040]
    fa0c:	xor    r14d,r14d
    fa0f:	mov    QWORD PTR [rsp+0x18],r13
    fa14:	movsxd rbp,ebp
    fa17:	mov    QWORD PTR [rsp+0x10],rax
    fa1c:	mov    eax,DWORD PTR [r13+0x8050]
    fa23:	mov    r13,r15
    fa26:	mov    r15d,ebx
    fa29:	mov    ebx,r14d
    fa2c:	mov    r14d,eax
    fa2f:	jmp    fa49 <try_commit+0x9a9>
    fa31:	nop    DWORD PTR [rax+0x0]
    fa38:	add    r15d,0x1
    fa3c:	add    ebx,r14d
    fa3f:	cmp    r15d,DWORD PTR [rsp]
    fa43:	je     10264 <try_commit+0x11c4>
    fa49:	mov    eax,ebx
    fa4b:	add    rax,QWORD PTR [rsp+0x10]
    fa50:	mov    edx,DWORD PTR [rax+0xc]
    fa53:	test   edx,edx
    fa55:	jns    fa38 <try_commit+0x998>
    fa57:	cmp    r13,rax
    fa5a:	je     fa38 <try_commit+0x998>
    fa5c:	mov    r12,QWORD PTR [rax+0x18]
    fa60:	mov    rsi,QWORD PTR [r13+0x18]
    fa64:	mov    rdx,rbp
    fa67:	mov    rdi,r12
    fa6a:	call   30f0 <strncmp@plt>
    fa6f:	test   eax,eax
    fa71:	jne    fa38 <try_commit+0x998>
    fa73:	mov    rdi,r12
    fa76:	call   31b0 <strlen@plt>
    fa7b:	cmp    rbp,rax
    fa7e:	jne    fa38 <try_commit+0x998>
    fa80:	mov    ebx,r15d
    fa83:	mov    r15,r13
    fa86:	mov    esi,DWORD PTR [rsp+0x8]
    fa8a:	mov    r13,QWORD PTR [rsp+0x18]
    fa8f:	mov    DWORD PTR [r15+0x10],ebx
    fa93:	mov    rdi,QWORD PTR [rsp+0x58]
    fa98:	call   bac0 <array_remove>
    fa9d:	mov    eax,DWORD PTR [r13+0x80d4]
    faa4:	jmp    f3ec <try_commit+0x34c>
    faa9:	nop    DWORD PTR [rax+0x0]
    fab0:	mov    edx,0x13
    fab5:	mov    rcx,QWORD PTR [rip+0x1a844]        # 2a300 <stderr@@GLIBC_2.2.5>
    fabc:	mov    esi,0x1
    fac1:	lea    rdi,[rip+0x1119b]        # 20c63 <desc_template.13939+0x383>
    fac8:	mov    ebx,0xffffffff
    facd:	call   3640 <fwrite@plt>
    fad2:	jmp    f325 <try_commit+0x285>
    fad7:	nop    WORD PTR [rax+rax*1+0x0]
    fae0:	mov    ebx,DWORD PTR [rsp+0x18]
    fae4:	mov    rdx,QWORD PTR [r13+0x8010]
    faeb:	lea    eax,[rbx+rbx*2]
    faee:	lea    ecx,[rbx*4+0x0]
    faf5:	shr    eax,1
    faf7:	and    ecx,0x4
    fafa:	movzx  eax,WORD PTR [rdx+rax*1]
    fafe:	sar    eax,cl
    fb00:	mov    ebx,eax
    fb02:	and    ebx,0xfff
    fb08:	mov    DWORD PTR [rsp+0x18],ebx
    fb0c:	jmp    f6c5 <try_commit+0x625>
    fb11:	nop    DWORD PTR [rax+0x0]
    fb18:	test   eax,eax
    fb1a:	je     10245 <try_commit+0x11a5>
    fb20:	cmp    eax,0x2
    fb23:	jne    fbad <try_commit+0xb0d>
    fb29:	mov    r9d,DWORD PTR [r12+0x804c]
    fb31:	mov    esi,DWORD PTR [rbp+0x8]
    fb34:	xor    edi,edi
    fb36:	mov    eax,r9d
    fb39:	jmp    fb5e <try_commit+0xabe>
    fb3b:	nop    DWORD PTR [rax+rax*1+0x0]
    fb40:	cmp    eax,edx
    fb42:	jne    fb4c <try_commit+0xaac>
    fb44:	test   eax,eax
    fb46:	jne    ffa8 <try_commit+0xf08>
    fb4c:	cmp    eax,edx
    fb4e:	je     fea7 <try_commit+0xe07>
    fb54:	mov    eax,edx
    fb56:	cmp    edi,eax
    fb58:	jg     f7a6 <try_commit+0x706>
    fb5e:	lea    ecx,[rax+rdi*1]
    fb61:	mov    edx,ecx
    fb63:	shr    edx,0x1f
    fb66:	add    edx,ecx
    fb68:	sar    edx,1
    fb6a:	cmp    r9d,edx
    fb6d:	jbe    fc20 <try_commit+0xb80>
    fb73:	mov    r10d,DWORD PTR [r12+0x8050]
    fb7b:	mov    ecx,edx
    fb7d:	mov    r14,QWORD PTR [r12+0x8040]
    fb85:	imul   ecx,r10d
    fb89:	add    rcx,r14
    fb8c:	mov    r8d,DWORD PTR [rcx]
    fb8f:	mov    r15d,DWORD PTR [rcx+0x4]
    fb93:	cmp    r8d,r15d
    fb96:	jae    fc40 <try_commit+0xba0>
    fb9c:	cmp    esi,r8d
    fb9f:	jbe    fb40 <try_commit+0xaa0>
    fba1:	cmp    edi,edx
    fba3:	je     fea0 <try_commit+0xe00>
    fba9:	mov    edi,edx
    fbab:	jmp    fb56 <try_commit+0xab6>
    fbad:	cmp    eax,0x3
    fbb0:	je     10245 <try_commit+0x11a5>
    fbb6:	lea    rcx,[rip+0x117b3]        # 21370 <__PRETTY_FUNCTION__.14661>
    fbbd:	mov    edx,0x9e3
    fbc2:	lea    rsi,[rip+0x10f1d]        # 20ae6 <desc_template.13939+0x206>
    fbc9:	lea    rdi,[rip+0xd5a7]        # 1d177 <_IO_stdin_used+0x177>
    fbd0:	call   3230 <__assert_fail@plt>
    fbd5:	nop    DWORD PTR [rax]
    fbd8:	shl    ecx,0x9
    fbdb:	movsxd rbx,ecx
    fbde:	mov    rdi,rbx
    fbe1:	call   5970 <qemu_malloc>
    fbe6:	mov    rsi,QWORD PTR [r12+0x8010]
    fbee:	mov    rdx,rbx
    fbf1:	mov    QWORD PTR [r12+0x80b8],rax
    fbf9:	mov    rdi,rax
    fbfc:	call   33b0 <memcpy@plt>
    fc01:	mov    ecx,DWORD PTR [r12+0x8060]
    fc09:	mov    rdx,QWORD PTR [r12+0x80b8]
    fc11:	jmp    f0f9 <try_commit+0x59>
    fc16:	nop    WORD PTR cs:[rax+rax*1+0x0]
    fc20:	lea    rcx,[rip+0x11849]        # 21470 <__PRETTY_FUNCTION__.13830>
    fc27:	mov    edx,0x60
    fc2c:	lea    rsi,[rip+0x10eb3]        # 20ae6 <desc_template.13939+0x206>
    fc33:	lea    rdi,[rip+0x10ee1]        # 20b1b <desc_template.13939+0x23b>
    fc3a:	call   3230 <__assert_fail@plt>
    fc3f:	nop
    fc40:	lea    rcx,[rip+0x11839]        # 21480 <__PRETTY_FUNCTION__.14249>
    fc47:	mov    edx,0x45a
    fc4c:	lea    rsi,[rip+0x10e93]        # 20ae6 <desc_template.13939+0x206>
    fc53:	lea    rdi,[rip+0x10ed5]        # 20b2f <desc_template.13939+0x24f>
    fc5a:	call   3230 <__assert_fail@plt>
    fc5f:	nop
    fc60:	call   3270 <close@plt>
    fc65:	mov    eax,DWORD PTR [r12+0x80d4]
    fc6d:	mov    DWORD PTR [r12+0x807c],0x0
    fc79:	jmp    f3c8 <try_commit+0x328>
    fc7e:	xchg   ax,ax
    fc80:	mov    eax,DWORD PTR [rsp+0x18]
    fc84:	cmp    DWORD PTR [r13+0x801c],eax
    fc8b:	jbe    fc20 <try_commit+0xb80>
    fc8d:	mov    ebx,eax
    fc8f:	imul   ebx,DWORD PTR [r13+0x8020]
    fc97:	mov    rax,QWORD PTR [r13+0x8010]
    fc9e:	mov    eax,DWORD PTR [rax+rbx*1]
    fca1:	mov    DWORD PTR [rsp+0x18],eax
    fca5:	jmp    f6c5 <try_commit+0x625>
    fcaa:	nop    WORD PTR [rax+rax*1+0x0]
    fcb0:	cmp    r9d,eax
    fcb3:	jb     10000 <try_commit+0xf60>
    fcb9:	mov    edi,ecx
    fcbb:	cmp    r10d,edi
    fcbe:	jbe    ffe0 <try_commit+0xf40>
    fcc4:	imul   edi,r14d
    fcc8:	add    r11,rdi
    fccb:	mov    eax,DWORD PTR [r11]
    fcce:	cmp    r9d,eax
    fcd1:	jb     ffe0 <try_commit+0xf40>
    fcd7:	cmp    r9d,DWORD PTR [r11+0x4]
    fcdb:	jae    101e8 <try_commit+0x1148>
    fce1:	cmp    r9d,eax
    fce4:	jne    10005 <try_commit+0xf65>
    fcea:	cmp    QWORD PTR [rbp+0x0],0x0
    fcef:	jne    102e2 <try_commit+0x1242>
    fcf5:	mov    edx,DWORD PTR [rbp+0xc]
    fcf8:	mov    rdi,r12
    fcfb:	add    r13d,0x1
    fcff:	mov    ebp,r13d
    fd02:	call   d090 <commit_one_file>
    fd07:	test   eax,eax
    fd09:	je     f496 <try_commit+0x3f6>
    fd0f:	mov    ebx,DWORD PTR [rsp]
    fd12:	mov    r11d,DWORD PTR [r12+0x80d4]
    fd1a:	mov    r15d,0xfffffffd
    fd20:	cmp    ebp,r11d
    fd23:	ja     10301 <try_commit+0x1261>
    fd29:	mov    ecx,r11d
    fd2c:	sub    ecx,0x1
    fd2f:	js     102a2 <try_commit+0x1202>
    fd35:	mov    eax,0x1
    fd3a:	je     fdba <try_commit+0xd1a>
    fd3c:	mov    eax,DWORD PTR [r12+0x80d8]
    fd44:	mov    r13,QWORD PTR [r12+0x80c8]
    fd4c:	imul   ecx,eax
    fd4f:	imul   eax,ebp
    fd52:	movsxd rcx,ecx
    fd55:	movsxd r14,eax
    fd58:	lea    rsi,[r13+rcx*1+0x0]
    fd5d:	mov    QWORD PTR [rsp+0x10],rcx
    fd62:	mov    rdi,r14
    fd65:	mov    QWORD PTR [rsp],rsi
    fd69:	call   5970 <qemu_malloc>
    fd6e:	mov    rdx,r14
    fd71:	mov    rsi,r13
    fd74:	mov    rdi,rax
    fd77:	mov    QWORD PTR [rsp+0x8],rax
    fd7c:	call   33b0 <memcpy@plt>
    fd81:	mov    rcx,QWORD PTR [rsp+0x10]
    fd86:	lea    rsi,[r13+r14*1+0x0]
    fd8b:	mov    rdi,r13
    fd8e:	mov    rdx,rcx
    fd91:	call   3530 <memmove@plt>
    fd96:	mov    rdx,r14
    fd99:	mov    r14,QWORD PTR [rsp+0x8]
    fd9e:	mov    rdi,QWORD PTR [rsp]
    fda2:	mov    rsi,r14
    fda5:	call   33b0 <memcpy@plt>
    fdaa:	mov    rdi,r14
    fdad:	call   3070 <free@plt>
    fdb2:	mov    eax,DWORD PTR [r12+0x80d4]
    fdba:	sub    eax,ebp
    fdbc:	mov    DWORD PTR [r12+0x80d4],eax
    fdc4:	test   r15d,r15d
    fdc7:	jne    102a6 <try_commit+0x1206>
    fdcd:	mov    DWORD PTR [rsp],ebx
    fdd0:	cmp    DWORD PTR [r12+0x804c],0x1
    fdd9:	jbe    100f5 <try_commit+0x1055>
    fddf:	xor    ebp,ebp
    fde1:	xor    r13d,r13d
    fde4:	mov    r14d,0x1
    fdea:	jmp    fe25 <try_commit+0xd85>
    fdec:	nop    DWORD PTR [rax+0x0]
    fdf0:	test   cl,cl
    fdf2:	je     fe6f <try_commit+0xdcf>
    fdf4:	mov    rdi,QWORD PTR [rax+0x18]
    fdf8:	call   30e0 <unlink@plt>
    fdfd:	test   eax,eax
    fdff:	jne    10150 <try_commit+0x10b0>
    fe05:	add    ebp,0x1
    fe08:	mov    esi,r14d
    fe0b:	mov    rdi,r12
    fe0e:	call   bc10 <remove_mapping>
    fe13:	add    r14d,0x1
    fe17:	cmp    DWORD PTR [r12+0x804c],r14d
    fe1f:	jbe    100e8 <try_commit+0x1048>
    fe25:	mov    eax,r14d
    fe28:	imul   eax,DWORD PTR [r12+0x8050]
    fe31:	add    rax,QWORD PTR [r12+0x8040]
    fe39:	mov    edx,DWORD PTR [rax+0x20]
    fe3c:	test   dl,0x10
    fe3f:	je     fe13 <try_commit+0xd73>
    fe41:	mov    ecx,DWORD PTR [rax+0x8]
    fe44:	mov    r15d,DWORD PTR [r12+0x8034]
    fe4c:	cmp    ecx,r15d
    fe4f:	jae    fc20 <try_commit+0xb80>
    fe55:	imul   ecx,DWORD PTR [r12+0x8038]
    fe5e:	mov    rsi,QWORD PTR [r12+0x8028]
    fe66:	movzx  ecx,BYTE PTR [rsi+rcx*1]
    fe6a:	cmp    cl,0xe5
    fe6d:	jne    fdf0 <try_commit+0xd50>
    fe6f:	and    edx,0x4
    fe72:	je     fe08 <try_commit+0xd68>
    fe74:	mov    rdi,QWORD PTR [rax+0x18]
    fe78:	mov    ebx,DWORD PTR [rax+0x14]
    fe7b:	call   31a0 <rmdir@plt>
    fe80:	test   eax,eax
    fe82:	jns    10080 <try_commit+0xfe0>
    fe88:	call   30d0 <__errno_location@plt>
    fe8d:	cmp    DWORD PTR [rax],0x27
    fe90:	jne    10150 <try_commit+0x10b0>
    fe96:	add    r13d,0x1
    fe9a:	jmp    fe13 <try_commit+0xd73>
    fe9f:	nop
    fea0:	cmp    esi,r15d
    fea3:	jb     febb <try_commit+0xe1b>
    fea5:	mov    edi,eax
    fea7:	cmp    r9d,edi
    feaa:	jbe    ffd0 <try_commit+0xf30>
    feb0:	imul   edi,r10d
    feb4:	lea    rcx,[r14+rdi*1]
    feb8:	mov    r8d,DWORD PTR [rcx]
    febb:	cmp    esi,r8d
    febe:	jb     ffd0 <try_commit+0xf30>
    fec4:	cmp    esi,DWORD PTR [rcx+0x4]
    fec7:	jae    101e8 <try_commit+0x1148>
    fecd:	mov    r9d,DWORD PTR [r12+0x8034]
    fed5:	test   r9d,r9d
    fed8:	je     ff21 <try_commit+0xe81>
    feda:	mov    r15,QWORD PTR [r12+0x8028]
    fee2:	mov    r10d,DWORD PTR [r12+0x8038]
    feea:	xor    r14d,r14d
    feed:	xor    ebx,ebx
    feef:	nop
    fef0:	mov    r8d,ebx
    fef3:	add    r8,r15
    fef6:	mov    rdi,r8
    fef9:	call   b940 <is_file>
    fefe:	test   al,al
    ff00:	je     ff15 <try_commit+0xe75>
    ff02:	movzx  eax,WORD PTR [r8+0x14]
    ff07:	movzx  edi,WORD PTR [r8+0x1a]
    ff0c:	shl    eax,0x10
    ff0f:	or     eax,edi
    ff11:	cmp    esi,eax
    ff13:	je     ff38 <try_commit+0xe98>
    ff15:	add    r14d,0x1
    ff19:	add    ebx,r10d
    ff1c:	cmp    r14d,r9d
    ff1f:	jne    fef0 <try_commit+0xe50>
    ff21:	mov    ebp,r13d
    ff24:	mov    ebx,DWORD PTR [rsp]
    ff27:	mov    r15d,0xfffffffa
    ff2d:	add    ebp,0x1
    ff30:	jmp    fd20 <try_commit+0xc80>
    ff35:	nop    DWORD PTR [rax]
    ff38:	test   rcx,rcx
    ff3b:	je     ff44 <try_commit+0xea4>
    ff3d:	cmp    esi,DWORD PTR [rcx]
    ff3f:	je     ff52 <try_commit+0xeb2>
    ff41:	mov    DWORD PTR [rcx+0x4],esi
    ff44:	lea    edx,[rsi+0x1]
    ff47:	mov    rdi,r12
    ff4a:	call   bd20 <insert_mapping>
    ff4f:	mov    rcx,rax
    ff52:	mov    rax,QWORD PTR [rbp+0x0]
    ff56:	test   rax,rax
    ff59:	je     10320 <try_commit+0x1280>
    ff5f:	mov    QWORD PTR [rcx+0x18],rax
    ff63:	xor    edx,edx
    ff65:	mov    esi,r14d
    ff68:	mov    rdi,r12
    ff6b:	mov    QWORD PTR [rcx+0x20],0x1
    ff73:	add    r13d,0x1
    ff77:	mov    DWORD PTR [rcx+0x10],0x0
    ff7e:	mov    ebp,r13d
    ff81:	call   d090 <commit_one_file>
    ff86:	test   eax,eax
    ff88:	je     f496 <try_commit+0x3f6>
    ff8e:	mov    ebx,DWORD PTR [rsp]
    ff91:	mov    r11d,DWORD PTR [r12+0x80d4]
    ff99:	mov    r15d,0xfffffff9
    ff9f:	jmp    fd20 <try_commit+0xc80>
    ffa4:	nop    DWORD PTR [rax+0x0]
    ffa8:	lea    rcx,[rip+0x114d1]        # 21480 <__PRETTY_FUNCTION__.14249>
    ffaf:	mov    edx,0x45c
    ffb4:	lea    rsi,[rip+0x10b2b]        # 20ae6 <desc_template.13939+0x206>
    ffbb:	lea    rdi,[rip+0x10b8b]        # 20b4d <desc_template.13939+0x26d>
    ffc2:	call   3230 <__assert_fail@plt>
    ffc7:	nop    WORD PTR [rax+rax*1+0x0]
    ffd0:	xor    ecx,ecx
    ffd2:	jmp    fecd <try_commit+0xe2d>
    ffd7:	nop    WORD PTR [rax+rax*1+0x0]
    ffe0:	lea    rcx,[rip+0x11389]        # 21370 <__PRETTY_FUNCTION__.14661>
    ffe7:	mov    edx,0x9b2
    ffec:	lea    rsi,[rip+0x10af3]        # 20ae6 <desc_template.13939+0x206>
    fff3:	lea    rdi,[rip+0x10b96]        # 20b90 <desc_template.13939+0x2b0>
    fffa:	call   3230 <__assert_fail@plt>
    ffff:	nop
   10000:	cmp    r9d,r8d
   10003:	jb     ffe0 <try_commit+0xf40>
   10005:	lea    rcx,[rip+0x11364]        # 21370 <__PRETTY_FUNCTION__.14661>
   1000c:	mov    edx,0x9b3
   10011:	lea    rsi,[rip+0x10ace]        # 20ae6 <desc_template.13939+0x206>
   10018:	lea    rdi,[rip+0x10c8d]        # 20cac <desc_template.13939+0x3cc>
   1001f:	call   3230 <__assert_fail@plt>
   10024:	nop    DWORD PTR [rax+0x0]
   10028:	call   3270 <close@plt>
   1002d:	mov    DWORD PTR [r12+0x807c],0x0
   10039:	jmp    f484 <try_commit+0x3e4>
   1003e:	mov    ecx,0xfffffffa
   10043:	mov    rdi,QWORD PTR [rip+0x1a2b6]        # 2a300 <stderr@@GLIBC_2.2.5>
   1004a:	lea    rdx,[rip+0x10ca0]        # 20cf1 <desc_template.13939+0x411>
   10051:	mov    esi,0x1
   10056:	xor    eax,eax
   10058:	call   3660 <__fprintf_chk@plt>
   1005d:	lea    rcx,[rip+0x1138c]        # 213f0 <__PRETTY_FUNCTION__.14706>
   10064:	mov    edx,0xa3b
   10069:	lea    rsi,[rip+0x10a76]        # 20ae6 <desc_template.13939+0x206>
   10070:	lea    rdi,[rip+0xd100]        # 1d177 <_IO_stdin_used+0x177>
   10077:	call   3230 <__assert_fail@plt>
   1007c:	nop    DWORD PTR [rax+0x0]
   10080:	mov    edi,DWORD PTR [r12+0x804c]
   10088:	cmp    edi,0x1
   1008b:	jbe    100cb <try_commit+0x102b>
   1008d:	mov    r8d,DWORD PTR [r12+0x8050]
   10095:	mov    r9,QWORD PTR [r12+0x8040]
   1009d:	mov    edx,0x1
   100a2:	mov    ecx,r8d
   100a5:	nop    DWORD PTR [rax]
   100a8:	mov    eax,ecx
   100aa:	add    rax,r9
   100ad:	test   BYTE PTR [rax+0x20],0x4
   100b1:	je     100c1 <try_commit+0x1021>
   100b3:	mov    eax,DWORD PTR [rax+0x14]
   100b6:	cmp    r15d,eax
   100b9:	jle    100c1 <try_commit+0x1021>
   100bb:	cmp    ebx,eax
   100bd:	cmovl  r15d,eax
   100c1:	add    edx,0x1
   100c4:	add    ecx,r8d
   100c7:	cmp    edx,edi
   100c9:	jne    100a8 <try_commit+0x1008>
   100cb:	mov    edx,r15d
   100ce:	mov    esi,ebx
   100d0:	mov    rdi,r12
   100d3:	add    ebp,0x1
   100d6:	sub    edx,ebx
   100d8:	call   c100 <remove_direntries>
   100dd:	jmp    fe08 <try_commit+0xd68>
   100e2:	nop    WORD PTR [rax+rax*1+0x0]
   100e8:	test   ebp,ebp
   100ea:	je     100f5 <try_commit+0x1055>
   100ec:	test   r13d,r13d
   100ef:	jne    fdd0 <try_commit+0xd30>
   100f5:	mov    rdi,QWORD PTR [r12+0x80b0]
   100fd:	mov    ebx,DWORD PTR [rsp]
   10100:	mov    rax,QWORD PTR [rdi+0x38]
   10104:	call   QWORD PTR [rax+0x58]
   10107:	mov    edx,DWORD PTR [r12+0x806c]
   1010f:	xor    esi,esi
   10111:	mov    eax,DWORD PTR [r12+0x8070]
   10119:	mov    ecx,DWORD PTR [r12+0x805c]
   10121:	mov    rdi,QWORD PTR [r12+0x80c0]
   10129:	sub    rax,rdx
   1012c:	cqo
   1012e:	idiv   rcx
   10131:	mov    edx,eax
   10133:	call   3250 <memset@plt>
   10138:	jmp    f325 <try_commit+0x285>
   1013d:	nop    DWORD PTR [rax]
   10140:	mov    ecx,0xfffffffe
   10145:	jmp    10043 <try_commit+0xfa3>
   1014a:	nop    WORD PTR [rax+rax*1+0x0]
   10150:	mov    rcx,QWORD PTR [rip+0x1a1a9]        # 2a300 <stderr@@GLIBC_2.2.5>
   10157:	mov    edx,0xf
   1015c:	mov    esi,0x1
   10161:	lea    rdi,[rip+0x10b79]        # 20ce1 <desc_template.13939+0x401>
   10168:	call   3640 <fwrite@plt>
   1016d:	lea    rcx,[rip+0x1127c]        # 213f0 <__PRETTY_FUNCTION__.14706>
   10174:	mov    edx,0xa54
   10179:	lea    rsi,[rip+0x10966]        # 20ae6 <desc_template.13939+0x206>
   10180:	lea    rdi,[rip+0xcff0]        # 1d177 <_IO_stdin_used+0x177>
   10187:	call   3230 <__assert_fail@plt>
   1018c:	mov    ebx,DWORD PTR [rsp]
   1018f:	test   r13d,r13d
   10192:	je     fdcd <try_commit+0xd2d>
   10198:	xor    r15d,r15d
   1019b:	jmp    fd20 <try_commit+0xc80>
   101a0:	mov    ecx,0xfffffffb
   101a5:	jmp    10043 <try_commit+0xfa3>
   101aa:	lea    rcx,[rip+0x1129f]        # 21450 <__PRETTY_FUNCTION__.14325>
   101b1:	mov    edx,0x564
   101b6:	lea    rsi,[rip+0x10929]        # 20ae6 <desc_template.13939+0x206>
   101bd:	lea    rdi,[rip+0x10ac4]        # 20c88 <desc_template.13939+0x3a8>
   101c4:	call   3230 <__assert_fail@plt>
   101c9:	lea    rcx,[rip+0x11200]        # 213d0 <__PRETTY_FUNCTION__.14627>
   101d0:	mov    edx,0x95c
   101d5:	lea    rsi,[rip+0x1090a]        # 20ae6 <desc_template.13939+0x206>
   101dc:	lea    rdi,[rip+0x10fb5]        # 21198 <desc_template.13939+0x8b8>
   101e3:	call   3230 <__assert_fail@plt>
   101e8:	lea    rcx,[rip+0x112b1]        # 214a0 <__PRETTY_FUNCTION__.14257>
   101ef:	mov    edx,0x477
   101f4:	lea    rsi,[rip+0x108eb]        # 20ae6 <desc_template.13939+0x206>
   101fb:	lea    rdi,[rip+0x10c3e]        # 20e40 <desc_template.13939+0x560>
   10202:	call   3230 <__assert_fail@plt>
   10207:	lea    rcx,[rip+0x111c2]        # 213d0 <__PRETTY_FUNCTION__.14627>
   1020e:	mov    edx,0x943
   10213:	lea    rsi,[rip+0x108cc]        # 20ae6 <desc_template.13939+0x206>
   1021a:	lea    rdi,[rip+0x10a7c]        # 20c9d <desc_template.13939+0x3bd>
   10221:	call   3230 <__assert_fail@plt>
   10226:	lea    rcx,[rip+0x11233]        # 21460 <__PRETTY_FUNCTION__.14480>
   1022d:	mov    edx,0x760
   10232:	lea    rsi,[rip+0x108ad]        # 20ae6 <desc_template.13939+0x206>
   10239:	lea    rdi,[rip+0x10a37]        # 20c77 <desc_template.13939+0x397>
   10240:	call   3230 <__assert_fail@plt>
   10245:	lea    rcx,[rip+0x11124]        # 21370 <__PRETTY_FUNCTION__.14661>
   1024c:	mov    edx,0x9a9
   10251:	lea    rsi,[rip+0x1088e]        # 20ae6 <desc_template.13939+0x206>
   10258:	lea    rdi,[rip+0xcf18]        # 1d177 <_IO_stdin_used+0x177>
   1025f:	call   3230 <__assert_fail@plt>
   10264:	lea    rcx,[rip+0x11165]        # 213d0 <__PRETTY_FUNCTION__.14627>
   1026b:	mov    edx,0x990
   10270:	lea    rsi,[rip+0x1086f]        # 20ae6 <desc_template.13939+0x206>
   10277:	lea    rdi,[rip+0x10a90]        # 20d0e <desc_template.13939+0x42e>
   1027e:	call   3230 <__assert_fail@plt>
   10283:	lea    rcx,[rip+0x11146]        # 213d0 <__PRETTY_FUNCTION__.14627>
   1028a:	mov    edx,0x982
   1028f:	lea    rsi,[rip+0x10850]        # 20ae6 <desc_template.13939+0x206>
   10296:	lea    rdi,[rip+0x10a0d]        # 20caa <desc_template.13939+0x3ca>
   1029d:	call   3230 <__assert_fail@plt>
   102a2:	or     r15d,0xffffffff
   102a6:	mov    rdi,QWORD PTR [rip+0x1a053]        # 2a300 <stderr@@GLIBC_2.2.5>
   102ad:	mov    ecx,r15d
   102b0:	mov    esi,0x1
   102b5:	xor    eax,eax
   102b7:	lea    rdx,[rip+0x10a06]        # 20cc4 <desc_template.13939+0x3e4>
   102be:	call   3660 <__fprintf_chk@plt>
   102c3:	lea    rcx,[rip+0x11126]        # 213f0 <__PRETTY_FUNCTION__.14706>
   102ca:	mov    edx,0xa4d
   102cf:	lea    rsi,[rip+0x10810]        # 20ae6 <desc_template.13939+0x206>
   102d6:	lea    rdi,[rip+0xce9a]        # 1d177 <_IO_stdin_used+0x177>
   102dd:	call   3230 <__assert_fail@plt>
   102e2:	lea    rcx,[rip+0x11087]        # 21370 <__PRETTY_FUNCTION__.14661>
   102e9:	mov    edx,0x9b4
   102ee:	lea    rsi,[rip+0x107f1]        # 20ae6 <desc_template.13939+0x206>
   102f5:	lea    rdi,[rip+0x1098c]        # 20c88 <desc_template.13939+0x3a8>
   102fc:	call   3230 <__assert_fail@plt>
   10301:	lea    rcx,[rip+0x110a8]        # 213b0 <__PRETTY_FUNCTION__.13862>
   10308:	mov    edx,0xb5
   1030d:	lea    rsi,[rip+0x107d2]        # 20ae6 <desc_template.13939+0x206>
   10314:	lea    rdi,[rip+0x107e3]        # 20afe <desc_template.13939+0x21e>
   1031b:	call   3230 <__assert_fail@plt>
   10320:	lea    rcx,[rip+0x11049]        # 21370 <__PRETTY_FUNCTION__.14661>
   10327:	mov    edx,0x9d7
   1032c:	lea    rsi,[rip+0x107b3]        # 20ae6 <desc_template.13939+0x206>
   10333:	lea    rdi,[rip+0x10963]        # 20c9d <desc_template.13939+0x3bd>
   1033a:	call   3230 <__assert_fail@plt>
   1033f:	mov    rdi,QWORD PTR [rip+0x19fba]        # 2a300 <stderr@@GLIBC_2.2.5>
   10346:	mov    ecx,ebx
   10348:	mov    esi,0x1
   1034d:	xor    eax,eax
   1034f:	lea    rdx,[rip+0x10e6a]        # 211c0 <desc_template.13939+0x8e0>
   10356:	call   3660 <__fprintf_chk@plt>
   1035b:	lea    rcx,[rip+0x1108e]        # 213f0 <__PRETTY_FUNCTION__.14706>
   10362:	mov    edx,0xa46
   10367:	lea    rsi,[rip+0x10778]        # 20ae6 <desc_template.13939+0x206>
   1036e:	lea    rdi,[rip+0xce02]        # 1d177 <_IO_stdin_used+0x177>
   10375:	call   3230 <__assert_fail@plt>
   1037a:	nop    WORD PTR [rax+rax*1+0x0]

0000000000010380 <vvfat_write>:
   10380:	push   r15
   10382:	push   r14
   10384:	push   r13
   10386:	push   r12
   10388:	push   rbp
   10389:	push   rbx
   1038a:	sub    rsp,0x388
   10391:	mov    r13,QWORD PTR [rdi+0x40]
   10395:	mov    QWORD PTR [rsp+0x8],rsi
   1039a:	mov    QWORD PTR [rsp+0x20],rdx
   1039f:	mov    DWORD PTR [rsp+0x14],ecx
   103a3:	mov    rax,QWORD PTR fs:0x28
   103ac:	mov    QWORD PTR [rsp+0x378],rax
   103b4:	xor    eax,eax
   103b6:	cmp    QWORD PTR [r13+0x8080],0x0
   103be:	je     103da <vvfat_write+0x5a>
   103c0:	mov    edi,DWORD PTR [r13+0x807c]
   103c7:	mov    QWORD PTR [r13+0x8080],0x0
   103d2:	test   edi,edi
   103d4:	jne    106bd <vvfat_write+0x33d>
   103da:	mov    eax,DWORD PTR [r13+0x8]
   103de:	mov    rdi,QWORD PTR [rsp+0x8]
   103e3:	mov    DWORD PTR [r13+0x8098],0xffffffff
   103ee:	cmp    rax,rdi
   103f1:	jg     1064f <vvfat_write+0x2cf>
   103f7:	mov    r14d,DWORD PTR [r13+0x806c]
   103fe:	mov    rax,rdi
   10401:	lea    rbp,[rsp+0x30]
   10406:	mov    r11d,DWORD PTR [r13+0x805c]
   1040d:	sub    rax,r14
   10410:	mov    DWORD PTR [rsp+0x1c],r14d
   10415:	cqo
   10417:	mov    DWORD PTR [rsp+0x18],r11d
   1041c:	idiv   r11
   1041f:	mov    r10,rax
   10422:	movsxd rax,DWORD PTR [rsp+0x14]
   10427:	add    rax,rdi
   1042a:	mov    QWORD PTR [rsp+0x28],rax
   1042f:	sub    rax,0x1
   10433:	mov    QWORD PTR [rsp],rax
   10437:	nop    WORD PTR [rax+rax*1+0x0]
   10440:	mov    rax,QWORD PTR [rsp]
   10444:	sub    rax,r14
   10447:	cqo
   10449:	idiv   r11
   1044c:	cmp    r10d,eax
   1044f:	ja     10713 <vvfat_write+0x393>
   10455:	mov    r8d,DWORD PTR [r13+0x804c]
   1045c:	xor    ecx,ecx
   1045e:	mov    edx,r8d
   10461:	jmp    10482 <vvfat_write+0x102>
   10463:	nop    DWORD PTR [rax+rax*1+0x0]
   10468:	cmp    edx,eax
   1046a:	jne    10474 <vvfat_write+0xf4>
   1046c:	test   edx,edx
   1046e:	jne    1081a <vvfat_write+0x49a>
   10474:	cmp    edx,eax
   10476:	je     104cf <vvfat_write+0x14f>
   10478:	mov    edx,eax
   1047a:	cmp    ecx,edx
   1047c:	jg     106f4 <vvfat_write+0x374>
   10482:	lea    esi,[rdx+rcx*1]
   10485:	mov    eax,esi
   10487:	shr    eax,0x1f
   1048a:	add    eax,esi
   1048c:	sar    eax,1
   1048e:	cmp    r8d,eax
   10491:	jbe    107b4 <vvfat_write+0x434>
   10497:	mov    r9d,DWORD PTR [r13+0x8050]
   1049e:	mov    ebx,eax
   104a0:	mov    r12,QWORD PTR [r13+0x8040]
   104a7:	imul   ebx,r9d
   104ab:	add    rbx,r12
   104ae:	mov    esi,DWORD PTR [rbx]
   104b0:	mov    edi,DWORD PTR [rbx+0x4]
   104b3:	cmp    esi,edi
   104b5:	jae    107d3 <vvfat_write+0x453>
   104bb:	cmp    r10d,esi
   104be:	jbe    10468 <vvfat_write+0xe8>
   104c0:	cmp    ecx,eax
   104c2:	je     104c8 <vvfat_write+0x148>
   104c4:	mov    ecx,eax
   104c6:	jmp    1047a <vvfat_write+0xfa>
   104c8:	cmp    r10d,edi
   104cb:	jb     10506 <vvfat_write+0x186>
   104cd:	mov    ecx,edx
   104cf:	cmp    r8d,ecx
   104d2:	jbe    1050b <vvfat_write+0x18b>
   104d4:	imul   ecx,r9d
   104d8:	lea    rbx,[r12+rcx*1]
   104dc:	cmp    r10d,DWORD PTR [rbx]
   104df:	jb     1050b <vvfat_write+0x18b>
   104e1:	mov    edi,DWORD PTR [rbx+0x4]
   104e4:	cmp    r10d,edi
   104e7:	jae    10860 <vvfat_write+0x4e0>
   104ed:	mov    eax,DWORD PTR [rbx+0x24]
   104f0:	test   eax,eax
   104f2:	jne    107f2 <vvfat_write+0x472>
   104f8:	test   BYTE PTR [rbx+0x20],0x4
   104fc:	jne    10514 <vvfat_write+0x194>
   104fe:	mov    r10d,edi
   10501:	jmp    10440 <vvfat_write+0xc0>
   10506:	cmp    r10d,esi
   10509:	jae    104ed <vvfat_write+0x16d>
   1050b:	add    r10d,0x1
   1050f:	jmp    10440 <vvfat_write+0xc0>
   10514:	mov    edi,DWORD PTR [rsp+0x18]
   10518:	mov    eax,DWORD PTR [rsp+0x1c]
   1051c:	mov    DWORD PTR [rsp+0x364],0x100
   10527:	mov    QWORD PTR [rsp+0x368],0x0
   10533:	imul   r10d,edi
   10537:	add    eax,r10d
   1053a:	lea    edx,[rax+rdi*1]
   1053d:	mov    rdi,QWORD PTR [rsp+0x8]
   10542:	movsxd rcx,eax
   10545:	mov    esi,eax
   10547:	cmp    rcx,rdi
   1054a:	jl     106b1 <vvfat_write+0x331>
   10550:	mov    r10,QWORD PTR [rsp+0x8]
   10555:	mov    edi,DWORD PTR [rsp+0x14]
   10559:	movsxd r8,edx
   1055c:	add    edi,r10d
   1055f:	cmp    r8,QWORD PTR [rsp+0x28]
   10564:	cmovg  edx,edi
   10567:	mov    edi,DWORD PTR [rsp+0x18]
   1056b:	imul   edi,DWORD PTR [rbx]
   1056e:	sub    rcx,r10
   10571:	mov    r12,rcx
   10574:	sub    edx,esi
   10576:	shl    r12,0x9
   1057a:	sub    eax,edi
   1057c:	shl    edx,0x4
   1057f:	mov    r15d,eax
   10582:	shl    r15d,0x4
   10586:	add    r15d,DWORD PTR [rbx+0x8]
   1058a:	test   edx,edx
   1058c:	jle    106a9 <vvfat_write+0x329>
   10592:	add    r12,QWORD PTR [rsp+0x20]
   10597:	lea    r14d,[rdx+r15*1]
   1059b:	nop    DWORD PTR [rax+rax*1+0x0]
   105a0:	mov    rsi,r12
   105a3:	mov    rdi,rbp
   105a6:	call   dd00 <parse_long_name>
   105ab:	test   eax,eax
   105ad:	js     106d2 <vvfat_write+0x352>
   105b3:	movzx  eax,BYTE PTR [r12+0xb]
   105b9:	cmp    al,0x28
   105bb:	je     10680 <vvfat_write+0x300>
   105c1:	cmp    al,0xf
   105c3:	je     10680 <vvfat_write+0x300>
   105c9:	movzx  edx,BYTE PTR [r12]
   105ce:	cmp    dl,0xe5
   105d1:	je     10680 <vvfat_write+0x300>
   105d7:	test   dl,dl
   105d9:	je     10680 <vvfat_write+0x300>
   105df:	test   al,0x1
   105e1:	je     10680 <vvfat_write+0x300>
   105e7:	cmp    DWORD PTR [r13+0x8034],r15d
   105ee:	jbe    107b4 <vvfat_write+0x434>
   105f4:	mov    eax,r15d
   105f7:	imul   eax,DWORD PTR [r13+0x8038]
   105ff:	add    rax,QWORD PTR [r13+0x8028]
   10606:	mov    rdx,QWORD PTR [r12]
   1060a:	mov    rcx,QWORD PTR [r12+0x8]
   1060f:	xor    rdx,QWORD PTR [rax]
   10612:	xor    rcx,QWORD PTR [rax+0x8]
   10616:	or     rcx,rdx
   10619:	jne    10632 <vvfat_write+0x2b2>
   1061b:	mov    rdx,QWORD PTR [r12+0x10]
   10620:	mov    rcx,QWORD PTR [r12+0x18]
   10625:	xor    rdx,QWORD PTR [rax+0x10]
   10629:	xor    rcx,QWORD PTR [rax+0x18]
   1062d:	or     rcx,rdx
   10630:	je     10680 <vvfat_write+0x300>
   10632:	mov    rcx,QWORD PTR [rip+0x19cc7]        # 2a300 <stderr@@GLIBC_2.2.5>
   10639:	mov    edx,0x30
   1063e:	mov    esi,0x1
   10643:	lea    rdi,[rip+0x10bce]        # 21218 <desc_template.13939+0x938>
   1064a:	call   3640 <fwrite@plt>
   1064f:	mov    ebx,0xffffffff
   10654:	mov    rdi,QWORD PTR [rsp+0x378]
   1065c:	xor    rdi,QWORD PTR fs:0x28
   10665:	mov    eax,ebx
   10667:	jne    1085b <vvfat_write+0x4db>
   1066d:	add    rsp,0x388
   10674:	pop    rbx
   10675:	pop    rbp
   10676:	pop    r12
   10678:	pop    r13
   1067a:	pop    r14
   1067c:	pop    r15
   1067e:	ret
   1067f:	nop
   10680:	add    r15d,0x1
   10684:	add    r12,0x20
   10688:	cmp    r14d,r15d
   1068b:	jne    105a0 <vvfat_write+0x220>
   10691:	mov    r14d,DWORD PTR [r13+0x806c]
   10698:	mov    r11d,DWORD PTR [r13+0x805c]
   1069f:	mov    DWORD PTR [rsp+0x1c],r14d
   106a4:	mov    DWORD PTR [rsp+0x18],r11d
   106a9:	mov    edi,DWORD PTR [rbx+0x4]
   106ac:	jmp    104fe <vvfat_write+0x17e>
   106b1:	mov    esi,edi
   106b3:	mov    eax,edi
   106b5:	movsxd rcx,edi
   106b8:	jmp    10550 <vvfat_write+0x1d0>
   106bd:	call   3270 <close@plt>
   106c2:	mov    DWORD PTR [r13+0x807c],0x0
   106cd:	jmp    103da <vvfat_write+0x5a>
   106d2:	mov    rcx,QWORD PTR [rip+0x19c27]        # 2a300 <stderr@@GLIBC_2.2.5>
   106d9:	mov    edx,0x1c
   106de:	mov    esi,0x1
   106e3:	lea    rdi,[rip+0x10638]        # 20d22 <desc_template.13939+0x442>
   106ea:	call   3640 <fwrite@plt>
   106ef:	jmp    1064f <vvfat_write+0x2cf>
   106f4:	lea    rcx,[rip+0x10d85]        # 21480 <__PRETTY_FUNCTION__.14249>
   106fb:	mov    edx,0x465
   10700:	lea    rsi,[rip+0x103df]        # 20ae6 <desc_template.13939+0x206>
   10707:	lea    rdi,[rip+0x1045b]        # 20b69 <desc_template.13939+0x289>
   1070e:	call   3230 <__assert_fail@plt>
   10713:	mov    rdi,QWORD PTR [r13+0x80b0]
   1071a:	mov    ecx,DWORD PTR [rsp+0x14]
   1071e:	mov    rdx,QWORD PTR [rsp+0x20]
   10723:	mov    rsi,QWORD PTR [rsp+0x8]
   10728:	mov    rax,QWORD PTR [rdi+0x38]
   1072c:	call   QWORD PTR [rax+0x28]
   1072f:	mov    ebx,eax
   10731:	test   eax,eax
   10733:	js     10839 <vvfat_write+0x4b9>
   10739:	mov    r9d,DWORD PTR [r13+0x806c]
   10740:	mov    rax,QWORD PTR [rsp+0x8]
   10745:	mov    edi,DWORD PTR [r13+0x805c]
   1074c:	sub    rax,r9
   1074f:	cqo
   10751:	idiv   rdi
   10754:	mov    rcx,rax
   10757:	mov    esi,eax
   10759:	mov    rax,QWORD PTR [rsp]
   1075d:	movsxd r8,ecx
   10760:	sub    rax,r9
   10763:	cqo
   10765:	idiv   rdi
   10768:	cmp    eax,ecx
   1076a:	jb     107a5 <vvfat_write+0x425>
   1076c:	mov    rcx,QWORD PTR [rsp]
   10770:	test   esi,esi
   10772:	js     1078f <vvfat_write+0x40f>
   10774:	mov    rax,QWORD PTR [r13+0x80c0]
   1077b:	add    rax,r8
   1077e:	or     BYTE PTR [rax],0x4
   10781:	mov    r9d,DWORD PTR [r13+0x806c]
   10788:	mov    edi,DWORD PTR [r13+0x805c]
   1078f:	mov    rax,rcx
   10792:	add    esi,0x1
   10795:	add    r8,0x1
   10799:	sub    rax,r9
   1079c:	cqo
   1079e:	idiv   rdi
   107a1:	cmp    esi,eax
   107a3:	jbe    10770 <vvfat_write+0x3f0>
   107a5:	mov    rdi,r13
   107a8:	xor    ebx,ebx
   107aa:	call   f0a0 <try_commit>
   107af:	jmp    10654 <vvfat_write+0x2d4>
   107b4:	lea    rcx,[rip+0x10cb5]        # 21470 <__PRETTY_FUNCTION__.13830>
   107bb:	mov    edx,0x60
   107c0:	lea    rsi,[rip+0x1031f]        # 20ae6 <desc_template.13939+0x206>
   107c7:	lea    rdi,[rip+0x1034d]        # 20b1b <desc_template.13939+0x23b>
   107ce:	call   3230 <__assert_fail@plt>
   107d3:	lea    rcx,[rip+0x10ca6]        # 21480 <__PRETTY_FUNCTION__.14249>
   107da:	mov    edx,0x45a
   107df:	lea    rsi,[rip+0x10300]        # 20ae6 <desc_template.13939+0x206>
   107e6:	lea    rdi,[rip+0x10342]        # 20b2f <desc_template.13939+0x24f>
   107ed:	call   3230 <__assert_fail@plt>
   107f2:	mov    rcx,QWORD PTR [rbx+0x18]
   107f6:	mov    rdi,QWORD PTR [rip+0x19b03]        # 2a300 <stderr@@GLIBC_2.2.5>
   107fd:	lea    rdx,[rip+0x109e4]        # 211e8 <desc_template.13939+0x908>
   10804:	xor    eax,eax
   10806:	mov    esi,0x1
   1080b:	mov    ebx,0xffffffff
   10810:	call   3660 <__fprintf_chk@plt>
   10815:	jmp    10654 <vvfat_write+0x2d4>
   1081a:	lea    rcx,[rip+0x10c5f]        # 21480 <__PRETTY_FUNCTION__.14249>
   10821:	mov    edx,0x45c
   10826:	lea    rsi,[rip+0x102b9]        # 20ae6 <desc_template.13939+0x206>
   1082d:	lea    rdi,[rip+0x10319]        # 20b4d <desc_template.13939+0x26d>
   10834:	call   3230 <__assert_fail@plt>
   10839:	mov    rcx,QWORD PTR [rip+0x19ac0]        # 2a300 <stderr@@GLIBC_2.2.5>
   10840:	mov    edx,0x1e
   10845:	mov    esi,0x1
   1084a:	lea    rdi,[rip+0x109ff]        # 21250 <desc_template.13939+0x970>
   10851:	call   3640 <fwrite@plt>
   10856:	jmp    10654 <vvfat_write+0x2d4>
   1085b:	call   31c0 <__stack_chk_fail@plt>
   10860:	lea    rcx,[rip+0x10c39]        # 214a0 <__PRETTY_FUNCTION__.14257>
   10867:	mov    edx,0x477
   1086c:	lea    rsi,[rip+0x10273]        # 20ae6 <desc_template.13939+0x206>
   10873:	lea    rdi,[rip+0x105c6]        # 20e40 <desc_template.13939+0x560>
   1087a:	call   3230 <__assert_fail@plt>
   1087f:	nop

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

00000000000108f0 <read_directory>:
   108f0:	push   r15
   108f2:	mov    eax,esi
   108f4:	push   r14
   108f6:	push   r13
   108f8:	push   r12
   108fa:	push   rbp
   108fb:	push   rbx
   108fc:	sub    rsp,0x258
   10903:	mov    DWORD PTR [rsp+0x40],esi
   10907:	mov    esi,DWORD PTR [rdi+0x804c]
   1090d:	mov    rcx,QWORD PTR fs:0x28
   10916:	mov    QWORD PTR [rsp+0x248],rcx
   1091e:	xor    ecx,ecx
   10920:	cmp    eax,esi
   10922:	jae    11709 <read_directory+0xe19>
   10928:	mov    ecx,DWORD PTR [rdi+0x8050]
   1092e:	mov    ebx,DWORD PTR [rsp+0x40]
   10932:	mov    r12,rdi
   10935:	mov    rdx,QWORD PTR [rdi+0x8040]
   1093c:	imul   ebx,ecx
   1093f:	add    rbx,rdx
   10942:	mov    rax,QWORD PTR [rbx+0x18]
   10946:	mov    QWORD PTR [rsp+0x8],rax
   1094b:	mov    eax,DWORD PTR [rbx]
   1094d:	mov    DWORD PTR [rsp+0x24],eax
   10951:	mov    eax,DWORD PTR [rbx+0x10]
   10954:	test   eax,eax
   10956:	js     116fc <read_directory+0xe0c>
   1095c:	cmp    eax,esi
   1095e:	jae    11709 <read_directory+0xe19>
   10964:	imul   eax,ecx
   10967:	mov    DWORD PTR [rsp+0x34],0xffffffff
   1096f:	add    rax,rdx
   10972:	je     1097a <read_directory+0x8a>
   10974:	mov    eax,DWORD PTR [rax]
   10976:	mov    DWORD PTR [rsp+0x34],eax
   1097a:	mov    rdi,QWORD PTR [rsp+0x8]
   1097f:	call   3190 <opendir@plt>
   10984:	mov    QWORD PTR [rsp+0x28],rax
   10989:	test   BYTE PTR [rbx+0x20],0x4
   1098d:	je     117c0 <read_directory+0xed0>
   10993:	cmp    QWORD PTR [rsp+0x28],0x0
   10999:	je     117e0 <read_directory+0xef0>
   1099f:	mov    r10d,DWORD PTR [rsp+0x24]
   109a4:	xor    ebp,ebp
   109a6:	test   r10d,r10d
   109a9:	jne    11531 <read_directory+0xc41>
   109af:	mov    eax,DWORD PTR [rsp+0x24]
   109b3:	mov    DWORD PTR [rbx+0x14],ebp
   109b6:	shr    eax,0x10
   109b9:	mov    DWORD PTR [rsp+0x5c],eax
   109bd:	mov    eax,DWORD PTR [rsp+0x34]
   109c1:	shr    eax,0x10
   109c4:	mov    DWORD PTR [rsp+0x44],eax
   109c8:	mov    rdi,QWORD PTR [rsp+0x28]
   109cd:	call   3540 <readdir64@plt>
   109d2:	mov    r13,rax
   109d5:	test   rax,rax
   109d8:	je     11555 <read_directory+0xc65>
   109de:	mov    rdi,QWORD PTR [rsp+0x8]
   109e3:	lea    rbx,[r13+0x13]
   109e7:	call   31b0 <strlen@plt>
   109ec:	mov    rdi,rbx
   109ef:	mov    r14,rax
   109f2:	call   31b0 <strlen@plt>
   109f7:	mov    ecx,0x2
   109fc:	mov    rsi,rbx
   109ff:	lea    rdi,[rip+0x1020f]        # 20c15 <desc_template.13939+0x335>
   10a06:	repz cmps BYTE PTR ds:[rsi],BYTE PTR es:[rdi]
   10a08:	mov    rsi,rbx
   10a0b:	lea    eax,[r14+rax*1+0x2]
   10a10:	mov    r9d,DWORD PTR [rsp+0x24]
   10a15:	lea    rdi,[rip+0x101f8]        # 20c14 <desc_template.13939+0x334>
   10a1c:	seta   dl
   10a1f:	sbb    dl,0x0
   10a22:	movsx  ecx,dl
   10a25:	test   ecx,ecx
   10a27:	mov    DWORD PTR [rsp+0x30],ecx
   10a2b:	mov    ecx,0x3
   10a30:	sete   r14b
   10a34:	repz cmps BYTE PTR ds:[rsi],BYTE PTR es:[rdi]
   10a36:	seta   dl
   10a39:	sbb    dl,0x0
   10a3c:	movsx  ecx,dl
   10a3f:	test   ecx,ecx
   10a41:	mov    DWORD PTR [rsp+0x1c],ecx
   10a45:	sete   r15b
   10a49:	test   r9d,r9d
   10a4c:	jne    10c63 <read_directory+0x373>
   10a52:	test   r14b,r14b
   10a55:	jne    109c8 <read_directory+0xd8>
   10a5b:	test   r15b,r15b
   10a5e:	jne    109c8 <read_directory+0xd8>
   10a64:	mov    r14d,eax
   10a67:	mov    rdi,r14
   10a6a:	call   5970 <qemu_malloc>
   10a6f:	sub    rsp,0x8
   10a73:	mov    rsi,r14
   10a76:	mov    rcx,0xffffffffffffffff
   10a7d:	mov    QWORD PTR [rsp+0x18],rax
   10a82:	mov    rdi,rax
   10a85:	mov    edx,0x1
   10a8a:	mov    r14,rax
   10a8d:	push   rbx
   10a8e:	mov    r9,QWORD PTR [rsp+0x18]
   10a93:	lea    r8,[rip+0x102a5]        # 20d3f <desc_template.13939+0x45f>
   10a9a:	xor    eax,eax
   10a9c:	call   3060 <__snprintf_chk@plt>
   10aa1:	lea    rdx,[rsp+0xc0]
   10aa9:	mov    rsi,r14
   10aac:	mov    edi,0x1
   10ab1:	call   3180 <__xstat64@plt>
   10ab6:	pop    rdx
   10ab7:	pop    rcx
   10ab8:	test   eax,eax
   10aba:	js     114b7 <read_directory+0xbc7>
   10ac0:	mov    eax,DWORD PTR [r12+0x8034]
   10ac8:	mov    DWORD PTR [rsp+0x20],eax
   10acc:	lea    r15,[rsp+0x140]
   10ad4:	xor    ecx,ecx
   10ad6:	mov    eax,0x1
   10adb:	lea    rdx,[r15+0x1]
   10adf:	jmp    10b08 <read_directory+0x218>
   10ae1:	nop    DWORD PTR [rax+0x0]
   10ae8:	add    rax,0x1
   10aec:	mov    BYTE PTR [rdx-0x1],dil
   10af0:	add    rcx,0x2
   10af4:	add    rdx,0x2
   10af8:	mov    BYTE PTR [rdx-0x2],0x0
   10afc:	cmp    rax,0x82
   10b02:	je     1151c <read_directory+0xc2c>
   10b08:	movzx  edi,BYTE PTR [r13+rax*1+0x12]
   10b0e:	mov    esi,ecx
   10b10:	mov    r8d,eax
   10b13:	test   dil,dil
   10b16:	jne    10ae8 <read_directory+0x1f8>
   10b18:	mov    BYTE PTR [rdx],0x0
   10b1b:	add    r8d,r8d
   10b1e:	mov    BYTE PTR [rdx-0x1],0x0
   10b22:	lea    edx,[rcx+0x19]
   10b25:	mov    ecx,0x4ec4ec4f
   10b2a:	mov    eax,edx
   10b2c:	mul    ecx
   10b2e:	mov    eax,r8d
   10b31:	shr    edx,0x3
   10b34:	mov    r14d,edx
   10b37:	mul    ecx
   10b39:	shr    edx,0x3
   10b3c:	imul   eax,edx,0x1a
   10b3f:	cmp    r8d,eax
   10b42:	je     10b7b <read_directory+0x28b>
   10b44:	add    r8d,0x1
   10b48:	mov    edi,0x4ec4ec4f
   10b4d:	movsxd rcx,r8d
   10b50:	lea    r8,[rsp+0x13f]
   10b58:	nop    DWORD PTR [rax+rax*1+0x0]
   10b60:	mov    eax,ecx
   10b62:	mov    BYTE PTR [r8+rcx*1],0xff
   10b67:	mul    edi
   10b69:	mov    eax,ecx
   10b6b:	add    rcx,0x1
   10b6f:	shr    edx,0x3
   10b72:	imul   edx,edx,0x1a
   10b75:	sub    eax,edx
   10b77:	test   eax,eax
   10b79:	jne    10b60 <read_directory+0x270>
   10b7b:	test   esi,esi
   10b7d:	je     1153e <read_directory+0xc4e>
   10b83:	mov    r10d,r14d
   10b86:	mov    edx,DWORD PTR [rsp+0x20]
   10b8a:	mov    rax,r12
   10b8d:	xor    ecx,ecx
   10b8f:	or     r10d,0x40
   10b93:	mov    QWORD PTR [rsp+0x38],rbx
   10b98:	mov    r12d,r14d
   10b9b:	mov    r14,rax
   10b9e:	mov    DWORD PTR [rsp+0x58],ebp
   10ba2:	mov    ebx,edx
   10ba4:	mov    ebp,ecx
   10ba6:	mov    QWORD PTR [rsp+0x48],r13
   10bab:	mov    r13d,r10d
   10bae:	mov    QWORD PTR [rsp+0x50],r15
   10bb3:	jmp    10c09 <read_directory+0x319>
   10bb5:	nop    DWORD PTR [rax]
   10bb8:	mov    DWORD PTR [r14+0x8034],r15d
   10bbf:	cmp    r15d,ebx
   10bc2:	jbe    11709 <read_directory+0xe19>
   10bc8:	imul   ebx,DWORD PTR [r14+0x8038]
   10bd0:	mov    rax,QWORD PTR [r14+0x8028]
   10bd7:	mov    edx,0xf
   10bdc:	xor    ecx,ecx
   10bde:	add    rax,rbx
   10be1:	mov    WORD PTR [rax+0xb],dx
   10be5:	mov    edx,r12d
   10be8:	sub    edx,ebp
   10bea:	test   ebp,ebp
   10bec:	mov    WORD PTR [rax+0x1a],cx
   10bf0:	cmove  edx,r13d
   10bf4:	add    ebp,0x1
   10bf7:	mov    BYTE PTR [rax],dl
   10bf9:	cmp    ebp,r12d
   10bfc:	jge    10fe5 <read_directory+0x6f5>
   10c02:	mov    ebx,DWORD PTR [r14+0x8034]
   10c09:	lea    r15d,[rbx+0x1]
   10c0d:	mov    eax,DWORD PTR [r14+0x8038]
   10c14:	mov    esi,r15d
   10c17:	imul   esi,eax
   10c1a:	cmp    esi,DWORD PTR [r14+0x8030]
   10c21:	jbe    10bb8 <read_directory+0x2c8>
   10c23:	mov    r9d,eax
   10c26:	mov    rdi,QWORD PTR [r14+0x8028]
   10c2d:	shl    r9d,0x5
   10c31:	sub    r9d,eax
   10c34:	add    r9d,esi
   10c37:	movsxd rsi,r9d
   10c3a:	mov    DWORD PTR [rsp],r9d
   10c3e:	call   5990 <qemu_realloc>
   10c43:	mov    QWORD PTR [r14+0x8028],rax
   10c4a:	test   rax,rax
   10c4d:	je     3798 <read_directory.cold.14+0x19>
   10c53:	mov    r9d,DWORD PTR [rsp]
   10c57:	mov    DWORD PTR [r14+0x8030],r9d
   10c5e:	jmp    10bb8 <read_directory+0x2c8>
   10c63:	mov    esi,eax
   10c65:	mov    rdi,rsi
   10c68:	mov    QWORD PTR [rsp],rsi
   10c6c:	call   5970 <qemu_malloc>
   10c71:	sub    rsp,0x8
   10c75:	mov    edx,0x1
   10c7a:	lea    r8,[rip+0x100be]        # 20d3f <desc_template.13939+0x45f>
   10c81:	push   rbx
   10c82:	mov    r9,QWORD PTR [rsp+0x18]
   10c87:	mov    rdi,rax
   10c8a:	mov    rcx,0xffffffffffffffff
   10c91:	mov    rsi,QWORD PTR [rsp+0x10]
   10c96:	mov    QWORD PTR [rsp+0x20],rax
   10c9b:	xor    eax,eax
   10c9d:	call   3060 <__snprintf_chk@plt>
   10ca2:	mov    rsi,QWORD PTR [rsp+0x20]
   10ca7:	mov    edi,0x1
   10cac:	lea    rdx,[rsp+0xc0]
   10cb4:	call   3180 <__xstat64@plt>
   10cb9:	pop    rdi
   10cba:	pop    r8
   10cbc:	test   eax,eax
   10cbe:	js     114b7 <read_directory+0xbc7>
   10cc4:	mov    eax,DWORD PTR [r12+0x8034]
   10ccc:	mov    DWORD PTR [rsp+0x20],eax
   10cd0:	or     r14b,r15b
   10cd3:	je     10acc <read_directory+0x1dc>
   10cd9:	lea    r13d,[rax+0x1]
   10cdd:	mov    eax,DWORD PTR [r12+0x8038]
   10ce5:	mov    edx,r13d
   10ce8:	imul   edx,eax
   10ceb:	cmp    edx,DWORD PTR [r12+0x8030]
   10cf3:	ja     11427 <read_directory+0xb37>
   10cf9:	mov    eax,DWORD PTR [rsp+0x20]
   10cfd:	mov    DWORD PTR [r12+0x8034],r13d
   10d05:	cmp    eax,r13d
   10d08:	jae    11709 <read_directory+0xe19>
   10d0e:	mov    r15d,eax
   10d11:	imul   r15d,DWORD PTR [r12+0x8038]
   10d1a:	add    r15,QWORD PTR [r12+0x8028]
   10d22:	mov    esi,0x2020
   10d27:	mov    BYTE PTR [r15+0xa],0x20
   10d2c:	mov    rdi,rbx
   10d2f:	movabs rax,0x2020202020202020
   10d39:	mov    WORD PTR [r15+0x8],si
   10d3e:	mov    QWORD PTR [r15],rax
   10d41:	call   31b0 <strlen@plt>
   10d46:	mov    rsi,rbx
   10d49:	mov    rdi,r15
   10d4c:	mov    rdx,rax
   10d4f:	call   33b0 <memcpy@plt>
   10d54:	mov    edx,0x20
   10d59:	lea    r13,[rsp+0x70]
   10d5e:	lea    rbx,[rsp+0x68]
   10d63:	mov    eax,DWORD PTR [rsp+0xc8]
   10d6a:	mov    rsi,r13
   10d6d:	mov    rdi,rbx
   10d70:	and    eax,0xf000
   10d75:	cmp    eax,0x4000
   10d7a:	mov    eax,0x10
   10d7f:	cmovne eax,edx
   10d82:	xor    r9d,r9d
   10d85:	mov    WORD PTR [r15+0xc],r9w
   10d8a:	mov    BYTE PTR [r15+0xb],al
   10d8e:	mov    rax,QWORD PTR [rsp+0x118]
   10d96:	mov    QWORD PTR [rsp+0x68],rax
   10d9b:	call   3100 <localtime_r@plt>
   10da0:	mov    edx,DWORD PTR [rsp+0x70]
   10da4:	mov    eax,edx
   10da6:	shr    eax,0x1f
   10da9:	add    eax,edx
   10dab:	mov    edx,DWORD PTR [rsp+0x74]
   10daf:	sar    eax,1
   10db1:	shl    edx,0x5
   10db4:	or     eax,edx
   10db6:	mov    edx,DWORD PTR [rsp+0x78]
   10dba:	shl    edx,0xb
   10dbd:	or     eax,edx
   10dbf:	mov    WORD PTR [r15+0xe],ax
   10dc4:	mov    rdi,QWORD PTR [rsp+0x118]
   10dcc:	call   10890 <fat_datetime.constprop.8>
   10dd1:	mov    WORD PTR [r15+0x10],ax
   10dd6:	mov    rdi,QWORD PTR [rsp+0xf8]
   10dde:	call   10890 <fat_datetime.constprop.8>
   10de3:	xor    r10d,r10d
   10de6:	mov    rsi,r13
   10de9:	mov    rdi,rbx
   10dec:	mov    WORD PTR [r15+0x14],r10w
   10df1:	mov    WORD PTR [r15+0x12],ax
   10df6:	mov    rax,QWORD PTR [rsp+0x108]
   10dfe:	mov    QWORD PTR [rsp+0x68],rax
   10e03:	call   3100 <localtime_r@plt>
   10e08:	mov    edx,DWORD PTR [rsp+0x70]
   10e0c:	mov    eax,edx
   10e0e:	shr    eax,0x1f
   10e11:	add    eax,edx
   10e13:	mov    edx,DWORD PTR [rsp+0x74]
   10e17:	sar    eax,1
   10e19:	shl    edx,0x5
   10e1c:	or     eax,edx
   10e1e:	mov    edx,DWORD PTR [rsp+0x78]
   10e22:	shl    edx,0xb
   10e25:	or     eax,edx
   10e27:	mov    WORD PTR [r15+0x16],ax
   10e2c:	mov    rdi,QWORD PTR [rsp+0x108]
   10e34:	call   10890 <fat_datetime.constprop.8>
   10e39:	mov    r11d,DWORD PTR [rsp+0x1c]
   10e3e:	mov    WORD PTR [r15+0x18],ax
   10e43:	test   r11d,r11d
   10e46:	jne    10fbe <read_directory+0x6ce>
   10e4c:	movzx  eax,WORD PTR [rsp+0x34]
   10e51:	mov    WORD PTR [r15+0x1a],ax
   10e56:	movzx  eax,WORD PTR [rsp+0x44]
   10e5b:	mov    WORD PTR [r15+0x14],ax
   10e60:	mov    rdx,QWORD PTR [rsp+0xe0]
   10e68:	cmp    rdx,0x7fffffff
   10e6f:	jg     116c1 <read_directory+0xdd1>
   10e75:	mov    eax,DWORD PTR [rsp+0xc8]
   10e7c:	and    eax,0xf000
   10e81:	cmp    eax,0x4000
   10e86:	je     10f9e <read_directory+0x6ae>
   10e8c:	mov    DWORD PTR [r15+0x1c],edx
   10e90:	test   r14b,r14b
   10e93:	jne    10faf <read_directory+0x6bf>
   10e99:	cmp    QWORD PTR [rsp+0xe0],0x0
   10ea2:	je     10faf <read_directory+0x6bf>
   10ea8:	mov    ebx,DWORD PTR [r12+0x804c]
   10eb0:	mov    eax,DWORD PTR [r12+0x8050]
   10eb8:	lea    r13d,[rbx+0x1]
   10ebc:	mov    edx,r13d
   10ebf:	imul   edx,eax
   10ec2:	cmp    edx,DWORD PTR [r12+0x8048]
   10eca:	ja     114e1 <read_directory+0xbf1>
   10ed0:	mov    DWORD PTR [r12+0x804c],r13d
   10ed8:	cmp    ebx,r13d
   10edb:	jae    11709 <read_directory+0xe19>
   10ee1:	imul   ebx,DWORD PTR [r12+0x8050]
   10eea:	mov    rax,QWORD PTR [r12+0x8040]
   10ef2:	add    rax,rbx
   10ef5:	mov    QWORD PTR [r12+0x8080],rax
   10efd:	mov    DWORD PTR [rax],0x0
   10f03:	mov    rax,QWORD PTR [r12+0x8080]
   10f0b:	mov    rdx,QWORD PTR [rsp+0xe0]
   10f13:	mov    DWORD PTR [rax+0x4],edx
   10f16:	mov    eax,DWORD PTR [r12+0x8034]
   10f1e:	mov    rdx,QWORD PTR [r12+0x8080]
   10f26:	sub    eax,0x1
   10f29:	mov    DWORD PTR [rdx+0x8],eax
   10f2c:	mov    rax,QWORD PTR [r12+0x8080]
   10f34:	mov    DWORD PTR [rax+0xc],0xffffffff
   10f3b:	mov    eax,DWORD PTR [rsp+0xc8]
   10f42:	and    eax,0xf000
   10f47:	cmp    eax,0x4000
   10f4c:	mov    rax,QWORD PTR [r12+0x8080]
   10f54:	je     114c6 <read_directory+0xbd6>
   10f5a:	mov    DWORD PTR [rax+0x20],0x0
   10f61:	mov    rax,QWORD PTR [r12+0x8080]
   10f69:	mov    DWORD PTR [rax+0x10],0x0
   10f70:	mov    rax,QWORD PTR [r12+0x8080]
   10f78:	mov    rcx,QWORD PTR [rsp+0x10]
   10f7d:	xor    edx,edx
   10f7f:	mov    QWORD PTR [rax+0x18],rcx
   10f83:	mov    rax,QWORD PTR [r12+0x8080]
   10f8b:	test   BYTE PTR [rsp+0xc8],0x92
   10f93:	sete   dl
   10f96:	mov    DWORD PTR [rax+0x24],edx
   10f99:	jmp    109c8 <read_directory+0xd8>
   10f9e:	mov    DWORD PTR [r15+0x1c],0x0
   10fa6:	test   r14b,r14b
   10fa9:	je     10ea8 <read_directory+0x5b8>
   10faf:	mov    rdi,QWORD PTR [rsp+0x10]
   10fb4:	call   5960 <qemu_free>
   10fb9:	jmp    109c8 <read_directory+0xd8>
   10fbe:	mov    r8d,DWORD PTR [rsp+0x30]
   10fc3:	test   r8d,r8d
   10fc6:	jne    1141b <read_directory+0xb2b>
   10fcc:	movzx  eax,WORD PTR [rsp+0x24]
   10fd1:	mov    WORD PTR [r15+0x1a],ax
   10fd6:	movzx  eax,WORD PTR [rsp+0x5c]
   10fdb:	mov    WORD PTR [r15+0x14],ax
   10fe0:	jmp    10e60 <read_directory+0x570>
   10fe5:	mov    rax,r14
   10fe8:	mov    r14d,r12d
   10feb:	mov    rbx,QWORD PTR [rsp+0x38]
   10ff0:	mov    ebp,DWORD PTR [rsp+0x58]
   10ff4:	imul   r11d,r14d,0x1a
   10ff8:	mov    r13,QWORD PTR [rsp+0x48]
   10ffd:	mov    r15,QWORD PTR [rsp+0x50]
   11002:	mov    r12,rax
   11005:	mov    r9d,DWORD PTR [rax+0x8034]
   1100c:	xor    esi,esi
   1100e:	mov    r10d,0x4ec4ec4f
   11014:	jmp    11028 <read_directory+0x738>
   11016:	nop    WORD PTR cs:[rax+rax*1+0x0]
   11020:	mov    r9d,DWORD PTR [r12+0x8034]
   11028:	mov    eax,esi
   1102a:	mov    ecx,esi
   1102c:	mul    r10d
   1102f:	mov    eax,esi
   11031:	shr    edx,0x3
   11034:	imul   edx,edx,0x1a
   11037:	sub    eax,edx
   11039:	mov    edx,eax
   1103b:	lea    edi,[rax+0x1]
   1103e:	cmp    eax,0x9
   11041:	jle    1104f <read_directory+0x75f>
   11043:	lea    eax,[rax+0x4]
   11046:	lea    edi,[rdx+0x6]
   11049:	cmp    edx,0x15
   1104c:	cmovle edi,eax
   1104f:	mov    eax,ecx
   11051:	lea    r8d,[r9-0x1]
   11055:	mul    r10d
   11058:	mov    eax,r8d
   1105b:	shr    edx,0x3
   1105e:	sub    eax,edx
   11060:	cmp    eax,r9d
   11063:	jae    11709 <read_directory+0xe19>
   11069:	movzx  ecx,BYTE PTR [r15+rsi*1]
   1106e:	movsxd rdx,edi
   11071:	add    rsi,0x1
   11075:	imul   eax,DWORD PTR [r12+0x8038]
   1107e:	add    rax,QWORD PTR [r12+0x8028]
   11086:	mov    BYTE PTR [rax+rdx*1],cl
   11089:	cmp    r11d,esi
   1108c:	jg     11020 <read_directory+0x730>
   1108e:	mov    r15d,DWORD PTR [r12+0x8034]
   11096:	mov    eax,r15d
   11099:	sub    eax,r14d
   1109c:	mov    r14d,eax
   1109f:	cmp    eax,r15d
   110a2:	jae    11709 <read_directory+0xe19>
   110a8:	mov    esi,DWORD PTR [r12+0x8038]
   110b0:	mov    r8,QWORD PTR [r12+0x8028]
   110b8:	mov    rdi,rbx
   110bb:	imul   r14d,esi
   110bf:	mov    DWORD PTR [rsp+0x38],esi
   110c3:	mov    QWORD PTR [rsp],r8
   110c7:	add    r14,r8
   110ca:	call   31b0 <strlen@plt>
   110cf:	mov    r8,QWORD PTR [rsp]
   110d3:	mov    esi,DWORD PTR [rsp+0x38]
   110d7:	lea    edx,[rax-0x1]
   110da:	test   edx,edx
   110dc:	jle    1110e <read_directory+0x81e>
   110de:	movsxd rcx,edx
   110e1:	cmp    BYTE PTR [r13+rcx*1+0x13],0x2e
   110e7:	je     113ba <read_directory+0xaca>
   110ed:	lea    ecx,[rax-0x2]
   110f0:	movsxd rcx,ecx
   110f3:	jmp    11108 <read_directory+0x818>
   110f5:	nop    DWORD PTR [rax]
   110f8:	sub    rcx,0x1
   110fc:	cmp    BYTE PTR [r13+rcx*1+0x14],0x2e
   11102:	je     113ba <read_directory+0xaca>
   11108:	mov    edx,ecx
   1110a:	test   ecx,ecx
   1110c:	jg     110f8 <read_directory+0x808>
   1110e:	cmp    eax,0x8
   11111:	mov    r9d,0x8
   11117:	cmovle r9d,eax
   1111b:	lea    ecx,[r15+0x1]
   1111f:	mov    r10d,esi
   11122:	imul   r10d,ecx
   11126:	cmp    r10d,DWORD PTR [r12+0x8030]
   1112e:	ja     11462 <read_directory+0xb72>
   11134:	mov    DWORD PTR [r12+0x8034],ecx
   1113c:	cmp    ecx,r15d
   1113f:	jbe    11709 <read_directory+0xe19>
   11145:	imul   r15d,DWORD PTR [r12+0x8038]
   1114e:	add    r15,QWORD PTR [r12+0x8028]
   11156:	movabs rax,0x2020202020202020
   11160:	movsxd r9,r9d
   11163:	mov    BYTE PTR [r15+0xa],0x20
   11168:	mov    QWORD PTR [r15],rax
   1116b:	mov    eax,0x2020
   11170:	mov    WORD PTR [r15+0x8],ax
   11175:	cmp    r9,0x8
   11179:	jae    113cc <read_directory+0xadc>
   1117f:	test   r9b,0x4
   11183:	jne    11728 <read_directory+0xe38>
   11189:	test   r9,r9
   1118c:	je     111a0 <read_directory+0x8b0>
   1118e:	movzx  eax,BYTE PTR [r13+0x13]
   11193:	mov    BYTE PTR [r15],al
   11196:	test   r9b,0x2
   1119a:	jne    1173e <read_directory+0xe4e>
   111a0:	movsxd rcx,edx
   111a3:	xor    eax,eax
   111a5:	add    rcx,r13
   111a8:	test   edx,edx
   111aa:	jle    111c4 <read_directory+0x8d4>
   111ac:	movzx  edx,BYTE PTR [rcx+rax*1+0x14]
   111b1:	test   dl,dl
   111b3:	je     111c4 <read_directory+0x8d4>
   111b5:	mov    BYTE PTR [r15+rax*1+0x8],dl
   111ba:	add    rax,0x1
   111be:	cmp    rax,0x3
   111c2:	jne    111ac <read_directory+0x8bc>
   111c4:	mov    ebx,0xa
   111c9:	jmp    111dd <read_directory+0x8ed>
   111cb:	nop    DWORD PTR [rax+rax*1+0x0]
   111d0:	movsxd rax,ebx
   111d3:	mov    BYTE PTR [r15+rax*1],0x5f
   111d8:	sub    ebx,0x1
   111db:	js     1122c <read_directory+0x93c>
   111dd:	movsxd rax,ebx
   111e0:	movzx  r13d,BYTE PTR [r15+rax*1]
   111e5:	cmp    ebx,0xa
   111e8:	je     112f2 <read_directory+0xa02>
   111ee:	cmp    ebx,0x7
   111f1:	je     112f2 <read_directory+0xa02>
   111f7:	lea    eax,[r13-0x21]
   111fb:	cmp    al,0x5e
   111fd:	ja     111d0 <read_directory+0x8e0>
   111ff:	movzx  esi,r13b
   11203:	lea    rdi,[rip+0xfb3b]        # 20d45 <desc_template.13939+0x465>
   1120a:	call   31e0 <strchr@plt>
   1120f:	test   rax,rax
   11212:	jne    111d0 <read_directory+0x8e0>
   11214:	lea    eax,[r13-0x61]
   11218:	cmp    al,0x19
   1121a:	ja     111d8 <read_directory+0x8e8>
   1121c:	movsxd rax,ebx
   1121f:	sub    r13d,0x20
   11223:	mov    BYTE PTR [r15+rax*1],r13b
   11227:	sub    ebx,0x1
   1122a:	jns    111dd <read_directory+0x8ed>
   1122c:	mov    ecx,0x30
   11231:	nop    DWORD PTR [rax+0x0]
   11238:	mov    edi,DWORD PTR [r12+0x8034]
   11240:	cmp    edi,ebp
   11242:	jbe    11709 <read_directory+0xe19>
   11248:	mov    esi,DWORD PTR [r12+0x8038]
   11250:	mov    rdx,QWORD PTR [r12+0x8028]
   11258:	mov    eax,esi
   1125a:	imul   eax,ebp
   1125d:	add    rax,rdx
   11260:	cmp    r15,rax
   11263:	ja     11279 <read_directory+0x989>
   11265:	jmp    1129c <read_directory+0x9ac>
   11267:	nop    WORD PTR [rax+rax*1+0x0]
   11270:	add    rax,0x20
   11274:	cmp    r15,rax
   11277:	jbe    1129c <read_directory+0x9ac>
   11279:	cmp    BYTE PTR [rax+0xb],0xf
   1127d:	je     11270 <read_directory+0x980>
   1127f:	mov    rbx,QWORD PTR [r15]
   11282:	cmp    QWORD PTR [rax],rbx
   11285:	jne    11270 <read_directory+0x980>
   11287:	movzx  ebx,WORD PTR [r15+0x8]
   1128c:	cmp    WORD PTR [rax+0x8],bx
   11290:	jne    11270 <read_directory+0x980>
   11292:	movzx  ebx,BYTE PTR [r15+0xa]
   11297:	cmp    BYTE PTR [rax+0xa],bl
   1129a:	jne    11270 <read_directory+0x980>
   1129c:	cmp    r15,rax
   1129f:	je     1134f <read_directory+0xa5f>
   112a5:	movzx  edx,BYTE PTR [r15+0x7]
   112aa:	cmp    dl,0x20
   112ad:	je     11330 <read_directory+0xa40>
   112b3:	mov    eax,0x7
   112b8:	jmp    112d4 <read_directory+0x9e4>
   112ba:	nop    WORD PTR [rax+rax*1+0x0]
   112c0:	mov    BYTE PTR [r15+rax*1],0x30
   112c5:	sub    rax,0x1
   112c9:	je     11238 <read_directory+0x948>
   112cf:	movzx  edx,BYTE PTR [r15+rax*1]
   112d4:	movsxd rsi,eax
   112d7:	cmp    dl,0x39
   112da:	je     112c0 <read_directory+0x9d0>
   112dc:	lea    edi,[rdx-0x30]
   112df:	lea    eax,[rdx+0x1]
   112e2:	cmp    dil,0xa
   112e6:	cmovae eax,ecx
   112e9:	mov    BYTE PTR [r15+rsi*1],al
   112ed:	jmp    11238 <read_directory+0x948>
   112f2:	test   ebx,ebx
   112f4:	jle    111f7 <read_directory+0x907>
   112fa:	cmp    r13b,0x20
   112fe:	jne    111f7 <read_directory+0x907>
   11304:	lea    eax,[rbx-0x1]
   11307:	cdqe
   11309:	jmp    1131e <read_directory+0xa2e>
   1130b:	nop    DWORD PTR [rax+rax*1+0x0]
   11310:	sub    rax,0x1
   11314:	cmp    r13b,0x20
   11318:	jne    111f7 <read_directory+0x907>
   1131e:	mov    ebx,eax
   11320:	movzx  r13d,BYTE PTR [r15+rax*1]
   11325:	test   eax,eax
   11327:	jg     11310 <read_directory+0xa20>
   11329:	jmp    111f7 <read_directory+0x907>
   1132e:	xchg   ax,ax
   11330:	lea    rax,[r15+0x6]
   11334:	cmp    BYTE PTR [rax],0x20
   11337:	jne    11345 <read_directory+0xa55>
   11339:	mov    BYTE PTR [rax],0x7e
   1133c:	sub    rax,0x1
   11340:	cmp    r15,rax
   11343:	jne    11334 <read_directory+0xa44>
   11345:	movzx  edx,BYTE PTR [r15+0x7]
   1134a:	jmp    112b3 <read_directory+0x9c3>
   1134f:	test   r14,r14
   11352:	je     113b2 <read_directory+0xac2>
   11354:	mov    rcx,r15
   11357:	lea    r8,[r15+0x8]
   1135b:	xor    eax,eax
   1135d:	nop    DWORD PTR [rax]
   11360:	ror    al,1
   11362:	add    rcx,0x1
   11366:	add    al,BYTE PTR [rcx-0x1]
   11369:	cmp    r8,rcx
   1136c:	jne    11360 <read_directory+0xa70>
   1136e:	xor    ecx,ecx
   11370:	ror    al,1
   11372:	add    al,BYTE PTR [r15+rcx*1+0x8]
   11377:	add    rcx,0x1
   1137b:	cmp    rcx,0x3
   1137f:	jne    11370 <read_directory+0xa80>
   11381:	mov    ecx,DWORD PTR [rsp+0x20]
   11385:	cmp    edi,ecx
   11387:	jbe    11709 <read_directory+0xe19>
   1138d:	imul   esi,ecx
   11390:	add    rdx,rsi
   11393:	cmp    r15,rdx
   11396:	ja     113ac <read_directory+0xabc>
   11398:	jmp    113b2 <read_directory+0xac2>
   1139a:	nop    WORD PTR [rax+rax*1+0x0]
   113a0:	mov    BYTE PTR [rdx+0xd],al
   113a3:	add    rdx,0x20
   113a7:	cmp    r15,rdx
   113aa:	jbe    113b2 <read_directory+0xac2>
   113ac:	cmp    BYTE PTR [rdx+0xb],0xf
   113b0:	je     113a0 <read_directory+0xab0>
   113b2:	xor    r14d,r14d
   113b5:	jmp    10d54 <read_directory+0x464>
   113ba:	cmp    edx,0x8
   113bd:	mov    r9d,0x8
   113c3:	cmovle r9d,edx
   113c7:	jmp    1111b <read_directory+0x82b>
   113cc:	mov    rax,QWORD PTR [r13+0x13]
   113d0:	mov    rcx,r15
   113d3:	mov    QWORD PTR [r15],rax
   113d6:	mov    rax,QWORD PTR [rbx+r9*1-0x8]
   113db:	mov    QWORD PTR [r15+r9*1-0x8],rax
   113e0:	lea    rax,[r15+0x8]
   113e4:	and    rax,0xfffffffffffffff8
   113e8:	sub    rcx,rax
   113eb:	add    r9,rcx
   113ee:	sub    rbx,rcx
   113f1:	and    r9,0xfffffffffffffff8
   113f5:	cmp    r9,0x8
   113f9:	jb     111a0 <read_directory+0x8b0>
   113ff:	and    r9,0xfffffffffffffff8
   11403:	xor    ecx,ecx
   11405:	mov    rsi,QWORD PTR [rbx+rcx*1]
   11409:	mov    QWORD PTR [rax+rcx*1],rsi
   1140d:	add    rcx,0x8
   11411:	cmp    rcx,r9
   11414:	jb     11405 <read_directory+0xb15>
   11416:	jmp    111a0 <read_directory+0x8b0>
   1141b:	xor    edi,edi
   1141d:	mov    WORD PTR [r15+0x1a],di
   11422:	jmp    10e60 <read_directory+0x570>
   11427:	mov    r15d,eax
   1142a:	mov    rdi,QWORD PTR [r12+0x8028]
   11432:	shl    r15d,0x5
   11436:	sub    r15d,eax
   11439:	add    r15d,edx
   1143c:	movsxd rsi,r15d
   1143f:	call   5990 <qemu_realloc>
   11444:	mov    QWORD PTR [r12+0x8028],rax
   1144c:	test   rax,rax
   1144f:	je     117b8 <read_directory+0xec8>
   11455:	mov    DWORD PTR [r12+0x8030],r15d
   1145d:	jmp    10cf9 <read_directory+0x409>
   11462:	mov    eax,esi
   11464:	mov    rdi,r8
   11467:	mov    DWORD PTR [rsp+0x58],r9d
   1146c:	shl    eax,0x5
   1146f:	mov    DWORD PTR [rsp+0x38],edx
   11473:	sub    eax,esi
   11475:	mov    DWORD PTR [rsp+0x48],ecx
   11479:	add    r10d,eax
   1147c:	movsxd rsi,r10d
   1147f:	mov    DWORD PTR [rsp],r10d
   11483:	call   5990 <qemu_realloc>
   11488:	mov    edx,DWORD PTR [rsp+0x38]
   1148c:	mov    r9d,DWORD PTR [rsp+0x58]
   11491:	test   rax,rax
   11494:	mov    QWORD PTR [r12+0x8028],rax
   1149c:	je     117b0 <read_directory+0xec0>
   114a2:	mov    r10d,DWORD PTR [rsp]
   114a6:	mov    ecx,DWORD PTR [rsp+0x48]
   114aa:	mov    DWORD PTR [r12+0x8030],r10d
   114b2:	jmp    11134 <read_directory+0x844>
   114b7:	mov    rdi,QWORD PTR [rsp+0x10]
   114bc:	call   3070 <free@plt>
   114c1:	jmp    109c8 <read_directory+0xd8>
   114c6:	mov    DWORD PTR [rax+0x20],0x4
   114cd:	mov    ecx,DWORD PTR [rsp+0x40]
   114d1:	mov    rax,QWORD PTR [r12+0x8080]
   114d9:	mov    DWORD PTR [rax+0x10],ecx
   114dc:	jmp    10f70 <read_directory+0x680>
   114e1:	mov    r14d,eax
   114e4:	mov    rdi,QWORD PTR [r12+0x8040]
   114ec:	shl    r14d,0x5
   114f0:	sub    r14d,eax
   114f3:	add    r14d,edx
   114f6:	movsxd rsi,r14d
   114f9:	call   5990 <qemu_realloc>
   114fe:	mov    QWORD PTR [r12+0x8040],rax
   11506:	test   rax,rax
   11509:	je     377f <read_directory.cold.14>
   1150f:	mov    DWORD PTR [r12+0x8048],r14d
   11517:	jmp    10ed0 <read_directory+0x5e0>
   1151c:	xor    eax,eax
   1151e:	mov    r14d,0xa
   11524:	mov    WORD PTR [rsp+0x242],ax
   1152c:	jmp    10b83 <read_directory+0x293>
   11531:	mov    ebp,DWORD PTR [r12+0x8034]
   11539:	jmp    109af <read_directory+0xbf>
   1153e:	imul   r11d,r14d,0x1a
   11542:	test   r11d,r11d
   11545:	jne    117ef <read_directory+0xeff>
   1154b:	mov    r15d,DWORD PTR [rsp+0x20]
   11550:	jmp    11096 <read_directory+0x7a6>
   11555:	mov    rdi,QWORD PTR [rsp+0x28]
   1155a:	call   32a0 <closedir@plt>
   1155f:	jmp    11597 <read_directory+0xca7>
   11561:	nop    DWORD PTR [rax+0x0]
   11568:	mov    DWORD PTR [r12+0x8034],ebp
   11570:	cmp    ebx,ebp
   11572:	jae    11709 <read_directory+0xe19>
   11578:	imul   ebx,DWORD PTR [r12+0x8038]
   11581:	mov    rax,QWORD PTR [r12+0x8028]
   11589:	add    rax,rbx
   1158c:	pxor   xmm0,xmm0
   11590:	movups XMMWORD PTR [rax],xmm0
   11593:	movups XMMWORD PTR [rax+0x10],xmm0
   11597:	mov    ecx,DWORD PTR [r12+0x805c]
   1159f:	mov    ebx,DWORD PTR [r12+0x8034]
   115a7:	xor    edx,edx
   115a9:	mov    esi,ecx
   115ab:	mov    eax,ebx
   115ad:	shl    esi,0x4
   115b0:	div    esi
   115b2:	test   edx,edx
   115b4:	je     1160b <read_directory+0xd1b>
   115b6:	lea    ebp,[rbx+0x1]
   115b9:	mov    eax,DWORD PTR [r12+0x8038]
   115c1:	mov    edx,ebp
   115c3:	imul   edx,eax
   115c6:	cmp    edx,DWORD PTR [r12+0x8030]
   115ce:	jbe    11568 <read_directory+0xc78>
   115d0:	mov    r13d,eax
   115d3:	mov    rdi,QWORD PTR [r12+0x8028]
   115db:	shl    r13d,0x5
   115df:	sub    r13d,eax
   115e2:	add    r13d,edx
   115e5:	movsxd rsi,r13d
   115e8:	call   5990 <qemu_realloc>
   115ed:	mov    QWORD PTR [r12+0x8028],rax
   115f5:	test   rax,rax
   115f8:	je     117f9 <read_directory+0xf09>
   115fe:	mov    DWORD PTR [r12+0x8030],r13d
   11606:	jmp    11568 <read_directory+0xc78>
   1160b:	mov    esi,DWORD PTR [rsp+0x40]
   1160f:	test   esi,esi
   11611:	jne    11623 <read_directory+0xd33>
   11613:	mov    r13d,ecx
   11616:	shl    r13d,0x5
   1161a:	cmp    r13d,ebx
   1161d:	ja     1174f <read_directory+0xe5f>
   11623:	mov    eax,DWORD PTR [rsp+0x40]
   11627:	cmp    eax,DWORD PTR [r12+0x804c]
   1162f:	jae    11709 <read_directory+0xe19>
   11635:	mov    ecx,eax
   11637:	mov    eax,DWORD PTR [r12+0x8034]
   1163f:	xor    edx,edx
   11641:	imul   ecx,DWORD PTR [r12+0x8050]
   1164a:	add    rcx,QWORD PTR [r12+0x8040]
   11652:	sub    eax,DWORD PTR [rcx+0x14]
   11655:	shl    eax,0x5
   11658:	div    DWORD PTR [r12+0x8058]
   11660:	add    eax,DWORD PTR [rsp+0x24]
   11664:	mov    DWORD PTR [rcx+0x4],eax
   11667:	mov    eax,DWORD PTR [rcx+0x8]
   1166a:	cmp    eax,DWORD PTR [r12+0x8034]
   11672:	jae    11709 <read_directory+0xe19>
   11678:	imul   eax,DWORD PTR [r12+0x8038]
   11681:	mov    edx,DWORD PTR [rcx]
   11683:	add    rax,QWORD PTR [r12+0x8028]
   1168b:	mov    WORD PTR [rax+0x1a],dx
   1168f:	shr    edx,0x10
   11692:	mov    WORD PTR [rax+0x14],dx
   11696:	xor    eax,eax
   11698:	mov    rcx,QWORD PTR [rsp+0x248]
   116a0:	xor    rcx,QWORD PTR fs:0x28
   116a9:	jne    117a1 <read_directory+0xeb1>
   116af:	add    rsp,0x258
   116b6:	pop    rbx
   116b7:	pop    rbp
   116b8:	pop    r12
   116ba:	pop    r13
   116bc:	pop    r14
   116be:	pop    r15
   116c0:	ret
   116c1:	mov    rbx,QWORD PTR [rsp+0x10]
   116c6:	mov    rdi,QWORD PTR [rip+0x18c33]        # 2a300 <stderr@@GLIBC_2.2.5>
   116cd:	lea    rdx,[rip+0xf683]        # 20d57 <desc_template.13939+0x477>
   116d4:	xor    eax,eax
   116d6:	mov    esi,0x1
   116db:	mov    rcx,rbx
   116de:	call   3660 <__fprintf_chk@plt>
   116e3:	mov    rdi,rbx
   116e6:	call   3070 <free@plt>
   116eb:	mov    rdi,QWORD PTR [rsp+0x28]
   116f0:	call   32a0 <closedir@plt>
   116f5:	mov    eax,0xfffffffe
   116fa:	jmp    11698 <read_directory+0xda8>
   116fc:	mov    DWORD PTR [rsp+0x34],0xffffffff
   11704:	jmp    1097a <read_directory+0x8a>
   11709:	lea    rcx,[rip+0xfd60]        # 21470 <__PRETTY_FUNCTION__.13830>
   11710:	mov    edx,0x60
   11715:	lea    rsi,[rip+0xf3ca]        # 20ae6 <desc_template.13939+0x206>
   1171c:	lea    rdi,[rip+0xf3f8]        # 20b1b <desc_template.13939+0x23b>
   11723:	call   3230 <__assert_fail@plt>
   11728:	mov    eax,DWORD PTR [r13+0x13]
   1172c:	mov    DWORD PTR [r15],eax
   1172f:	mov    eax,DWORD PTR [rbx+r9*1-0x4]
   11734:	mov    DWORD PTR [r15+r9*1-0x4],eax
   11739:	jmp    111a0 <read_directory+0x8b0>
   1173e:	movzx  eax,WORD PTR [rbx+r9*1-0x2]
   11744:	mov    WORD PTR [r15+r9*1-0x2],ax
   1174a:	jmp    111a0 <read_directory+0x8b0>
   1174f:	mov    eax,DWORD PTR [r12+0x8038]
   11757:	mov    edx,r13d
   1175a:	imul   edx,eax
   1175d:	cmp    edx,DWORD PTR [r12+0x8030]
   11765:	ja     11800 <read_directory+0xf10>
   1176b:	mov    eax,DWORD PTR [r12+0x8034]
   11773:	shl    ecx,0x5
   11776:	mov    edx,ecx
   11778:	sub    edx,ebx
   1177a:	shl    rdx,0x5
   1177e:	cmp    eax,ebx
   11780:	jbe    11709 <read_directory+0xe19>
   11782:	mov    edi,ebx
   11784:	xor    esi,esi
   11786:	imul   edi,DWORD PTR [r12+0x8038]
   1178f:	add    rdi,QWORD PTR [r12+0x8028]
   11797:	call   3250 <memset@plt>
   1179c:	jmp    11623 <read_directory+0xd33>
   117a1:	call   31c0 <__stack_chk_fail@plt>
   117a6:	nop    WORD PTR cs:[rax+rax*1+0x0]
   117b0:	xor    r15d,r15d
   117b3:	jmp    11156 <read_directory+0x866>
   117b8:	xor    r15d,r15d
   117bb:	jmp    10d22 <read_directory+0x432>
   117c0:	lea    rcx,[rip+0xfb49]        # 21310 <__PRETTY_FUNCTION__.14179>
   117c7:	mov    edx,0x2c9
   117cc:	lea    rsi,[rip+0xf313]        # 20ae6 <desc_template.13939+0x206>
   117d3:	lea    rdi,[rip+0xf8e6]        # 210c0 <desc_template.13939+0x7e0>
   117da:	call   3230 <__assert_fail@plt>
   117df:	nop
   117e0:	mov    eax,DWORD PTR [rbx]
   117e2:	mov    DWORD PTR [rbx+0x4],eax
   117e5:	mov    eax,0xffffffff
   117ea:	jmp    11698 <read_directory+0xda8>
   117ef:	mov    r9d,DWORD PTR [rsp+0x20]
   117f4:	jmp    1100c <read_directory+0x71c>
   117f9:	xor    eax,eax
   117fb:	jmp    1158c <read_directory+0xc9c>
   11800:	mov    ebp,eax
   11802:	mov    rdi,QWORD PTR [r12+0x8028]
   1180a:	shl    ebp,0x5
   1180d:	sub    ebp,eax
   1180f:	add    ebp,edx
   11811:	movsxd rsi,ebp
   11814:	call   5990 <qemu_realloc>
   11819:	mov    QWORD PTR [r12+0x8028],rax
   11821:	test   rax,rax
   11824:	je     1184c <read_directory+0xf5c>
   11826:	mov    edx,DWORD PTR [r12+0x805c]
   1182e:	mov    DWORD PTR [r12+0x8030],ebp
   11836:	mov    DWORD PTR [r12+0x8034],r13d
   1183e:	shl    edx,0x5
   11841:	sub    edx,ebx
   11843:	shl    rdx,0x5
   11847:	jmp    11782 <read_directory+0xe92>
   1184c:	mov    eax,DWORD PTR [r12+0x8034]
   11854:	mov    ecx,DWORD PTR [r12+0x805c]
   1185c:	jmp    11773 <read_directory+0xe83>
   11861:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   1186c:	nop    DWORD PTR [rax+0x0]

0000000000011870 <vvfat_open>:
   11870:	movabs rax,0x3f00000010
   1187a:	push   r15
   1187c:	xor    edx,edx
   1187e:	push   r14
   11880:	push   r13
   11882:	mov    r13,rsi
   11885:	lea    rsi,[rip+0xc6ba]        # 1df46 <__PRETTY_FUNCTION__.13430+0x96>
   1188c:	push   r12
   1188e:	mov    r12,rdi
   11891:	push   rbp
   11892:	push   rbx
   11893:	sub    rsp,0x18
   11897:	mov    rbx,QWORD PTR [rdi+0x40]
   1189b:	mov    QWORD PTR [rbx],rdi
   1189e:	mov    DWORD PTR [rbx+0x800c],0x10
   118a8:	mov    DWORD PTR [rbx+0x805c],0x10
   118b2:	mov    DWORD PTR [rdi+0x884],0x400
   118bc:	mov    QWORD PTR [rdi+0x888],rax
   118c3:	mov    DWORD PTR [rbx+0x8098],0xffffffff
   118cd:	mov    DWORD PTR [rbx+0x8],0x40
   118d4:	mov    DWORD PTR [rdi+0x8],0x1
   118db:	mov    rdi,r13
   118de:	mov    QWORD PTR [rbx+0x80a0],0x0
   118e9:	mov    QWORD PTR [rbx+0x80b0],0x0
   118f4:	mov    QWORD PTR [rbx+0x80a8],0x0
   118ff:	mov    QWORD PTR [rbx+0x80b8],0x0
   1190a:	mov    DWORD PTR [rbx+0x80e8],0x1
   11914:	call   5620 <strstart>
   11919:	test   eax,eax
   1191b:	je     12148 <vvfat_open+0x8d8>
   11921:	lea    rsi,[rip+0xf461]        # 20d89 <desc_template.13939+0x4a9>
   11928:	mov    rdi,r13
   1192b:	call   36b0 <strstr@plt>
   11930:	test   rax,rax
   11933:	je     124c8 <vvfat_open+0xc58>
   11939:	mov    DWORD PTR [rbx+0x800c],0xc
   11943:	mov    r14d,0x1
   11949:	movabs rax,0x2400000002
   11953:	mov    DWORD PTR [rbx+0x8],0x1
   1195a:	mov    DWORD PTR [rbx+0x805c],0x2
   11964:	mov    DWORD PTR [r12+0x884],0x50
   11970:	mov    QWORD PTR [r12+0x888],rax
   11978:	mov    eax,0x1680
   1197d:	mov    DWORD PTR [rbx+0x8070],eax
   11983:	lea    rsi,[rip+0xf408]        # 20d92 <desc_template.13939+0x4b2>
   1198a:	mov    rdi,r13
   1198d:	call   36b0 <strstr@plt>
   11992:	test   rax,rax
   11995:	je     120d0 <vvfat_open+0x860>
   1199b:	mov    rcx,QWORD PTR [rip+0x1895e]        # 2a300 <stderr@@GLIBC_2.2.5>
   119a2:	mov    edx,0x4c
   119a7:	mov    esi,0x1
   119ac:	lea    rdi,[rip+0xf8bd]        # 21270 <desc_template.13939+0x990>
   119b3:	call   3640 <fwrite@plt>
   119b8:	mov    DWORD PTR [rbx+0x800c],0x20
   119c2:	lea    rsi,[rip+0xf3d8]        # 20da1 <desc_template.13939+0x4c1>
   119c9:	mov    rdi,r13
   119cc:	call   36b0 <strstr@plt>
   119d1:	test   rax,rax
   119d4:	je     11af7 <vvfat_open+0x287>
   119da:	mov    edx,DWORD PTR [rbx+0x806c]
   119e0:	mov    eax,DWORD PTR [rbx+0x8070]
   119e6:	mov    esi,0x1
   119eb:	mov    ecx,DWORD PTR [rbx+0x805c]
   119f1:	sub    rax,rdx
   119f4:	cqo
   119f6:	idiv   rcx
   119f9:	movsxd rdi,eax
   119fc:	call   3330 <calloc@plt>
   11a01:	mov    edi,0x400
   11a06:	mov    QWORD PTR [rbx+0x80c8],0x0
   11a11:	mov    QWORD PTR [rbx+0x80c0],rax
   11a18:	mov    QWORD PTR [rbx+0x80d0],0x0
   11a23:	mov    DWORD PTR [rbx+0x80d8],0x18
   11a2d:	call   5970 <qemu_malloc>
   11a32:	mov    esi,0x400
   11a37:	mov    QWORD PTR [rbx+0x80a8],rax
   11a3e:	mov    rdi,rax
   11a41:	call   180d0 <get_tmp_filename>
   11a46:	mov    edx,DWORD PTR [rbx+0x8070]
   11a4c:	xor    r8d,r8d
   11a4f:	mov    rsi,QWORD PTR [rbx+0x80a8]
   11a56:	lea    rcx,[rip+0xc4e9]        # 1df46 <__PRETTY_FUNCTION__.13430+0x96>
   11a5d:	lea    rdi,[rip+0x176fc]        # 29160 <bdrv_qcow>
   11a64:	call   180b0 <bdrv_create>
   11a69:	test   eax,eax
   11a6b:	js     12148 <vvfat_open+0x8d8>
   11a71:	lea    rdi,[rip+0xf1ea]        # 20c62 <desc_template.13939+0x382>
   11a78:	call   17ff0 <bdrv_new>
   11a7d:	mov    QWORD PTR [rbx+0x80b0],rax
   11a84:	test   rax,rax
   11a87:	je     12148 <vvfat_open+0x8d8>
   11a8d:	mov    rsi,QWORD PTR [rbx+0x80a8]
   11a94:	xor    edx,edx
   11a96:	mov    rdi,rax
   11a99:	call   19100 <bdrv_open>
   11a9e:	test   eax,eax
   11aa0:	js     12148 <vvfat_open+0x8d8>
   11aa6:	mov    rdi,QWORD PTR [rbx+0x80a8]
   11aad:	call   30e0 <unlink@plt>
   11ab2:	mov    rbp,QWORD PTR [rbx]
   11ab5:	mov    esi,0x1
   11aba:	mov    edi,0x8c8
   11abf:	call   3330 <calloc@plt>
   11ac4:	lea    rsi,[rip+0x17f55]        # 29a20 <vvfat_write_target>
   11acb:	mov    QWORD PTR [rbp+0x850],rax
   11ad2:	mov    rax,QWORD PTR [rbx]
   11ad5:	mov    rax,QWORD PTR [rax+0x850]
   11adc:	mov    QWORD PTR [rax+0x38],rsi
   11ae0:	mov    rax,QWORD PTR [rbx]
   11ae3:	mov    rax,QWORD PTR [rax+0x850]
   11aea:	mov    QWORD PTR [rax+0x40],rbx
   11aee:	mov    DWORD PTR [r12+0x8],0x0
   11af7:	mov    esi,0x3a
   11afc:	mov    rdi,r13
   11aff:	call   3210 <strrchr@plt>
   11b04:	sub    rax,r13
   11b07:	cmp    eax,0x2
   11b0a:	jle    127e7 <vvfat_open+0xf77>
   11b10:	movsxd r15,eax
   11b13:	cmp    BYTE PTR [r13+r15*1-0x2],0x3a
   11b19:	je     123e0 <vvfat_open+0xb70>
   11b1f:	lea    rbp,[r13+r15*1+0x1]
   11b24:	mov    eax,DWORD PTR [r12+0x884]
   11b2c:	lea    r13,[rbx+0xc]
   11b30:	mov    edx,0x8000
   11b35:	xor    esi,esi
   11b37:	imul   eax,DWORD PTR [r12+0x888]
   11b40:	mov    rdi,r13
   11b43:	imul   eax,DWORD PTR [r12+0x88c]
   11b4c:	cdqe
   11b4e:	mov    QWORD PTR [r12],rax
   11b52:	call   3250 <memset@plt>
   11b57:	mov    edi,DWORD PTR [rbx+0x805c]
   11b5d:	shl    edi,0x9
   11b60:	mov    DWORD PTR [rbx+0x8058],edi
   11b66:	call   5970 <qemu_malloc>
   11b6b:	xor    edx,edx
   11b6d:	mov    esi,0x400
   11b72:	xor    edi,edi
   11b74:	mov    QWORD PTR [rbx+0x8090],rax
   11b7b:	mov    eax,DWORD PTR [rbx+0x805c]
   11b81:	mov    QWORD PTR [rbx+0x8040],0x0
   11b8c:	mov    QWORD PTR [rbx+0x8048],0x0
   11b97:	shl    eax,0xc
   11b9a:	div    DWORD PTR [rbx+0x800c]
   11ba0:	mov    DWORD PTR [rbx+0x8050],0x28
   11baa:	mov    QWORD PTR [rbx+0x8028],0x0
   11bb5:	mov    QWORD PTR [rbx+0x8030],0x0
   11bc0:	mov    DWORD PTR [rbx+0x8038],0x20
   11bca:	xor    edx,edx
   11bcc:	lea    ecx,[rax+0x1]
   11bcf:	mov    eax,DWORD PTR [rbx+0x8070]
   11bd5:	add    eax,ecx
   11bd7:	div    ecx
   11bd9:	mov    DWORD PTR [rbx+0x8060],eax
   11bdf:	call   5990 <qemu_realloc>
   11be4:	mov    QWORD PTR [rbx+0x8028],rax
   11beb:	test   rax,rax
   11bee:	je     37a2 <vvfat_open.cold.15>
   11bf4:	movabs rsi,0x100000400
   11bfe:	mov    edx,0x5441
   11c03:	mov    QWORD PTR [rbx+0x8030],rsi
   11c0a:	movabs rsi,0x46565620554d4551
   11c14:	mov    BYTE PTR [rax+0xb],0x28
   11c18:	mov    QWORD PTR [rax],rsi
   11c1b:	mov    WORD PTR [rax+0x8],dx
   11c1f:	mov    BYTE PTR [rax+0xa],0x0
   11c23:	mov    eax,DWORD PTR [rbx+0x800c]
   11c29:	cmp    eax,0xc
   11c2c:	je     12408 <vvfat_open+0xb98>
   11c32:	mov    QWORD PTR [rbx+0x8010],0x0
   11c3d:	xor    ecx,ecx
   11c3f:	cmp    eax,0x20
   11c42:	mov    eax,DWORD PTR [rbx+0x8060]
   11c48:	mov    QWORD PTR [rbx+0x8018],0x0
   11c53:	sete   cl
   11c56:	xor    edx,edx
   11c58:	lea    ecx,[rcx+rcx*1+0x2]
   11c5c:	shl    eax,0x9
   11c5f:	div    ecx
   11c61:	mov    DWORD PTR [rbx+0x8020],ecx
   11c67:	mov    r15d,ecx
   11c6a:	imul   r15d,eax
   11c6e:	test   r15d,r15d
   11c71:	jne    12080 <vvfat_open+0x810>
   11c77:	xor    edi,edi
   11c79:	xor    edx,edx
   11c7b:	xor    esi,esi
   11c7d:	call   3250 <memset@plt>
   11c82:	mov    eax,DWORD PTR [rbx+0x800c]
   11c88:	cmp    eax,0x10
   11c8b:	je     12500 <vvfat_open+0xc90>
   11c91:	cmp    eax,0x20
   11c94:	je     124f0 <vvfat_open+0xc80>
   11c9a:	cmp    eax,0xc
   11c9d:	mov    edx,0xfff
   11ca2:	mov    eax,0x0
   11ca7:	cmove  eax,edx
   11caa:	mov    DWORD PTR [rbx+0x8078],eax
   11cb0:	mov    eax,DWORD PTR [rbx+0x8]
   11cb3:	mov    edx,DWORD PTR [rbx+0x8060]
   11cb9:	mov    ecx,DWORD PTR [rbx+0x805c]
   11cbf:	mov    r15d,DWORD PTR [rbx+0x804c]
   11cc6:	lea    edx,[rax+rdx*2]
   11cc9:	mov    eax,DWORD PTR [rbx+0x8070]
   11ccf:	mov    DWORD PTR [rbx+0x806c],edx
   11cd5:	sub    rax,rdx
   11cd8:	cqo
   11cda:	idiv   rcx
   11cdd:	lea    edx,[r15+0x1]
   11ce1:	mov    ecx,edx
   11ce3:	mov    DWORD PTR [rbx+0x8074],eax
   11ce9:	mov    eax,DWORD PTR [rbx+0x8050]
   11cef:	imul   ecx,eax
   11cf2:	cmp    ecx,DWORD PTR [rbx+0x8048]
   11cf8:	ja     12480 <vvfat_open+0xc10>
   11cfe:	mov    DWORD PTR [rbx+0x804c],edx
   11d04:	cmp    r15d,edx
   11d07:	jae    12740 <vvfat_open+0xed0>
   11d0d:	imul   r15d,DWORD PTR [rbx+0x8050]
   11d15:	add    r15,QWORD PTR [rbx+0x8040]
   11d1c:	mov    rdi,rbp
   11d1f:	movabs rax,0xffffffff00000000
   11d29:	mov    DWORD PTR [r15],0x0
   11d30:	mov    QWORD PTR [r15+0x8],rax
   11d34:	mov    DWORD PTR [r15+0x10],0xffffffff
   11d3c:	call   3680 <strdup@plt>
   11d41:	mov    QWORD PTR [r15+0x18],rax
   11d45:	mov    rcx,rax
   11d48:	mov    esi,DWORD PTR [rcx]
   11d4a:	add    rcx,0x4
   11d4e:	lea    edx,[rsi-0x1010101]
   11d54:	not    esi
   11d56:	and    edx,esi
   11d58:	and    edx,0x80808080
   11d5e:	je     11d48 <vvfat_open+0x4d8>
   11d60:	mov    esi,edx
   11d62:	shr    esi,0x10
   11d65:	test   edx,0x8080
   11d6b:	cmove  edx,esi
   11d6e:	lea    rsi,[rcx+0x2]
   11d72:	cmove  rcx,rsi
   11d76:	mov    esi,edx
   11d78:	add    sil,dl
   11d7b:	sbb    rcx,0x3
   11d7f:	sub    rcx,rax
   11d82:	test   ecx,ecx
   11d84:	je     11d95 <vvfat_open+0x525>
   11d86:	lea    edx,[rcx-0x1]
   11d89:	add    rdx,rax
   11d8c:	cmp    BYTE PTR [rdx],0x2f
   11d8f:	je     12510 <vvfat_open+0xca0>
   11d95:	mov    QWORD PTR [r15+0x20],0x4
   11d9d:	mov    QWORD PTR [rbx+0x80e0],rax
   11da4:	mov    eax,DWORD PTR [rbx+0x804c]
   11daa:	test   eax,eax
   11dac:	je     12740 <vvfat_open+0xed0>
   11db2:	xor    ecx,ecx
   11db4:	xor    r15d,r15d
   11db7:	jmp    11e35 <vvfat_open+0x5c5>
   11db9:	nop    DWORD PTR [rax+0x0]
   11dc0:	mov    edx,DWORD PTR [rbp+0x8]
   11dc3:	cmp    edx,DWORD PTR [rbx+0x8034]
   11dc9:	jae    12740 <vvfat_open+0xed0>
   11dcf:	imul   edx,DWORD PTR [rbx+0x8038]
   11dd6:	mov    rsi,QWORD PTR [rbx+0x8028]
   11ddd:	sub    eax,0x1
   11de0:	add    rsi,rdx
   11de3:	xor    edx,edx
   11de5:	div    DWORD PTR [rbx+0x8058]
   11deb:	lea    eax,[rcx+rax*1+0x1]
   11def:	mov    DWORD PTR [rbp+0x4],eax
   11df2:	mov    WORD PTR [rsi+0x1a],cx
   11df6:	shr    ecx,0x10
   11df9:	mov    WORD PTR [rsi+0x14],cx
   11dfd:	mov    ecx,DWORD PTR [rbp+0x0]
   11e00:	mov    esi,DWORD PTR [rbp+0x4]
   11e03:	cmp    esi,ecx
   11e05:	jbe    1279e <vvfat_open+0xf2e>
   11e0b:	cmp    DWORD PTR [rbx+0x8074],esi
   11e11:	jb     12100 <vvfat_open+0x890>
   11e17:	test   r8d,r8d
   11e1a:	jne    11ed0 <vvfat_open+0x660>
   11e20:	mov    eax,DWORD PTR [rbx+0x804c]
   11e26:	add    r15d,0x1
   11e2a:	mov    ecx,esi
   11e2c:	cmp    r15d,eax
   11e2f:	jae    12160 <vvfat_open+0x8f0>
   11e35:	xor    r8d,r8d
   11e38:	test   r15d,r15d
   11e3b:	mov    ebp,r15d
   11e3e:	setne  r8b
   11e42:	imul   ebp,DWORD PTR [rbx+0x8050]
   11e49:	add    rbp,QWORD PTR [rbx+0x8040]
   11e50:	mov    eax,DWORD PTR [rbp+0x20]
   11e53:	test   al,0x4
   11e55:	jne    11e80 <vvfat_open+0x610>
   11e57:	test   eax,eax
   11e59:	jne    127bd <vvfat_open+0xf4d>
   11e5f:	mov    eax,DWORD PTR [rbp+0x4]
   11e62:	mov    DWORD PTR [rbp+0x20],0x1
   11e69:	mov    DWORD PTR [rbp+0x0],ecx
   11e6c:	test   eax,eax
   11e6e:	jne    11dc0 <vvfat_open+0x550>
   11e74:	lea    esi,[rcx+0x1]
   11e77:	xor    r8d,r8d
   11e7a:	mov    DWORD PTR [rbp+0x4],esi
   11e7d:	jmp    11e03 <vvfat_open+0x593>
   11e7f:	nop
   11e80:	mov    DWORD PTR [rbp+0x0],ecx
   11e83:	mov    esi,r15d
   11e86:	mov    rdi,rbx
   11e89:	mov    DWORD PTR [rsp+0x8],r8d
   11e8e:	call   108f0 <read_directory>
   11e93:	mov    r8d,DWORD PTR [rsp+0x8]
   11e98:	test   eax,eax
   11e9a:	jne    126f0 <vvfat_open+0xe80>
   11ea0:	cmp    r15d,DWORD PTR [rbx+0x804c]
   11ea7:	jae    12740 <vvfat_open+0xed0>
   11ead:	mov    ebp,r15d
   11eb0:	imul   ebp,DWORD PTR [rbx+0x8050]
   11eb7:	add    rbp,QWORD PTR [rbx+0x8040]
   11ebe:	mov    ecx,DWORD PTR [rbp+0x0]
   11ec1:	mov    esi,DWORD PTR [rbp+0x4]
   11ec4:	jmp    11e03 <vvfat_open+0x593>
   11ec9:	nop    DWORD PTR [rax+0x0]
   11ed0:	lea    r9d,[rcx+0x1]
   11ed4:	mov    edx,ecx
   11ed6:	mov    eax,esi
   11ed8:	shl    r9d,0x4
   11edc:	nop    DWORD PTR [rax+0x0]
   11ee0:	sub    eax,0x1
   11ee3:	mov    edi,edx
   11ee5:	mov    r10d,DWORD PTR [rbx+0x800c]
   11eec:	mov    r8d,DWORD PTR [rbx+0x801c]
   11ef3:	cmp    eax,edx
   11ef5:	jbe    11fc0 <vvfat_open+0x750>
   11efb:	add    edx,0x1
   11efe:	cmp    r10d,0x20
   11f02:	je     11fa0 <vvfat_open+0x730>
   11f08:	cmp    r10d,0x10
   11f0c:	je     11f80 <vvfat_open+0x710>
   11f0e:	lea    eax,[rcx+rcx*2]
   11f11:	shr    eax,1
   11f13:	cmp    eax,r8d
   11f16:	jae    12740 <vvfat_open+0xed0>
   11f1c:	imul   eax,DWORD PTR [rbx+0x8020]
   11f23:	add    rax,QWORD PTR [rbx+0x8010]
   11f2a:	and    edi,0x1
   11f2d:	jne    11f60 <vvfat_open+0x6f0>
   11f2f:	movzx  edi,BYTE PTR [rax+0x1]
   11f33:	mov    r8d,edx
   11f36:	mov    BYTE PTR [rax],dl
   11f38:	shr    r8d,0x8
   11f3c:	and    edi,0xfffffff0
   11f3f:	and    r8d,0xf
   11f43:	or     edi,r8d
   11f46:	mov    BYTE PTR [rax+0x1],dil
   11f4a:	nop    WORD PTR [rax+rax*1+0x0]
   11f50:	mov    eax,DWORD PTR [rbp+0x4]
   11f53:	add    ecx,0x1
   11f56:	add    r9d,0x10
   11f5a:	jmp    11ee0 <vvfat_open+0x670>
   11f5c:	nop    DWORD PTR [rax+0x0]
   11f60:	movzx  edi,BYTE PTR [rax]
   11f63:	and    edi,0xf
   11f66:	or     edi,r9d
   11f69:	mov    BYTE PTR [rax],dil
   11f6c:	mov    edi,edx
   11f6e:	shr    edi,0x4
   11f71:	mov    BYTE PTR [rax+0x1],dil
   11f75:	jmp    11f50 <vvfat_open+0x6e0>
   11f77:	nop    WORD PTR [rax+rax*1+0x0]
   11f80:	cmp    ecx,r8d
   11f83:	jae    12740 <vvfat_open+0xed0>
   11f89:	imul   edi,DWORD PTR [rbx+0x8020]
   11f90:	mov    rax,QWORD PTR [rbx+0x8010]
   11f97:	mov    WORD PTR [rax+rdi*1],dx
   11f9b:	jmp    11f50 <vvfat_open+0x6e0>
   11f9d:	nop    DWORD PTR [rax]
   11fa0:	cmp    ecx,r8d
   11fa3:	jae    12740 <vvfat_open+0xed0>
   11fa9:	imul   edi,DWORD PTR [rbx+0x8020]
   11fb0:	mov    rax,QWORD PTR [rbx+0x8010]
   11fb7:	mov    DWORD PTR [rax+rdi*1],edx
   11fba:	jmp    11f50 <vvfat_open+0x6e0>
   11fbc:	nop    DWORD PTR [rax+0x0]
   11fc0:	mov    ecx,DWORD PTR [rbx+0x8078]
   11fc6:	cmp    r10d,0x20
   11fca:	je     12060 <vvfat_open+0x7f0>
   11fd0:	cmp    r10d,0x10
   11fd4:	je     12038 <vvfat_open+0x7c8>
   11fd6:	lea    edx,[rax+rax*2]
   11fd9:	shr    edx,1
   11fdb:	cmp    edx,r8d
   11fde:	jae    12740 <vvfat_open+0xed0>
   11fe4:	imul   edx,DWORD PTR [rbx+0x8020]
   11feb:	add    rdx,QWORD PTR [rbx+0x8010]
   11ff2:	test   al,0x1
   11ff4:	je     12018 <vvfat_open+0x7a8>
   11ff6:	movzx  eax,BYTE PTR [rdx]
   11ff9:	mov    edi,ecx
   11ffb:	shl    edi,0x4
   11ffe:	and    eax,0xf
   12001:	or     eax,edi
   12003:	mov    BYTE PTR [rdx],al
   12005:	mov    eax,ecx
   12007:	shr    eax,0x4
   1200a:	mov    BYTE PTR [rdx+0x1],al
   1200d:	jmp    11e20 <vvfat_open+0x5b0>
   12012:	nop    WORD PTR [rax+rax*1+0x0]
   12018:	movzx  edi,BYTE PTR [rdx+0x1]
   1201c:	mov    eax,ecx
   1201e:	mov    BYTE PTR [rdx],cl
   12020:	shr    eax,0x8
   12023:	and    edi,0xfffffff0
   12026:	and    eax,0xf
   12029:	or     eax,edi
   1202b:	mov    BYTE PTR [rdx+0x1],al
   1202e:	jmp    11e20 <vvfat_open+0x5b0>
   12033:	nop    DWORD PTR [rax+rax*1+0x0]
   12038:	cmp    eax,r8d
   1203b:	jae    12740 <vvfat_open+0xed0>
   12041:	imul   eax,DWORD PTR [rbx+0x8020]
   12048:	mov    rdx,QWORD PTR [rbx+0x8010]
   1204f:	mov    WORD PTR [rdx+rax*1],cx
   12053:	jmp    11e20 <vvfat_open+0x5b0>
   12058:	nop    DWORD PTR [rax+rax*1+0x0]
   12060:	cmp    eax,r8d
   12063:	jae    12740 <vvfat_open+0xed0>
   12069:	imul   eax,DWORD PTR [rbx+0x8020]
   12070:	mov    rdx,QWORD PTR [rbx+0x8010]
   12077:	mov    DWORD PTR [rdx+rax*1],ecx
   1207a:	jmp    11e20 <vvfat_open+0x5b0>
   1207f:	nop
   12080:	mov    edx,ecx
   12082:	xor    edi,edi
   12084:	mov    DWORD PTR [rsp+0x8],eax
   12088:	shl    edx,0x5
   1208b:	sub    edx,ecx
   1208d:	add    r15d,edx
   12090:	movsxd rsi,r15d
   12093:	call   5990 <qemu_realloc>
   12098:	mov    r8d,DWORD PTR [rsp+0x8]
   1209d:	test   rax,rax
   120a0:	mov    rdi,rax
   120a3:	mov    QWORD PTR [rbx+0x8010],rax
   120aa:	je     127dc <vvfat_open+0xf6c>
   120b0:	mov    DWORD PTR [rbx+0x8018],r15d
   120b7:	mov    edx,r15d
   120ba:	mov    DWORD PTR [rbx+0x801c],r8d
   120c1:	jmp    11c7b <vvfat_open+0x40b>
   120c6:	nop    WORD PTR cs:[rax+rax*1+0x0]
   120d0:	lea    rsi,[rip+0xecc0]        # 20d97 <desc_template.13939+0x4b7>
   120d7:	mov    rdi,r13
   120da:	call   36b0 <strstr@plt>
   120df:	test   rax,rax
   120e2:	je     12658 <vvfat_open+0xde8>
   120e8:	mov    DWORD PTR [rbx+0x800c],0x10
   120f2:	jmp    119c2 <vvfat_open+0x152>
   120f7:	nop    WORD PTR [rax+rax*1+0x0]
   12100:	mov    ecx,DWORD PTR [rbx+0x800c]
   12106:	lea    r8,[rip+0xec66]        # 20d73 <desc_template.13939+0x493>
   1210d:	cmp    ecx,0xc
   12110:	jne    1212e <vvfat_open+0x8be>
   12112:	lea    r8,[rip+0xec60]        # 20d79 <desc_template.13939+0x499>
   12119:	lea    rax,[rip+0xec61]        # 20d81 <desc_template.13939+0x4a1>
   12120:	cmp    DWORD PTR [rbx+0x8070],0xb40
   1212a:	cmovne r8,rax
   1212e:	mov    rdi,QWORD PTR [rip+0x181cb]        # 2a300 <stderr@@GLIBC_2.2.5>
   12135:	lea    rdx,[rip+0xf1a4]        # 212e0 <desc_template.13939+0xa00>
   1213c:	mov    esi,0x1
   12141:	xor    eax,eax
   12143:	call   3660 <__fprintf_chk@plt>
   12148:	mov    r14d,0xffffffff
   1214e:	add    rsp,0x18
   12152:	mov    eax,r14d
   12155:	pop    rbx
   12156:	pop    rbp
   12157:	pop    r12
   12159:	pop    r13
   1215b:	pop    r14
   1215d:	pop    r15
   1215f:	ret
   12160:	test   eax,eax
   12162:	je     12740 <vvfat_open+0xed0>
   12168:	mov    rdx,QWORD PTR [rbx+0x8040]
   1216f:	mov    ecx,DWORD PTR [rbx+0x801c]
   12175:	mov    eax,DWORD PTR [rdx+0x4]
   12178:	imul   eax,DWORD PTR [rbx+0x805c]
   1217f:	mov    DWORD PTR [rbx+0x8064],eax
   12185:	mov    eax,DWORD PTR [rdx+0x4]
   12188:	mov    edx,DWORD PTR [rbx+0x800c]
   1218e:	mov    DWORD PTR [rbx+0x8068],eax
   12194:	mov    eax,DWORD PTR [rbx+0x8078]
   1219a:	cmp    edx,0x20
   1219d:	je     12690 <vvfat_open+0xe20>
   121a3:	cmp    edx,0x10
   121a6:	je     12520 <vvfat_open+0xcb0>
   121ac:	test   ecx,ecx
   121ae:	je     12740 <vvfat_open+0xed0>
   121b4:	mov    rcx,QWORD PTR [rbx+0x8010]
   121bb:	movzx  edx,BYTE PTR [rcx+0x1]
   121bf:	mov    BYTE PTR [rcx],al
   121c1:	shr    eax,0x8
   121c4:	and    eax,0xf
   121c7:	and    edx,0xfffffff0
   121ca:	or     eax,edx
   121cc:	mov    BYTE PTR [rcx+0x1],al
   121cf:	mov    edx,DWORD PTR [rbx+0x800c]
   121d5:	mov    eax,DWORD PTR [rbx+0x8078]
   121db:	mov    ecx,DWORD PTR [rbx+0x801c]
   121e1:	cmp    edx,0x20
   121e4:	je     126b0 <vvfat_open+0xe40>
   121ea:	cmp    edx,0x10
   121ed:	je     12720 <vvfat_open+0xeb0>
   121f3:	cmp    ecx,0x1
   121f6:	jbe    12740 <vvfat_open+0xed0>
   121fc:	mov    edx,DWORD PTR [rbx+0x8020]
   12202:	add    rdx,QWORD PTR [rbx+0x8010]
   12209:	mov    esi,eax
   1220b:	shr    eax,0x4
   1220e:	movzx  ecx,BYTE PTR [rdx]
   12211:	shl    esi,0x4
   12214:	mov    BYTE PTR [rdx+0x1],al
   12217:	and    ecx,0xf
   1221a:	or     ecx,esi
   1221c:	mov    BYTE PTR [rdx],cl
   1221e:	mov    eax,DWORD PTR [rbx+0x8]
   12221:	mov    r11d,0x3eeb
   12227:	mov    ebp,0x200
   1222c:	movabs rsi,0x20202020554d4551
   12236:	mov    QWORD PTR [rbx+0x8080],0x0
   12241:	mov    r15d,0x1
   12247:	mov    ecx,0x0
   1224c:	add    eax,0x7fffff
   12251:	shl    eax,0x9
   12254:	add    rax,r13
   12257:	mov    WORD PTR [rax],r11w
   1225b:	mov    BYTE PTR [rax+0x2],0x90
   1225f:	mov    QWORD PTR [rax+0x3],rsi
   12263:	mov    WORD PTR [rax+0xb],bp
   12267:	mov    edx,DWORD PTR [rbx+0x805c]
   1226d:	mov    WORD PTR [rax+0xe],r15w
   12272:	mov    BYTE PTR [rax+0xd],dl
   12275:	mov    BYTE PTR [rax+0x10],0x2
   12279:	movzx  edx,WORD PTR [rbx+0x8064]
   12280:	shl    edx,0x4
   12283:	mov    WORD PTR [rax+0x11],dx
   12287:	mov    edx,DWORD PTR [rbx+0x8070]
   1228d:	cmp    edx,0x10000
   12293:	cmovae edx,ecx
   12296:	mov    WORD PTR [rax+0x13],dx
   1229a:	mov    edx,0xfffffff8
   1229f:	cmp    DWORD PTR [rbx+0x800c],0xc
   122a6:	mov    ecx,edx
   122a8:	je     126d0 <vvfat_open+0xe60>
   122ae:	mov    BYTE PTR [rax+0x15],cl
   122b1:	mov    rcx,QWORD PTR [rbx+0x8010]
   122b8:	mov    r9d,0xfffffabe
   122be:	movabs rsi,0x46565620554d4551
   122c8:	mov    r10d,0x5441
   122ce:	mov    BYTE PTR [rcx],dl
   122d0:	mov    edx,DWORD PTR [rbx+0x8060]
   122d6:	xor    ecx,ecx
   122d8:	mov    WORD PTR [rax+0x16],dx
   122dc:	mov    rdx,QWORD PTR [rbx]
   122df:	mov    edx,DWORD PTR [rdx+0x88c]
   122e5:	mov    WORD PTR [rax+0x18],dx
   122e9:	mov    rdx,QWORD PTR [rbx]
   122ec:	mov    edx,DWORD PTR [rdx+0x888]
   122f2:	mov    WORD PTR [rax+0x1a],dx
   122f6:	mov    edx,0x3f
   122fb:	cmp    DWORD PTR [rbx+0x8],0x1
   122ff:	cmove  edx,ecx
   12302:	mov    DWORD PTR [rax+0x1c],edx
   12305:	mov    edx,DWORD PTR [rbx+0x8070]
   1230b:	cmp    edx,0xffff
   12311:	cmovbe edx,ecx
   12314:	mov    ecx,0xffffff80
   12319:	mov    DWORD PTR [rax+0x20],edx
   1231c:	mov    edx,0x0
   12321:	cmp    DWORD PTR [rbx+0x800c],0xc
   12328:	cmovne edx,ecx
   1232b:	mov    DWORD PTR [rax+0x25],0x1afd2900
   12332:	mov    WORD PTR [rax+0x29],r9w
   12337:	mov    BYTE PTR [rax+0x24],dl
   1233a:	movabs rdx,0x2020203231544146
   12344:	mov    QWORD PTR [rax+0x2b],rsi
   12348:	mov    WORD PTR [rax+0x33],r10w
   1234d:	mov    BYTE PTR [rax+0x35],0x20
   12351:	mov    ecx,DWORD PTR [rbx+0x800c]
   12357:	cmp    ecx,0xc
   1235a:	je     12377 <vvfat_open+0xb07>
   1235c:	movabs rdx,0x2020203631544146
   12366:	cmp    ecx,0x10
   12369:	movabs rcx,0x2020203233544146
   12373:	cmovne rdx,rcx
   12377:	mov    r8d,0xffffaa55
   1237d:	mov    QWORD PTR [rax+0x36],rdx
   12381:	mov    WORD PTR [rax+0x1fe],r8w
   12389:	mov    eax,DWORD PTR [rbx+0x805c]
   1238f:	imul   eax,DWORD PTR [rbx+0x8074]
   12396:	add    eax,DWORD PTR [rbx+0x806c]
   1239c:	cmp    DWORD PTR [rbx+0x8],0x40
   123a0:	mov    esi,eax
   123a2:	mov    DWORD PTR [rbx+0x8070],eax
   123a8:	je     12540 <vvfat_open+0xcd0>
   123ae:	test   r14d,r14d
   123b1:	je     1214e <vvfat_open+0x8de>
   123b7:	mov    DWORD PTR [r12+0x884],0x0
   123c3:	xor    r14d,r14d
   123c6:	mov    QWORD PTR [r12+0x888],0x0
   123d2:	jmp    1214e <vvfat_open+0x8de>
   123d7:	nop    WORD PTR [rax+rax*1+0x0]
   123e0:	call   36e0 <__ctype_b_loc@plt>
   123e5:	lea    rbp,[r13+r15*1-0x1]
   123ea:	movzx  edx,BYTE PTR [rbp+0x0]
   123ee:	mov    rax,QWORD PTR [rax]
   123f1:	test   BYTE PTR [rax+rdx*2+0x1],0x4
   123f6:	jne    11b24 <vvfat_open+0x2b4>
   123fc:	jmp    11b1f <vvfat_open+0x2af>
   12401:	nop    DWORD PTR [rax+0x0]
   12408:	mov    DWORD PTR [rbx+0x8020],0x1
   12412:	mov    eax,DWORD PTR [rbx+0x8060]
   12418:	mov    QWORD PTR [rbx+0x8010],0x0
   12423:	mov    QWORD PTR [rbx+0x8018],0x0
   1242e:	lea    eax,[rax+rax*2]
   12431:	shl    eax,0x9
   12434:	cmp    eax,0x1
   12437:	jbe    11c77 <vvfat_open+0x407>
   1243d:	shr    eax,1
   1243f:	xor    edi,edi
   12441:	lea    r15d,[rax+0x1f]
   12445:	mov    DWORD PTR [rsp+0x8],eax
   12449:	movsxd rsi,r15d
   1244c:	call   5990 <qemu_realloc>
   12451:	mov    edx,DWORD PTR [rsp+0x8]
   12455:	test   rax,rax
   12458:	mov    rdi,rax
   1245b:	mov    QWORD PTR [rbx+0x8010],rax
   12462:	je     127dc <vvfat_open+0xf6c>
   12468:	mov    DWORD PTR [rbx+0x801c],edx
   1246e:	mov    edx,r15d
   12471:	mov    DWORD PTR [rbx+0x8018],r15d
   12478:	jmp    11c7b <vvfat_open+0x40b>
   1247d:	nop    DWORD PTR [rax]
   12480:	mov    esi,eax
   12482:	mov    rdi,QWORD PTR [rbx+0x8040]
   12489:	mov    DWORD PTR [rsp+0xc],edx
   1248d:	shl    esi,0x5
   12490:	sub    esi,eax
   12492:	add    ecx,esi
   12494:	movsxd rsi,ecx
   12497:	mov    DWORD PTR [rsp+0x8],ecx
   1249b:	call   5990 <qemu_realloc>
   124a0:	mov    QWORD PTR [rbx+0x8040],rax
   124a7:	test   rax,rax
   124aa:	je     37ac <vvfat_open.cold.15+0xa>
   124b0:	mov    ecx,DWORD PTR [rsp+0x8]
   124b4:	mov    edx,DWORD PTR [rsp+0xc]
   124b8:	mov    DWORD PTR [rbx+0x8048],ecx
   124be:	jmp    11cfe <vvfat_open+0x48e>
   124c3:	nop    DWORD PTR [rax+rax*1+0x0]
   124c8:	mov    eax,DWORD PTR [r12+0x888]
   124d0:	xor    r14d,r14d
   124d3:	imul   eax,DWORD PTR [r12+0x884]
   124dc:	imul   eax,DWORD PTR [r12+0x88c]
   124e5:	jmp    1197d <vvfat_open+0x10d>
   124ea:	nop    WORD PTR [rax+rax*1+0x0]
   124f0:	mov    DWORD PTR [rbx+0x8078],0xfffffff
   124fa:	jmp    11cb0 <vvfat_open+0x440>
   124ff:	nop
   12500:	mov    DWORD PTR [rbx+0x8078],0xffff
   1250a:	jmp    11cb0 <vvfat_open+0x440>
   1250f:	nop
   12510:	mov    BYTE PTR [rdx],0x0
   12513:	mov    rax,QWORD PTR [r15+0x18]
   12517:	jmp    11d95 <vvfat_open+0x525>
   1251c:	nop    DWORD PTR [rax+0x0]
   12520:	test   ecx,ecx
   12522:	je     12740 <vvfat_open+0xed0>
   12528:	mov    rdx,QWORD PTR [rbx+0x8010]
   1252f:	mov    WORD PTR [rdx],ax
   12532:	jmp    121cf <vvfat_open+0x95f>
   12537:	nop    WORD PTR [rax+rax*1+0x0]
   12540:	lea    rdi,[r13+0x8]
   12544:	mov    QWORD PTR [rbx+0xc],0x0
   1254c:	xor    eax,eax
   1254e:	mov    QWORD PTR [r13+0x1f8],0x0
   12559:	and    rdi,0xfffffffffffffff8
   1255d:	sub    r13,rdi
   12560:	lea    ecx,[r13+0x200]
   12567:	shr    ecx,0x3
   1256a:	rep stos QWORD PTR es:[rdi],rax
   1256d:	mov    BYTE PTR [rbx+0x1ca],0x80
   12574:	mov    eax,0x3f
   12579:	mov    DWORD PTR [rbx+0x1c4],0xbe1afdfa
   12583:	cdq
   12584:	mov    rcx,QWORD PTR [rbx]
   12587:	idiv   DWORD PTR [rcx+0x88c]
   1258d:	mov    edi,edx
   1258f:	cdq
   12590:	idiv   DWORD PTR [rcx+0x888]
   12596:	cmp    eax,DWORD PTR [rcx+0x884]
   1259c:	jge    12780 <vvfat_open+0xf10>
   125a2:	mov    BYTE PTR [rbx+0x1cb],dl
   125a8:	mov    edx,eax
   125aa:	add    edi,0x1
   125ad:	xor    r8d,r8d
   125b0:	sar    edx,0x8
   125b3:	mov    BYTE PTR [rbx+0x1cd],al
   125b9:	shl    edx,0x6
   125bc:	or     edi,edx
   125be:	mov    BYTE PTR [rbx+0x1cc],dil
   125c5:	mov    eax,esi
   125c7:	cdq
   125c8:	idiv   DWORD PTR [rcx+0x88c]
   125ce:	mov    edi,edx
   125d0:	cdq
   125d1:	idiv   DWORD PTR [rcx+0x888]
   125d7:	cmp    eax,DWORD PTR [rcx+0x884]
   125dd:	jge    12760 <vvfat_open+0xef0>
   125e3:	mov    BYTE PTR [rbx+0x1cf],dl
   125e9:	mov    edx,eax
   125eb:	add    edi,0x1
   125ee:	sar    edx,0x8
   125f1:	mov    BYTE PTR [rbx+0x1d1],al
   125f7:	shl    edx,0x6
   125fa:	or     edi,edx
   125fc:	mov    BYTE PTR [rbx+0x1d0],dil
   12603:	mov    edx,DWORD PTR [rbx+0x800c]
   12609:	lea    eax,[rsi-0x3f]
   1260c:	mov    DWORD PTR [rbx+0x1d2],0x3f
   12616:	mov    DWORD PTR [rbx+0x1d6],eax
   1261c:	mov    eax,0x1
   12621:	cmp    edx,0xc
   12624:	je     1263b <vvfat_open+0xdcb>
   12626:	lea    eax,[r8+0xb]
   1262a:	cmp    edx,0x10
   1262d:	jne    1263b <vvfat_open+0xdcb>
   1262f:	cmp    r8d,0x1
   12633:	sbb    eax,eax
   12635:	and    eax,0xfffffff8
   12638:	add    eax,0xe
   1263b:	mov    BYTE PTR [rbx+0x1ce],al
   12641:	mov    eax,0xffffaa55
   12646:	mov    WORD PTR [rbx+0x20a],ax
   1264d:	jmp    123ae <vvfat_open+0xb3e>
   12652:	nop    WORD PTR [rax+rax*1+0x0]
   12658:	lea    rsi,[rip+0xe73d]        # 20d9c <desc_template.13939+0x4bc>
   1265f:	mov    rdi,r13
   12662:	call   36b0 <strstr@plt>
   12667:	test   rax,rax
   1266a:	je     119c2 <vvfat_open+0x152>
   12670:	mov    DWORD PTR [rbx+0x800c],0xc
   1267a:	mov    DWORD PTR [rbx+0x8070],0xb40
   12684:	jmp    119c2 <vvfat_open+0x152>
   12689:	nop    DWORD PTR [rax+0x0]
   12690:	test   ecx,ecx
   12692:	je     12740 <vvfat_open+0xed0>
   12698:	mov    rdx,QWORD PTR [rbx+0x8010]
   1269f:	mov    DWORD PTR [rdx],eax
   126a1:	jmp    121cf <vvfat_open+0x95f>
   126a6:	nop    WORD PTR cs:[rax+rax*1+0x0]
   126b0:	cmp    ecx,0x1
   126b3:	jbe    12740 <vvfat_open+0xed0>
   126b9:	mov    edx,DWORD PTR [rbx+0x8020]
   126bf:	mov    rcx,QWORD PTR [rbx+0x8010]
   126c6:	mov    DWORD PTR [rcx+rdx*1],eax
   126c9:	jmp    1221e <vvfat_open+0x9ae>
   126ce:	xchg   ax,ax
   126d0:	cmp    DWORD PTR [rbx+0x8070],0x1680
   126da:	jne    122ae <vvfat_open+0xa3e>
   126e0:	mov    edx,0xfffffff9
   126e5:	mov    ecx,edx
   126e7:	jmp    122ae <vvfat_open+0xa3e>
   126ec:	nop    DWORD PTR [rax+0x0]
   126f0:	mov    rcx,QWORD PTR [rbp+0x18]
   126f4:	mov    rdi,QWORD PTR [rip+0x17c05]        # 2a300 <stderr@@GLIBC_2.2.5>
   126fb:	lea    rdx,[rip+0xe6ab]        # 20dad <desc_template.13939+0x4cd>
   12702:	xor    eax,eax
   12704:	mov    esi,0x1
   12709:	mov    r14d,0xffffffff
   1270f:	call   3660 <__fprintf_chk@plt>
   12714:	jmp    1214e <vvfat_open+0x8de>
   12719:	nop    DWORD PTR [rax+0x0]
   12720:	cmp    ecx,0x1
   12723:	jbe    12740 <vvfat_open+0xed0>
   12725:	mov    edx,DWORD PTR [rbx+0x8020]
   1272b:	mov    rcx,QWORD PTR [rbx+0x8010]
   12732:	mov    WORD PTR [rcx+rdx*1],ax
   12736:	jmp    1221e <vvfat_open+0x9ae>
   1273b:	nop    DWORD PTR [rax+rax*1+0x0]
   12740:	lea    rcx,[rip+0xed29]        # 21470 <__PRETTY_FUNCTION__.13830>
   12747:	mov    edx,0x60
   1274c:	lea    rsi,[rip+0xe393]        # 20ae6 <desc_template.13939+0x206>
   12753:	lea    rdi,[rip+0xe3c1]        # 20b1b <desc_template.13939+0x23b>
   1275a:	call   3230 <__assert_fail@plt>
   1275f:	nop
   12760:	mov    edx,0xffffffff
   12765:	mov    BYTE PTR [rbx+0x1d1],0xff
   1276c:	mov    r8d,0x1
   12772:	mov    WORD PTR [rbx+0x1cf],dx
   12779:	jmp    12603 <vvfat_open+0xd93>
   1277e:	xchg   ax,ax
   12780:	mov    edi,0xffffffff
   12785:	mov    BYTE PTR [rbx+0x1cd],0xff
   1278c:	mov    r8d,0x1
   12792:	mov    WORD PTR [rbx+0x1cb],di
   12799:	jmp    125c5 <vvfat_open+0xd55>
   1279e:	lea    rcx,[rip+0xeb7b]        # 21320 <__PRETTY_FUNCTION__.14216>
   127a5:	mov    edx,0x3a4
   127aa:	lea    rsi,[rip+0xe335]        # 20ae6 <desc_template.13939+0x206>
   127b1:	lea    rdi,[rip+0xe377]        # 20b2f <desc_template.13939+0x24f>
   127b8:	call   3230 <__assert_fail@plt>
   127bd:	lea    rcx,[rip+0xeb5c]        # 21320 <__PRETTY_FUNCTION__.14216>
   127c4:	mov    edx,0x395
   127c9:	lea    rsi,[rip+0xe316]        # 20ae6 <desc_template.13939+0x206>
   127d0:	lea    rdi,[rip+0xeae9]        # 212c0 <desc_template.13939+0x9e0>
   127d7:	call   3230 <__assert_fail@plt>
   127dc:	mov    edx,DWORD PTR [rbx+0x8018]
   127e2:	jmp    11c7b <vvfat_open+0x40b>
   127e7:	lea    rcx,[rip+0xeb4a]        # 21338 <__PRETTY_FUNCTION__.14237>
   127ee:	mov    edx,0x42b
   127f3:	lea    rsi,[rip+0xe2ec]        # 20ae6 <desc_template.13939+0x206>
   127fa:	lea    rdi,[rip+0xe5a5]        # 20da6 <desc_template.13939+0x4c6>
   12801:	call   3230 <__assert_fail@plt>
   12806:	nop    WORD PTR cs:[rax+rax*1+0x0]

0000000000012810 <qcow_make_empty>:
   12810:	xor    eax,eax
   12812:	ret
   12813:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   1281e:	xchg   ax,ax

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

0000000000012a40 <get_refcount.isra.4>:
   12a40:	mov    eax,DWORD PTR [rdi+0x8]
   12a43:	mov    rdx,rsi
   12a46:	lea    ecx,[rax-0x1]
   12a49:	xor    eax,eax
   12a4b:	sar    rdx,cl
   12a4e:	cmp    DWORD PTR [rdi+0x138],edx
   12a54:	jbe    12ad0 <get_refcount.isra.4+0x90>
   12a56:	push   r12
   12a58:	movsxd rdx,edx
   12a5b:	push   rbp
   12a5c:	push   rbx
   12a5d:	mov    r8,QWORD PTR [rdi+0x128]
   12a64:	mov    r12,QWORD PTR [r8+rdx*8]
   12a68:	test   r12,r12
   12a6b:	je     12ac3 <get_refcount.isra.4+0x83>
   12a6d:	mov    rbp,rsi
   12a70:	mov    rbx,rdi
   12a73:	mov    rdx,QWORD PTR [rdi+0x148]
   12a7a:	cmp    r12,QWORD PTR [rdi+0x140]
   12a81:	je     12aaa <get_refcount.isra.4+0x6a>
   12a83:	mov    ecx,DWORD PTR [rdi+0xc]
   12a86:	mov    rdi,QWORD PTR [rdi]
   12a89:	mov    rsi,r12
   12a8c:	call   18b00 <bdrv_pread>
   12a91:	cmp    eax,DWORD PTR [rbx+0xc]
   12a94:	jne    12ad1 <get_refcount.isra.4+0x91>
   12a96:	mov    eax,DWORD PTR [rbx+0x8]
   12a99:	mov    QWORD PTR [rbx+0x140],r12
   12aa0:	mov    rdx,QWORD PTR [rbx+0x148]
   12aa7:	lea    ecx,[rax-0x1]
   12aaa:	mov    eax,0x1
   12aaf:	shl    eax,cl
   12ab1:	sub    eax,0x1
   12ab4:	and    eax,ebp
   12ab6:	cdqe
   12ab8:	movzx  eax,WORD PTR [rdx+rax*2]
   12abc:	rol    ax,0x8
   12ac0:	movzx  eax,ax
   12ac3:	pop    rbx
   12ac4:	pop    rbp
   12ac5:	pop    r12
   12ac7:	ret
   12ac8:	nop    DWORD PTR [rax+rax*1+0x0]
   12ad0:	ret
   12ad1:	mov    eax,0x1
   12ad6:	jmp    12ac3 <get_refcount.isra.4+0x83>
   12ad8:	nop    DWORD PTR [rax+rax*1+0x0]

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

0000000000013680 <qcow_aio_read_bh>:
   13680:	push   rbx
   13681:	mov    rbx,rdi
   13684:	mov    rdi,QWORD PTR [rdi+0x58]
   13688:	call   5180 <qemu_bh_delete>
   1368d:	mov    QWORD PTR [rbx+0x58],0x0
   13695:	mov    rdi,rbx
   13698:	xor    esi,esi
   1369a:	pop    rbx
   1369b:	jmp    133d0 <qcow_aio_read_cb>

00000000000136a0 <create_refcount_update>:
   136a0:	mov    eax,DWORD PTR [rdi]
   136a2:	neg    eax
   136a4:	cdqe
   136a6:	mov    r8,rax
   136a9:	and    r8,rsi
   136ac:	lea    rsi,[rsi+rdx*1-0x1]
   136b1:	and    rsi,rax
   136b4:	cmp    r8,rsi
   136b7:	jg     136ed <create_refcount_update+0x4d>
   136b9:	nop    DWORD PTR [rax+0x0]
   136c0:	mov    ecx,DWORD PTR [rdi+0x4]
   136c3:	mov    rax,QWORD PTR [rdi+0x8]
   136c7:	mov    rdx,r8
   136ca:	sar    rdx,cl
   136cd:	lea    rdx,[rax+rdx*2]
   136d1:	movzx  eax,WORD PTR [rdx]
   136d4:	rol    ax,0x8
   136d8:	add    eax,0x1
   136db:	rol    ax,0x8
   136df:	mov    WORD PTR [rdx],ax
   136e2:	movsxd rax,DWORD PTR [rdi]
   136e5:	add    r8,rax
   136e8:	cmp    rsi,r8
   136eb:	jge    136c0 <create_refcount_update+0x20>
   136ed:	ret
   136ee:	xchg   ax,ax

00000000000136f0 <qcow_create>:
   136f0:	push   r15
   136f2:	pxor   xmm0,xmm0
   136f6:	push   r14
   136f8:	mov    r14,rdx
   136fb:	mov    edx,0x1a4
   13700:	push   r13
   13702:	push   r12
   13704:	mov    r12d,ecx
   13707:	push   rbp
   13708:	mov    rbp,rsi
   1370b:	mov    esi,0x241
   13710:	push   rbx
   13711:	sub    rsp,0xb8
   13718:	mov    rax,QWORD PTR fs:0x28
   13721:	mov    QWORD PTR [rsp+0xa8],rax
   13729:	xor    eax,eax
   1372b:	movaps XMMWORD PTR [rsp+0x30],xmm0
   13730:	movaps XMMWORD PTR [rsp+0x40],xmm0
   13735:	movaps XMMWORD PTR [rsp+0x50],xmm0
   1373a:	call   3500 <open64@plt>
   1373f:	test   eax,eax
   13741:	js     13a4b <qcow_create+0x35b>
   13747:	mov    ebx,eax
   13749:	shl    rbp,0x9
   1374d:	pxor   xmm0,xmm0
   13751:	lea    r15,[rsp+0x60]
   13756:	movabs rax,0x2000000fb494651
   13760:	movups XMMWORD PTR [rsp+0x68],xmm0
   13765:	mov    QWORD PTR [rsp+0x60],rax
   1376a:	mov    rax,rbp
   1376d:	movups XMMWORD PTR [r15+0x18],xmm0
   13772:	bswap  rax
   13775:	movups XMMWORD PTR [r15+0x28],xmm0
   1377a:	movups XMMWORD PTR [r15+0x38],xmm0
   1377f:	mov    QWORD PTR [rsp+0x78],rax
   13784:	test   r14,r14
   13787:	je     13a20 <qcow_create+0x330>
   1378d:	movabs rax,0x4800000000000000
   13797:	mov    rdi,r14
   1379a:	mov    QWORD PTR [rsp+0x68],rax
   1379f:	call   31b0 <strlen@plt>
   137a4:	mov    edx,eax
   137a6:	mov    DWORD PTR [rsp+0x1c],eax
   137aa:	add    eax,0x4f
   137ad:	and    eax,0xfffffff8
   137b0:	bswap  edx
   137b2:	mov    DWORD PTR [rsp+0x70],edx
   137b6:	cdqe
   137b8:	mov    QWORD PTR [rsp+0x10],rax
   137bd:	add    rax,0xfff
   137c3:	and    rax,0xfffffffffffff000
   137c9:	mov    rdx,rax
   137cc:	mov    r13,rax
   137cf:	bswap  rdx
   137d2:	movabs rsi,0xc00001000
   137dc:	and    r12d,0x1
   137e0:	mov    DWORD PTR [rsp+0x74],0xc000000
   137e8:	mov    QWORD PTR [rsp+0x30],rsi
   137ed:	jne    13a08 <qcow_create+0x318>
   137f3:	add    rbp,0x1fffff
   137fa:	mov    QWORD PTR [rsp+0x48],rax
   137ff:	mov    edi,0x1000
   13804:	sar    rbp,0x15
   13808:	mov    QWORD PTR [rsp+0x88],rdx
   13810:	mov    eax,ebp
   13812:	mov    r12d,ebp
   13815:	bswap  eax
   13817:	mov    DWORD PTR [rsp+0x84],eax
   1381e:	movsxd rax,ebp
   13821:	shl    rax,0x3
   13825:	lea    rsi,[rax+0xfff]
   1382c:	mov    QWORD PTR [rsp+0x8],rax
   13831:	and    rsi,0xfffffffffffff000
   13838:	add    r13,rsi
   1383b:	call   59c0 <qemu_mallocz>
   13840:	movsxd rsi,DWORD PTR [rsp+0x30]
   13845:	mov    rdx,r13
   13848:	mov    ecx,DWORD PTR [rsp+0x34]
   1384c:	bswap  rdx
   1384f:	mov    QWORD PTR [rsp+0x50],r13
   13854:	mov    rdi,rsi
   13857:	add    rsi,r13
   1385a:	mov    QWORD PTR [rsp+0x90],rdx
   13862:	mov    rdx,rsi
   13865:	mov    QWORD PTR [rsp+0x40],rax
   1386a:	shr    rdx,cl
   1386d:	sub    ecx,0x1
   13870:	mov    QWORD PTR [rsp+0x58],rsi
   13875:	mov    QWORD PTR [rsp+0x28],rdx
   1387a:	shr    rdx,cl
   1387d:	mov    DWORD PTR [rsp+0x98],0x1000000
   13888:	lea    r13d,[rdx+0x1]
   1388c:	test   r13d,r13d
   1388f:	jle    138c3 <qcow_create+0x1d3>
   13891:	mov    edx,edx
   13893:	lea    r8,[rdx*8+0x8]
   1389b:	xor    edx,edx
   1389d:	jmp    138a5 <qcow_create+0x1b5>
   1389f:	nop
   138a0:	mov    rax,QWORD PTR [rsp+0x40]
   138a5:	mov    rcx,rsi
   138a8:	bswap  rcx
   138ab:	mov    QWORD PTR [rax+rdx*1],rcx
   138af:	movsxd rax,DWORD PTR [rsp+0x30]
   138b4:	add    rdx,0x8
   138b8:	mov    rdi,rax
   138bb:	add    rsi,rax
   138be:	cmp    r8,rdx
   138c1:	jne    138a0 <qcow_create+0x1b0>
   138c3:	imul   edi,r13d
   138c7:	movsxd rdi,edi
   138ca:	call   59c0 <qemu_mallocz>
   138cf:	lea    r9,[rsp+0x30]
   138d4:	mov    rdx,QWORD PTR [rsp+0x10]
   138d9:	xor    esi,esi
   138db:	mov    rdi,r9
   138de:	mov    QWORD PTR [rsp+0x38],rax
   138e3:	call   136a0 <create_refcount_update>
   138e8:	mov    rdx,QWORD PTR [rsp+0x8]
   138ed:	mov    rsi,QWORD PTR [rsp+0x48]
   138f2:	call   136a0 <create_refcount_update>
   138f7:	movsxd rdx,DWORD PTR [rsp+0x30]
   138fc:	mov    rsi,QWORD PTR [rsp+0x50]
   13901:	call   136a0 <create_refcount_update>
   13906:	mov    edx,DWORD PTR [rsp+0x30]
   1390a:	mov    rsi,QWORD PTR [rsp+0x58]
   1390f:	imul   edx,r13d
   13913:	movsxd rdx,edx
   13916:	call   136a0 <create_refcount_update>
   1391b:	mov    edx,0x48
   13920:	mov    rsi,r15
   13923:	mov    edi,ebx
   13925:	call   3160 <write@plt>
   1392a:	test   r14,r14
   1392d:	je     1393e <qcow_create+0x24e>
   1392f:	movsxd rdx,DWORD PTR [rsp+0x1c]
   13934:	mov    rsi,r14
   13937:	mov    edi,ebx
   13939:	call   3160 <write@plt>
   1393e:	mov    rsi,QWORD PTR [rsp+0x48]
   13943:	xor    edx,edx
   13945:	mov    edi,ebx
   13947:	xor    r14d,r14d
   1394a:	lea    r15,[rsp+0x28]
   1394f:	call   3650 <lseek64@plt>
   13954:	mov    QWORD PTR [rsp+0x28],0x0
   1395d:	test   ebp,ebp
   1395f:	jle    13980 <qcow_create+0x290>
   13961:	nop    DWORD PTR [rax+0x0]
   13968:	mov    edx,0x8
   1396d:	mov    rsi,r15
   13970:	mov    edi,ebx
   13972:	add    r14d,0x1
   13976:	call   3160 <write@plt>
   1397b:	cmp    r12d,r14d
   1397e:	jne    13968 <qcow_create+0x278>
   13980:	mov    rsi,QWORD PTR [rsp+0x50]
   13985:	xor    edx,edx
   13987:	mov    edi,ebx
   13989:	call   3650 <lseek64@plt>
   1398e:	movsxd rdx,DWORD PTR [rsp+0x30]
   13993:	mov    rsi,QWORD PTR [rsp+0x40]
   13998:	mov    edi,ebx
   1399a:	call   3160 <write@plt>
   1399f:	mov    rsi,QWORD PTR [rsp+0x58]
   139a4:	xor    edx,edx
   139a6:	mov    edi,ebx
   139a8:	call   3650 <lseek64@plt>
   139ad:	imul   r13d,DWORD PTR [rsp+0x30]
   139b3:	mov    rsi,QWORD PTR [rsp+0x38]
   139b8:	mov    edi,ebx
   139ba:	movsxd rdx,r13d
   139bd:	call   3160 <write@plt>
   139c2:	mov    rdi,QWORD PTR [rsp+0x40]
   139c7:	call   5960 <qemu_free>
   139cc:	mov    rdi,QWORD PTR [rsp+0x38]
   139d1:	call   5960 <qemu_free>
   139d6:	mov    edi,ebx
   139d8:	call   3270 <close@plt>
   139dd:	xor    eax,eax
   139df:	mov    rbx,QWORD PTR [rsp+0xa8]
   139e7:	xor    rbx,QWORD PTR fs:0x28
   139f0:	jne    13a52 <qcow_create+0x362>
   139f2:	add    rsp,0xb8
   139f9:	pop    rbx
   139fa:	pop    rbp
   139fb:	pop    r12
   139fd:	pop    r13
   139ff:	pop    r14
   13a01:	pop    r15
   13a03:	ret
   13a04:	nop    DWORD PTR [rax+0x0]
   13a08:	mov    DWORD PTR [rsp+0x80],0x1000000
   13a13:	jmp    137f3 <qcow_create+0x103>
   13a18:	nop    DWORD PTR [rax+rax*1+0x0]
   13a20:	movabs rdx,0x10000000000000
   13a2a:	mov    eax,0x1000
   13a2f:	mov    r13d,0x1000
   13a35:	mov    QWORD PTR [rsp+0x10],0x48
   13a3e:	mov    DWORD PTR [rsp+0x1c],0x0
   13a46:	jmp    137d2 <qcow_create+0xe2>
   13a4b:	mov    eax,0xffffffff
   13a50:	jmp    139df <qcow_create+0x2ef>
   13a52:	call   31c0 <__stack_chk_fail@plt>
   13a57:	nop    WORD PTR [rax+rax*1+0x0]

0000000000013a60 <qcow_open>:
   13a60:	push   r15
   13a62:	push   r14
   13a64:	push   r13
   13a66:	push   r12
   13a68:	push   rbp
   13a69:	push   rbx
   13a6a:	sub    rsp,0xb8
   13a71:	mov    r15,QWORD PTR [rdi+0x40]
   13a75:	mov    QWORD PTR [rsp+0x18],rdi
   13a7a:	mov    rbx,QWORD PTR fs:0x28
   13a83:	mov    QWORD PTR [rsp+0xa8],rbx
   13a8b:	xor    ebx,ebx
   13a8d:	test   dl,0x80
   13a90:	je     13a98 <qcow_open+0x38>
   13a92:	and    dl,0x7f
   13a95:	or     edx,0x40
   13a98:	mov    rdi,r15
   13a9b:	call   19080 <bdrv_file_open>
   13aa0:	test   eax,eax
   13aa2:	js     13e13 <qcow_open+0x3b3>
   13aa8:	mov    rdi,QWORD PTR [r15]
   13aab:	xor    esi,esi
   13aad:	lea    rdx,[rsp+0x60]
   13ab2:	mov    ecx,0x48
   13ab7:	call   18b00 <bdrv_pread>
   13abc:	cmp    eax,0x48
   13abf:	jne    13ffe <qcow_open+0x59e>
   13ac5:	mov    ecx,DWORD PTR [rsp+0x74]
   13ac9:	mov    eax,DWORD PTR [rsp+0x60]
   13acd:	mov    rsi,QWORD PTR [rsp+0x78]
   13ad2:	mov    edx,ecx
   13ad4:	mov    rcx,QWORD PTR [rsp+0x88]
   13adc:	bswap  eax
   13ade:	mov    DWORD PTR [rsp+0x60],eax
   13ae2:	mov    eax,DWORD PTR [rsp+0x64]
   13ae6:	bswap  rsi
   13ae9:	mov    QWORD PTR [rsp+0x78],rsi
   13aee:	bswap  edx
   13af0:	bswap  rcx
   13af3:	mov    QWORD PTR [rsp+0x88],rcx
   13afb:	mov    ecx,DWORD PTR [rsp+0x84]
   13b02:	bswap  eax
   13b04:	mov    DWORD PTR [rsp+0x64],eax
   13b08:	mov    rax,QWORD PTR [rsp+0x68]
   13b0d:	bswap  ecx
   13b0f:	mov    DWORD PTR [rsp+0x84],ecx
   13b16:	mov    rcx,QWORD PTR [rsp+0x90]
   13b1e:	bswap  rax
   13b21:	mov    QWORD PTR [rsp+0x68],rax
   13b26:	mov    eax,DWORD PTR [rsp+0x70]
   13b2a:	bswap  rcx
   13b2d:	mov    QWORD PTR [rsp+0x90],rcx
   13b35:	mov    ecx,DWORD PTR [rsp+0x98]
   13b3c:	bswap  eax
   13b3e:	mov    DWORD PTR [rsp+0x70],eax
   13b42:	mov    eax,DWORD PTR [rsp+0x80]
   13b49:	bswap  ecx
   13b4b:	mov    DWORD PTR [rsp+0x98],ecx
   13b52:	mov    rcx,QWORD PTR [rsp+0xa0]
   13b5a:	bswap  eax
   13b5c:	cmp    eax,0x1
   13b5f:	mov    DWORD PTR [rsp+0x74],edx
   13b63:	bswap  rcx
   13b66:	mov    QWORD PTR [rsp+0xa0],rcx
   13b6e:	mov    ecx,DWORD PTR [rsp+0x9c]
   13b75:	mov    DWORD PTR [rsp+0x80],eax
   13b7c:	bswap  ecx
   13b7e:	mov    DWORD PTR [rsp+0x9c],ecx
   13b85:	seta   cl
   13b88:	cmp    rsi,0x1
   13b8c:	setbe  sil
   13b90:	or     ecx,esi
   13b92:	movabs rsi,0x2514649fb
   13b9c:	cmp    QWORD PTR [rsp+0x60],rsi
   13ba1:	setne  sil
   13ba5:	or     cl,sil
   13ba8:	jne    13ffe <qcow_open+0x59e>
   13bae:	lea    esi,[rdx-0x9]
   13bb1:	cmp    esi,0x7
   13bb4:	ja     13ffe <qcow_open+0x59e>
   13bba:	mov    DWORD PTR [r15+0x164],eax
   13bc1:	test   eax,eax
   13bc3:	jne    13e40 <qcow_open+0x3e0>
   13bc9:	mov    eax,0x1
   13bce:	mov    ecx,edx
   13bd0:	mov    DWORD PTR [r15+0x8],edx
   13bd4:	mov    ebx,eax
   13bd6:	shl    ebx,cl
   13bd8:	mov    ecx,esi
   13bda:	mov    rsi,QWORD PTR [rsp+0x18]
   13bdf:	mov    DWORD PTR [r15+0xc],ebx
   13be3:	mov    ebx,eax
   13be5:	shl    ebx,cl
   13be7:	lea    ecx,[rdx-0x3]
   13bea:	mov    edx,eax
   13bec:	shl    edx,cl
   13bee:	mov    DWORD PTR [r15+0x14],ecx
   13bf2:	mov    DWORD PTR [r15+0x10],ebx
   13bf6:	mov    DWORD PTR [r15+0x18],edx
   13bfa:	mov    rdx,QWORD PTR [rsp+0x78]
   13bff:	shr    rdx,0x9
   13c03:	mov    QWORD PTR [rsi],rdx
   13c06:	mov    edx,DWORD PTR [r15+0x8]
   13c0a:	mov    esi,0x46
   13c0f:	lea    ecx,[rdx-0x8]
   13c12:	sub    esi,edx
   13c14:	shl    eax,cl
   13c16:	mov    ecx,esi
   13c18:	mov    DWORD PTR [r15+0x24],esi
   13c1c:	movsxd rdi,DWORD PTR [rsp+0x84]
   13c24:	sub    eax,0x1
   13c27:	mov    DWORD PTR [r15+0x28],eax
   13c2b:	mov    eax,0x1
   13c30:	mov    rbx,rax
   13c33:	shl    rbx,cl
   13c36:	mov    rcx,rbx
   13c39:	sub    rcx,0x1
   13c3d:	mov    QWORD PTR [r15+0x30],rcx
   13c41:	mov    rcx,QWORD PTR [rsp+0x90]
   13c49:	mov    esi,DWORD PTR [rsp+0x98]
   13c50:	mov    QWORD PTR [r15+0x130],rcx
   13c57:	lea    ecx,[rdx-0x3]
   13c5a:	shl    esi,cl
   13c5c:	mov    rcx,QWORD PTR [rsp+0xa0]
   13c64:	mov    DWORD PTR [r15+0x138],esi
   13c6b:	mov    QWORD PTR [r15+0x350],rcx
   13c72:	mov    ecx,DWORD PTR [rsp+0x9c]
   13c79:	mov    DWORD PTR [r15+0x1c],edi
   13c7d:	mov    DWORD PTR [r15+0x35c],ecx
   13c84:	mov    ecx,DWORD PTR [r15+0x14]
   13c88:	add    ecx,edx
   13c8a:	mov    rdx,QWORD PTR [rsp+0x78]
   13c8f:	shl    rax,cl
   13c92:	lea    rax,[rdx+rax*1-0x1]
   13c97:	shr    rax,cl
   13c9a:	mov    DWORD PTR [r15+0x20],eax
   13c9e:	cmp    edi,eax
   13ca0:	jl     13ffe <qcow_open+0x59e>
   13ca6:	mov    rax,QWORD PTR [rsp+0x88]
   13cae:	shl    rdi,0x3
   13cb2:	mov    QWORD PTR [r15+0x38],rax
   13cb6:	call   5970 <qemu_malloc>
   13cbb:	mov    esi,DWORD PTR [r15+0x1c]
   13cbf:	mov    rdi,QWORD PTR [r15]
   13cc2:	mov    QWORD PTR [r15+0x40],rax
   13cc6:	mov    rdx,rax
   13cc9:	lea    ecx,[rsi*8+0x0]
   13cd0:	mov    rsi,QWORD PTR [r15+0x38]
   13cd4:	call   18b00 <bdrv_pread>
   13cd9:	movsxd rdx,DWORD PTR [r15+0x1c]
   13cdd:	cdqe
   13cdf:	mov    rcx,rdx
   13ce2:	shl    rdx,0x3
   13ce6:	cmp    rax,rdx
   13ce9:	jne    13ffe <qcow_open+0x59e>
   13cef:	test   ecx,ecx
   13cf1:	jle    13d13 <qcow_open+0x2b3>
   13cf3:	xor    eax,eax
   13cf5:	nop    DWORD PTR [rax]
   13cf8:	mov    rdx,QWORD PTR [r15+0x40]
   13cfc:	lea    rcx,[rdx+rax*8]
   13d00:	add    rax,0x1
   13d04:	mov    rdx,QWORD PTR [rcx]
   13d07:	bswap  rdx
   13d0a:	mov    QWORD PTR [rcx],rdx
   13d0d:	cmp    DWORD PTR [r15+0x1c],eax
   13d11:	jg     13cf8 <qcow_open+0x298>
   13d13:	mov    edi,DWORD PTR [r15+0x18]
   13d17:	shl    edi,0x4
   13d1a:	movsxd rdi,edi
   13d1d:	shl    rdi,0x3
   13d21:	call   5970 <qemu_malloc>
   13d26:	movsxd rdi,DWORD PTR [r15+0xc]
   13d2a:	mov    QWORD PTR [r15+0x48],rax
   13d2e:	call   5970 <qemu_malloc>
   13d33:	mov    QWORD PTR [r15+0x110],rax
   13d3a:	mov    eax,DWORD PTR [r15+0xc]
   13d3e:	lea    edi,[rax+0x10]
   13d41:	shl    edi,0x5
   13d44:	movsxd rdi,edi
   13d47:	call   5970 <qemu_malloc>
   13d4c:	mov    QWORD PTR [r15+0x120],0xffffffffffffffff
   13d57:	mov    QWORD PTR [r15+0x118],rax
   13d5e:	mov    rax,QWORD PTR [rsp+0x18]
   13d63:	mov    rbx,QWORD PTR [rax+0x40]
   13d67:	movsxd rdi,DWORD PTR [rbx+0xc]
   13d6b:	call   5970 <qemu_malloc>
   13d70:	mov    QWORD PTR [rbx+0x148],rax
   13d77:	mov    eax,DWORD PTR [rbx+0x138]
   13d7d:	lea    ebp,[rax*8+0x0]
   13d84:	movsxd rdi,ebp
   13d87:	call   5970 <qemu_malloc>
   13d8c:	mov    ecx,DWORD PTR [rbx+0x138]
   13d92:	mov    QWORD PTR [rbx+0x128],rax
   13d99:	test   ecx,ecx
   13d9b:	jne    14068 <qcow_open+0x608>
   13da1:	mov    rsi,QWORD PTR [rsp+0x68]
   13da6:	test   rsi,rsi
   13da9:	je     13de6 <qcow_open+0x386>
   13dab:	mov    ebx,DWORD PTR [rsp+0x70]
   13daf:	mov    eax,0x3ff
   13db4:	mov    r14,QWORD PTR [rsp+0x18]
   13db9:	mov    rdi,QWORD PTR [r15]
   13dbc:	cmp    ebx,0x3ff
   13dc2:	lea    rdx,[r14+0x448]
   13dc9:	cmovg  ebx,eax
   13dcc:	mov    ecx,ebx
   13dce:	call   18b00 <bdrv_pread>
   13dd3:	cmp    eax,ebx
   13dd5:	jne    13ffe <qcow_open+0x59e>
   13ddb:	cdqe
   13ddd:	mov    BYTE PTR [r14+rax*1+0x448],0x0
   13de6:	mov    rax,QWORD PTR [rsp+0x18]
   13deb:	mov    r12,QWORD PTR [rax+0x40]
   13def:	movsxd rax,DWORD PTR [r12+0x35c]
   13df7:	test   eax,eax
   13df9:	jne    13e58 <qcow_open+0x3f8>
   13dfb:	mov    QWORD PTR [r12+0x360],0x0
   13e07:	mov    DWORD PTR [r12+0x358],0x0
   13e13:	mov    rsi,QWORD PTR [rsp+0xa8]
   13e1b:	xor    rsi,QWORD PTR fs:0x28
   13e24:	jne    140e7 <qcow_open+0x687>
   13e2a:	add    rsp,0xb8
   13e31:	pop    rbx
   13e32:	pop    rbp
   13e33:	pop    r12
   13e35:	pop    r13
   13e37:	pop    r14
   13e39:	pop    r15
   13e3b:	ret
   13e3c:	nop    DWORD PTR [rax+0x0]
   13e40:	mov    rax,QWORD PTR [rsp+0x18]
   13e45:	mov    DWORD PTR [rax+0x14],0x1
   13e4c:	jmp    13bc9 <qcow_open+0x169>
   13e51:	nop    DWORD PTR [rax+0x0]
   13e58:	lea    rdi,[rax*8+0x0]
   13e60:	mov    rbx,QWORD PTR [r12+0x350]
   13e68:	sub    rdi,rax
   13e6b:	shl    rdi,0x3
   13e6f:	call   59c0 <qemu_mallocz>
   13e74:	mov    QWORD PTR [r12+0x360],rax
   13e7c:	mov    eax,DWORD PTR [r12+0x35c]
   13e84:	test   eax,eax
   13e86:	jle    140d0 <qcow_open+0x670>
   13e8c:	lea    rax,[rsp+0x30]
   13e91:	mov    DWORD PTR [rsp+0x10],0x0
   13e99:	mov    QWORD PTR [rsp+0x8],0x0
   13ea2:	mov    QWORD PTR [rsp+0x20],rax
   13ea7:	mov    QWORD PTR [rsp+0x28],r15
   13eac:	jmp    13fc4 <qcow_open+0x564>
   13eb1:	nop    DWORD PTR [rax+0x0]
   13eb8:	mov    rax,QWORD PTR [rsp+0x30]
   13ebd:	mov    r15,QWORD PTR [rsp+0x8]
   13ec2:	add    r15,QWORD PTR [r12+0x360]
   13eca:	bswap  rax
   13ecd:	mov    QWORD PTR [r15],rax
   13ed0:	mov    eax,DWORD PTR [rsp+0x38]
   13ed4:	bswap  eax
   13ed6:	mov    DWORD PTR [r15+0x8],eax
   13eda:	mov    eax,DWORD PTR [rsp+0x50]
   13ede:	movzx  r9d,WORD PTR [rsp+0x3c]
   13ee4:	movzx  ebp,WORD PTR [rsp+0x3e]
   13ee9:	bswap  eax
   13eeb:	mov    DWORD PTR [r15+0x20],eax
   13eef:	mov    eax,DWORD PTR [rsp+0x40]
   13ef3:	rol    r9w,0x8
   13ef8:	rol    bp,0x8
   13efc:	bswap  eax
   13efe:	mov    DWORD PTR [r15+0x24],eax
   13f02:	mov    eax,DWORD PTR [rsp+0x44]
   13f06:	movzx  r13d,r9w
   13f0a:	lea    edi,[r13+0x1]
   13f0e:	mov    DWORD PTR [rsp+0x14],r9d
   13f13:	movzx  r14d,bp
   13f17:	bswap  eax
   13f19:	mov    DWORD PTR [r15+0x28],eax
   13f1d:	mov    rax,QWORD PTR [rsp+0x48]
   13f22:	movsxd rdi,edi
   13f25:	bswap  rax
   13f28:	mov    QWORD PTR [r15+0x30],rax
   13f2c:	mov    eax,DWORD PTR [rsp+0x54]
   13f30:	bswap  eax
   13f32:	mov    eax,eax
   13f34:	lea    rbx,[rbx+rax*1+0x28]
   13f39:	call   5970 <qemu_malloc>
   13f3e:	mov    ecx,r13d
   13f41:	mov    rsi,rbx
   13f44:	mov    QWORD PTR [r15+0x10],rax
   13f48:	mov    rdi,QWORD PTR [r12]
   13f4c:	mov    rdx,rax
   13f4f:	call   18b00 <bdrv_pread>
   13f54:	cmp    r13d,eax
   13f57:	jne    13feb <qcow_open+0x58b>
   13f5d:	mov    r9d,DWORD PTR [rsp+0x14]
   13f62:	mov    rax,QWORD PTR [r15+0x10]
   13f66:	lea    edi,[r14+0x1]
   13f6a:	movsxd rdi,edi
   13f6d:	movzx  r9d,r9w
   13f71:	mov    BYTE PTR [rax+r9*1],0x0
   13f76:	add    rbx,r9
   13f79:	call   5970 <qemu_malloc>
   13f7e:	mov    ecx,r14d
   13f81:	mov    rsi,rbx
   13f84:	mov    QWORD PTR [r15+0x18],rax
   13f88:	mov    rdi,QWORD PTR [r12]
   13f8c:	mov    rdx,rax
   13f8f:	call   18b00 <bdrv_pread>
   13f94:	cmp    r14d,eax
   13f97:	jne    13feb <qcow_open+0x58b>
   13f99:	mov    rax,QWORD PTR [r15+0x18]
   13f9d:	movzx  ebp,bp
   13fa0:	add    DWORD PTR [rsp+0x10],0x1
   13fa5:	add    rbx,rbp
   13fa8:	add    QWORD PTR [rsp+0x8],0x38
   13fae:	mov    BYTE PTR [rax+rbp*1],0x0
   13fb2:	mov    eax,DWORD PTR [rsp+0x10]
   13fb6:	cmp    eax,DWORD PTR [r12+0x35c]
   13fbe:	jge    140d0 <qcow_open+0x670>
   13fc4:	add    rbx,0x7
   13fc8:	mov    rdx,QWORD PTR [rsp+0x20]
   13fcd:	mov    rdi,QWORD PTR [r12]
   13fd1:	mov    ecx,0x28
   13fd6:	and    rbx,0xfffffffffffffff8
   13fda:	mov    rsi,rbx
   13fdd:	call   18b00 <bdrv_pread>
   13fe2:	cmp    eax,0x28
   13fe5:	je     13eb8 <qcow_open+0x458>
   13feb:	mov    rax,QWORD PTR [rsp+0x18]
   13ff0:	mov    r15,QWORD PTR [rsp+0x28]
   13ff5:	mov    rdi,QWORD PTR [rax+0x40]
   13ff9:	call   12c90 <qcow_free_snapshots.isra.7>
   13ffe:	mov    rbx,QWORD PTR [rsp+0x18]
   14003:	mov    rdi,QWORD PTR [rbx+0x40]
   14007:	call   12c90 <qcow_free_snapshots.isra.7>
   1400c:	mov    rbx,QWORD PTR [rbx+0x40]
   14010:	mov    rdi,QWORD PTR [rbx+0x148]
   14017:	call   5960 <qemu_free>
   1401c:	mov    rdi,QWORD PTR [rbx+0x128]
   14023:	call   5960 <qemu_free>
   14028:	mov    rdi,QWORD PTR [r15+0x40]
   1402c:	call   5960 <qemu_free>
   14031:	mov    rdi,QWORD PTR [r15+0x48]
   14035:	call   5960 <qemu_free>
   1403a:	mov    rdi,QWORD PTR [r15+0x110]
   14041:	call   5960 <qemu_free>
   14046:	mov    rdi,QWORD PTR [r15+0x118]
   1404d:	call   5960 <qemu_free>
   14052:	mov    rdi,QWORD PTR [r15]
   14055:	call   18130 <bdrv_delete>
   1405a:	mov    eax,0xffffffff
   1405f:	jmp    13e13 <qcow_open+0x3b3>
   14064:	nop    DWORD PTR [rax+0x0]
   14068:	mov    rsi,QWORD PTR [rbx+0x130]
   1406f:	mov    rdi,QWORD PTR [rbx]
   14072:	mov    ecx,ebp
   14074:	mov    rdx,rax
   14077:	call   18b00 <bdrv_pread>
   1407c:	cmp    ebp,eax
   1407e:	jne    13ffe <qcow_open+0x59e>
   14084:	mov    edx,DWORD PTR [rbx+0x138]
   1408a:	test   edx,edx
   1408c:	je     13da1 <qcow_open+0x341>
   14092:	xor    eax,eax
   14094:	nop    DWORD PTR [rax+0x0]
   14098:	mov    rdx,QWORD PTR [rbx+0x128]
   1409f:	lea    rcx,[rdx+rax*8]
   140a3:	add    rax,0x1
   140a7:	mov    rdx,QWORD PTR [rcx]
   140aa:	bswap  rdx
   140ad:	mov    QWORD PTR [rcx],rdx
   140b0:	cmp    DWORD PTR [rbx+0x138],eax
   140b6:	ja     14098 <qcow_open+0x638>
   140b8:	mov    rsi,QWORD PTR [rsp+0x68]
   140bd:	test   rsi,rsi
   140c0:	jne    13dab <qcow_open+0x34b>
   140c6:	jmp    13de6 <qcow_open+0x386>
   140cb:	nop    DWORD PTR [rax+rax*1+0x0]
   140d0:	sub    ebx,DWORD PTR [r12+0x350]
   140d8:	xor    eax,eax
   140da:	mov    DWORD PTR [r12+0x358],ebx
   140e2:	jmp    13e13 <qcow_open+0x3b3>
   140e7:	call   31c0 <__stack_chk_fail@plt>
   140ec:	nop    DWORD PTR [rax+0x0]

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

00000000000143a0 <update_cluster_refcount>:
   143a0:	push   r15
   143a2:	push   r14
   143a4:	push   r13
   143a6:	mov    r13d,edx
   143a9:	push   r12
   143ab:	push   rbp
   143ac:	push   rbx
   143ad:	mov    rbx,rdi
   143b0:	sub    rsp,0x58
   143b4:	mov    rbp,QWORD PTR [rdi+0x40]
   143b8:	mov    QWORD PTR [rsp+0x8],rsi
   143bd:	mov    r9d,DWORD PTR [rbp+0x138]
   143c4:	mov    rax,QWORD PTR fs:0x28
   143cd:	mov    QWORD PTR [rsp+0x48],rax
   143d2:	xor    eax,eax
   143d4:	mov    eax,DWORD PTR [rbp+0x8]
   143d7:	lea    ecx,[rax-0x1]
   143da:	sar    rsi,cl
   143dd:	mov    r14,rsi
   143e0:	cmp    r9d,esi
   143e3:	jbe    144f0 <update_cluster_refcount+0x150>
   143e9:	mov    rax,QWORD PTR [rbp+0x128]
   143f0:	movsxd r10,esi
   143f3:	lea    r15,[r10*8+0x0]
   143fb:	mov    r14,QWORD PTR [rax+r10*8]
   143ff:	mov    r12,r14
   14402:	test   r14,r14
   14405:	je     14780 <update_cluster_refcount+0x3e0>
   1440b:	cmp    QWORD PTR [rbp+0x140],r14
   14412:	je     1443d <update_cluster_refcount+0x9d>
   14414:	mov    rbx,QWORD PTR [rbx+0x40]
   14418:	mov    rsi,r14
   1441b:	mov    ecx,DWORD PTR [rbx+0xc]
   1441e:	mov    rdx,QWORD PTR [rbx+0x148]
   14425:	mov    rdi,QWORD PTR [rbx]
   14428:	call   18b00 <bdrv_pread>
   1442d:	cmp    eax,DWORD PTR [rbx+0xc]
   14430:	jne    147b0 <update_cluster_refcount+0x410>
   14436:	mov    QWORD PTR [rbx+0x140],r14
   1443d:	mov    eax,DWORD PTR [rbp+0x8]
   14440:	mov    rbx,QWORD PTR [rsp+0x8]
   14445:	mov    rsi,QWORD PTR [rbp+0x148]
   1444c:	lea    ecx,[rax-0x1]
   1444f:	mov    eax,0x1
   14454:	shl    eax,cl
   14456:	lea    ecx,[rax-0x1]
   14459:	and    ecx,ebx
   1445b:	movsxd rdx,ecx
   1445e:	add    rdx,rdx
   14461:	add    rsi,rdx
   14464:	movzx  eax,WORD PTR [rsi]
   14467:	rol    ax,0x8
   1446b:	movzx  eax,ax
   1446e:	add    r13d,eax
   14471:	cmp    r13d,0xffff
   14478:	ja     14790 <update_cluster_refcount+0x3f0>
   1447e:	test   r13d,r13d
   14481:	jne    14493 <update_cluster_refcount+0xf3>
   14483:	cmp    QWORD PTR [rbp+0x150],rbx
   1448a:	jle    14493 <update_cluster_refcount+0xf3>
   1448c:	mov    QWORD PTR [rbp+0x150],rbx
   14493:	mov    eax,r13d
   14496:	rol    ax,0x8
   1449a:	mov    WORD PTR [rsi],ax
   1449d:	lea    esi,[rcx+rcx*1]
   144a0:	mov    rdi,QWORD PTR [rbp+0x0]
   144a4:	mov    ecx,0x2
   144a9:	movsxd rsi,esi
   144ac:	add    rdx,QWORD PTR [rbp+0x148]
   144b3:	add    rsi,r12
   144b6:	call   19110 <bdrv_pwrite>
   144bb:	cmp    eax,0x2
   144be:	jne    147b0 <update_cluster_refcount+0x410>
   144c4:	mov    rdi,QWORD PTR [rsp+0x48]
   144c9:	xor    rdi,QWORD PTR fs:0x28
   144d2:	mov    eax,r13d
   144d5:	jne    147ea <update_cluster_refcount+0x44a>
   144db:	add    rsp,0x58
   144df:	pop    rbx
   144e0:	pop    rbp
   144e1:	pop    r12
   144e3:	pop    r13
   144e5:	pop    r14
   144e7:	pop    r15
   144e9:	ret
   144ea:	nop    WORD PTR [rax+rax*1+0x0]
   144f0:	cmp    edx,0xffffffff
   144f3:	je     14790 <update_cluster_refcount+0x3f0>
   144f9:	lea    edx,[rsi+0x1]
   144fc:	cmp    r9d,edx
   144ff:	jae    146c9 <update_cluster_refcount+0x329>
   14505:	lea    ecx,[rax-0x3]
   14508:	mov    r12d,0x1
   1450e:	mov    eax,0x2
   14513:	shr    r9d,cl
   14516:	shl    r12d,cl
   14519:	shl    eax,cl
   1451b:	test   r9d,r9d
   1451e:	jne    14533 <update_cluster_refcount+0x193>
   14520:	cmp    edx,r12d
   14523:	jle    14558 <update_cluster_refcount+0x1b8>
   14525:	cmp    edx,eax
   14527:	jle    147a0 <update_cluster_refcount+0x400>
   1452d:	mov    r9d,0x2
   14533:	lea    esi,[r9+r9*2+0x1]
   14538:	mov    r9d,esi
   1453b:	shr    r9d,0x1f
   1453f:	add    r9d,esi
   14542:	sar    r9d,1
   14545:	mov    esi,r9d
   14548:	shl    esi,cl
   1454a:	cmp    edx,esi
   1454c:	jg     1451b <update_cluster_refcount+0x17b>
   1454e:	mov    r12d,esi
   14551:	jmp    1455e <update_cluster_refcount+0x1be>
   14553:	nop    DWORD PTR [rax+rax*1+0x0]
   14558:	mov    r9d,0x1
   1455e:	lea    eax,[r12*8+0x0]
   14566:	mov    DWORD PTR [rsp+0x20],r9d
   1456b:	mov    DWORD PTR [rsp+0x10],eax
   1456f:	cdqe
   14571:	mov    rdi,rax
   14574:	mov    QWORD PTR [rsp+0x18],rax
   14579:	call   59c0 <qemu_mallocz>
   1457e:	mov    edx,DWORD PTR [rbp+0x138]
   14584:	mov    rsi,QWORD PTR [rbp+0x128]
   1458b:	mov    rdi,rax
   1458e:	mov    r15,rax
   14591:	shl    rdx,0x3
   14595:	call   33b0 <memcpy@plt>
   1459a:	mov    ecx,DWORD PTR [rbp+0x138]
   145a0:	xor    eax,eax
   145a2:	mov    r9d,DWORD PTR [rsp+0x20]
   145a7:	test   ecx,ecx
   145a9:	je     145c7 <update_cluster_refcount+0x227>
   145ab:	nop    DWORD PTR [rax+rax*1+0x0]
   145b0:	mov    rdx,QWORD PTR [r15+rax*8]
   145b4:	bswap  rdx
   145b7:	mov    QWORD PTR [r15+rax*8],rdx
   145bb:	add    rax,0x1
   145bf:	cmp    DWORD PTR [rbp+0x138],eax
   145c5:	ja     145b0 <update_cluster_refcount+0x210>
   145c7:	mov    rsi,QWORD PTR [rsp+0x18]
   145cc:	mov    rdi,rbx
   145cf:	mov    DWORD PTR [rsp+0x2c],r9d
   145d4:	call   12ae0 <alloc_clusters_noref>
   145d9:	mov    ecx,DWORD PTR [rsp+0x10]
   145dd:	mov    rdi,QWORD PTR [rbp+0x0]
   145e1:	mov    rdx,r15
   145e4:	mov    rsi,rax
   145e7:	mov    QWORD PTR [rsp+0x20],rax
   145ec:	call   19110 <bdrv_pwrite>
   145f1:	cmp    DWORD PTR [rsp+0x10],eax
   145f5:	mov    r9d,DWORD PTR [rsp+0x2c]
   145fa:	jne    147c0 <update_cluster_refcount+0x420>
   14600:	mov    edx,DWORD PTR [rbp+0x138]
   14606:	xor    eax,eax
   14608:	test   edx,edx
   1460a:	je     14627 <update_cluster_refcount+0x287>
   1460c:	nop    DWORD PTR [rax+0x0]
   14610:	mov    rdx,QWORD PTR [r15+rax*8]
   14614:	bswap  rdx
   14617:	mov    QWORD PTR [r15+rax*8],rdx
   1461b:	add    rax,0x1
   1461f:	cmp    DWORD PTR [rbp+0x138],eax
   14625:	ja     14610 <update_cluster_refcount+0x270>
   14627:	mov    rax,QWORD PTR [rsp+0x20]
   1462c:	bswap  r9d
   1462f:	mov    DWORD PTR [rsp+0x44],r9d
   14634:	lea    rdx,[rsp+0x3c]
   14639:	mov    ecx,0xc
   1463e:	mov    esi,0x30
   14643:	bswap  rax
   14646:	mov    QWORD PTR [rsp+0x3c],rax
   1464b:	mov    rdi,QWORD PTR [rbp+0x0]
   1464f:	call   19110 <bdrv_pwrite>
   14654:	cmp    eax,0xc
   14657:	jne    147c0 <update_cluster_refcount+0x420>
   1465d:	mov    rdi,QWORD PTR [rbp+0x128]
   14664:	call   5960 <qemu_free>
   14669:	mov    edi,DWORD PTR [rbp+0x138]
   1466f:	mov    rdx,QWORD PTR [rsp+0x18]
   14674:	mov    QWORD PTR [rbp+0x128],r15
   1467b:	mov    rax,QWORD PTR [rbp+0x130]
   14682:	mov    DWORD PTR [rbp+0x138],r12d
   14689:	mov    ecx,0x1
   1468e:	mov    DWORD PTR [rsp+0x2c],edi
   14692:	mov    rdi,rbx
   14695:	mov    QWORD PTR [rsp+0x10],rax
   1469a:	mov    rax,QWORD PTR [rsp+0x20]
   1469f:	mov    QWORD PTR [rbp+0x130],rax
   146a6:	mov    rsi,rax
   146a9:	call   147f0 <update_refcount>
   146ae:	movsxd rdx,DWORD PTR [rsp+0x2c]
   146b3:	mov    rsi,QWORD PTR [rsp+0x10]
   146b8:	mov    rdi,rbx
   146bb:	mov    ecx,0xffffffff
   146c0:	shl    rdx,0x3
   146c4:	call   147f0 <update_refcount>
   146c9:	mov    rax,QWORD PTR [rbp+0x128]
   146d0:	movsxd r10,r14d
   146d3:	lea    r15,[r10*8+0x0]
   146db:	mov    r14,QWORD PTR [rax+r10*8]
   146df:	mov    r12,r14
   146e2:	test   r14,r14
   146e5:	jne    1440b <update_cluster_refcount+0x6b>
   146eb:	movsxd rsi,DWORD PTR [rbp+0xc]
   146ef:	mov    rdi,rbx
   146f2:	call   12ae0 <alloc_clusters_noref>
   146f7:	movsxd rdx,DWORD PTR [rbp+0xc]
   146fb:	mov    rdi,QWORD PTR [rbp+0x148]
   14702:	xor    esi,esi
   14704:	mov    r12,rax
   14707:	call   3250 <memset@plt>
   1470c:	mov    ecx,DWORD PTR [rbp+0xc]
   1470f:	mov    rdi,QWORD PTR [rbp+0x0]
   14713:	mov    rsi,r12
   14716:	mov    rdx,QWORD PTR [rbp+0x148]
   1471d:	call   19110 <bdrv_pwrite>
   14722:	cmp    DWORD PTR [rbp+0xc],eax
   14725:	jne    14790 <update_cluster_refcount+0x3f0>
   14727:	mov    rax,QWORD PTR [rbp+0x128]
   1472e:	lea    rdx,[rsp+0x30]
   14733:	mov    ecx,0x8
   14738:	mov    QWORD PTR [rax+r15*1],r12
   1473c:	mov    rax,r12
   1473f:	mov    rsi,QWORD PTR [rbp+0x130]
   14746:	bswap  rax
   14749:	mov    QWORD PTR [rsp+0x30],rax
   1474e:	mov    rdi,QWORD PTR [rbp+0x0]
   14752:	add    rsi,r15
   14755:	call   19110 <bdrv_pwrite>
   1475a:	cmp    eax,0x8
   1475d:	jne    14790 <update_cluster_refcount+0x3f0>
   1475f:	movsxd rdx,DWORD PTR [rbp+0xc]
   14763:	mov    ecx,0x1
   14768:	mov    rsi,r12
   1476b:	mov    rdi,rbx
   1476e:	mov    QWORD PTR [rbp+0x140],r12
   14775:	call   147f0 <update_refcount>
   1477a:	jmp    1443d <update_cluster_refcount+0x9d>
   1477f:	nop
   14780:	cmp    edx,0xffffffff
   14783:	jne    146eb <update_cluster_refcount+0x34b>
   14789:	nop    DWORD PTR [rax+0x0]
   14790:	mov    r13d,0xffffffea
   14796:	jmp    144c4 <update_cluster_refcount+0x124>
   1479b:	nop    DWORD PTR [rax+rax*1+0x0]
   147a0:	mov    r12d,eax
   147a3:	mov    r9d,0x2
   147a9:	jmp    1455e <update_cluster_refcount+0x1be>
   147ae:	xchg   ax,ax
   147b0:	mov    r13d,0xfffffffb
   147b6:	jmp    144c4 <update_cluster_refcount+0x124>
   147bb:	nop    DWORD PTR [rax+rax*1+0x0]
   147c0:	mov    rdx,QWORD PTR [rsp+0x18]
   147c5:	mov    rsi,QWORD PTR [rsp+0x20]
   147ca:	mov    ecx,0xffffffff
   147cf:	mov    rdi,rbx
   147d2:	mov    r13d,0xfffffffb
   147d8:	call   147f0 <update_refcount>
   147dd:	mov    rdi,r15
   147e0:	call   5960 <qemu_free>
   147e5:	jmp    144c4 <update_cluster_refcount+0x124>
   147ea:	call   31c0 <__stack_chk_fail@plt>
   147ef:	nop

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

0000000000014a60 <get_cluster_table>:
   14a60:	push   r15
   14a62:	push   r14
   14a64:	mov    r14,rdi
   14a67:	push   r13
   14a69:	push   r12
   14a6b:	mov    r12,rsi
   14a6e:	push   rbp
   14a6f:	push   rbx
   14a70:	mov    rbx,rsi
   14a73:	sub    rsp,0x48
   14a77:	mov    r15,QWORD PTR [rdi+0x40]
   14a7b:	mov    QWORD PTR [rsp+0x10],rcx
   14a80:	mov    QWORD PTR [rsp+0x8],rdx
   14a85:	mov    ecx,DWORD PTR [r15+0x8]
   14a89:	mov    QWORD PTR [rsp+0x18],r8
   14a8e:	add    ecx,DWORD PTR [r15+0x14]
   14a92:	shr    r12,cl
   14a95:	mov    rax,QWORD PTR fs:0x28
   14a9e:	mov    QWORD PTR [rsp+0x38],rax
   14aa3:	xor    eax,eax
   14aa5:	cmp    DWORD PTR [r15+0x1c],r12d
   14aa9:	jle    14c48 <get_cluster_table+0x1e8>
   14aaf:	mov    rax,QWORD PTR [r15+0x40]
   14ab3:	movsxd r12,r12d
   14ab6:	lea    rbp,[r12*8+0x0]
   14abe:	mov    rsi,QWORD PTR [rax+r12*8]
   14ac2:	test   rsi,rsi
   14ac5:	js     14c60 <get_cluster_table+0x200>
   14acb:	jne    14c28 <get_cluster_table+0x1c8>
   14ad1:	mov    r13,QWORD PTR [r14+0x40]
   14ad5:	mov    rdi,r14
   14ad8:	mov    rax,QWORD PTR [r13+0x40]
   14adc:	movsxd rsi,DWORD PTR [r13+0x18]
   14ae0:	mov    r8,QWORD PTR [rax+r12*8]
   14ae4:	shl    rsi,0x3
   14ae8:	mov    QWORD PTR [rsp+0x28],r8
   14aed:	call   148b0 <alloc_clusters>
   14af2:	mov    rdx,QWORD PTR [r13+0x40]
   14af6:	mov    ecx,0x8
   14afb:	mov    QWORD PTR [rsp+0x20],rax
   14b00:	bts    rax,0x3f
   14b05:	mov    QWORD PTR [rdx+r12*8],rax
   14b09:	mov    rsi,QWORD PTR [r13+0x38]
   14b0d:	bswap  rax
   14b10:	lea    rdx,[rsp+0x30]
   14b15:	mov    QWORD PTR [rsp+0x30],rax
   14b1a:	mov    rdi,QWORD PTR [r13+0x0]
   14b1e:	add    rsi,rbp
   14b21:	call   19110 <bdrv_pwrite>
   14b26:	mov    r8,QWORD PTR [rsp+0x28]
   14b2b:	cmp    eax,0x8
   14b2e:	jne    14c00 <get_cluster_table+0x1a0>
   14b34:	mov    rsi,QWORD PTR [r14+0x40]
   14b38:	xor    eax,eax
   14b3a:	xor    ebp,ebp
   14b3c:	mov    ecx,0xffffffff
   14b41:	nop    DWORD PTR [rax+0x0]
   14b48:	mov    edx,DWORD PTR [rsi+rax*4+0xd0]
   14b4f:	cmp    edx,ecx
   14b51:	jae    14b58 <get_cluster_table+0xf8>
   14b53:	movsxd rbp,eax
   14b56:	mov    ecx,edx
   14b58:	add    rax,0x1
   14b5c:	cmp    rax,0x10
   14b60:	jne    14b48 <get_cluster_table+0xe8>
   14b62:	mov    ecx,DWORD PTR [r13+0x14]
   14b66:	mov    eax,ebp
   14b68:	mov    rdx,QWORD PTR [r13+0x48]
   14b6c:	shl    eax,cl
   14b6e:	cdqe
   14b70:	lea    r14,[rdx+rax*8]
   14b74:	movsxd rdx,DWORD PTR [r13+0x18]
   14b78:	mov    rcx,rdx
   14b7b:	test   r8,r8
   14b7e:	jne    14bd8 <get_cluster_table+0x178>
   14b80:	shl    rdx,0x3
   14b84:	xor    esi,esi
   14b86:	mov    rdi,r14
   14b89:	call   3250 <memset@plt>
   14b8e:	mov    eax,DWORD PTR [r13+0x18]
   14b92:	mov    rdi,QWORD PTR [r13+0x0]
   14b96:	mov    rdx,r14
   14b99:	mov    rsi,QWORD PTR [rsp+0x20]
   14b9e:	lea    ecx,[rax*8+0x0]
   14ba5:	call   19110 <bdrv_pwrite>
   14baa:	movsxd rdx,DWORD PTR [r13+0x18]
   14bae:	cdqe
   14bb0:	shl    rdx,0x3
   14bb4:	cmp    rdx,rax
   14bb7:	jne    14c00 <get_cluster_table+0x1a0>
   14bb9:	mov    rax,QWORD PTR [rsp+0x20]
   14bbe:	mov    QWORD PTR [r13+rbp*8+0x50],rax
   14bc3:	mov    DWORD PTR [r13+rbp*4+0xd0],0x1
   14bcf:	jmp    14cf6 <get_cluster_table+0x296>
   14bd4:	nop    DWORD PTR [rax+0x0]
   14bd8:	mov    rdi,QWORD PTR [r13+0x0]
   14bdc:	shl    ecx,0x3
   14bdf:	mov    rdx,r14
   14be2:	mov    rsi,r8
   14be5:	call   18b00 <bdrv_pread>
   14bea:	movsxd rdx,DWORD PTR [r13+0x18]
   14bee:	cdqe
   14bf0:	mov    rcx,rdx
   14bf3:	shl    rdx,0x3
   14bf7:	cmp    rax,rdx
   14bfa:	je     14cb0 <get_cluster_table+0x250>
   14c00:	xor    eax,eax
   14c02:	mov    rdi,QWORD PTR [rsp+0x38]
   14c07:	xor    rdi,QWORD PTR fs:0x28
   14c10:	jne    14d10 <get_cluster_table+0x2b0>
   14c16:	add    rsp,0x48
   14c1a:	pop    rbx
   14c1b:	pop    rbp
   14c1c:	pop    r12
   14c1e:	pop    r13
   14c20:	pop    r14
   14c22:	pop    r15
   14c24:	ret
   14c25:	nop    DWORD PTR [rax]
   14c28:	movsxd rdx,DWORD PTR [r15+0x18]
   14c2c:	mov    ecx,0xffffffff
   14c31:	mov    rdi,r14
   14c34:	shl    rdx,0x3
   14c38:	call   147f0 <update_refcount>
   14c3d:	jmp    14ad1 <get_cluster_table+0x71>
   14c42:	nop    WORD PTR [rax+rax*1+0x0]
   14c48:	lea    esi,[r12+0x1]
   14c4d:	call   148e0 <grow_l1_table>
   14c52:	test   eax,eax
   14c54:	jns    14aaf <get_cluster_table+0x4f>
   14c5a:	jmp    14c00 <get_cluster_table+0x1a0>
   14c5c:	nop    DWORD PTR [rax+0x0]
   14c60:	btr    rsi,0x3f
   14c65:	lea    rdi,[r14+0x40]
   14c69:	mov    rbp,rsi
   14c6c:	call   12b60 <l2_load.isra.5>
   14c71:	mov    r14,rax
   14c74:	test   rax,rax
   14c77:	je     14c00 <get_cluster_table+0x1a0>
   14c79:	mov    ecx,DWORD PTR [r15+0x8]
   14c7d:	mov    eax,DWORD PTR [r15+0x18]
   14c81:	shr    rbx,cl
   14c84:	sub    eax,0x1
   14c87:	and    ebx,eax
   14c89:	mov    rax,QWORD PTR [rsp+0x8]
   14c8e:	mov    QWORD PTR [rax],r14
   14c91:	mov    rax,QWORD PTR [rsp+0x10]
   14c96:	mov    QWORD PTR [rax],rbp
   14c99:	mov    rax,QWORD PTR [rsp+0x18]
   14c9e:	mov    DWORD PTR [rax],ebx
   14ca0:	mov    eax,0x1
   14ca5:	jmp    14c02 <get_cluster_table+0x1a2>
   14caa:	nop    WORD PTR [rax+rax*1+0x0]
   14cb0:	mov    rsi,QWORD PTR [rsp+0x20]
   14cb5:	mov    rdi,QWORD PTR [r13+0x0]
   14cb9:	mov    rdx,r14
   14cbc:	shl    ecx,0x3
   14cbf:	call   19110 <bdrv_pwrite>
   14cc4:	movsxd rdx,DWORD PTR [r13+0x18]
   14cc8:	cdqe
   14cca:	shl    rdx,0x3
   14cce:	cmp    rax,rdx
   14cd1:	jne    14c00 <get_cluster_table+0x1a0>
   14cd7:	mov    rax,QWORD PTR [rsp+0x20]
   14cdc:	mov    QWORD PTR [r13+rbp*8+0x50],rax
   14ce1:	mov    DWORD PTR [r13+rbp*4+0xd0],0x1
   14ced:	test   r14,r14
   14cf0:	je     14c00 <get_cluster_table+0x1a0>
   14cf6:	movabs rsi,0x7fffffffffffffff
   14d00:	mov    rax,QWORD PTR [r15+0x40]
   14d04:	and    rsi,QWORD PTR [rax+r12*8]
   14d08:	mov    rbp,rsi
   14d0b:	jmp    14c79 <get_cluster_table+0x219>
   14d10:	call   31c0 <__stack_chk_fail@plt>
   14d15:	data16 nop WORD PTR cs:[rax+rax*1+0x0]

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

00000000000153f0 <qcow_write_snapshots>:
   153f0:	push   r15
   153f2:	push   r14
   153f4:	push   r13
   153f6:	push   r12
   153f8:	push   rbp
   153f9:	push   rbx
   153fa:	sub    rsp,0x68
   153fe:	mov    rbx,QWORD PTR [rdi+0x40]
   15402:	mov    QWORD PTR [rsp+0x10],rdi
   15407:	mov    eax,DWORD PTR [rbx+0x35c]
   1540d:	mov    rcx,QWORD PTR fs:0x28
   15416:	mov    QWORD PTR [rsp+0x58],rcx
   1541b:	xor    ecx,ecx
   1541d:	test   eax,eax
   1541f:	jle    156a0 <qcow_write_snapshots+0x2b0>
   15425:	lea    ecx,[rax-0x1]
   15428:	mov    rdx,QWORD PTR [rbx+0x360]
   1542f:	xor    ebp,ebp
   15431:	lea    rax,[rcx*8+0x0]
   15439:	sub    rax,rcx
   1543c:	lea    r12,[rdx+0x10]
   15440:	lea    r13,[rdx+rax*8+0x48]
   15445:	nop    DWORD PTR [rax]
   15448:	mov    rdi,QWORD PTR [r12]
   1544c:	add    rbp,0x7
   15450:	add    r12,0x38
   15454:	and    rbp,0xfffffffffffffff8
   15458:	call   31b0 <strlen@plt>
   1545d:	mov    rdi,QWORD PTR [r12-0x30]
   15462:	mov    r14,rax
   15465:	call   31b0 <strlen@plt>
   1546a:	lea    rbp,[r14+rbp*1+0x28]
   1546f:	add    rbp,rax
   15472:	cmp    r13,r12
   15475:	jne    15448 <qcow_write_snapshots+0x58>
   15477:	mov    DWORD PTR [rsp+0x1c],ebp
   1547b:	movsxd rsi,ebp
   1547e:	mov    rdi,QWORD PTR [rsp+0x10]
   15483:	call   148b0 <alloc_clusters>
   15488:	mov    QWORD PTR [rsp+0x8],rax
   1548d:	mov    eax,DWORD PTR [rbx+0x35c]
   15493:	test   eax,eax
   15495:	jle    15610 <qcow_write_snapshots+0x220>
   1549b:	mov    rax,QWORD PTR [rsp+0x8]
   154a0:	xor    r14d,r14d
   154a3:	lea    rbp,[rsp+0x30]
   154a8:	mov    DWORD PTR [rsp+0x18],0x0
   154b0:	mov    QWORD PTR [rsp],rax
   154b4:	jmp    1552a <qcow_write_snapshots+0x13a>
   154b6:	nop    WORD PTR cs:[rax+rax*1+0x0]
   154c0:	add    r9,0x28
   154c4:	mov    rdx,QWORD PTR [r15+0x10]
   154c8:	mov    rdi,QWORD PTR [rbx]
   154cb:	mov    ecx,r12d
   154ce:	mov    rsi,r9
   154d1:	mov    QWORD PTR [rsp],r9
   154d5:	call   19110 <bdrv_pwrite>
   154da:	cmp    eax,r12d
   154dd:	jne    155e7 <qcow_write_snapshots+0x1f7>
   154e3:	mov    r9,QWORD PTR [rsp]
   154e7:	cdqe
   154e9:	mov    rdx,QWORD PTR [r15+0x18]
   154ed:	mov    ecx,r13d
   154f0:	mov    rdi,QWORD PTR [rbx]
   154f3:	lea    r12,[rax+r9*1]
   154f7:	mov    rsi,r12
   154fa:	call   19110 <bdrv_pwrite>
   154ff:	cmp    eax,r13d
   15502:	jne    155e7 <qcow_write_snapshots+0x1f7>
   15508:	cdqe
   1550a:	add    DWORD PTR [rsp+0x18],0x1
   1550f:	add    r14,0x38
   15513:	add    rax,r12
   15516:	mov    QWORD PTR [rsp],rax
   1551a:	mov    eax,DWORD PTR [rsp+0x18]
   1551e:	cmp    DWORD PTR [rbx+0x35c],eax
   15524:	jle    15610 <qcow_write_snapshots+0x220>
   1552a:	mov    r15,QWORD PTR [rbx+0x360]
   15531:	pxor   xmm0,xmm0
   15535:	mov    QWORD PTR [rbp+0x20],0x0
   1553d:	movaps XMMWORD PTR [rbp+0x0],xmm0
   15541:	add    r15,r14
   15544:	movaps XMMWORD PTR [rbp+0x10],xmm0
   15548:	mov    rax,QWORD PTR [r15]
   1554b:	bswap  rax
   1554e:	mov    QWORD PTR [rsp+0x30],rax
   15553:	mov    eax,DWORD PTR [r15+0x8]
   15557:	bswap  eax
   15559:	mov    DWORD PTR [rsp+0x38],eax
   1555d:	mov    eax,DWORD PTR [r15+0x20]
   15561:	bswap  eax
   15563:	mov    DWORD PTR [rsp+0x50],eax
   15567:	mov    eax,DWORD PTR [r15+0x24]
   1556b:	bswap  eax
   1556d:	mov    DWORD PTR [rsp+0x40],eax
   15571:	mov    eax,DWORD PTR [r15+0x28]
   15575:	bswap  eax
   15577:	mov    DWORD PTR [rsp+0x44],eax
   1557b:	mov    rax,QWORD PTR [r15+0x30]
   1557f:	bswap  rax
   15582:	mov    QWORD PTR [rsp+0x48],rax
   15587:	mov    rdi,QWORD PTR [r15+0x10]
   1558b:	call   31b0 <strlen@plt>
   15590:	mov    rdi,QWORD PTR [r15+0x18]
   15594:	mov    r12,rax
   15597:	call   31b0 <strlen@plt>
   1559c:	mov    r9,QWORD PTR [rsp]
   155a0:	mov    ecx,0x28
   155a5:	mov    rdx,rbp
   155a8:	mov    r13,rax
   155ab:	mov    eax,r12d
   155ae:	rol    ax,0x8
   155b2:	add    r9,0x7
   155b6:	mov    WORD PTR [rsp+0x3c],ax
   155bb:	mov    eax,r13d
   155be:	and    r9,0xfffffffffffffff8
   155c2:	rol    ax,0x8
   155c6:	mov    rsi,r9
   155c9:	mov    QWORD PTR [rsp],r9
   155cd:	mov    WORD PTR [rsp+0x3e],ax
   155d2:	mov    rdi,QWORD PTR [rbx]
   155d5:	call   19110 <bdrv_pwrite>
   155da:	mov    r9,QWORD PTR [rsp]
   155de:	cmp    eax,0x28
   155e1:	je     154c0 <qcow_write_snapshots+0xd0>
   155e7:	mov    eax,0xffffffff
   155ec:	mov    rsi,QWORD PTR [rsp+0x58]
   155f1:	xor    rsi,QWORD PTR fs:0x28
   155fa:	jne    156af <qcow_write_snapshots+0x2bf>
   15600:	add    rsp,0x68
   15604:	pop    rbx
   15605:	pop    rbp
   15606:	pop    r12
   15608:	pop    r13
   1560a:	pop    r14
   1560c:	pop    r15
   1560e:	ret
   1560f:	nop
   15610:	mov    rax,QWORD PTR [rsp+0x8]
   15615:	lea    rdx,[rsp+0x28]
   1561a:	mov    ecx,0x8
   1561f:	mov    esi,0x40
   15624:	bswap  rax
   15627:	mov    QWORD PTR [rsp+0x28],rax
   1562c:	mov    rdi,QWORD PTR [rbx]
   1562f:	call   19110 <bdrv_pwrite>
   15634:	cmp    eax,0x8
   15637:	jne    155e7 <qcow_write_snapshots+0x1f7>
   15639:	mov    eax,DWORD PTR [rbx+0x35c]
   1563f:	lea    rdx,[rsp+0x24]
   15644:	mov    ecx,0x4
   15649:	mov    esi,0x3c
   1564e:	bswap  eax
   15650:	mov    DWORD PTR [rsp+0x24],eax
   15654:	mov    rdi,QWORD PTR [rbx]
   15657:	call   19110 <bdrv_pwrite>
   1565c:	cmp    eax,0x4
   1565f:	jne    155e7 <qcow_write_snapshots+0x1f7>
   15661:	movsxd rdx,DWORD PTR [rbx+0x358]
   15668:	mov    rdi,QWORD PTR [rsp+0x10]
   1566d:	mov    ecx,0xffffffff
   15672:	mov    rsi,QWORD PTR [rbx+0x350]
   15679:	call   147f0 <update_refcount>
   1567e:	mov    rax,QWORD PTR [rsp+0x8]
   15683:	mov    QWORD PTR [rbx+0x350],rax
   1568a:	mov    eax,DWORD PTR [rsp+0x1c]
   1568e:	mov    DWORD PTR [rbx+0x358],eax
   15694:	xor    eax,eax
   15696:	jmp    155ec <qcow_write_snapshots+0x1fc>
   1569b:	nop    DWORD PTR [rax+rax*1+0x0]
   156a0:	mov    DWORD PTR [rsp+0x1c],0x0
   156a8:	xor    esi,esi
   156aa:	jmp    1547e <qcow_write_snapshots+0x8e>
   156af:	call   31c0 <__stack_chk_fail@plt>
   156b4:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   156bf:	nop

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

0000000000016690 <parallels_read>:
   16690:	push   r15
   16692:	push   r14
   16694:	push   r13
   16696:	push   r12
   16698:	push   rbp
   16699:	push   rbx
   1669a:	sub    rsp,0x8
   1669e:	mov    r13,QWORD PTR [rdi+0x40]
   166a2:	test   ecx,ecx
   166a4:	jle    16748 <parallels_read+0xb8>
   166aa:	lea    r12d,[rcx-0x1]
   166ae:	mov    r14,rdi
   166b1:	mov    rbp,rsi
   166b4:	mov    rbx,rdx
   166b7:	add    r12,0x1
   166bb:	mov    rdi,r13
   166be:	shl    r12,0x9
   166c2:	add    r12,rdx
   166c5:	jmp    166e4 <parallels_read+0x54>
   166c7:	nop    WORD PTR [rax+rax*1+0x0]
   166d0:	add    rbx,0x200
   166d7:	add    rbp,0x1
   166db:	cmp    rbx,r12
   166de:	je     16748 <parallels_read+0xb8>
   166e0:	mov    rdi,QWORD PTR [r14+0x40]
   166e4:	mov    rax,rbp
   166e7:	movsxd rsi,DWORD PTR [rdi+0x14]
   166eb:	cqo
   166ed:	idiv   rsi
   166f0:	cmp    DWORD PTR [rdi+0x10],eax
   166f3:	jb     16760 <parallels_read+0xd0>
   166f5:	mov    rsi,QWORD PTR [rdi+0x8]
   166f9:	mov    eax,eax
   166fb:	mov    eax,DWORD PTR [rsi+rax*4]
   166fe:	test   eax,eax
   16700:	je     16760 <parallels_read+0xd0>
   16702:	add    eax,edx
   16704:	mov    edi,DWORD PTR [rdi]
   16706:	xor    edx,edx
   16708:	shl    eax,0x9
   1670b:	mov    r15d,eax
   1670e:	mov    rsi,r15
   16711:	call   3650 <lseek64@plt>
   16716:	cmp    r15,rax
   16719:	jne    16760 <parallels_read+0xd0>
   1671b:	mov    edi,DWORD PTR [r13+0x0]
   1671f:	mov    edx,0x200
   16724:	mov    rsi,rbx
   16727:	call   52c0 <qemu_read_ok>
   1672c:	test   eax,eax
   1672e:	jns    166d0 <parallels_read+0x40>
   16730:	add    rsp,0x8
   16734:	mov    eax,0xffffffff
   16739:	pop    rbx
   1673a:	pop    rbp
   1673b:	pop    r12
   1673d:	pop    r13
   1673f:	pop    r14
   16741:	pop    r15
   16743:	ret
   16744:	nop    DWORD PTR [rax+0x0]
   16748:	add    rsp,0x8
   1674c:	xor    eax,eax
   1674e:	pop    rbx
   1674f:	pop    rbp
   16750:	pop    r12
   16752:	pop    r13
   16754:	pop    r14
   16756:	pop    r15
   16758:	ret
   16759:	nop    DWORD PTR [rax+0x0]
   16760:	lea    rdi,[rbx+0x8]
   16764:	mov    rcx,rbx
   16767:	xor    eax,eax
   16769:	mov    QWORD PTR [rbx],0x0
   16770:	mov    QWORD PTR [rbx+0x1f8],0x0
   1677b:	and    rdi,0xfffffffffffffff8
   1677f:	sub    rcx,rdi
   16782:	add    ecx,0x200
   16788:	shr    ecx,0x3
   1678b:	rep stos QWORD PTR es:[rdi],rax
   1678e:	jmp    166d0 <parallels_read+0x40>
   16793:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   1679e:	xchg   ax,ax

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

0000000000017c40 <bdrv_aio_cancel_vector>:
   17c40:	mov    rdi,QWORD PTR [rdi+0x40]
   17c44:	mov    rax,QWORD PTR [rdi]
   17c47:	jmp    QWORD PTR [rax]
   17c49:	nop    DWORD PTR [rax+0x0]

0000000000017c50 <bdrv_rw_em_cb>:
   17c50:	mov    DWORD PTR [rdi],esi
   17c52:	ret
   17c53:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   17c5e:	xchg   ax,ax

0000000000017d40 <bdrv_aio_rw_vector_cb>:
   17d40:	push   rbp
   17d41:	mov    ebp,esi
   17d43:	push   rbx
   17d44:	mov    rbx,rdi
   17d47:	sub    rsp,0x8
   17d4b:	mov    eax,DWORD PTR [rbx+0x38]
   17d4e:	mov    rdi,QWORD PTR [rdi+0x30]
   17d52:	test   eax,eax
   17d54:	je     17d80 <bdrv_aio_rw_vector_cb+0x40>
   17d56:	call   5460 <qemu_vfree>
   17d5b:	mov    rdi,QWORD PTR [rbx+0x18]
   17d5f:	mov    esi,ebp
   17d61:	call   QWORD PTR [rbx+0x10]
   17d64:	mov    rax,QWORD PTR [rbx]
   17d67:	mov    rdx,QWORD PTR [rax+0x10]
   17d6b:	mov    QWORD PTR [rbx+0x20],rdx
   17d6f:	mov    QWORD PTR [rax+0x10],rbx
   17d73:	add    rsp,0x8
   17d77:	pop    rbx
   17d78:	pop    rbp
   17d79:	ret
   17d7a:	nop    WORD PTR [rax+rax*1+0x0]
   17d80:	mov    rax,QWORD PTR [rbx+0x28]
   17d84:	mov    rsi,rdi
   17d87:	mov    rdx,QWORD PTR [rax+0x10]
   17d8b:	mov    rdi,rax
   17d8e:	call   58e0 <qemu_iovec_from_buffer>
   17d93:	mov    rdi,QWORD PTR [rbx+0x30]
   17d97:	jmp    17d56 <bdrv_aio_rw_vector_cb+0x16>
   17d99:	nop    DWORD PTR [rax+0x0]

0000000000017da0 <bdrv_aio_bh_cb>:
   17da0:	push   rbx
   17da1:	mov    rbx,rdi
   17da4:	mov    esi,DWORD PTR [rdi+0x30]
   17da7:	mov    rdi,QWORD PTR [rdi+0x18]
   17dab:	call   QWORD PTR [rbx+0x10]
   17dae:	mov    rdi,QWORD PTR [rbx+0x28]
   17db2:	call   5180 <qemu_bh_delete>
   17db7:	mov    rax,QWORD PTR [rbx]
   17dba:	mov    QWORD PTR [rbx+0x28],0x0
   17dc2:	mov    rdx,QWORD PTR [rax+0x10]
   17dc6:	mov    QWORD PTR [rbx+0x20],rdx
   17dca:	mov    QWORD PTR [rax+0x10],rbx
   17dce:	pop    rbx
   17dcf:	ret

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

0000000000017e00 <bdrv_check_byte_request>:
   17e00:	mov    rax,QWORD PTR [rdi+0x38]
   17e04:	test   rax,rax
   17e07:	je     17ea0 <bdrv_check_byte_request+0xa0>
   17e0d:	push   r12
   17e0f:	mov    r12,rdx
   17e12:	push   rbp
   17e13:	mov    rbp,rsi
   17e16:	push   rbx
   17e17:	mov    rdx,QWORD PTR [rax+0xf0]
   17e1e:	mov    rbx,rdi
   17e21:	test   rdx,rdx
   17e24:	je     17e78 <bdrv_check_byte_request+0x78>
   17e26:	call   rdx
   17e28:	test   eax,eax
   17e2a:	je     17e69 <bdrv_check_byte_request+0x69>
   17e2c:	mov    ecx,DWORD PTR [rbx+0x880]
   17e32:	test   ecx,ecx
   17e34:	jne    17e62 <bdrv_check_byte_request+0x62>
   17e36:	mov    rax,QWORD PTR [rbx+0x38]
   17e3a:	test   rax,rax
   17e3d:	je     17ea6 <bdrv_check_byte_request+0xa6>
   17e3f:	mov    rax,QWORD PTR [rax+0xa8]
   17e46:	test   rax,rax
   17e49:	je     17e88 <bdrv_check_byte_request+0x88>
   17e4b:	mov    rdi,rbx
   17e4e:	call   rax
   17e50:	test   rbp,rbp
   17e53:	js     17e98 <bdrv_check_byte_request+0x98>
   17e55:	cmp    rbp,rax
   17e58:	jg     17e98 <bdrv_check_byte_request+0x98>
   17e5a:	sub    rax,rbp
   17e5d:	cmp    r12,rax
   17e60:	ja     17e98 <bdrv_check_byte_request+0x98>
   17e62:	xor    eax,eax
   17e64:	pop    rbx
   17e65:	pop    rbp
   17e66:	pop    r12
   17e68:	ret
   17e69:	pop    rbx
   17e6a:	mov    eax,0xffffff85
   17e6f:	pop    rbp
   17e70:	pop    r12
   17e72:	ret
   17e73:	nop    DWORD PTR [rax+rax*1+0x0]
   17e78:	mov    edx,DWORD PTR [rdi+0x880]
   17e7e:	test   edx,edx
   17e80:	je     17e3f <bdrv_check_byte_request+0x3f>
   17e82:	jmp    17e62 <bdrv_check_byte_request+0x62>
   17e84:	nop    DWORD PTR [rax+0x0]
   17e88:	mov    rax,QWORD PTR [rbx]
   17e8b:	shl    rax,0x9
   17e8f:	jmp    17e50 <bdrv_check_byte_request+0x50>
   17e91:	nop    DWORD PTR [rax+0x0]
   17e98:	mov    eax,0xfffffffb
   17e9d:	jmp    17e64 <bdrv_check_byte_request+0x64>
   17e9f:	nop
   17ea0:	mov    eax,0xffffff85
   17ea5:	ret
   17ea6:	mov    rax,0xffffffffffffff85
   17ead:	jmp    17e50 <bdrv_check_byte_request+0x50>
   17eaf:	nop

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

00000000000180b0 <bdrv_create>:
   180b0:	mov    rax,QWORD PTR [rdi+0x38]
   180b4:	mov    r9,rsi
   180b7:	mov    rsi,rdx
   180ba:	mov    rdx,rcx
   180bd:	test   rax,rax
   180c0:	je     180ca <bdrv_create+0x1a>
   180c2:	mov    ecx,r8d
   180c5:	mov    rdi,r9
   180c8:	jmp    rax
   180ca:	mov    eax,0xffffffa1
   180cf:	ret

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

00000000000181a0 <bdrv_close>:
   181a0:	mov    rax,QWORD PTR [rdi+0x38]
   181a4:	test   rax,rax
   181a7:	je     18208 <bdrv_close+0x68>
   181a9:	push   rbx
   181aa:	mov    rbx,rdi
   181ad:	mov    rdi,QWORD PTR [rdi+0x850]
   181b4:	test   rdi,rdi
   181b7:	je     181c2 <bdrv_close+0x22>
   181b9:	call   18130 <bdrv_delete>
   181be:	mov    rax,QWORD PTR [rbx+0x38]
   181c2:	mov    rdi,rbx
   181c5:	call   QWORD PTR [rax+0x30]
   181c8:	mov    rdi,QWORD PTR [rbx+0x40]
   181cc:	call   5960 <qemu_free>
   181d1:	mov    rax,QWORD PTR [rbx+0x28]
   181d5:	mov    QWORD PTR [rbx+0x40],0x0
   181dd:	mov    QWORD PTR [rbx+0x38],0x0
   181e5:	mov    DWORD PTR [rbx+0x84c],0x1
   181ef:	test   rax,rax
   181f2:	je     18200 <bdrv_close+0x60>
   181f4:	mov    rdi,QWORD PTR [rbx+0x30]
   181f8:	pop    rbx
   181f9:	jmp    rax
   181fb:	nop    DWORD PTR [rax+rax*1+0x0]
   18200:	pop    rbx
   18201:	ret
   18202:	nop    WORD PTR [rax+rax*1+0x0]
   18208:	ret
   18209:	nop    DWORD PTR [rax+0x0]

0000000000018210 <bdrv_read>:
   18210:	push   r15
   18212:	push   r14
   18214:	push   r13
   18216:	push   r12
   18218:	push   rbp
   18219:	push   rbx
   1821a:	sub    rsp,0x28
   1821e:	mov    r14,QWORD PTR [rdi+0x38]
   18222:	test   r14,r14
   18225:	je     18318 <bdrv_read+0x108>
   1822b:	mov    eax,ecx
   1822d:	mov    DWORD PTR [rsp+0x1c],ecx
   18231:	mov    r15,rsi
   18234:	mov    rcx,rsi
   18237:	neg    rcx
   1823a:	shl    r15,0x9
   1823e:	test   rsi,rsi
   18241:	mov    QWORD PTR [rsp+0x10],rdx
   18246:	cmovns rcx,r15
   1824a:	shl    eax,0x9
   1824d:	mov    rbx,rsi
   18250:	mov    rbp,rdi
   18253:	movsxd r12,eax
   18256:	mov    rsi,rcx
   18259:	mov    rdx,r12
   1825c:	mov    QWORD PTR [rsp+0x8],rcx
   18261:	call   17e00 <bdrv_check_byte_request>
   18266:	mov    rcx,QWORD PTR [rsp+0x8]
   1826b:	test   eax,eax
   1826d:	jne    18308 <bdrv_read+0xf8>
   18273:	mov    rdx,r12
   18276:	mov    rsi,rcx
   18279:	mov    rdi,rbp
   1827c:	call   17e00 <bdrv_check_byte_request>
   18281:	test   eax,eax
   18283:	mov    DWORD PTR [rsp+0x8],eax
   18287:	jne    18308 <bdrv_read+0xf8>
   18289:	mov    rax,QWORD PTR [r14+0x90]
   18290:	test   rax,rax
   18293:	je     182e0 <bdrv_read+0xd0>
   18295:	mov    ecx,r12d
   18298:	mov    rdx,QWORD PTR [rsp+0x10]
   1829d:	mov    rsi,r15
   182a0:	mov    rdi,rbp
   182a3:	call   rax
   182a5:	mov    r9d,eax
   182a8:	test   eax,eax
   182aa:	js     182c5 <bdrv_read+0xb5>
   182ac:	cmp    eax,r12d
   182af:	jne    18310 <bdrv_read+0x100>
   182b1:	add    QWORD PTR [rbp+0x860],r12
   182b8:	mov    r9d,DWORD PTR [rsp+0x8]
   182bd:	add    QWORD PTR [rbp+0x870],0x1
   182c5:	add    rsp,0x28
   182c9:	mov    eax,r9d
   182cc:	pop    rbx
   182cd:	pop    rbp
   182ce:	pop    r12
   182d0:	pop    r13
   182d2:	pop    r14
   182d4:	pop    r15
   182d6:	ret
   182d7:	nop    WORD PTR [rax+rax*1+0x0]
   182e0:	mov    rax,QWORD PTR [r14+0x20]
   182e4:	mov    ecx,DWORD PTR [rsp+0x1c]
   182e8:	mov    rsi,rbx
   182eb:	mov    rdi,rbp
   182ee:	mov    rdx,QWORD PTR [rsp+0x10]
   182f3:	add    rsp,0x28
   182f7:	pop    rbx
   182f8:	pop    rbp
   182f9:	pop    r12
   182fb:	pop    r13
   182fd:	pop    r14
   182ff:	pop    r15
   18301:	jmp    rax
   18303:	nop    DWORD PTR [rax+rax*1+0x0]
   18308:	mov    r9d,0xfffffffb
   1830e:	jmp    182c5 <bdrv_read+0xb5>
   18310:	mov    r9d,0xffffffea
   18316:	jmp    182c5 <bdrv_read+0xb5>
   18318:	mov    r9d,0xffffff85
   1831e:	jmp    182c5 <bdrv_read+0xb5>

0000000000018500 <guess_disk_lchs>:
   18500:	push   r15
   18502:	push   r14
   18504:	mov    r14,rdi
   18507:	push   r13
   18509:	mov    r13,rdx
   1850c:	push   r12
   1850e:	mov    r12,rcx
   18511:	push   rbp
   18512:	mov    rbp,rsi
   18515:	push   rbx
   18516:	sub    rsp,0x218
   1851d:	mov    rax,QWORD PTR fs:0x28
   18526:	mov    QWORD PTR [rsp+0x208],rax
   1852e:	xor    eax,eax
   18530:	mov    rax,QWORD PTR [rdi+0x38]
   18534:	test   rax,rax
   18537:	je     18628 <guess_disk_lchs+0x128>
   1853d:	mov    rax,QWORD PTR [rax+0xa8]
   18544:	test   rax,rax
   18547:	je     18630 <guess_disk_lchs+0x130>
   1854d:	call   rax
   1854f:	test   rax,rax
   18552:	js     18628 <guess_disk_lchs+0x128>
   18558:	sar    rax,0x9
   1855c:	mov    rbx,rax
   1855f:	mov    r15,rsp
   18562:	xor    esi,esi
   18564:	mov    ecx,0x1
   18569:	mov    rdi,r14
   1856c:	mov    rdx,r15
   1856f:	call   18210 <bdrv_read>
   18574:	test   eax,eax
   18576:	js     185f9 <guess_disk_lchs+0xf9>
   1857c:	cmp    BYTE PTR [rsp+0x1fe],0x55
   18584:	jne    185f9 <guess_disk_lchs+0xf9>
   18586:	cmp    BYTE PTR [rsp+0x1ff],0xaa
   1858e:	jne    185f9 <guess_disk_lchs+0xf9>
   18590:	mov    rcx,r15
   18593:	lea    r8,[r15+0x40]
   18597:	mov    eax,DWORD PTR [rcx+0x1ca]
   1859d:	test   eax,eax
   1859f:	je     185f0 <guess_disk_lchs+0xf0>
   185a1:	movzx  eax,BYTE PTR [rcx+0x1c3]
   185a8:	test   al,al
   185aa:	je     185f0 <guess_disk_lchs+0xf0>
   185ac:	movzx  esi,BYTE PTR [rcx+0x1c4]
   185b3:	and    esi,0x3f
   185b6:	je     185f0 <guess_disk_lchs+0xf0>
   185b8:	lea    edi,[rax+0x1]
   185bb:	movzx  esi,sil
   185bf:	mov    rax,rbx
   185c2:	xor    edx,edx
   185c4:	mov    r9d,edi
   185c7:	imul   r9d,esi
   185cb:	movsxd r9,r9d
   185ce:	div    r9
   185d1:	lea    edx,[rax-0x1]
   185d4:	cmp    edx,0x3ffe
   185da:	ja     185f0 <guess_disk_lchs+0xf0>
   185dc:	mov    DWORD PTR [r13+0x0],edi
   185e0:	mov    DWORD PTR [r12],esi
   185e4:	mov    DWORD PTR [rbp+0x0],eax
   185e7:	xor    eax,eax
   185e9:	jmp    185fe <guess_disk_lchs+0xfe>
   185eb:	nop    DWORD PTR [rax+rax*1+0x0]
   185f0:	add    rcx,0x10
   185f4:	cmp    r8,rcx
   185f7:	jne    18597 <guess_disk_lchs+0x97>
   185f9:	mov    eax,0xffffffff
   185fe:	mov    rbx,QWORD PTR [rsp+0x208]
   18606:	xor    rbx,QWORD PTR fs:0x28
   1860f:	jne    1863c <guess_disk_lchs+0x13c>
   18611:	add    rsp,0x218
   18618:	pop    rbx
   18619:	pop    rbp
   1861a:	pop    r12
   1861c:	pop    r13
   1861e:	pop    r14
   18620:	pop    r15
   18622:	ret
   18623:	nop    DWORD PTR [rax+rax*1+0x0]
   18628:	xor    ebx,ebx
   1862a:	jmp    1855f <guess_disk_lchs+0x5f>
   1862f:	nop
   18630:	mov    rax,QWORD PTR [rdi]
   18633:	shl    rax,0x9
   18637:	jmp    1854f <guess_disk_lchs+0x4f>
   1863c:	call   31c0 <__stack_chk_fail@plt>
   18641:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   1864c:	nop    DWORD PTR [rax+0x0]

0000000000018650 <bdrv_write>:
   18650:	push   r15
   18652:	push   r14
   18654:	push   r13
   18656:	push   r12
   18658:	push   rbp
   18659:	push   rbx
   1865a:	sub    rsp,0x18
   1865e:	mov    r14,QWORD PTR [rdi+0x38]
   18662:	test   r14,r14
   18665:	je     1875e <bdrv_write+0x10e>
   1866b:	mov    eax,DWORD PTR [rdi+0x8]
   1866e:	mov    r12,rdi
   18671:	test   eax,eax
   18673:	jne    18757 <bdrv_write+0x107>
   18679:	mov    rbx,rsi
   1867c:	mov    r15d,ecx
   1867f:	neg    rsi
   18682:	mov    r13,rdx
   18685:	mov    rcx,rbx
   18688:	mov    ebp,r15d
   1868b:	shl    rcx,0x9
   1868f:	test   rbx,rbx
   18692:	cmovns rsi,rcx
   18696:	shl    ebp,0x9
   18699:	mov    QWORD PTR [rsp+0x8],rcx
   1869e:	movsxd rdx,ebp
   186a1:	call   17e00 <bdrv_check_byte_request>
   186a6:	test   eax,eax
   186a8:	jne    18750 <bdrv_write+0x100>
   186ae:	mov    rax,QWORD PTR [r14+0x98]
   186b5:	test   rax,rax
   186b8:	je     18730 <bdrv_write+0xe0>
   186ba:	xor    r15d,r15d
   186bd:	jmp    186d2 <bdrv_write+0x82>
   186bf:	nop
   186c0:	add    r15d,ebx
   186c3:	add    r13,rbx
   186c6:	cmp    r15d,ebp
   186c9:	je     18718 <bdrv_write+0xc8>
   186cb:	mov    rax,QWORD PTR [r14+0x98]
   186d2:	mov    ecx,ebp
   186d4:	mov    rdx,r13
   186d7:	mov    rsi,QWORD PTR [rsp+0x8]
   186dc:	mov    rdi,r12
   186df:	sub    ecx,r15d
   186e2:	call   rax
   186e4:	movsxd rbx,eax
   186e7:	test   ebx,ebx
   186e9:	jns    186c0 <bdrv_write+0x70>
   186eb:	mov    edx,ebx
   186ed:	lea    rsi,[rip+0x92a5]        # 21999 <__FUNCTION__.13813+0x41>
   186f4:	mov    edi,0x1
   186f9:	xor    eax,eax
   186fb:	call   34d0 <__printf_chk@plt>
   18700:	add    rsp,0x18
   18704:	mov    eax,ebx
   18706:	pop    rbx
   18707:	pop    rbp
   18708:	pop    r12
   1870a:	pop    r13
   1870c:	pop    r14
   1870e:	pop    r15
   18710:	ret
   18711:	nop    DWORD PTR [rax+0x0]
   18718:	add    QWORD PTR [r12+0x868],r15
   18720:	xor    ebx,ebx
   18722:	add    QWORD PTR [r12+0x878],0x1
   1872b:	jmp    18700 <bdrv_write+0xb0>
   1872d:	nop    DWORD PTR [rax]
   18730:	mov    rax,QWORD PTR [r14+0x28]
   18734:	add    rsp,0x18
   18738:	mov    ecx,r15d
   1873b:	mov    rdx,r13
   1873e:	mov    rsi,rbx
   18741:	mov    rdi,r12
   18744:	pop    rbx
   18745:	pop    rbp
   18746:	pop    r12
   18748:	pop    r13
   1874a:	pop    r14
   1874c:	pop    r15
   1874e:	jmp    rax
   18750:	mov    ebx,0xfffffffb
   18755:	jmp    18700 <bdrv_write+0xb0>
   18757:	mov    ebx,0xfffffff3
   1875c:	jmp    18700 <bdrv_write+0xb0>
   1875e:	mov    ebx,0xffffff85
   18763:	jmp    18700 <bdrv_write+0xb0>
   18765:	data16 nop WORD PTR cs:[rax+rax*1+0x0]

0000000000018770 <bdrv_commit>:
   18770:	push   r15
   18772:	push   r14
   18774:	push   r13
   18776:	push   r12
   18778:	push   rbp
   18779:	push   rbx
   1877a:	sub    rsp,0x238
   18781:	mov    r15,QWORD PTR [rdi+0x38]
   18785:	mov    rax,QWORD PTR fs:0x28
   1878e:	mov    QWORD PTR [rsp+0x228],rax
   18796:	xor    eax,eax
   18798:	test   r15,r15
   1879b:	je     188d8 <bdrv_commit+0x168>
   187a1:	mov    eax,DWORD PTR [rdi+0x8]
   187a4:	mov    r12,rdi
   187a7:	mov    DWORD PTR [rsp+0xc],eax
   187ab:	test   eax,eax
   187ad:	jne    188c4 <bdrv_commit+0x154>
   187b3:	cmp    QWORD PTR [rdi+0x850],0x0
   187bb:	je     188ce <bdrv_commit+0x15e>
   187c1:	mov    rax,QWORD PTR [r15+0xa8]
   187c8:	test   rax,rax
   187cb:	je     188b8 <bdrv_commit+0x148>
   187d1:	call   rax
   187d3:	sar    rax,0x9
   187d7:	mov    r14,rax
   187da:	test   rax,rax
   187dd:	jle    18813 <bdrv_commit+0xa3>
   187df:	lea    rax,[rsp+0x1c]
   187e4:	xor    ebx,ebx
   187e6:	lea    r13,[rsp+0x20]
   187eb:	mov    QWORD PTR [rsp],rax
   187ef:	mov    rcx,QWORD PTR [rsp]
   187f3:	mov    edx,0x10000
   187f8:	mov    rsi,rbx
   187fb:	mov    rdi,r12
   187fe:	call   QWORD PTR [r15+0x48]
   18802:	test   eax,eax
   18804:	jne    18830 <bdrv_commit+0xc0>
   18806:	movsxd rax,DWORD PTR [rsp+0x1c]
   1880b:	add    rbx,rax
   1880e:	cmp    rbx,r14
   18811:	jl     187ef <bdrv_commit+0x7f>
   18813:	mov    rax,QWORD PTR [r15+0x58]
   18817:	test   rax,rax
   1881a:	je     18888 <bdrv_commit+0x118>
   1881c:	mov    rdi,r12
   1881f:	call   rax
   18821:	mov    DWORD PTR [rsp+0xc],eax
   18825:	jmp    18888 <bdrv_commit+0x118>
   18827:	nop    WORD PTR [rax+rax*1+0x0]
   18830:	mov    eax,DWORD PTR [rsp+0x1c]
   18834:	test   eax,eax
   18836:	jle    1880e <bdrv_commit+0x9e>
   18838:	xor    ebp,ebp
   1883a:	jmp    18869 <bdrv_commit+0xf9>
   1883c:	nop    DWORD PTR [rax+0x0]
   18840:	mov    rdi,QWORD PTR [r12+0x850]
   18848:	mov    ecx,0x1
   1884d:	mov    rdx,r13
   18850:	mov    rsi,rbx
   18853:	call   18650 <bdrv_write>
   18858:	test   eax,eax
   1885a:	jne    18880 <bdrv_commit+0x110>
   1885c:	add    rbx,0x1
   18860:	add    ebp,0x1
   18863:	cmp    DWORD PTR [rsp+0x1c],ebp
   18867:	jle    1880e <bdrv_commit+0x9e>
   18869:	mov    ecx,0x1
   1886e:	mov    rdx,r13
   18871:	mov    rsi,rbx
   18874:	mov    rdi,r12
   18877:	call   18210 <bdrv_read>
   1887c:	test   eax,eax
   1887e:	je     18840 <bdrv_commit+0xd0>
   18880:	mov    DWORD PTR [rsp+0xc],0xfffffffb
   18888:	mov    rdx,QWORD PTR [rsp+0x228]
   18890:	xor    rdx,QWORD PTR fs:0x28
   18899:	mov    eax,DWORD PTR [rsp+0xc]
   1889d:	jne    188e2 <bdrv_commit+0x172>
   1889f:	add    rsp,0x238
   188a6:	pop    rbx
   188a7:	pop    rbp
   188a8:	pop    r12
   188aa:	pop    r13
   188ac:	pop    r14
   188ae:	pop    r15
   188b0:	ret
   188b1:	nop    DWORD PTR [rax+0x0]
   188b8:	mov    rax,QWORD PTR [rdi]
   188bb:	shl    rax,0x9
   188bf:	jmp    187d3 <bdrv_commit+0x63>
   188c4:	mov    DWORD PTR [rsp+0xc],0xfffffff3
   188cc:	jmp    18888 <bdrv_commit+0x118>
   188ce:	mov    DWORD PTR [rsp+0xc],0xffffffa1
   188d6:	jmp    18888 <bdrv_commit+0x118>
   188d8:	mov    DWORD PTR [rsp+0xc],0xffffff85
   188e0:	jmp    18888 <bdrv_commit+0x118>
   188e2:	call   31c0 <__stack_chk_fail@plt>
   188e7:	nop    WORD PTR [rax+rax*1+0x0]

0000000000018b00 <bdrv_pread>:
   18b00:	push   r14
   18b02:	push   r13
   18b04:	push   r12
   18b06:	push   rbp
   18b07:	push   rbx
   18b08:	mov    r14,QWORD PTR [rdi+0x38]
   18b0c:	test   r14,r14
   18b0f:	je     18b6e <bdrv_pread+0x6e>
   18b11:	mov    r13,rdx
   18b14:	movsxd rdx,ecx
   18b17:	mov    r12d,ecx
   18b1a:	mov    rbp,rsi
   18b1d:	mov    rbx,rdi
   18b20:	call   17e00 <bdrv_check_byte_request>
   18b25:	test   eax,eax
   18b27:	jne    18b60 <bdrv_pread+0x60>
   18b29:	mov    rax,QWORD PTR [r14+0x90]
   18b30:	mov    ecx,r12d
   18b33:	mov    rdx,r13
   18b36:	mov    rsi,rbp
   18b39:	mov    rdi,rbx
   18b3c:	test   rax,rax
   18b3f:	je     18b50 <bdrv_pread+0x50>
   18b41:	pop    rbx
   18b42:	pop    rbp
   18b43:	pop    r12
   18b45:	pop    r13
   18b47:	pop    r14
   18b49:	jmp    rax
   18b4b:	nop    DWORD PTR [rax+rax*1+0x0]
   18b50:	pop    rbx
   18b51:	pop    rbp
   18b52:	pop    r12
   18b54:	pop    r13
   18b56:	pop    r14
   18b58:	jmp    18320 <bdrv_pread_em>
   18b5d:	nop    DWORD PTR [rax]
   18b60:	mov    eax,0xfffffffb
   18b65:	pop    rbx
   18b66:	pop    rbp
   18b67:	pop    r12
   18b69:	pop    r13
   18b6b:	pop    r14
   18b6d:	ret
   18b6e:	mov    eax,0xffffff85
   18b73:	jmp    18b65 <bdrv_pread+0x65>
   18b75:	data16 nop WORD PTR cs:[rax+rax*1+0x0]

0000000000018b80 <bdrv_open2>:
   18b80:	push   r15
   18b82:	mov    r15,rdi
   18b85:	push   r14
   18b87:	push   r13
   18b89:	push   r12
   18b8b:	mov    r12d,edx
   18b8e:	push   rbp
   18b8f:	mov    rbp,rsi
   18b92:	push   rbx
   18b93:	mov    rbx,rcx
   18b96:	sub    rsp,0x28c8
   18b9d:	mov    rax,QWORD PTR fs:0x28
   18ba6:	mov    QWORD PTR [rsp+0x28b8],rax
   18bae:	xor    eax,eax
   18bb0:	and    edx,0x8
   18bb3:	mov    DWORD PTR [rdi+0x8],0x0
   18bba:	mov    DWORD PTR [rdi+0x848],0x0
   18bc4:	mov    QWORD PTR [rdi+0x14],0x0
   18bcc:	je     18cb3 <bdrv_open2+0x133>
   18bd2:	lea    rdi,[rip+0x8089]        # 20c62 <desc_template.13939+0x382>
   18bd9:	call   17ff0 <bdrv_new>
   18bde:	xor    edx,edx
   18be0:	mov    rsi,rbp
   18be3:	mov    rdi,rax
   18be6:	mov    r14,rax
   18be9:	call   19100 <bdrv_open>
   18bee:	mov    r13d,eax
   18bf1:	test   eax,eax
   18bf3:	js     18f70 <bdrv_open2+0x3f0>
   18bf9:	mov    rdx,QWORD PTR [r14+0x38]
   18bfd:	test   rdx,rdx
   18c00:	je     18dfd <bdrv_open2+0x27d>
   18c06:	mov    rax,QWORD PTR [rdx+0xa8]
   18c0d:	test   rax,rax
   18c10:	je     19030 <bdrv_open2+0x4b0>
   18c16:	mov    rdi,r14
   18c19:	call   rax
   18c1b:	mov    rdx,QWORD PTR [r14+0x38]
   18c1f:	sar    rax,0x9
   18c23:	mov    QWORD PTR [rsp],rax
   18c27:	test   rdx,rdx
   18c2a:	je     18e08 <bdrv_open2+0x288>
   18c30:	cmp    QWORD PTR [rdx+0x88],0x0
   18c38:	mov    rdi,r14
   18c3b:	je     18e0b <bdrv_open2+0x28b>
   18c41:	lea    r14,[rsp+0x8b0]
   18c49:	lea    r13,[rsp+0x18b0]
   18c51:	call   18130 <bdrv_delete>
   18c56:	mov    esi,0x1000
   18c5b:	mov    rdi,r14
   18c5e:	call   180d0 <get_tmp_filename>
   18c63:	mov    rcx,rbp
   18c66:	mov    esi,0x1000
   18c6b:	mov    rdi,r13
   18c6e:	lea    rdx,[rip+0x4390]        # 1d005 <_IO_stdin_used+0x5>
   18c75:	xor    eax,eax
   18c77:	call   3200 <snprintf@plt>
   18c7c:	mov    rax,QWORD PTR [rip+0x10f15]        # 29b98 <bdrv_qcow2+0x38>
   18c83:	test   rax,rax
   18c86:	je     19058 <bdrv_open2+0x4d8>
   18c8c:	mov    rdx,r13
   18c8f:	xor    ecx,ecx
   18c91:	mov    rsi,QWORD PTR [rsp]
   18c95:	mov    rdi,r14
   18c98:	call   rax
   18c9a:	mov    r13d,eax
   18c9d:	test   eax,eax
   18c9f:	js     18d89 <bdrv_open2+0x209>
   18ca5:	mov    DWORD PTR [r15+0x848],0x1
   18cb0:	mov    rbp,r14
   18cb3:	lea    rdi,[r15+0x48]
   18cb7:	mov    rdx,rbp
   18cba:	mov    esi,0x400
   18cbf:	call   5560 <pstrcpy>
   18cc4:	test   r12b,0x10
   18cc8:	jne    18db8 <bdrv_open2+0x238>
   18cce:	test   rbx,rbx
   18cd1:	je     18e48 <bdrv_open2+0x2c8>
   18cd7:	mov    QWORD PTR [r15+0x38],rbx
   18cdb:	movsxd rdi,DWORD PTR [rbx+0x8]
   18cdf:	mov    r14d,r12d
   18ce2:	and    r14d,0xe3
   18ce9:	call   59c0 <qemu_mallocz>
   18cee:	mov    edx,r14d
   18cf1:	mov    rsi,rbp
   18cf4:	mov    rdi,r15
   18cf7:	mov    QWORD PTR [r15+0x40],rax
   18cfb:	call   QWORD PTR [rbx+0x18]
   18cfe:	mov    r13d,eax
   18d01:	cmp    eax,0xfffffff3
   18d04:	je     18f48 <bdrv_open2+0x3c8>
   18d0a:	cmp    eax,0xffffffff
   18d0d:	je     18f48 <bdrv_open2+0x3c8>
   18d13:	test   r13d,r13d
   18d16:	js     18ff8 <bdrv_open2+0x478>
   18d1c:	cmp    QWORD PTR [rbx+0xa8],0x0
   18d24:	je     18d4f <bdrv_open2+0x1cf>
   18d26:	mov    rax,QWORD PTR [r15+0x38]
   18d2a:	test   rax,rax
   18d2d:	je     19063 <bdrv_open2+0x4e3>
   18d33:	mov    rax,QWORD PTR [rax+0xa8]
   18d3a:	test   rax,rax
   18d3d:	je     19048 <bdrv_open2+0x4c8>
   18d43:	mov    rdi,r15
   18d46:	call   rax
   18d48:	sar    rax,0x9
   18d4c:	mov    QWORD PTR [r15],rax
   18d4f:	mov    eax,DWORD PTR [r15+0x848]
   18d56:	test   eax,eax
   18d58:	jne    18fe8 <bdrv_open2+0x468>
   18d5e:	cmp    BYTE PTR [r15+0x448],0x0
   18d66:	jne    18f80 <bdrv_open2+0x400>
   18d6c:	mov    rax,QWORD PTR [r15+0x28]
   18d70:	xor    r13d,r13d
   18d73:	mov    DWORD PTR [r15+0x84c],0x1
   18d7e:	test   rax,rax
   18d81:	je     18d89 <bdrv_open2+0x209>
   18d83:	mov    rdi,QWORD PTR [r15+0x30]
   18d87:	call   rax
   18d89:	mov    rcx,QWORD PTR [rsp+0x28b8]
   18d91:	xor    rcx,QWORD PTR fs:0x28
   18d9a:	mov    eax,r13d
   18d9d:	jne    1906f <bdrv_open2+0x4ef>
   18da3:	add    rsp,0x28c8
   18daa:	pop    rbx
   18dab:	pop    rbp
   18dac:	pop    r12
   18dae:	pop    r13
   18db0:	pop    r14
   18db2:	pop    r15
   18db4:	ret
   18db5:	nop    DWORD PTR [rax]
   18db8:	mov    rdi,rbp
   18dbb:	mov    r14d,r12d
   18dbe:	call   17c60 <find_protocol>
   18dc3:	test   rax,rax
   18dc6:	mov    rbx,rax
   18dc9:	lea    rax,[rip+0x113d0]        # 2a1a0 <bdrv_raw>
   18dd0:	cmove  rbx,rax
   18dd4:	and    r14d,0xffffffe7
   18dd8:	mov    QWORD PTR [r15+0x38],rbx
   18ddc:	movsxd rdi,DWORD PTR [rbx+0x8]
   18de0:	call   59c0 <qemu_mallocz>
   18de5:	mov    edx,r14d
   18de8:	mov    rsi,rbp
   18deb:	mov    rdi,r15
   18dee:	mov    QWORD PTR [r15+0x40],rax
   18df2:	call   QWORD PTR [rbx+0x18]
   18df5:	mov    r13d,eax
   18df8:	jmp    18d13 <bdrv_open2+0x193>
   18dfd:	mov    QWORD PTR [rsp],0xffffffffffffffff
   18e05:	nop    DWORD PTR [rax]
   18e08:	mov    rdi,r14
   18e0b:	lea    r14,[rsp+0x8b0]
   18e13:	lea    r13,[rsp+0x18b0]
   18e1b:	call   18130 <bdrv_delete>
   18e20:	mov    rdi,r14
   18e23:	mov    esi,0x1000
   18e28:	call   180d0 <get_tmp_filename>
   18e2d:	mov    edx,0x1000
   18e32:	mov    rsi,r13
   18e35:	mov    rdi,rbp
   18e38:	call   3280 <__realpath_chk@plt>
   18e3d:	jmp    18c7c <bdrv_open2+0xfc>
   18e42:	nop    WORD PTR [rax+rax*1+0x0]
   18e48:	xor    edx,edx
   18e4a:	lea    rsi,[rip+0x8b5b]        # 219ac <__FUNCTION__.13813+0x54>
   18e51:	mov    rdi,rbp
   18e54:	call   5620 <strstart>
   18e59:	lea    rbx,[rip+0x11200]        # 2a060 <bdrv_host_device>
   18e60:	mov    r13d,eax
   18e63:	test   eax,eax
   18e65:	jne    18cd7 <bdrv_open2+0x157>
   18e6b:	lea    rdx,[rsp+0x20]
   18e70:	mov    rsi,rbp
   18e73:	mov    edi,0x1
   18e78:	call   3180 <__xstat64@plt>
   18e7d:	test   eax,eax
   18e7f:	js     18e95 <bdrv_open2+0x315>
   18e81:	mov    eax,DWORD PTR [rsp+0x38]
   18e85:	and    eax,0xb000
   18e8a:	cmp    eax,0x2000
   18e8f:	je     18cd7 <bdrv_open2+0x157>
   18e95:	mov    rdi,rbp
   18e98:	call   17c60 <find_protocol>
   18e9d:	mov    rbx,rax
   18ea0:	test   rax,rax
   18ea3:	jne    18cd7 <bdrv_open2+0x157>
   18ea9:	xor    edx,edx
   18eab:	lea    rdi,[rsp+0x18]
   18eb0:	mov    rsi,rbp
   18eb3:	call   19080 <bdrv_file_open>
   18eb8:	test   eax,eax
   18eba:	js     18f36 <bdrv_open2+0x3b6>
   18ebc:	lea    rax,[rsp+0xb0]
   18ec4:	mov    rdi,QWORD PTR [rsp+0x18]
   18ec9:	xor    esi,esi
   18ecb:	mov    ecx,0x800
   18ed0:	mov    rdx,rax
   18ed3:	mov    QWORD PTR [rsp+0x8],rax
   18ed8:	call   18b00 <bdrv_pread>
   18edd:	mov    rdi,QWORD PTR [rsp+0x18]
   18ee2:	mov    r14d,eax
   18ee5:	mov    DWORD PTR [rsp],eax
   18ee8:	call   18130 <bdrv_delete>
   18eed:	test   r14d,r14d
   18ef0:	js     18f36 <bdrv_open2+0x3b6>
   18ef2:	mov    r14,QWORD PTR [rip+0x11487]        # 2a380 <first_drv>
   18ef9:	test   r14,r14
   18efc:	je     18f36 <bdrv_open2+0x3b6>
   18efe:	xchg   ax,ax
   18f00:	mov    rax,QWORD PTR [r14+0x10]
   18f04:	test   rax,rax
   18f07:	je     18f21 <bdrv_open2+0x3a1>
   18f09:	mov    rdx,rbp
   18f0c:	mov    esi,DWORD PTR [rsp]
   18f0f:	mov    rdi,QWORD PTR [rsp+0x8]
   18f14:	call   rax
   18f16:	cmp    eax,r13d
   18f19:	jle    18f21 <bdrv_open2+0x3a1>
   18f1b:	mov    rbx,r14
   18f1e:	mov    r13d,eax
   18f21:	mov    r14,QWORD PTR [r14+0x138]
   18f28:	test   r14,r14
   18f2b:	jne    18f00 <bdrv_open2+0x380>
   18f2d:	test   rbx,rbx
   18f30:	jne    18cd7 <bdrv_open2+0x157>
   18f36:	mov    r13d,0xfffffffe
   18f3c:	jmp    19011 <bdrv_open2+0x491>
   18f41:	nop    DWORD PTR [rax+0x0]
   18f48:	mov    edx,r12d
   18f4b:	mov    rsi,rbp
   18f4e:	mov    rdi,r15
   18f51:	and    edx,0xe1
   18f57:	call   QWORD PTR [rbx+0x18]
   18f5a:	mov    DWORD PTR [r15+0x8],0x1
   18f62:	mov    r13d,eax
   18f65:	jmp    18d13 <bdrv_open2+0x193>
   18f6a:	nop    WORD PTR [rax+rax*1+0x0]
   18f70:	mov    rdi,r14
   18f73:	call   18130 <bdrv_delete>
   18f78:	jmp    18d89 <bdrv_open2+0x209>
   18f7d:	nop    DWORD PTR [rax]
   18f80:	lea    rdi,[rip+0x7cdb]        # 20c62 <desc_template.13939+0x382>
   18f87:	lea    rbx,[rsp+0x18b0]
   18f8f:	call   17ff0 <bdrv_new>
   18f94:	mov    rdx,rbp
   18f97:	mov    esi,0x1000
   18f9c:	mov    rdi,rbx
   18f9f:	mov    QWORD PTR [r15+0x850],rax
   18fa6:	lea    rcx,[r15+0x448]
   18fad:	call   17ee0 <path_combine>
   18fb2:	mov    rdi,QWORD PTR [r15+0x850]
   18fb9:	mov    edx,r14d
   18fbc:	mov    rsi,rbx
   18fbf:	lea    rcx,[rip+0x111da]        # 2a1a0 <bdrv_raw>
   18fc6:	call   18b80 <bdrv_open2>
   18fcb:	mov    r13d,eax
   18fce:	test   eax,eax
   18fd0:	jns    18d6c <bdrv_open2+0x1ec>
   18fd6:	mov    rdi,r15
   18fd9:	call   181a0 <bdrv_close>
   18fde:	jmp    18d89 <bdrv_open2+0x209>
   18fe3:	nop    DWORD PTR [rax+rax*1+0x0]
   18fe8:	mov    rdi,rbp
   18feb:	call   30e0 <unlink@plt>
   18ff0:	jmp    18d5e <bdrv_open2+0x1de>
   18ff5:	nop    DWORD PTR [rax]
   18ff8:	mov    rdi,QWORD PTR [r15+0x40]
   18ffc:	call   5960 <qemu_free>
   19001:	mov    QWORD PTR [r15+0x40],0x0
   19009:	mov    QWORD PTR [r15+0x38],0x0
   19011:	mov    edx,DWORD PTR [r15+0x848]
   19018:	test   edx,edx
   1901a:	je     18d89 <bdrv_open2+0x209>
   19020:	mov    rdi,rbp
   19023:	call   30e0 <unlink@plt>
   19028:	jmp    18d89 <bdrv_open2+0x209>
   1902d:	nop    DWORD PTR [rax]
   19030:	mov    r13,QWORD PTR [r14]
   19033:	shl    r13,0x9
   19037:	sar    r13,0x9
   1903b:	mov    QWORD PTR [rsp],r13
   1903f:	jmp    18c30 <bdrv_open2+0xb0>
   19044:	nop    DWORD PTR [rax+0x0]
   19048:	mov    rax,QWORD PTR [r15]
   1904b:	shl    rax,0x9
   1904f:	sar    rax,0x9
   19053:	jmp    18d4c <bdrv_open2+0x1cc>
   19058:	mov    r13d,0xffffffa1
   1905e:	jmp    18d89 <bdrv_open2+0x209>
   19063:	mov    rax,0xffffffffffffffff
   1906a:	jmp    18d4c <bdrv_open2+0x1cc>
   1906f:	call   31c0 <__stack_chk_fail@plt>
   19074:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   1907f:	nop

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

0000000000019100 <bdrv_open>:
   19100:	xor    ecx,ecx
   19102:	jmp    18b80 <bdrv_open2>
   19107:	nop    WORD PTR [rax+rax*1+0x0]

0000000000019110 <bdrv_pwrite>:
   19110:	push   r14
   19112:	push   r13
   19114:	push   r12
   19116:	push   rbp
   19117:	push   rbx
   19118:	mov    r14,QWORD PTR [rdi+0x38]
   1911c:	test   r14,r14
   1911f:	je     1917e <bdrv_pwrite+0x6e>
   19121:	mov    r13,rdx
   19124:	movsxd rdx,ecx
   19127:	mov    r12d,ecx
   1912a:	mov    rbp,rsi
   1912d:	mov    rbx,rdi
   19130:	call   17e00 <bdrv_check_byte_request>
   19135:	test   eax,eax
   19137:	jne    19170 <bdrv_pwrite+0x60>
   19139:	mov    rax,QWORD PTR [r14+0x98]
   19140:	mov    ecx,r12d
   19143:	mov    rdx,r13
   19146:	mov    rsi,rbp
   19149:	mov    rdi,rbx
   1914c:	test   rax,rax
   1914f:	je     19160 <bdrv_pwrite+0x50>
   19151:	pop    rbx
   19152:	pop    rbp
   19153:	pop    r12
   19155:	pop    r13
   19157:	pop    r14
   19159:	jmp    rax
   1915b:	nop    DWORD PTR [rax+rax*1+0x0]
   19160:	pop    rbx
   19161:	pop    rbp
   19162:	pop    r12
   19164:	pop    r13
   19166:	pop    r14
   19168:	jmp    188f0 <bdrv_pwrite_em>
   1916d:	nop    DWORD PTR [rax]
   19170:	mov    eax,0xfffffffb
   19175:	pop    rbx
   19176:	pop    rbp
   19177:	pop    r12
   19179:	pop    r13
   1917b:	pop    r14
   1917d:	ret
   1917e:	mov    eax,0xffffff85
   19183:	jmp    19175 <bdrv_pwrite+0x65>
   19185:	data16 nop WORD PTR cs:[rax+rax*1+0x0]

0000000000019190 <bdrv_truncate>:
   19190:	mov    rax,QWORD PTR [rdi+0x38]
   19194:	test   rax,rax
   19197:	je     191a7 <bdrv_truncate+0x17>
   19199:	mov    rax,QWORD PTR [rax+0xa0]
   191a0:	test   rax,rax
   191a3:	je     191ad <bdrv_truncate+0x1d>
   191a5:	jmp    rax
   191a7:	mov    eax,0xffffff85
   191ac:	ret
   191ad:	mov    eax,0xffffffa1
   191b2:	ret
   191b3:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   191be:	xchg   ax,ax

00000000000191c0 <bdrv_getlength>:
   191c0:	mov    rax,QWORD PTR [rdi+0x38]
   191c4:	test   rax,rax
   191c7:	je     191e8 <bdrv_getlength+0x28>
   191c9:	mov    rax,QWORD PTR [rax+0xa8]
   191d0:	test   rax,rax
   191d3:	je     191e0 <bdrv_getlength+0x20>
   191d5:	jmp    rax
   191d7:	nop    WORD PTR [rax+rax*1+0x0]
   191e0:	mov    rax,QWORD PTR [rdi]
   191e3:	shl    rax,0x9
   191e7:	ret
   191e8:	mov    rax,0xffffffffffffff85
   191ef:	ret

00000000000191f0 <bdrv_get_geometry>:
   191f0:	mov    rax,QWORD PTR [rdi+0x38]
   191f4:	push   rbx
   191f5:	mov    rbx,rsi
   191f8:	test   rax,rax
   191fb:	je     19220 <bdrv_get_geometry+0x30>
   191fd:	mov    rax,QWORD PTR [rax+0xa8]
   19204:	test   rax,rax
   19207:	je     19230 <bdrv_get_geometry+0x40>
   19209:	call   rax
   1920b:	test   rax,rax
   1920e:	js     19220 <bdrv_get_geometry+0x30>
   19210:	sar    rax,0x9
   19214:	mov    QWORD PTR [rbx],rax
   19217:	pop    rbx
   19218:	ret
   19219:	nop    DWORD PTR [rax+0x0]
   19220:	xor    eax,eax
   19222:	mov    QWORD PTR [rbx],rax
   19225:	pop    rbx
   19226:	ret
   19227:	nop    WORD PTR [rax+rax*1+0x0]
   19230:	mov    rax,QWORD PTR [rdi]
   19233:	shl    rax,0x9
   19237:	jmp    1920b <bdrv_get_geometry+0x1b>
   19239:	nop    DWORD PTR [rax+0x0]

0000000000019240 <bdrv_guess_geometry>:
   19240:	push   r15
   19242:	push   r14
   19244:	push   r13
   19246:	mov    r13,rdx
   19249:	push   r12
   1924b:	mov    r12,rsi
   1924e:	push   rbp
   1924f:	mov    rbp,rcx
   19252:	push   rbx
   19253:	mov    rbx,rdi
   19256:	sub    rsp,0x28
   1925a:	mov    rax,QWORD PTR fs:0x28
   19263:	mov    QWORD PTR [rsp+0x18],rax
   19268:	xor    eax,eax
   1926a:	mov    rax,QWORD PTR [rdi+0x38]
   1926e:	test   rax,rax
   19271:	je     192e8 <bdrv_guess_geometry+0xa8>
   19273:	mov    rax,QWORD PTR [rax+0xa8]
   1927a:	test   rax,rax
   1927d:	je     193f0 <bdrv_guess_geometry+0x1b0>
   19283:	call   rax
   19285:	test   rax,rax
   19288:	js     192e8 <bdrv_guess_geometry+0xa8>
   1928a:	sar    rax,0x9
   1928e:	mov    r14,rax
   19291:	mov    ecx,DWORD PTR [rbx+0x884]
   19297:	mov    edx,DWORD PTR [rbx+0x888]
   1929d:	mov    eax,DWORD PTR [rbx+0x88c]
   192a3:	mov    DWORD PTR [rsp+0xc],ecx
   192a7:	mov    DWORD PTR [rsp+0x10],edx
   192ab:	mov    DWORD PTR [rsp+0x14],eax
   192af:	test   ecx,ecx
   192b1:	je     192f0 <bdrv_guess_geometry+0xb0>
   192b3:	mov    DWORD PTR [r12],ecx
   192b7:	mov    DWORD PTR [r13+0x0],edx
   192bb:	mov    DWORD PTR [rbp+0x0],eax
   192be:	mov    rax,QWORD PTR [rsp+0x18]
   192c3:	xor    rax,QWORD PTR fs:0x28
   192cc:	jne    1943a <bdrv_guess_geometry+0x1fa>
   192d2:	add    rsp,0x28
   192d6:	pop    rbx
   192d7:	pop    rbp
   192d8:	pop    r12
   192da:	pop    r13
   192dc:	pop    r14
   192de:	pop    r15
   192e0:	ret
   192e1:	nop    DWORD PTR [rax+0x0]
   192e8:	xor    r14d,r14d
   192eb:	jmp    19291 <bdrv_guess_geometry+0x51>
   192ed:	nop    DWORD PTR [rax]
   192f0:	lea    rcx,[rsp+0x14]
   192f5:	lea    rdx,[rsp+0x10]
   192fa:	mov    rdi,rbx
   192fd:	mov    r15d,DWORD PTR [rbx+0x890]
   19304:	lea    rsi,[rsp+0xc]
   19309:	call   18500 <guess_disk_lchs>
   1930e:	test   eax,eax
   19310:	je     193b0 <bdrv_guess_geometry+0x170>
   19316:	xor    ecx,ecx
   19318:	movabs rsi,0x820820820820821
   19322:	mov    rdx,r14
   19325:	shr    rdx,0x4
   19329:	mov    rax,rdx
   1932c:	mul    rsi
   1932f:	shr    rdx,1
   19332:	mov    eax,edx
   19334:	cmp    edx,0x3fff
   1933a:	jle    19400 <bdrv_guess_geometry+0x1c0>
   19340:	mov    DWORD PTR [rsp+0xc],0x3fff
   19348:	mov    eax,0x3fff
   1934d:	mov    DWORD PTR [r12],eax
   19351:	mov    eax,0x3f
   19356:	mov    DWORD PTR [r13+0x0],0x10
   1935e:	mov    DWORD PTR [rbp+0x0],0x3f
   19365:	test   cl,cl
   19367:	je     19390 <bdrv_guess_geometry+0x150>
   19369:	mov    eax,DWORD PTR [r12]
   1936d:	imul   eax,DWORD PTR [r13+0x0]
   19372:	cmp    eax,0x20000
   19377:	jg     19410 <bdrv_guess_geometry+0x1d0>
   1937d:	mov    DWORD PTR [rbx+0x890],0x3
   19387:	mov    eax,DWORD PTR [rbp+0x0]
   1938a:	nop    WORD PTR [rax+rax*1+0x0]
   19390:	mov    edx,DWORD PTR [r13+0x0]
   19394:	mov    ecx,DWORD PTR [r12]
   19398:	mov    DWORD PTR [rbx+0x88c],eax
   1939e:	mov    DWORD PTR [rbx+0x884],ecx
   193a4:	mov    DWORD PTR [rbx+0x888],edx
   193aa:	jmp    192be <bdrv_guess_geometry+0x7e>
   193af:	nop
   193b0:	mov    eax,DWORD PTR [rsp+0x10]
   193b4:	test   r15d,r15d
   193b7:	sete   cl
   193ba:	cmp    eax,0x10
   193bd:	jg     19318 <bdrv_guess_geometry+0xd8>
   193c3:	mov    edx,DWORD PTR [rsp+0xc]
   193c7:	mov    DWORD PTR [r12],edx
   193cb:	mov    DWORD PTR [r13+0x0],eax
   193cf:	mov    eax,DWORD PTR [rsp+0x14]
   193d3:	mov    DWORD PTR [rbp+0x0],eax
   193d6:	test   r15d,r15d
   193d9:	jne    19390 <bdrv_guess_geometry+0x150>
   193db:	mov    DWORD PTR [rbx+0x890],0x1
   193e5:	mov    eax,DWORD PTR [rbp+0x0]
   193e8:	jmp    19390 <bdrv_guess_geometry+0x150>
   193ea:	nop    WORD PTR [rax+rax*1+0x0]
   193f0:	mov    rax,QWORD PTR [rdi]
   193f3:	shl    rax,0x9
   193f7:	jmp    19285 <bdrv_guess_geometry+0x45>
   193fc:	nop    DWORD PTR [rax+0x0]
   19400:	cmp    edx,0x1
   19403:	jle    19428 <bdrv_guess_geometry+0x1e8>
   19405:	mov    DWORD PTR [rsp+0xc],edx
   19409:	jmp    1934d <bdrv_guess_geometry+0x10d>
   1940e:	xchg   ax,ax
   19410:	mov    DWORD PTR [rbx+0x890],0x2
   1941a:	mov    eax,DWORD PTR [rbp+0x0]
   1941d:	jmp    19390 <bdrv_guess_geometry+0x150>
   19422:	nop    WORD PTR [rax+rax*1+0x0]
   19428:	mov    DWORD PTR [rsp+0xc],0x2
   19430:	mov    eax,0x2
   19435:	jmp    1934d <bdrv_guess_geometry+0x10d>
   1943a:	call   31c0 <__stack_chk_fail@plt>
   1943f:	nop

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

0000000000019570 <bdrv_set_key>:
   19570:	push   rbp
   19571:	mov    rbp,rsi
   19574:	push   rbx
   19575:	mov    rbx,rdi
   19578:	sub    rsp,0x8
   1957c:	mov    rdi,QWORD PTR [rdi+0x850]
   19583:	test   rdi,rdi
   19586:	je     1958f <bdrv_set_key+0x1f>
   19588:	mov    edx,DWORD PTR [rdi+0x14]
   1958b:	test   edx,edx
   1958d:	jne    195c8 <bdrv_set_key+0x58>
   1958f:	mov    eax,DWORD PTR [rbx+0x14]
   19592:	test   eax,eax
   19594:	je     195e0 <bdrv_set_key+0x70>
   19596:	mov    rax,QWORD PTR [rbx+0x38]
   1959a:	test   rax,rax
   1959d:	je     195e0 <bdrv_set_key+0x70>
   1959f:	mov    rax,QWORD PTR [rax+0x50]
   195a3:	test   rax,rax
   195a6:	je     195e0 <bdrv_set_key+0x70>
   195a8:	mov    rsi,rbp
   195ab:	mov    rdi,rbx
   195ae:	call   rax
   195b0:	xor    edx,edx
   195b2:	test   eax,eax
   195b4:	sete   dl
   195b7:	mov    DWORD PTR [rbx+0x18],edx
   195ba:	add    rsp,0x8
   195be:	pop    rbx
   195bf:	pop    rbp
   195c0:	ret
   195c1:	nop    DWORD PTR [rax+0x0]
   195c8:	call   19570 <bdrv_set_key>
   195cd:	test   eax,eax
   195cf:	js     195ba <bdrv_set_key+0x4a>
   195d1:	mov    eax,DWORD PTR [rbx+0x14]
   195d4:	test   eax,eax
   195d6:	jne    19596 <bdrv_set_key+0x26>
   195d8:	jmp    195ba <bdrv_set_key+0x4a>
   195da:	nop    WORD PTR [rax+rax*1+0x0]
   195e0:	mov    eax,0xffffffff
   195e5:	jmp    195ba <bdrv_set_key+0x4a>
   195e7:	nop    WORD PTR [rax+rax*1+0x0]

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

0000000000019620 <bdrv_iterate_format>:
   19620:	push   r12
   19622:	push   rbp
   19623:	push   rbx
   19624:	mov    rbx,QWORD PTR [rip+0x10d55]        # 2a380 <first_drv>
   1962b:	test   rbx,rbx
   1962e:	je     19655 <bdrv_iterate_format+0x35>
   19630:	mov    r12,rdi
   19633:	mov    rbp,rsi
   19636:	nop    WORD PTR cs:[rax+rax*1+0x0]
   19640:	mov    rsi,QWORD PTR [rbx]
   19643:	mov    rdi,rbp
   19646:	call   r12
   19649:	mov    rbx,QWORD PTR [rbx+0x138]
   19650:	test   rbx,rbx
   19653:	jne    19640 <bdrv_iterate_format+0x20>
   19655:	pop    rbx
   19656:	pop    rbp
   19657:	pop    r12
   19659:	ret
   1965a:	nop    WORD PTR [rax+rax*1+0x0]

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

00000000000196b0 <bdrv_iterate>:
   196b0:	push   r12
   196b2:	push   rbp
   196b3:	push   rbx
   196b4:	mov    rbx,QWORD PTR [rip+0x10ddd]        # 2a498 <bdrv_first>
   196bb:	test   rbx,rbx
   196be:	je     196e5 <bdrv_iterate+0x35>
   196c0:	mov    r12,rdi
   196c3:	mov    rbp,rsi
   196c6:	nop    WORD PTR cs:[rax+rax*1+0x0]
   196d0:	mov    rsi,rbx
   196d3:	mov    rdi,rbp
   196d6:	call   r12
   196d9:	mov    rbx,QWORD PTR [rbx+0x8b8]
   196e0:	test   rbx,rbx
   196e3:	jne    196d0 <bdrv_iterate+0x20>
   196e5:	pop    rbx
   196e6:	pop    rbp
   196e7:	pop    r12
   196e9:	ret
   196ea:	nop    WORD PTR [rax+rax*1+0x0]

00000000000196f0 <bdrv_get_device_name>:
   196f0:	lea    rax,[rdi+0x898]
   196f7:	ret
   196f8:	nop    DWORD PTR [rax+rax*1+0x0]

0000000000019700 <bdrv_flush>:
   19700:	push   rbx
   19701:	mov    rbx,rdi
   19704:	jmp    1972e <bdrv_flush+0x2e>
   19706:	nop    WORD PTR cs:[rax+rax*1+0x0]
   19710:	mov    rax,QWORD PTR [rax+0x40]
   19714:	test   rax,rax
   19717:	je     19722 <bdrv_flush+0x22>
   19719:	mov    rdi,rbx
   1971c:	call   rax
   1971e:	test   eax,eax
   19720:	jne    1973c <bdrv_flush+0x3c>
   19722:	mov    rbx,QWORD PTR [rbx+0x850]
   19729:	test   rbx,rbx
   1972c:	je     19740 <bdrv_flush+0x40>
   1972e:	mov    rax,QWORD PTR [rbx+0x38]
   19732:	test   rax,rax
   19735:	jne    19710 <bdrv_flush+0x10>
   19737:	mov    eax,0xffffffea
   1973c:	pop    rbx
   1973d:	ret
   1973e:	xchg   ax,ax
   19740:	xor    eax,eax
   19742:	pop    rbx
   19743:	ret
   19744:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   1974f:	nop

0000000000019750 <bdrv_flush_all>:
   19750:	push   r13
   19752:	push   r12
   19754:	xor    r12d,r12d
   19757:	push   rbp
   19758:	push   rbx
   19759:	sub    rsp,0x8
   1975d:	mov    rbp,QWORD PTR [rip+0x10d34]        # 2a498 <bdrv_first>
   19764:	test   rbp,rbp
   19767:	je     197ac <bdrv_flush_all+0x5c>
   19769:	mov    r13d,0xffffffea
   1976f:	nop
   19770:	mov    rax,QWORD PTR [rbp+0x38]
   19774:	test   rax,rax
   19777:	je     197a0 <bdrv_flush_all+0x50>
   19779:	mov    ecx,DWORD PTR [rbp+0x8]
   1977c:	test   ecx,ecx
   1977e:	jne    197a0 <bdrv_flush_all+0x50>
   19780:	mov    edx,DWORD PTR [rbp+0xc]
   19783:	test   edx,edx
   19785:	je     197c4 <bdrv_flush_all+0x74>
   19787:	mov    rdx,QWORD PTR [rax+0xf0]
   1978e:	test   rdx,rdx
   19791:	je     197c4 <bdrv_flush_all+0x74>
   19793:	mov    rdi,rbp
   19796:	call   rdx
   19798:	test   eax,eax
   1979a:	jne    197c0 <bdrv_flush_all+0x70>
   1979c:	nop    DWORD PTR [rax+0x0]
   197a0:	mov    rbp,QWORD PTR [rbp+0x8b8]
   197a7:	test   rbp,rbp
   197aa:	jne    19770 <bdrv_flush_all+0x20>
   197ac:	add    rsp,0x8
   197b0:	mov    eax,r12d
   197b3:	pop    rbx
   197b4:	pop    rbp
   197b5:	pop    r12
   197b7:	pop    r13
   197b9:	ret
   197ba:	nop    WORD PTR [rax+rax*1+0x0]
   197c0:	mov    rax,QWORD PTR [rbp+0x38]
   197c4:	mov    rbx,rbp
   197c7:	jmp    197f2 <bdrv_flush_all+0xa2>
   197c9:	nop    DWORD PTR [rax+0x0]
   197d0:	mov    rax,QWORD PTR [rax+0x40]
   197d4:	test   rax,rax
   197d7:	je     197e2 <bdrv_flush_all+0x92>
   197d9:	mov    rdi,rbx
   197dc:	call   rax
   197de:	test   eax,eax
   197e0:	jne    19800 <bdrv_flush_all+0xb0>
   197e2:	mov    rbx,QWORD PTR [rbx+0x850]
   197e9:	test   rbx,rbx
   197ec:	je     197a0 <bdrv_flush_all+0x50>
   197ee:	mov    rax,QWORD PTR [rbx+0x38]
   197f2:	test   rax,rax
   197f5:	jne    197d0 <bdrv_flush_all+0x80>
   197f7:	mov    r12d,r13d
   197fa:	jmp    197a0 <bdrv_flush_all+0x50>
   197fc:	nop    DWORD PTR [rax+0x0]
   19800:	mov    r12d,eax
   19803:	jmp    197a0 <bdrv_flush_all+0x50>
   19805:	data16 nop WORD PTR cs:[rax+rax*1+0x0]

0000000000019810 <bdrv_is_allocated>:
   19810:	mov    rax,QWORD PTR [rdi+0x38]
   19814:	mov    rax,QWORD PTR [rax+0x48]
   19818:	test   rax,rax
   1981b:	je     19820 <bdrv_is_allocated+0x10>
   1981d:	jmp    rax
   1981f:	nop
   19820:	mov    rax,QWORD PTR [rdi]
   19823:	cmp    rax,rsi
   19826:	jg     19838 <bdrv_is_allocated+0x28>
   19828:	mov    DWORD PTR [rcx],0x0
   1982e:	xor    eax,eax
   19830:	ret
   19831:	nop    DWORD PTR [rax+0x0]
   19838:	sub    rax,rsi
   1983b:	movsxd rdx,edx
   1983e:	cmp    rax,rdx
   19841:	cmovle rdx,rax
   19845:	mov    eax,0x1
   1984a:	mov    DWORD PTR [rcx],edx
   1984c:	ret
   1984d:	nop    DWORD PTR [rax]

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

0000000000019ad0 <bdrv_write_compressed>:
   19ad0:	push   r15
   19ad2:	push   r14
   19ad4:	push   r13
   19ad6:	push   r12
   19ad8:	push   rbp
   19ad9:	push   rbx
   19ada:	sub    rsp,0x18
   19ade:	mov    r14,QWORD PTR [rdi+0x38]
   19ae2:	test   r14,r14
   19ae5:	je     19b8b <bdrv_write_compressed+0xbb>
   19aeb:	mov    rax,rsi
   19aee:	mov    r12,rsi
   19af1:	mov    r15d,ecx
   19af4:	mov    QWORD PTR [rsp+0x8],rdx
   19af9:	neg    rax
   19afc:	shl    r12,0x9
   19b00:	test   rsi,rsi
   19b03:	mov    rbx,rsi
   19b06:	cmovs  r12,rax
   19b0a:	shl    r15d,0x9
   19b0e:	mov    r13d,ecx
   19b11:	mov    rbp,rdi
   19b14:	movsxd r15,r15d
   19b17:	mov    rdx,r15
   19b1a:	mov    rsi,r12
   19b1d:	call   17e00 <bdrv_check_byte_request>
   19b22:	test   eax,eax
   19b24:	jne    19b70 <bdrv_write_compressed+0xa0>
   19b26:	cmp    QWORD PTR [r14+0xb0],0x0
   19b2e:	je     19b84 <bdrv_write_compressed+0xb4>
   19b30:	mov    rdx,r15
   19b33:	mov    rsi,r12
   19b36:	mov    rdi,rbp
   19b39:	call   17e00 <bdrv_check_byte_request>
   19b3e:	test   eax,eax
   19b40:	jne    19b70 <bdrv_write_compressed+0xa0>
   19b42:	mov    rax,QWORD PTR [r14+0xb0]
   19b49:	mov    ecx,r13d
   19b4c:	mov    rsi,rbx
   19b4f:	mov    rdi,rbp
   19b52:	mov    rdx,QWORD PTR [rsp+0x8]
   19b57:	add    rsp,0x18
   19b5b:	pop    rbx
   19b5c:	pop    rbp
   19b5d:	pop    r12
   19b5f:	pop    r13
   19b61:	pop    r14
   19b63:	pop    r15
   19b65:	jmp    rax
   19b67:	nop    WORD PTR [rax+rax*1+0x0]
   19b70:	mov    eax,0xfffffffb
   19b75:	add    rsp,0x18
   19b79:	pop    rbx
   19b7a:	pop    rbp
   19b7b:	pop    r12
   19b7d:	pop    r13
   19b7f:	pop    r14
   19b81:	pop    r15
   19b83:	ret
   19b84:	mov    eax,0xffffffa1
   19b89:	jmp    19b75 <bdrv_write_compressed+0xa5>
   19b8b:	mov    eax,0xffffff85
   19b90:	jmp    19b75 <bdrv_write_compressed+0xa5>
   19b92:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   19b9d:	nop    DWORD PTR [rax]

0000000000019ba0 <bdrv_get_info>:
   19ba0:	mov    rax,QWORD PTR [rdi+0x38]
   19ba4:	test   rax,rax
   19ba7:	je     19bc6 <bdrv_get_info+0x26>
   19ba9:	cmp    QWORD PTR [rax+0xd8],0x0
   19bb1:	je     19bc0 <bdrv_get_info+0x20>
   19bb3:	pxor   xmm0,xmm0
   19bb7:	movups XMMWORD PTR [rsi],xmm0
   19bba:	jmp    QWORD PTR [rax+0xd8]
   19bc0:	mov    eax,0xffffffa1
   19bc5:	ret
   19bc6:	mov    eax,0xffffff85
   19bcb:	ret
   19bcc:	nop    DWORD PTR [rax+0x0]

0000000000019bd0 <bdrv_put_buffer>:
   19bd0:	mov    rax,QWORD PTR [rdi+0x38]
   19bd4:	test   rax,rax
   19bd7:	je     19be7 <bdrv_put_buffer+0x17>
   19bd9:	mov    rax,QWORD PTR [rax+0xe0]
   19be0:	test   rax,rax
   19be3:	je     19bed <bdrv_put_buffer+0x1d>
   19be5:	jmp    rax
   19be7:	mov    eax,0xffffff85
   19bec:	ret
   19bed:	mov    eax,0xffffffa1
   19bf2:	ret
   19bf3:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   19bfe:	xchg   ax,ax

0000000000019c00 <bdrv_get_buffer>:
   19c00:	mov    rax,QWORD PTR [rdi+0x38]
   19c04:	test   rax,rax
   19c07:	je     19c17 <bdrv_get_buffer+0x17>
   19c09:	mov    rax,QWORD PTR [rax+0xe8]
   19c10:	test   rax,rax
   19c13:	je     19c1d <bdrv_get_buffer+0x1d>
   19c15:	jmp    rax
   19c17:	mov    eax,0xffffff85
   19c1c:	ret
   19c1d:	mov    eax,0xffffffa1
   19c22:	ret
   19c23:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   19c2e:	xchg   ax,ax

0000000000019c30 <bdrv_snapshot_create>:
   19c30:	mov    rax,QWORD PTR [rdi+0x38]
   19c34:	test   rax,rax
   19c37:	je     19c47 <bdrv_snapshot_create+0x17>
   19c39:	mov    rax,QWORD PTR [rax+0xb8]
   19c40:	test   rax,rax
   19c43:	je     19c4d <bdrv_snapshot_create+0x1d>
   19c45:	jmp    rax
   19c47:	mov    eax,0xffffff85
   19c4c:	ret
   19c4d:	mov    eax,0xffffffa1
   19c52:	ret
   19c53:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   19c5e:	xchg   ax,ax

0000000000019c60 <bdrv_snapshot_goto>:
   19c60:	mov    rax,QWORD PTR [rdi+0x38]
   19c64:	test   rax,rax
   19c67:	je     19c77 <bdrv_snapshot_goto+0x17>
   19c69:	mov    rax,QWORD PTR [rax+0xc0]
   19c70:	test   rax,rax
   19c73:	je     19c7d <bdrv_snapshot_goto+0x1d>
   19c75:	jmp    rax
   19c77:	mov    eax,0xffffff85
   19c7c:	ret
   19c7d:	mov    eax,0xffffffa1
   19c82:	ret
   19c83:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   19c8e:	xchg   ax,ax

0000000000019c90 <bdrv_snapshot_delete>:
   19c90:	mov    rax,QWORD PTR [rdi+0x38]
   19c94:	test   rax,rax
   19c97:	je     19ca7 <bdrv_snapshot_delete+0x17>
   19c99:	mov    rax,QWORD PTR [rax+0xc8]
   19ca0:	test   rax,rax
   19ca3:	je     19cad <bdrv_snapshot_delete+0x1d>
   19ca5:	jmp    rax
   19ca7:	mov    eax,0xffffff85
   19cac:	ret
   19cad:	mov    eax,0xffffffa1
   19cb2:	ret
   19cb3:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   19cbe:	xchg   ax,ax

0000000000019cc0 <bdrv_snapshot_list>:
   19cc0:	mov    rax,QWORD PTR [rdi+0x38]
   19cc4:	test   rax,rax
   19cc7:	je     19cd7 <bdrv_snapshot_list+0x17>
   19cc9:	mov    rax,QWORD PTR [rax+0xd0]
   19cd0:	test   rax,rax
   19cd3:	je     19cdd <bdrv_snapshot_list+0x1d>
   19cd5:	jmp    rax
   19cd7:	mov    eax,0xffffff85
   19cdc:	ret
   19cdd:	mov    eax,0xffffffa1
   19ce2:	ret
   19ce3:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   19cee:	xchg   ax,ax

0000000000019cf0 <get_human_readable_size>:
   19cf0:	push   rbx
   19cf1:	movsxd rsi,esi
   19cf4:	mov    rbx,rdi
   19cf7:	cmp    rdx,0x3e7
   19cfe:	jle    19d98 <get_human_readable_size+0xa8>
   19d04:	cmp    rdx,0x27ff
   19d0b:	jle    19e30 <get_human_readable_size+0x140>
   19d11:	cmp    rdx,0xf9fff
   19d18:	jle    19e40 <get_human_readable_size+0x150>
   19d1e:	xor    edi,edi
   19d20:	mov    ecx,0x400
   19d25:	lea    rax,[rcx+rcx*4]
   19d29:	mov    r8,rcx
   19d2c:	add    edi,0x1
   19d2f:	shl    rax,0xb
   19d33:	shl    r8,0xa
   19d37:	cmp    rdx,rax
   19d3a:	jl     19dc0 <get_human_readable_size+0xd0>
   19d40:	imul   rcx,rcx,0xfa000
   19d47:	cmp    rdx,rcx
   19d4a:	jl     19e10 <get_human_readable_size+0x120>
   19d50:	mov    rcx,r8
   19d53:	cmp    edi,0x3
   19d56:	jne    19d25 <get_human_readable_size+0x35>
   19d58:	sar    rcx,1
   19d5b:	mov    edi,0x54
   19d60:	lea    rax,[rdx+rcx*1]
   19d64:	sub    rsp,0x8
   19d68:	mov    rcx,0xffffffffffffffff
   19d6f:	cqo
   19d71:	push   rdi
   19d72:	mov    rdi,rbx
   19d75:	idiv   r8
   19d78:	mov    edx,0x1
   19d7d:	lea    r8,[rip+0x7cb0]        # 21a34 <__FUNCTION__.13813+0xdc>
   19d84:	mov    r9,rax
   19d87:	xor    eax,eax
   19d89:	call   3060 <__snprintf_chk@plt>
   19d8e:	pop    rax
   19d8f:	pop    rdx
   19d90:	mov    rax,rbx
   19d93:	pop    rbx
   19d94:	ret
   19d95:	nop    DWORD PTR [rax]
   19d98:	mov    r9,rdx
   19d9b:	lea    r8,[rip+0x7c86]        # 21a28 <__FUNCTION__.13813+0xd0>
   19da2:	mov    edx,0x1
   19da7:	xor    eax,eax
   19da9:	mov    rcx,0xffffffffffffffff
   19db0:	call   3060 <__snprintf_chk@plt>
   19db5:	mov    rax,rbx
   19db8:	pop    rbx
   19db9:	ret
   19dba:	nop    WORD PTR [rax+rax*1+0x0]
   19dc0:	pxor   xmm1,xmm1
   19dc4:	movsxd rdi,edi
   19dc7:	lea    rax,[rip+0x7d1d]        # 21aeb <suffixes.14512>
   19dce:	cvtsi2sd xmm1,r8
   19dd3:	movsx  r9d,BYTE PTR [rax+rdi*1]
   19dd8:	pxor   xmm0,xmm0
   19ddc:	lea    r8,[rip+0x7c49]        # 21a2c <__FUNCTION__.13813+0xd4>
   19de3:	mov    rdi,rbx
   19de6:	mov    eax,0x1
   19deb:	cvtsi2sd xmm0,rdx
   19df0:	mov    rcx,0xffffffffffffffff
   19df7:	mov    edx,0x1
   19dfc:	divsd  xmm0,xmm1
   19e00:	call   3060 <__snprintf_chk@plt>
   19e05:	jmp    19d90 <get_human_readable_size+0xa0>
   19e07:	nop    WORD PTR [rax+rax*1+0x0]
   19e10:	movsxd rdi,edi
   19e13:	lea    rax,[rip+0x7cd1]        # 21aeb <suffixes.14512>
   19e1a:	mov    rcx,r8
   19e1d:	movsx  edi,BYTE PTR [rax+rdi*1]
   19e21:	sar    rcx,1
   19e24:	jmp    19d60 <get_human_readable_size+0x70>
   19e29:	nop    DWORD PTR [rax+0x0]
   19e30:	movsd  xmm1,QWORD PTR [rip+0x7cb8]        # 21af0 <suffixes.14512+0x5>
   19e38:	mov    r9d,0x4b
   19e3e:	jmp    19dd8 <get_human_readable_size+0xe8>
   19e40:	mov    ecx,0x200
   19e45:	mov    edi,0x4b
   19e4a:	mov    r8d,0x400
   19e50:	jmp    19d60 <get_human_readable_size+0x70>
   19e55:	data16 nop WORD PTR cs:[rax+rax*1+0x0]

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

000000000001a070 <bdrv_aio_read>:
   1a070:	push   r15
   1a072:	push   r14
   1a074:	push   r13
   1a076:	push   r12
   1a078:	push   rbp
   1a079:	push   rbx
   1a07a:	sub    rsp,0x18
   1a07e:	mov    r13,QWORD PTR [rdi+0x38]
   1a082:	test   r13,r13
   1a085:	je     1a100 <bdrv_aio_read+0x90>
   1a087:	mov    rbp,rsi
   1a08a:	mov    rax,rsi
   1a08d:	mov    r15d,ecx
   1a090:	shl    rsi,0x9
   1a094:	neg    rax
   1a097:	test   rbp,rbp
   1a09a:	mov    QWORD PTR [rsp],rdx
   1a09e:	mov    r14,r8
   1a0a1:	cmovs  rsi,rax
   1a0a5:	shl    r15d,0x9
   1a0a9:	mov    QWORD PTR [rsp+0x8],r9
   1a0ae:	mov    r12d,ecx
   1a0b1:	movsxd rdx,r15d
   1a0b4:	mov    rbx,rdi
   1a0b7:	call   17e00 <bdrv_check_byte_request>
   1a0bc:	test   eax,eax
   1a0be:	jne    1a100 <bdrv_aio_read+0x90>
   1a0c0:	mov    r9,QWORD PTR [rsp+0x8]
   1a0c5:	mov    r8,r14
   1a0c8:	mov    ecx,r12d
   1a0cb:	mov    rdx,QWORD PTR [rsp]
   1a0cf:	mov    rsi,rbp
   1a0d2:	mov    rdi,rbx
   1a0d5:	call   QWORD PTR [r13+0x60]
   1a0d9:	test   rax,rax
   1a0dc:	je     1a0f0 <bdrv_aio_read+0x80>
   1a0de:	mov    r15d,r15d
   1a0e1:	add    QWORD PTR [rbx+0x870],0x1
   1a0e9:	add    QWORD PTR [rbx+0x860],r15
   1a0f0:	add    rsp,0x18
   1a0f4:	pop    rbx
   1a0f5:	pop    rbp
   1a0f6:	pop    r12
   1a0f8:	pop    r13
   1a0fa:	pop    r14
   1a0fc:	pop    r15
   1a0fe:	ret
   1a0ff:	nop
   1a100:	add    rsp,0x18
   1a104:	xor    eax,eax
   1a106:	pop    rbx
   1a107:	pop    rbp
   1a108:	pop    r12
   1a10a:	pop    r13
   1a10c:	pop    r14
   1a10e:	pop    r15
   1a110:	ret
   1a111:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   1a11c:	nop    DWORD PTR [rax+0x0]

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

000000000001a1a0 <bdrv_aio_write>:
   1a1a0:	push   r15
   1a1a2:	push   r14
   1a1a4:	push   r13
   1a1a6:	push   r12
   1a1a8:	push   rbp
   1a1a9:	push   rbx
   1a1aa:	sub    rsp,0x18
   1a1ae:	mov    r13,QWORD PTR [rdi+0x38]
   1a1b2:	test   r13,r13
   1a1b5:	je     1a240 <bdrv_aio_write+0xa0>
   1a1bb:	mov    eax,DWORD PTR [rdi+0x8]
   1a1be:	test   eax,eax
   1a1c0:	jne    1a240 <bdrv_aio_write+0xa0>
   1a1c2:	mov    rbp,rsi
   1a1c5:	mov    rax,rsi
   1a1c8:	mov    r15d,ecx
   1a1cb:	shl    rsi,0x9
   1a1cf:	neg    rax
   1a1d2:	test   rbp,rbp
   1a1d5:	mov    QWORD PTR [rsp],rdx
   1a1d9:	mov    r14,r8
   1a1dc:	cmovs  rsi,rax
   1a1e0:	shl    r15d,0x9
   1a1e4:	mov    QWORD PTR [rsp+0x8],r9
   1a1e9:	mov    r12d,ecx
   1a1ec:	movsxd rdx,r15d
   1a1ef:	mov    rbx,rdi
   1a1f2:	call   17e00 <bdrv_check_byte_request>
   1a1f7:	test   eax,eax
   1a1f9:	jne    1a240 <bdrv_aio_write+0xa0>
   1a1fb:	mov    r9,QWORD PTR [rsp+0x8]
   1a200:	mov    r8,r14
   1a203:	mov    ecx,r12d
   1a206:	mov    rdx,QWORD PTR [rsp]
   1a20a:	mov    rsi,rbp
   1a20d:	mov    rdi,rbx
   1a210:	call   QWORD PTR [r13+0x68]
   1a214:	test   rax,rax
   1a217:	je     1a22b <bdrv_aio_write+0x8b>
   1a219:	mov    r15d,r15d
   1a21c:	add    QWORD PTR [rbx+0x878],0x1
   1a224:	add    QWORD PTR [rbx+0x868],r15
   1a22b:	add    rsp,0x18
   1a22f:	pop    rbx
   1a230:	pop    rbp
   1a231:	pop    r12
   1a233:	pop    r13
   1a235:	pop    r14
   1a237:	pop    r15
   1a239:	ret
   1a23a:	nop    WORD PTR [rax+rax*1+0x0]
   1a240:	add    rsp,0x18
   1a244:	xor    eax,eax
   1a246:	pop    rbx
   1a247:	pop    rbp
   1a248:	pop    r12
   1a24a:	pop    r13
   1a24c:	pop    r14
   1a24e:	pop    r15
   1a250:	ret
   1a251:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   1a25c:	nop    DWORD PTR [rax+0x0]

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

000000000001a520 <bdrv_aio_cancel>:
   1a520:	mov    rax,QWORD PTR [rdi]
   1a523:	jmp    QWORD PTR [rax]
   1a525:	data16 nop WORD PTR cs:[rax+rax*1+0x0]

000000000001a530 <bdrv_aio_flush>:
   1a530:	mov    rax,QWORD PTR [rdi+0x38]
   1a534:	test   rax,rax
   1a537:	je     1a540 <bdrv_aio_flush+0x10>
   1a539:	jmp    QWORD PTR [rax+0x78]
   1a53c:	nop    DWORD PTR [rax+0x0]
   1a540:	xor    eax,eax
   1a542:	ret
   1a543:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   1a54e:	xchg   ax,ax

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

000000000001a6f0 <bdrv_aio_flush_em>:
   1a6f0:	push   rbp
   1a6f1:	push   rbx
   1a6f2:	mov    rbx,rdi
   1a6f5:	sub    rsp,0x8
   1a6f9:	call   1a680 <qemu_aio_get>
   1a6fe:	cmp    QWORD PTR [rax+0x28],0x0
   1a703:	mov    rbp,rax
   1a706:	jne    1a72e <bdrv_aio_flush_em+0x3e>
   1a708:	jmp    1a760 <bdrv_aio_flush_em+0x70>
   1a70a:	nop    WORD PTR [rax+rax*1+0x0]
   1a710:	mov    rax,QWORD PTR [rax+0x40]
   1a714:	test   rax,rax
   1a717:	je     1a722 <bdrv_aio_flush_em+0x32>
   1a719:	mov    rdi,rbx
   1a71c:	call   rax
   1a71e:	test   eax,eax
   1a720:	jne    1a73c <bdrv_aio_flush_em+0x4c>
   1a722:	mov    rbx,QWORD PTR [rbx+0x850]
   1a729:	test   rbx,rbx
   1a72c:	je     1a758 <bdrv_aio_flush_em+0x68>
   1a72e:	mov    rax,QWORD PTR [rbx+0x38]
   1a732:	test   rax,rax
   1a735:	jne    1a710 <bdrv_aio_flush_em+0x20>
   1a737:	mov    eax,0xffffffea
   1a73c:	mov    DWORD PTR [rbp+0x30],eax
   1a73f:	mov    rdi,QWORD PTR [rbp+0x28]
   1a743:	call   5160 <qemu_bh_schedule>
   1a748:	add    rsp,0x8
   1a74c:	mov    rax,rbp
   1a74f:	pop    rbx
   1a750:	pop    rbp
   1a751:	ret
   1a752:	nop    WORD PTR [rax+rax*1+0x0]
   1a758:	xor    eax,eax
   1a75a:	jmp    1a73c <bdrv_aio_flush_em+0x4c>
   1a75c:	nop    DWORD PTR [rax+0x0]
   1a760:	mov    rsi,rax
   1a763:	lea    rdi,[rip+0xffffffffffffd636]        # 17da0 <bdrv_aio_bh_cb>
   1a76a:	call   5120 <qemu_bh_new>
   1a76f:	mov    QWORD PTR [rbp+0x28],rax
   1a773:	jmp    1a72e <bdrv_aio_flush_em+0x3e>
   1a775:	data16 nop WORD PTR cs:[rax+rax*1+0x0]

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

000000000001a870 <bdrv_is_inserted>:
   1a870:	mov    rax,QWORD PTR [rdi+0x38]
   1a874:	test   rax,rax
   1a877:	je     1a890 <bdrv_is_inserted+0x20>
   1a879:	mov    rax,QWORD PTR [rax+0xf0]
   1a880:	test   rax,rax
   1a883:	je     1a898 <bdrv_is_inserted+0x28>
   1a885:	jmp    rax
   1a887:	nop    WORD PTR [rax+rax*1+0x0]
   1a890:	xor    eax,eax
   1a892:	ret
   1a893:	nop    DWORD PTR [rax+rax*1+0x0]
   1a898:	mov    eax,0x1
   1a89d:	ret
   1a89e:	xchg   ax,ax

000000000001a8a0 <bdrv_media_changed>:
   1a8a0:	mov    rax,QWORD PTR [rdi+0x38]
   1a8a4:	push   rbx
   1a8a5:	mov    rbx,rdi
   1a8a8:	test   rax,rax
   1a8ab:	je     1a8c0 <bdrv_media_changed+0x20>
   1a8ad:	mov    rax,QWORD PTR [rax+0xf8]
   1a8b4:	test   rax,rax
   1a8b7:	je     1a8c0 <bdrv_media_changed+0x20>
   1a8b9:	call   rax
   1a8bb:	cmp    eax,0xffffffa1
   1a8be:	jne    1a8c6 <bdrv_media_changed+0x26>
   1a8c0:	mov    eax,DWORD PTR [rbx+0x84c]
   1a8c6:	mov    DWORD PTR [rbx+0x84c],0x0
   1a8d0:	pop    rbx
   1a8d1:	ret
   1a8d2:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   1a8dd:	nop    DWORD PTR [rax]

000000000001a8e0 <bdrv_eject>:
   1a8e0:	push   rbp
   1a8e1:	mov    ebp,esi
   1a8e3:	push   rbx
   1a8e4:	mov    rbx,rdi
   1a8e7:	sub    rsp,0x8
   1a8eb:	mov    rax,QWORD PTR [rdi+0x38]
   1a8ef:	test   rax,rax
   1a8f2:	je     1a910 <bdrv_eject+0x30>
   1a8f4:	mov    rax,QWORD PTR [rax+0x100]
   1a8fb:	test   rax,rax
   1a8fe:	je     1a910 <bdrv_eject+0x30>
   1a900:	call   rax
   1a902:	cmp    eax,0xffffffa1
   1a905:	je     1a910 <bdrv_eject+0x30>
   1a907:	add    rsp,0x8
   1a90b:	pop    rbx
   1a90c:	pop    rbp
   1a90d:	ret
   1a90e:	xchg   ax,ax
   1a910:	test   ebp,ebp
   1a912:	je     1a907 <bdrv_eject+0x27>
   1a914:	add    rsp,0x8
   1a918:	mov    rdi,rbx
   1a91b:	pop    rbx
   1a91c:	pop    rbp
   1a91d:	jmp    181a0 <bdrv_close>
   1a922:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   1a92d:	nop    DWORD PTR [rax]

000000000001a930 <bdrv_is_locked>:
   1a930:	mov    eax,DWORD PTR [rdi+0x10]
   1a933:	ret
   1a934:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   1a93f:	nop

000000000001a940 <bdrv_set_locked>:
   1a940:	mov    rax,QWORD PTR [rdi+0x38]
   1a944:	mov    DWORD PTR [rdi+0x10],esi
   1a947:	test   rax,rax
   1a94a:	je     1a960 <bdrv_set_locked+0x20>
   1a94c:	mov    rax,QWORD PTR [rax+0x108]
   1a953:	test   rax,rax
   1a956:	je     1a960 <bdrv_set_locked+0x20>
   1a958:	jmp    rax
   1a95a:	nop    WORD PTR [rax+rax*1+0x0]
   1a960:	ret
   1a961:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   1a96c:	nop    DWORD PTR [rax+0x0]

000000000001a970 <bdrv_ioctl>:
   1a970:	mov    rax,QWORD PTR [rdi+0x38]
   1a974:	test   rax,rax
   1a977:	je     1a990 <bdrv_ioctl+0x20>
   1a979:	mov    rax,QWORD PTR [rax+0x110]
   1a980:	test   rax,rax
   1a983:	je     1a990 <bdrv_ioctl+0x20>
   1a985:	jmp    rax
   1a987:	nop    WORD PTR [rax+rax*1+0x0]
   1a990:	mov    eax,0xffffffa1
   1a995:	ret
   1a996:	nop    WORD PTR cs:[rax+rax*1+0x0]

000000000001a9a0 <qemu_aio_wait.part.0>:
   1a9a0:	push   r15
   1a9a2:	push   r14
   1a9a4:	push   r13
   1a9a6:	push   r12
   1a9a8:	mov    r12d,0x1
   1a9ae:	push   rbp
   1a9af:	xor    ebp,ebp
   1a9b1:	push   rbx
   1a9b2:	sub    rsp,0x118
   1a9b9:	mov    rax,QWORD PTR fs:0x28
   1a9c2:	mov    QWORD PTR [rsp+0x108],rax
   1a9ca:	xor    eax,eax
   1a9cc:	mov    r15,rsp
   1a9cf:	lea    r14,[rsp+0x80]
   1a9d7:	nop    WORD PTR [rax+rax*1+0x0]
   1a9e0:	mov    DWORD PTR [rip+0xf9be],0x1        # 2a3a8 <walking_handlers>
   1a9ea:	mov    ecx,0x10
   1a9ef:	mov    rdi,r15
   1a9f2:	mov    eax,ebp
   1a9f4:	cld
   1a9f5:	rep stos QWORD PTR es:[rdi],rax
   1a9f8:	mov    ecx,0x10
   1a9fd:	mov    rdi,r14
   1aa00:	cld
   1aa01:	rep stos QWORD PTR es:[rdi],rax
   1aa04:	mov    r13,QWORD PTR [rip+0xf9a5]        # 2a3b0 <aio_handlers>
   1aa0b:	test   r13,r13
   1aa0e:	je     1abed <qemu_aio_wait.part.0+0x24d>
   1aa14:	mov    ebx,0xffffffff
   1aa19:	nop    DWORD PTR [rax+0x0]
   1aa20:	mov    rax,QWORD PTR [r13+0x18]
   1aa24:	test   rax,rax
   1aa27:	je     1aa37 <qemu_aio_wait.part.0+0x97>
   1aa29:	mov    rdi,QWORD PTR [r13+0x28]
   1aa2d:	call   rax
   1aa2f:	test   eax,eax
   1aa31:	je     1aabe <qemu_aio_wait.part.0+0x11e>
   1aa37:	mov    r8d,DWORD PTR [r13+0x20]
   1aa3b:	test   r8d,r8d
   1aa3e:	jne    1aabe <qemu_aio_wait.part.0+0x11e>
   1aa40:	cmp    QWORD PTR [r13+0x8],0x0
   1aa45:	je     1aa81 <qemu_aio_wait.part.0+0xe1>
   1aa47:	movsxd rdi,DWORD PTR [r13+0x0]
   1aa4b:	call   31f0 <__fdelt_chk@plt>
   1aa50:	mov    ecx,DWORD PTR [r13+0x0]
   1aa54:	mov    rdx,r12
   1aa57:	mov    esi,ecx
   1aa59:	sar    esi,0x1f
   1aa5c:	shr    esi,0x1a
   1aa5f:	add    ecx,esi
   1aa61:	and    ecx,0x3f
   1aa64:	sub    ecx,esi
   1aa66:	shl    rdx,cl
   1aa69:	or     QWORD PTR [rsp+rax*8],rdx
   1aa6d:	mov    eax,DWORD PTR [r13+0x0]
   1aa71:	mov    edi,DWORD PTR [r13+0x20]
   1aa75:	add    eax,0x1
   1aa78:	cmp    ebx,eax
   1aa7a:	cmovl  ebx,eax
   1aa7d:	test   edi,edi
   1aa7f:	jne    1aabe <qemu_aio_wait.part.0+0x11e>
   1aa81:	cmp    QWORD PTR [r13+0x10],0x0
   1aa86:	je     1aabe <qemu_aio_wait.part.0+0x11e>
   1aa88:	movsxd rdi,DWORD PTR [r13+0x0]
   1aa8c:	call   31f0 <__fdelt_chk@plt>
   1aa91:	mov    ecx,DWORD PTR [r13+0x0]
   1aa95:	mov    rdx,r12
   1aa98:	mov    esi,ecx
   1aa9a:	sar    esi,0x1f
   1aa9d:	shr    esi,0x1a
   1aaa0:	add    ecx,esi
   1aaa2:	and    ecx,0x3f
   1aaa5:	sub    ecx,esi
   1aaa7:	shl    rdx,cl
   1aaaa:	or     QWORD PTR [rsp+rax*8+0x80],rdx
   1aab2:	mov    eax,DWORD PTR [r13+0x0]
   1aab6:	add    eax,0x1
   1aab9:	cmp    ebx,eax
   1aabb:	cmovl  ebx,eax
   1aabe:	mov    r13,QWORD PTR [r13+0x30]
   1aac2:	test   r13,r13
   1aac5:	jne    1aa20 <qemu_aio_wait.part.0+0x80>
   1aacb:	mov    DWORD PTR [rip+0xf8d7],ebp        # 2a3a8 <walking_handlers>
   1aad1:	cmp    ebx,0xffffffff
   1aad4:	je     1abf7 <qemu_aio_wait.part.0+0x257>
   1aada:	xor    r8d,r8d
   1aadd:	xor    ecx,ecx
   1aadf:	mov    rdx,r14
   1aae2:	mov    rsi,r15
   1aae5:	mov    edi,ebx
   1aae7:	call   33f0 <select@plt>
   1aaec:	cmp    eax,0xffffffff
   1aaef:	je     1abf7 <qemu_aio_wait.part.0+0x257>
   1aaf5:	test   eax,eax
   1aaf7:	jle    1ac20 <qemu_aio_wait.part.0+0x280>
   1aafd:	mov    rbx,QWORD PTR [rip+0xf8ac]        # 2a3b0 <aio_handlers>
   1ab04:	mov    ebp,0x1
   1ab09:	mov    DWORD PTR [rip+0xf895],0x1        # 2a3a8 <walking_handlers>
   1ab13:	test   rbx,rbx
   1ab16:	jne    1abb3 <qemu_aio_wait.part.0+0x213>
   1ab1c:	jmp    1abed <qemu_aio_wait.part.0+0x24d>
   1ab21:	nop    DWORD PTR [rax+0x0]
   1ab28:	movsxd rdi,DWORD PTR [rbx]
   1ab2b:	call   31f0 <__fdelt_chk@plt>
   1ab30:	mov    edx,DWORD PTR [rbx]
   1ab32:	mov    esi,edx
   1ab34:	sar    esi,0x1f
   1ab37:	shr    esi,0x1a
   1ab3a:	lea    ecx,[rdx+rsi*1]
   1ab3d:	mov    rdx,rbp
   1ab40:	and    ecx,0x3f
   1ab43:	sub    ecx,esi
   1ab45:	shl    rdx,cl
   1ab48:	test   QWORD PTR [rsp+rax*8],rdx
   1ab4c:	je     1ab5d <qemu_aio_wait.part.0+0x1bd>
   1ab4e:	mov    rax,QWORD PTR [rbx+0x8]
   1ab52:	test   rax,rax
   1ab55:	je     1ab5d <qemu_aio_wait.part.0+0x1bd>
   1ab57:	mov    rdi,QWORD PTR [rbx+0x28]
   1ab5b:	call   rax
   1ab5d:	mov    ecx,DWORD PTR [rbx+0x20]
   1ab60:	test   ecx,ecx
   1ab62:	jne    1abbe <qemu_aio_wait.part.0+0x21e>
   1ab64:	movsxd rdi,DWORD PTR [rbx]
   1ab67:	call   31f0 <__fdelt_chk@plt>
   1ab6c:	mov    edx,DWORD PTR [rbx]
   1ab6e:	mov    esi,edx
   1ab70:	sar    esi,0x1f
   1ab73:	shr    esi,0x1a
   1ab76:	lea    ecx,[rdx+rsi*1]
   1ab79:	mov    rdx,rbp
   1ab7c:	and    ecx,0x3f
   1ab7f:	sub    ecx,esi
   1ab81:	shl    rdx,cl
   1ab84:	test   QWORD PTR [rsp+rax*8+0x80],rdx
   1ab8c:	je     1ab9d <qemu_aio_wait.part.0+0x1fd>
   1ab8e:	mov    rax,QWORD PTR [rbx+0x10]
   1ab92:	test   rax,rax
   1ab95:	je     1ab9d <qemu_aio_wait.part.0+0x1fd>
   1ab97:	mov    rdi,QWORD PTR [rbx+0x28]
   1ab9b:	call   rax
   1ab9d:	mov    r12,QWORD PTR [rbx+0x30]
   1aba1:	mov    edx,DWORD PTR [rbx+0x20]
   1aba4:	mov    rax,r12
   1aba7:	test   edx,edx
   1aba9:	jne    1abc5 <qemu_aio_wait.part.0+0x225>
   1abab:	mov    rbx,r12
   1abae:	test   r12,r12
   1abb1:	je     1abed <qemu_aio_wait.part.0+0x24d>
   1abb3:	mov    esi,DWORD PTR [rbx+0x20]
   1abb6:	test   esi,esi
   1abb8:	je     1ab28 <qemu_aio_wait.part.0+0x188>
   1abbe:	mov    rax,QWORD PTR [rbx+0x30]
   1abc2:	mov    r12,rax
   1abc5:	mov    rdx,QWORD PTR [rbx+0x38]
   1abc9:	test   rax,rax
   1abcc:	je     1abda <qemu_aio_wait.part.0+0x23a>
   1abce:	mov    QWORD PTR [rax+0x38],rdx
   1abd2:	mov    rdx,QWORD PTR [rbx+0x38]
   1abd6:	mov    rax,QWORD PTR [rbx+0x30]
   1abda:	mov    QWORD PTR [rdx],rax
   1abdd:	mov    rdi,rbx
   1abe0:	mov    rbx,r12
   1abe3:	call   5960 <qemu_free>
   1abe8:	test   r12,r12
   1abeb:	jne    1abb3 <qemu_aio_wait.part.0+0x213>
   1abed:	mov    DWORD PTR [rip+0xf7b1],0x0        # 2a3a8 <walking_handlers>
   1abf7:	mov    rax,QWORD PTR [rsp+0x108]
   1abff:	xor    rax,QWORD PTR fs:0x28
   1ac08:	jne    1ac28 <qemu_aio_wait.part.0+0x288>
   1ac0a:	add    rsp,0x118
   1ac11:	pop    rbx
   1ac12:	pop    rbp
   1ac13:	pop    r12
   1ac15:	pop    r13
   1ac17:	pop    r14
   1ac19:	pop    r15
   1ac1b:	ret
   1ac1c:	nop    DWORD PTR [rax+0x0]
   1ac20:	je     1a9e0 <qemu_aio_wait.part.0+0x40>
   1ac26:	jmp    1abf7 <qemu_aio_wait.part.0+0x257>
   1ac28:	call   31c0 <__stack_chk_fail@plt>
   1ac2d:	nop    DWORD PTR [rax]

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

000000000001ad40 <qemu_aio_flush>:
   1ad40:	push   rbp
   1ad41:	push   rbx
   1ad42:	sub    rsp,0x8
   1ad46:	nop    WORD PTR cs:[rax+rax*1+0x0]
   1ad50:	mov    rbx,QWORD PTR [rip+0xf659]        # 2a3b0 <aio_handlers>
   1ad57:	test   rbx,rbx
   1ad5a:	je     1ad90 <qemu_aio_flush+0x50>
   1ad5c:	xor    ebp,ebp
   1ad5e:	xchg   ax,ax
   1ad60:	mov    rdi,QWORD PTR [rbx+0x28]
   1ad64:	call   QWORD PTR [rbx+0x18]
   1ad67:	mov    rbx,QWORD PTR [rbx+0x30]
   1ad6b:	or     ebp,eax
   1ad6d:	test   rbx,rbx
   1ad70:	jne    1ad60 <qemu_aio_flush+0x20>
   1ad72:	call   5150 <qemu_bh_poll>
   1ad77:	test   eax,eax
   1ad79:	jne    1ad80 <qemu_aio_flush+0x40>
   1ad7b:	call   1a9a0 <qemu_aio_wait.part.0>
   1ad80:	test   ebp,ebp
   1ad82:	jg     1ad50 <qemu_aio_flush+0x10>
   1ad84:	add    rsp,0x8
   1ad88:	pop    rbx
   1ad89:	pop    rbp
   1ad8a:	ret
   1ad8b:	nop    DWORD PTR [rax+rax*1+0x0]
   1ad90:	call   5150 <qemu_bh_poll>
   1ad95:	test   eax,eax
   1ad97:	jne    1ad84 <qemu_aio_flush+0x44>
   1ad99:	add    rsp,0x8
   1ad9d:	pop    rbx
   1ad9e:	pop    rbp
   1ad9f:	jmp    1a9a0 <qemu_aio_wait.part.0>
   1ada4:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   1adaf:	nop

000000000001adb0 <qemu_aio_wait>:
   1adb0:	sub    rsp,0x8
   1adb4:	call   5150 <qemu_bh_poll>
   1adb9:	test   eax,eax
   1adbb:	jne    1add0 <qemu_aio_wait+0x20>
   1adbd:	add    rsp,0x8
   1adc1:	jmp    1a9a0 <qemu_aio_wait.part.0>
   1adc6:	nop    WORD PTR cs:[rax+rax*1+0x0]
   1add0:	add    rsp,0x8
   1add4:	ret
   1add5:	nop    WORD PTR cs:[rax+rax*1+0x0]
   1addf:	nop

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

000000000001afc0 <aio_thread>:
   1afc0:	push   r15
   1afc2:	push   r14
   1afc4:	push   r13
   1afc6:	push   r12
   1afc8:	push   rbp
   1afc9:	push   rbx
   1afca:	sub    rsp,0xb8
   1afd1:	mov    rax,QWORD PTR fs:0x28
   1afda:	mov    QWORD PTR [rsp+0xa8],rax
   1afe2:	xor    eax,eax
   1afe4:	lea    rbx,[rsp+0x20]
   1afe9:	call   3170 <getpid@plt>
   1afee:	mov    rdi,rbx
   1aff1:	mov    r15d,eax
   1aff4:	call   33a0 <sigfillset@plt>
   1aff9:	test   eax,eax
   1affb:	jne    1b1ac <aio_thread+0x1ec>
   1b001:	xor    edx,edx
   1b003:	xor    edi,edi
   1b005:	mov    rsi,rbx
   1b008:	call   3050 <sigprocmask@plt>
   1b00d:	test   eax,eax
   1b00f:	jne    1b1a0 <aio_thread+0x1e0>
   1b015:	mov    r14,rsp
   1b018:	lea    r12,[rip+0xf3a1]        # 2a3c0 <request_list>
   1b01f:	lea    r13,[rsp+0x10]
   1b024:	nop    DWORD PTR [rax+0x0]
   1b028:	xor    esi,esi
   1b02a:	mov    rdi,r14
   1b02d:	call   3220 <gettimeofday@plt>
   1b032:	mov    rax,QWORD PTR [rsp]
   1b036:	mov    QWORD PTR [rsp+0x18],0x0
   1b03f:	add    rax,0xa
   1b043:	mov    QWORD PTR [rsp+0x10],rax
   1b048:	call   1aed0 <mutex_lock.constprop.5>
   1b04d:	xor    eax,eax
   1b04f:	jmp    1b08a <aio_thread+0xca>
   1b051:	nop    DWORD PTR [rax+0x0]
   1b058:	cmp    eax,0x6e
   1b05b:	je     1b158 <aio_thread+0x198>
   1b061:	mov    rdx,r13
   1b064:	lea    rsi,[rip+0xf3f5]        # 2a460 <lock>
   1b06b:	lea    rdi,[rip+0xf3ae]        # 2a420 <cond>
   1b072:	call   3570 <pthread_cond_timedwait@plt>
   1b077:	test   eax,eax
   1b079:	setne  cl
   1b07c:	cmp    eax,0x6e
   1b07f:	setne  dl
   1b082:	test   cl,dl
   1b084:	jne    1b192 <aio_thread+0x1d2>
   1b08a:	mov    rbx,QWORD PTR [r12]
   1b08e:	test   rbx,rbx
   1b091:	je     1b058 <aio_thread+0x98>
   1b093:	mov    rax,QWORD PTR [rbx+0x28]
   1b097:	mov    rdx,QWORD PTR [rbx+0x30]
   1b09b:	test   rax,rax
   1b09e:	je     1b148 <aio_thread+0x188>
   1b0a4:	mov    QWORD PTR [rax+0x30],rdx
   1b0a8:	mov    rdx,QWORD PTR [rbx+0x30]
   1b0ac:	mov    rax,QWORD PTR [rbx+0x28]
   1b0b0:	mov    QWORD PTR [rdx],rax
   1b0b3:	xor    ebp,ebp
   1b0b5:	mov    DWORD PTR [rbx+0x48],0x1
   1b0bc:	sub    DWORD PTR [rip+0xf30d],0x1        # 2a3d0 <idle_threads>
   1b0c3:	call   1aea0 <mutex_unlock.constprop.4>
   1b0c8:	jmp    1b0d8 <aio_thread+0x118>
   1b0ca:	nop    WORD PTR [rax+rax*1+0x0]
   1b0d0:	test   rax,rax
   1b0d3:	je     1b10e <aio_thread+0x14e>
   1b0d5:	add    rbp,rax
   1b0d8:	mov    rdx,QWORD PTR [rbx+0x10]
   1b0dc:	cmp    rdx,rbp
   1b0df:	jbe    1b10e <aio_thread+0x14e>
   1b0e1:	mov    rcx,QWORD PTR [rbx+0x20]
   1b0e5:	mov    rsi,QWORD PTR [rbx+0x8]
   1b0e9:	sub    rdx,rbp
   1b0ec:	mov    edi,DWORD PTR [rbx]
   1b0ee:	add    rcx,rbp
   1b0f1:	add    rsi,rbp
   1b0f4:	call   QWORD PTR [rbx+0x38]
   1b0f7:	cmp    rax,0xffffffffffffffff
   1b0fb:	jne    1b0d0 <aio_thread+0x110>
   1b0fd:	call   30d0 <__errno_location@plt>
   1b102:	mov    eax,DWORD PTR [rax]
   1b104:	cmp    eax,0x4
   1b107:	je     1b0d8 <aio_thread+0x118>
   1b109:	neg    eax
   1b10b:	movsxd rbp,eax
   1b10e:	call   1aed0 <mutex_lock.constprop.5>
   1b113:	mov    QWORD PTR [rbx+0x40],rbp
   1b117:	add    DWORD PTR [rip+0xf2b2],0x1        # 2a3d0 <idle_threads>
   1b11e:	call   1aea0 <mutex_unlock.constprop.4>
   1b123:	mov    esi,DWORD PTR [rbx+0x18]
   1b126:	mov    edi,r15d
   1b129:	call   33d0 <kill@plt>
   1b12e:	test   eax,eax
   1b130:	je     1b028 <aio_thread+0x68>
   1b136:	lea    rdi,[rip+0x6a5f]        # 21b9c <suffixes.14512+0xb1>
   1b13d:	call   1ae10 <die>
   1b142:	nop    WORD PTR [rax+rax*1+0x0]
   1b148:	mov    QWORD PTR [rip+0xf279],rdx        # 2a3c8 <request_list+0x8>
   1b14f:	jmp    1b0b0 <aio_thread+0xf0>
   1b154:	nop    DWORD PTR [rax+0x0]
   1b158:	sub    DWORD PTR [rip+0xf271],0x1        # 2a3d0 <idle_threads>
   1b15f:	sub    DWORD PTR [rip+0xf26e],0x1        # 2a3d4 <cur_threads>
   1b166:	call   1aea0 <mutex_unlock.constprop.4>
   1b16b:	xor    eax,eax
   1b16d:	mov    rdi,QWORD PTR [rsp+0xa8]
   1b175:	xor    rdi,QWORD PTR fs:0x28
   1b17e:	jne    1b1b8 <aio_thread+0x1f8>
   1b180:	add    rsp,0xb8
   1b187:	pop    rbx
   1b188:	pop    rbp
   1b189:	pop    r12
   1b18b:	pop    r13
   1b18d:	pop    r14
   1b18f:	pop    r15
   1b191:	ret
   1b192:	lea    rsi,[rip+0x69ec]        # 21b85 <suffixes.14512+0x9a>
   1b199:	mov    edi,eax
   1b19b:	call   1ade0 <die2>
   1b1a0:	lea    rdi,[rip+0x69d2]        # 21b79 <suffixes.14512+0x8e>
   1b1a7:	call   1ae10 <die>
   1b1ac:	lea    rdi,[rip+0x69bb]        # 21b6e <suffixes.14512+0x83>
   1b1b3:	call   1ae10 <die>
   1b1b8:	call   31c0 <__stack_chk_fail@plt>
   1b1bd:	nop    DWORD PTR [rax]

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

000000000001b980 <raw_aio_em_cb>:
   1b980:	push   rbx
   1b981:	mov    rbx,rdi
   1b984:	mov    esi,DWORD PTR [rdi+0x80]
   1b98a:	mov    rdi,QWORD PTR [rdi+0x18]
   1b98e:	call   QWORD PTR [rbx+0x10]
   1b991:	mov    rdi,rbx
   1b994:	pop    rbx
   1b995:	jmp    1a860 <qemu_aio_release>
   1b99a:	nop    WORD PTR [rax+rax*1+0x0]

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

000000000001ba20 <posix_aio_read>:
   1ba20:	push   r15
   1ba22:	push   r14
   1ba24:	mov    r14,rdi
   1ba27:	push   r13
   1ba29:	push   r12
   1ba2b:	push   rbp
   1ba2c:	push   rbx
   1ba2d:	sub    rsp,0x28
   1ba31:	mov    rax,QWORD PTR fs:0x28
   1ba3a:	mov    QWORD PTR [rsp+0x18],rax
   1ba3f:	xor    eax,eax
   1ba41:	mov    rbx,rsp
   1ba44:	mov    edi,DWORD PTR [r14]
   1ba47:	mov    edx,0x10
   1ba4c:	mov    rsi,rbx
   1ba4f:	call   32e0 <read@plt>
   1ba54:	cmp    rax,0xffffffffffffffff
   1ba58:	je     1bb00 <posix_aio_read+0xe0>
   1ba5e:	cmp    rax,0x10
   1ba62:	je     1ba44 <posix_aio_read+0x24>
   1ba64:	add    r14,0x8
   1ba68:	mov    r15d,0xffffffea
   1ba6e:	mov    r12,r14
   1ba71:	mov    rbx,QWORD PTR [r12]
   1ba75:	test   rbx,rbx
   1ba78:	je     1ba9f <posix_aio_read+0x7f>
   1ba7a:	lea    r13,[rbx+0x28]
   1ba7e:	mov    rdi,r13
   1ba81:	call   1b2e0 <qemu_paio_error>
   1ba86:	mov    ebp,eax
   1ba88:	cmp    eax,0x7d
   1ba8b:	je     1bac0 <posix_aio_read+0xa0>
   1ba8d:	cmp    eax,0x73
   1ba90:	jne    1bad8 <posix_aio_read+0xb8>
   1ba92:	lea    r12,[rbx+0x78]
   1ba96:	mov    rbx,QWORD PTR [r12]
   1ba9a:	test   rbx,rbx
   1ba9d:	jne    1ba7a <posix_aio_read+0x5a>
   1ba9f:	mov    rax,QWORD PTR [rsp+0x18]
   1baa4:	xor    rax,QWORD PTR fs:0x28
   1baad:	jne    1bb2c <posix_aio_read+0x10c>
   1baaf:	add    rsp,0x28
   1bab3:	pop    rbx
   1bab4:	pop    rbp
   1bab5:	pop    r12
   1bab7:	pop    r13
   1bab9:	pop    r14
   1babb:	pop    r15
   1babd:	ret
   1babe:	xchg   ax,ax
   1bac0:	mov    rax,QWORD PTR [rbx+0x78]
   1bac4:	mov    rdi,rbx
   1bac7:	mov    QWORD PTR [r12],rax
   1bacb:	call   1a860 <qemu_aio_release>
   1bad0:	jmp    1ba71 <posix_aio_read+0x51>
   1bad2:	nop    WORD PTR [rax+rax*1+0x0]
   1bad8:	test   eax,eax
   1bada:	je     1bb18 <posix_aio_read+0xf8>
   1badc:	neg    ebp
   1bade:	mov    rax,QWORD PTR [rbx+0x78]
   1bae2:	mov    esi,ebp
   1bae4:	mov    QWORD PTR [r12],rax
   1bae8:	mov    rdi,QWORD PTR [rbx+0x18]
   1baec:	call   QWORD PTR [rbx+0x10]
   1baef:	mov    rdi,rbx
   1baf2:	call   1a860 <qemu_aio_release>
   1baf7:	jmp    1ba6e <posix_aio_read+0x4e>
   1bafc:	nop    DWORD PTR [rax+0x0]
   1bb00:	call   30d0 <__errno_location@plt>
   1bb05:	cmp    DWORD PTR [rax],0x4
   1bb08:	jne    1ba64 <posix_aio_read+0x44>
   1bb0e:	jmp    1ba44 <posix_aio_read+0x24>
   1bb13:	nop    DWORD PTR [rax+rax*1+0x0]
   1bb18:	mov    rdi,r13
   1bb1b:	call   1b2c0 <qemu_paio_return>
   1bb20:	cdqe
   1bb22:	cmp    rax,QWORD PTR [rbx+0x38]
   1bb26:	cmovne ebp,r15d
   1bb2a:	jmp    1bade <posix_aio_read+0xbe>
   1bb2c:	call   31c0 <__stack_chk_fail@plt>
   1bb31:	data16 nop WORD PTR cs:[rax+rax*1+0x0]
   1bb3c:	nop    DWORD PTR [rax+0x0]

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

000000000001bd20 <raw_pwrite>:
   1bd20:	push   r15
   1bd22:	mov    r15d,ecx
   1bd25:	push   r14
   1bd27:	mov    r14,rdx
   1bd2a:	push   r13
   1bd2c:	push   r12
   1bd2e:	xor    r12d,r12d
   1bd31:	push   rbp
   1bd32:	mov    rbp,rsi
   1bd35:	push   rbx
   1bd36:	sub    rsp,0x28
   1bd3a:	mov    r13,QWORD PTR [rdi+0x40]
   1bd3e:	mov    QWORD PTR [rsp+0x8],rdi
   1bd43:	mov    rdx,QWORD PTR [r13+0x28]
   1bd47:	test   rdx,rdx
   1bd4a:	je     1bdf5 <raw_pwrite+0xd5>
   1bd50:	mov    r8,rsi
   1bd53:	and    r8d,0x1ff
   1bd5a:	jne    1be20 <raw_pwrite+0x100>
   1bd60:	test   r15d,0x1ff
   1bd67:	je     1bde8 <raw_pwrite+0xc8>
   1bd69:	mov    ecx,r15d
   1bd6c:	and    ecx,0xfffffe00
   1bd72:	jne    1bd9e <raw_pwrite+0x7e>
   1bd74:	jmp    1bee0 <raw_pwrite+0x1c0>
   1bd79:	nop    DWORD PTR [rax+0x0]
   1bd80:	sub    r15d,eax
   1bd83:	movsxd rdx,eax
   1bd86:	add    r12d,eax
   1bd89:	mov    ecx,r15d
   1bd8c:	add    r14,rdx
   1bd8f:	add    rbp,rdx
   1bd92:	and    ecx,0xfffffe00
   1bd98:	je     1bee0 <raw_pwrite+0x1c0>
   1bd9e:	cmp    ecx,0x4000
   1bda4:	mov    ebx,0x4000
   1bda9:	mov    rdi,QWORD PTR [r13+0x28]
   1bdad:	mov    rsi,r14
   1bdb0:	cmovle ebx,ecx
   1bdb3:	movsxd rdx,ebx
   1bdb6:	call   33b0 <memcpy@plt>
   1bdbb:	mov    rdx,QWORD PTR [r13+0x28]
   1bdbf:	mov    rdi,QWORD PTR [rsp+0x8]
   1bdc4:	mov    ecx,ebx
   1bdc6:	mov    rsi,rbp
   1bdc9:	call   1bc90 <raw_pwrite_aligned>
   1bdce:	test   eax,eax
   1bdd0:	jns    1bd80 <raw_pwrite+0x60>
   1bdd2:	add    rsp,0x28
   1bdd6:	pop    rbx
   1bdd7:	pop    rbp
   1bdd8:	pop    r12
   1bdda:	pop    r13
   1bddc:	pop    r14
   1bdde:	pop    r15
   1bde0:	ret
   1bde1:	nop    DWORD PTR [rax+0x0]
   1bde8:	test   r14d,0x1ff
   1bdef:	jne    1bd69 <raw_pwrite+0x49>
   1bdf5:	mov    rdi,QWORD PTR [rsp+0x8]
   1bdfa:	mov    ecx,r15d
   1bdfd:	mov    rdx,r14
   1be00:	mov    rsi,rbp
   1be03:	call   1bc90 <raw_pwrite_aligned>
   1be08:	add    rsp,0x28
   1be0c:	pop    rbx
   1be0d:	add    eax,r12d
   1be10:	pop    rbp
   1be11:	pop    r12
   1be13:	pop    r13
   1be15:	pop    r14
   1be17:	pop    r15
   1be19:	ret
   1be1a:	nop    WORD PTR [rax+rax*1+0x0]
   1be20:	mov    r10,rsi
   1be23:	movsxd rbx,r8d
   1be26:	mov    ecx,0x200
   1be2b:	mov    QWORD PTR [rsp+0x18],r8
   1be30:	sub    r10,rbx
   1be33:	mov    rsi,r10
   1be36:	mov    QWORD PTR [rsp+0x10],r10
   1be3b:	call   1b550 <raw_pread_aligned>
   1be40:	test   eax,eax
   1be42:	js     1bdd2 <raw_pwrite+0xb2>
   1be44:	mov    r8,QWORD PTR [rsp+0x18]
   1be49:	mov    r12d,0x200
   1be4f:	mov    rdx,QWORD PTR [r13+0x28]
   1be53:	mov    r10,QWORD PTR [rsp+0x10]
   1be58:	sub    r12d,r8d
   1be5b:	cmp    r15d,r12d
   1be5e:	cmovle r12d,r15d
   1be62:	add    rbx,rdx
   1be65:	movsxd r8,r12d
   1be68:	cmp    r8,0x8
   1be6c:	jb     1bf68 <raw_pwrite+0x248>
   1be72:	mov    rax,QWORD PTR [r14]
   1be75:	lea    rdi,[rbx+0x8]
   1be79:	mov    rsi,r14
   1be7c:	and    rdi,0xfffffffffffffff8
   1be80:	mov    QWORD PTR [rbx],rax
   1be83:	mov    rax,QWORD PTR [r14+r8*1-0x8]
   1be88:	mov    QWORD PTR [rbx+r8*1-0x8],rax
   1be8d:	sub    rbx,rdi
   1be90:	lea    rcx,[rbx+r8*1]
   1be94:	sub    rsi,rbx
   1be97:	shr    rcx,0x3
   1be9b:	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
   1be9e:	mov    rdx,QWORD PTR [r13+0x28]
   1bea2:	mov    rdi,QWORD PTR [rsp+0x8]
   1bea7:	mov    ecx,0x200
   1beac:	mov    rsi,r10
   1beaf:	mov    QWORD PTR [rsp+0x10],r8
   1beb4:	call   1bc90 <raw_pwrite_aligned>
   1beb9:	test   eax,eax
   1bebb:	js     1bdd2 <raw_pwrite+0xb2>
   1bec1:	mov    eax,r12d
   1bec4:	sub    r15d,r12d
   1bec7:	je     1bdd2 <raw_pwrite+0xb2>
   1becd:	mov    r8,QWORD PTR [rsp+0x10]
   1bed2:	add    r14,r8
   1bed5:	add    rbp,r8
   1bed8:	jmp    1bd60 <raw_pwrite+0x40>
   1bedd:	nop    DWORD PTR [rax]
   1bee0:	mov    eax,r12d
   1bee3:	test   r15d,r15d
   1bee6:	je     1bdd2 <raw_pwrite+0xb2>
   1beec:	mov    rdx,QWORD PTR [r13+0x28]
   1bef0:	mov    rdi,QWORD PTR [rsp+0x8]
   1bef5:	mov    ecx,0x200
   1befa:	mov    rsi,rbp
   1befd:	call   1b550 <raw_pread_aligned>
   1bf02:	test   eax,eax
   1bf04:	js     1bdd2 <raw_pwrite+0xb2>
   1bf0a:	mov    rdx,QWORD PTR [r13+0x28]
   1bf0e:	cmp    r15d,0x8
   1bf12:	jae    1bf9c <raw_pwrite+0x27c>
   1bf18:	test   r15b,0x4
   1bf1c:	jne    1bfe8 <raw_pwrite+0x2c8>
   1bf22:	test   r15d,r15d
   1bf25:	je     1bf3b <raw_pwrite+0x21b>
   1bf27:	movzx  eax,BYTE PTR [r14]
   1bf2b:	mov    BYTE PTR [rdx],al
   1bf2d:	test   r15b,0x2
   1bf31:	jne    1c002 <raw_pwrite+0x2e2>
   1bf37:	mov    rdx,QWORD PTR [r13+0x28]
   1bf3b:	mov    rdi,QWORD PTR [rsp+0x8]
   1bf40:	mov    ecx,0x200
   1bf45:	mov    rsi,rbp
   1bf48:	call   1bc90 <raw_pwrite_aligned>
   1bf4d:	test   eax,eax
   1bf4f:	js     1bdd2 <raw_pwrite+0xb2>
   1bf55:	cmp    eax,r15d
   1bf58:	cmovg  eax,r15d
   1bf5c:	add    eax,r12d
   1bf5f:	jmp    1bdd2 <raw_pwrite+0xb2>
   1bf64:	nop    DWORD PTR [rax+0x0]
   1bf68:	test   r8b,0x4
   1bf6c:	jne    1bfd0 <raw_pwrite+0x2b0>
   1bf6e:	test   r8,r8
   1bf71:	je     1bea2 <raw_pwrite+0x182>
   1bf77:	movzx  eax,BYTE PTR [r14]
   1bf7b:	mov    BYTE PTR [rbx],al
   1bf7d:	test   r8b,0x2
   1bf81:	je     1be9e <raw_pwrite+0x17e>
   1bf87:	movzx  eax,WORD PTR [r14+r8*1-0x2]
   1bf8d:	mov    WORD PTR [rbx+r8*1-0x2],ax
   1bf93:	mov    rdx,QWORD PTR [r13+0x28]
   1bf97:	jmp    1bea2 <raw_pwrite+0x182>
   1bf9c:	mov    rax,QWORD PTR [r14]
   1bf9f:	lea    rdi,[rdx+0x8]
   1bfa3:	mov    rsi,r14
   1bfa6:	and    rdi,0xfffffffffffffff8
   1bfaa:	mov    QWORD PTR [rdx],rax
   1bfad:	mov    eax,r15d
   1bfb0:	mov    rcx,QWORD PTR [r14+rax*1-0x8]
   1bfb5:	mov    QWORD PTR [rdx+rax*1-0x8],rcx
   1bfba:	sub    rdx,rdi
   1bfbd:	sub    rsi,rdx
   1bfc0:	add    edx,r15d
   1bfc3:	shr    edx,0x3
   1bfc6:	mov    ecx,edx
   1bfc8:	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
   1bfcb:	jmp    1bf37 <raw_pwrite+0x217>
   1bfd0:	mov    eax,DWORD PTR [r14]
   1bfd3:	mov    DWORD PTR [rbx],eax
   1bfd5:	mov    eax,DWORD PTR [r14+r8*1-0x4]
   1bfda:	mov    DWORD PTR [rbx+r8*1-0x4],eax
   1bfdf:	mov    rdx,QWORD PTR [r13+0x28]
   1bfe3:	jmp    1bea2 <raw_pwrite+0x182>
   1bfe8:	mov    eax,DWORD PTR [r14]
   1bfeb:	mov    DWORD PTR [rdx],eax
   1bfed:	mov    eax,r15d
   1bff0:	mov    ecx,DWORD PTR [r14+rax*1-0x4]
   1bff5:	mov    DWORD PTR [rdx+rax*1-0x4],ecx
   1bff9:	mov    rdx,QWORD PTR [r13+0x28]
   1bffd:	jmp    1bf3b <raw_pwrite+0x21b>
   1c002:	mov    eax,r15d
   1c005:	movzx  ecx,WORD PTR [r14+rax*1-0x2]
   1c00b:	mov    WORD PTR [rdx+rax*1-0x2],cx
   1c010:	mov    rdx,QWORD PTR [r13+0x28]
   1c014:	jmp    1bf3b <raw_pwrite+0x21b>
   1c019:	nop    DWORD PTR [rax+0x0]

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
