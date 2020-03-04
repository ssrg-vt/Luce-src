	.intel_syntax noprefix

	.section	.text
	.align	16
	.globl sys_getpid
	.type sys_getpid, @function
sys_getpid:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax,  qword ptr [word ptr [rip + current_task]] # Size:7, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	eax, dword ptr [rax] # Size:2, Opcode: 0x8b,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl sys_getprio
	.type sys_getprio, @function
sys_getprio:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x18], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rax,  qword ptr [word ptr [rip + current_task]] # Size:7, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	cmp	qword ptr [rbp - 0x18], 0 # Size:5, Opcode: 0x83,0x00,0x00,0x00
	je	.label_10 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	edx, dword ptr [rax] # Size:2, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	eax, dword ptr [rax] # Size:2, Opcode: 0x8b,0x00,0x00,0x00
	cmp	edx, eax # Size:2, Opcode: 0x39,0x00,0x00,0x00
	jne	.label_12 # Size:2, Opcode: 0x75,0x00,0x00,0x00
.label_10:
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	movzx	eax, byte ptr [rax + 0x29] # Size:4, Opcode: 0x0f,0xb6,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	jmp	.label_11 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_12:
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
.label_11:
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl sys_setprio
	.type sys_setprio, @function
sys_setprio:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	dword ptr [rbp - 0xc], esi # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, 0xffffffda # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl socket_send
	.type socket_send, @function
socket_send:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	sub	rsp, 0x30 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	dword ptr [rbp - 0x14], edi # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x20], rsi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x28], rdx # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	dword ptr [rbp - 8], 0 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
.label_16:
	mov	eax, dword ptr [rbp - 8] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	cdqe	 # Size:2, Opcode: 0x98,0x00,0x00,0x00
	mov	rdx, qword ptr [rbp - 0x28] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	sub	rdx, rax # Size:3, Opcode: 0x29,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 8] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	movsxd	rcx, eax # Size:3, Opcode: 0x63,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x20] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	add	rcx, rax # Size:3, Opcode: 0x01,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x14] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rsi, rcx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	edi, eax # Size:2, Opcode: 0x89,0x00,0x00,0x00
	call	lwip_write # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	dword ptr [rbp - 4], eax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	cmp	dword ptr [rbp - 4], 0 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	js	.label_13 # Size:2, Opcode: 0x78,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 4] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	add	dword ptr [rbp - 8], eax # Size:3, Opcode: 0x01,0x00,0x00,0x00
	jmp	.label_15 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_13:
	mov	eax, dword ptr [rbp - 4] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	jmp	.label_14 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_15:
	mov	eax, dword ptr [rbp - 8] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	cdqe	 # Size:2, Opcode: 0x98,0x00,0x00,0x00
	cmp	qword ptr [rbp - 0x28], rax # Size:4, Opcode: 0x39,0x00,0x00,0x00
	ja	.label_16 # Size:2, Opcode: 0x77,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x28] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
.label_14:
	leave	 # Size:1, Opcode: 0xc9,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl socket_recv
	.type socket_recv, @function
socket_recv:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	sub	rsp, 0x30 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	dword ptr [rbp - 0x14], edi # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x20], rsi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x28], rdx # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	dword ptr [rbp - 8], 0 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
.label_20:
	mov	eax, dword ptr [rbp - 8] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	cdqe	 # Size:2, Opcode: 0x98,0x00,0x00,0x00
	mov	rdx, qword ptr [rbp - 0x28] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	sub	rdx, rax # Size:3, Opcode: 0x29,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 8] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	movsxd	rcx, eax # Size:3, Opcode: 0x63,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x20] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	add	rcx, rax # Size:3, Opcode: 0x01,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x14] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rsi, rcx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	edi, eax # Size:2, Opcode: 0x89,0x00,0x00,0x00
	call	lwip_read # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	dword ptr [rbp - 4], eax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	cmp	dword ptr [rbp - 4], 0 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	js	.label_17 # Size:2, Opcode: 0x78,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 4] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	add	dword ptr [rbp - 8], eax # Size:3, Opcode: 0x01,0x00,0x00,0x00
	jmp	.label_19 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_17:
	mov	eax, dword ptr [rbp - 4] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	jmp	.label_18 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_19:
	mov	eax, dword ptr [rbp - 8] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	cdqe	 # Size:2, Opcode: 0x98,0x00,0x00,0x00
	cmp	qword ptr [rbp - 0x28], rax # Size:4, Opcode: 0x39,0x00,0x00,0x00
	ja	.label_20 # Size:2, Opcode: 0x77,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x28] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
.label_18:
	leave	 # Size:1, Opcode: 0xc9,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl readv
	.type readv, @function
readv:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	dword ptr [rbp - 4], edi # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x10], rsi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	dword ptr [rbp - 8], edx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, -0x26 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl writev
	.type writev, @function
writev:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	dword ptr [rbp - 4], edi # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x10], rsi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	dword ptr [rbp - 8], edx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, -0x26 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl uhyve_send
	.type uhyve_send, @function
uhyve_send:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, edi # Size:2, Opcode: 0x89,0x00,0x00,0x00
	mov	dword ptr [rbp - 8], esi # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	word ptr [rbp - 4], ax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	movzx	eax, word ptr [rbp - 4] # Size:4, Opcode: 0x0f,0xb7,0x00,0x00
	mov	rdx, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 8] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rdx], eax # Size:2, Opcode: 0x89,0x00,0x00,0x00
	nop	 # Size:1, Opcode: 0x90,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl sys_write
	.type sys_write, @function
sys_write:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	sub	rsp, 0x60 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	dword ptr [rbp - 0x44], edi # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x50], rsi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x58], rdx # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr fs:[0x28] # Size:9, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	cmp	qword ptr [rbp - 0x50], 0 # Size:5, Opcode: 0x83,0x00,0x00,0x00
	sete	al # Size:3, Opcode: 0x0f,0x94,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_21 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	rax, -0x16 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	jmp	.label_23 # Size:5, Opcode: 0xe9,0x00,0x00,0x00
.label_21:
	mov	dword ptr [rbp - 0x30], 1 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x44] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rbp - 0x2c], eax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x58] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x28], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x44] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	and	eax, 0x40000000 # Size:5, Opcode: 0x25,0x00,0x00,0x00
	test	eax, eax # Size:2, Opcode: 0x85,0x00,0x00,0x00
	je	.label_22 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	lea	rdi,  qword ptr [word ptr [rip + lwip_lock]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	call	spinlock_irqsave_lock # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x44] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	and	eax, 0xbfffffff # Size:5, Opcode: 0x25,0x00,0x00,0x00
	mov	ecx, eax # Size:2, Opcode: 0x89,0x00,0x00,0x00
	mov	rdx, qword ptr [rbp - 0x58] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x50] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rsi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	edi, ecx # Size:2, Opcode: 0x89,0x00,0x00,0x00
	call	lwip_write # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	cdqe	 # Size:2, Opcode: 0x98,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x38], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	lea	rdi,  qword ptr [word ptr [rip + lwip_lock]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	call	spinlock_irqsave_unlock # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	cmp	qword ptr [rbp - 0x38], 0 # Size:5, Opcode: 0x83,0x00,0x00,0x00
	jns	.label_27 # Size:2, Opcode: 0x79,0x00,0x00,0x00
	mov	rax,  qword ptr [word ptr [rip + current_task]] # Size:7, Opcode: 0x8b,0x00,0x00,0x00
	mov	eax, dword ptr [rax + 0x78] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	neg	eax # Size:2, Opcode: 0xf7,0x00,0x00,0x00
	cdqe	 # Size:2, Opcode: 0x98,0x00,0x00,0x00
	jmp	.label_23 # Size:5, Opcode: 0xe9,0x00,0x00,0x00
.label_27:
	mov	rax, qword ptr [rbp - 0x38] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	jmp	.label_23 # Size:5, Opcode: 0xe9,0x00,0x00,0x00
.label_22:
	call	is_uhyve # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	test	eax, eax # Size:2, Opcode: 0x85,0x00,0x00,0x00
	je	.label_25 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x44] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rbp - 0x20], eax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x50] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x1c], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x58] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x14], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	lea	rax, qword ptr [rbp - 0x20] # Size:4, Opcode: 0x8d,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	virt_to_phys # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	esi, eax # Size:2, Opcode: 0x89,0x00,0x00,0x00
	mov	edi, 0x400 # Size:5, Opcode: 0xbf,0x00,0x00,0x00
	call	uhyve_send # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x14] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	jmp	.label_23 # Size:5, Opcode: 0xe9,0x00,0x00,0x00
.label_25:
	mov	eax,  dword ptr [dword ptr [rip + libc_sd]] # Size:6, Opcode: 0x8b,0x00,0x00,0x00
	test	eax, eax # Size:2, Opcode: 0x85,0x00,0x00,0x00
	jns	.label_26 # Size:2, Opcode: 0x79,0x00,0x00,0x00
	lea	rdi,  qword ptr [word ptr [rip + stdio_lock]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	call	spinlock_irqsave_lock # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x20], 0 # Size:8, Opcode: 0xc7,0x00,0x00,0x00
	jmp	.label_28 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_29:
	mov	rax, qword ptr [rbp - 0x20] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdx, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x50] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	add	rax, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	movzx	eax, byte ptr [rax] # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	movsx	eax, al # Size:3, Opcode: 0x0f,0xbe,0x00,0x00
	mov	edi, eax # Size:2, Opcode: 0x89,0x00,0x00,0x00
	call	kputchar # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x20] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	add	rax, 1 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x20], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
.label_28:
	mov	rax, qword ptr [rbp - 0x20] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	cmp	qword ptr [rbp - 0x58], rax # Size:4, Opcode: 0x39,0x00,0x00,0x00
	ja	.label_29 # Size:2, Opcode: 0x77,0x00,0x00,0x00
	lea	rdi,  qword ptr [word ptr [rip + stdio_lock]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	call	spinlock_irqsave_unlock # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x58] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	jmp	.label_23 # Size:5, Opcode: 0xe9,0x00,0x00,0x00
.label_26:
	lea	rdi,  qword ptr [word ptr [rip + lwip_lock]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	call	spinlock_irqsave_lock # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	eax,  dword ptr [dword ptr [rip + libc_sd]] # Size:6, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rbp - 0x3c], eax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	lea	rcx, qword ptr [rbp - 0x30] # Size:4, Opcode: 0x8d,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x3c] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	edx, 0x10 # Size:5, Opcode: 0xba,0x00,0x00,0x00
	mov	rsi, rcx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	edi, eax # Size:2, Opcode: 0x89,0x00,0x00,0x00
	call	socket_send # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x20], 0 # Size:8, Opcode: 0xc7,0x00,0x00,0x00
	jmp	.label_30 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_31:
	mov	rax, qword ptr [rbp - 0x20] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdx, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x58] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	sub	rax, rdx # Size:3, Opcode: 0x29,0x00,0x00,0x00
	mov	rdx, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x20] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rcx, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x50] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	add	rcx, rax # Size:3, Opcode: 0x01,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x3c] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rsi, rcx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	edi, eax # Size:2, Opcode: 0x89,0x00,0x00,0x00
	call	lwip_write # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	cdqe	 # Size:2, Opcode: 0x98,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x38], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	cmp	qword ptr [rbp - 0x38], 0 # Size:5, Opcode: 0x83,0x00,0x00,0x00
	jns	.label_33 # Size:2, Opcode: 0x79,0x00,0x00,0x00
	lea	rdi,  qword ptr [word ptr [rip + lwip_lock]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	call	spinlock_irqsave_unlock # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x38] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	jmp	.label_23 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_33:
	mov	rdx, qword ptr [rbp - 0x20] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x38] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	add	rax, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x20], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
.label_30:
	mov	rax, qword ptr [rbp - 0x20] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	cmp	qword ptr [rbp - 0x58], rax # Size:4, Opcode: 0x39,0x00,0x00,0x00
	ja	.label_31 # Size:2, Opcode: 0x77,0x00,0x00,0x00
	cmp	dword ptr [rbp - 0x44], 2 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	jle	.label_32 # Size:2, Opcode: 0x7e,0x00,0x00,0x00
	lea	rcx, qword ptr [rbp - 0x20] # Size:4, Opcode: 0x8d,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x3c] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	edx, 8 # Size:5, Opcode: 0xba,0x00,0x00,0x00
	mov	rsi, rcx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	edi, eax # Size:2, Opcode: 0x89,0x00,0x00,0x00
	call	socket_recv # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	cdqe	 # Size:2, Opcode: 0x98,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x20], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
.label_32:
	lea	rdi,  qword ptr [word ptr [rip + lwip_lock]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	call	spinlock_irqsave_unlock # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x20] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
.label_23:
	mov	rsi, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	xor	rsi, qword ptr fs:[0x28] # Size:9, Opcode: 0x33,0x00,0x00,0x00
	je	.label_24 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	call	__stack_chk_fail # Size:5, Opcode: 0xe8,0x00,0x00,0x00
.label_24:
	leave	 # Size:1, Opcode: 0xc9,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl sys_open
	.type sys_open, @function
sys_open:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	sub	rsp, 0x40 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x38], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	dword ptr [rbp - 0x3c], esi # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	dword ptr [rbp - 0x40], edx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr fs:[0x28] # Size:9, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	call	is_uhyve # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	test	eax, eax # Size:2, Opcode: 0x85,0x00,0x00,0x00
	je	.label_34 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x38] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	virt_to_phys # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x20], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x3c] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rbp - 0x18], eax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x40] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rbp - 0x14], eax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	dword ptr [rbp - 0x10], 0xffffffff # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	lea	rax, qword ptr [rbp - 0x20] # Size:4, Opcode: 0x8d,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	virt_to_phys # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	esi, eax # Size:2, Opcode: 0x89,0x00,0x00,0x00
	mov	edi, 0x440 # Size:5, Opcode: 0xbf,0x00,0x00,0x00
	call	uhyve_send # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x10] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	jmp	.label_37 # Size:5, Opcode: 0xe9,0x00,0x00,0x00
.label_34:
	mov	dword ptr [rbp - 0x2c], 2 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	lea	rdi,  qword ptr [word ptr [rip + lwip_lock]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	call	spinlock_irqsave_lock # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	eax,  dword ptr [dword ptr [rip + libc_sd]] # Size:6, Opcode: 0x8b,0x00,0x00,0x00
	test	eax, eax # Size:2, Opcode: 0x85,0x00,0x00,0x00
	jns	.label_35 # Size:2, Opcode: 0x79,0x00,0x00,0x00
	mov	dword ptr [rbp - 0x30], 0xffffffea # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	jmp	.label_36 # Size:5, Opcode: 0xe9,0x00,0x00,0x00
.label_35:
	mov	eax,  dword ptr [dword ptr [rip + libc_sd]] # Size:6, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rbp - 0x24], eax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x38] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	strlen # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	add	rax, 1 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x20], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	lea	rcx, qword ptr [rbp - 0x2c] # Size:4, Opcode: 0x8d,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x24] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	edx, 4 # Size:5, Opcode: 0xba,0x00,0x00,0x00
	mov	rsi, rcx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	edi, eax # Size:2, Opcode: 0x89,0x00,0x00,0x00
	call	socket_send # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	dword ptr [rbp - 0x30], eax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x30] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	test	eax, eax # Size:2, Opcode: 0x85,0x00,0x00,0x00
	js	.label_38 # Size:6, Opcode: 0x0f,0x88,0x00,0x00
	lea	rcx, qword ptr [rbp - 0x20] # Size:4, Opcode: 0x8d,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x24] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	edx, 8 # Size:5, Opcode: 0xba,0x00,0x00,0x00
	mov	rsi, rcx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	edi, eax # Size:2, Opcode: 0x89,0x00,0x00,0x00
	call	socket_send # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	dword ptr [rbp - 0x30], eax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x30] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	test	eax, eax # Size:2, Opcode: 0x85,0x00,0x00,0x00
	js	.label_40 # Size:6, Opcode: 0x0f,0x88,0x00,0x00
	mov	dword ptr [rbp - 0x28], 0 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	jmp	.label_41 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_42:
	mov	rdx, qword ptr [rbp - 0x20] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x28] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	cdqe	 # Size:2, Opcode: 0x98,0x00,0x00,0x00
	sub	rdx, rax # Size:3, Opcode: 0x29,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x28] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	movsxd	rcx, eax # Size:3, Opcode: 0x63,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x38] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	add	rcx, rax # Size:3, Opcode: 0x01,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x24] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rsi, rcx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	edi, eax # Size:2, Opcode: 0x89,0x00,0x00,0x00
	call	socket_send # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	dword ptr [rbp - 0x30], eax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x30] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	test	eax, eax # Size:2, Opcode: 0x85,0x00,0x00,0x00
	js	.label_43 # Size:2, Opcode: 0x78,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x30] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	add	dword ptr [rbp - 0x28], eax # Size:3, Opcode: 0x01,0x00,0x00,0x00
.label_41:
	mov	eax, dword ptr [rbp - 0x28] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	movsxd	rdx, eax # Size:3, Opcode: 0x63,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x20] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	cmp	rdx, rax # Size:3, Opcode: 0x39,0x00,0x00,0x00
	jb	.label_42 # Size:2, Opcode: 0x72,0x00,0x00,0x00
	lea	rcx, qword ptr [rbp - 0x3c] # Size:4, Opcode: 0x8d,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x24] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	edx, 4 # Size:5, Opcode: 0xba,0x00,0x00,0x00
	mov	rsi, rcx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	edi, eax # Size:2, Opcode: 0x89,0x00,0x00,0x00
	call	socket_send # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	dword ptr [rbp - 0x30], eax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x30] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	test	eax, eax # Size:2, Opcode: 0x85,0x00,0x00,0x00
	js	.label_44 # Size:2, Opcode: 0x78,0x00,0x00,0x00
	lea	rcx, qword ptr [rbp - 0x40] # Size:4, Opcode: 0x8d,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x24] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	edx, 4 # Size:5, Opcode: 0xba,0x00,0x00,0x00
	mov	rsi, rcx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	edi, eax # Size:2, Opcode: 0x89,0x00,0x00,0x00
	call	socket_send # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	dword ptr [rbp - 0x30], eax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x30] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	test	eax, eax # Size:2, Opcode: 0x85,0x00,0x00,0x00
	js	.label_45 # Size:2, Opcode: 0x78,0x00,0x00,0x00
	lea	rcx, qword ptr [rbp - 0x30] # Size:4, Opcode: 0x8d,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x24] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	edx, 4 # Size:5, Opcode: 0xba,0x00,0x00,0x00
	mov	rsi, rcx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	edi, eax # Size:2, Opcode: 0x89,0x00,0x00,0x00
	call	socket_recv # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	jmp	.label_36 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_38:
	nop	 # Size:1, Opcode: 0x90,0x00,0x00,0x00
	jmp	.label_36 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_40:
	nop	 # Size:1, Opcode: 0x90,0x00,0x00,0x00
	jmp	.label_36 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_43:
	nop	 # Size:1, Opcode: 0x90,0x00,0x00,0x00
	jmp	.label_36 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_44:
	nop	 # Size:1, Opcode: 0x90,0x00,0x00,0x00
	jmp	.label_36 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_45:
	nop	 # Size:1, Opcode: 0x90,0x00,0x00,0x00
.label_36:
	lea	rdi,  qword ptr [word ptr [rip + lwip_lock]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	call	spinlock_irqsave_unlock # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x30] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
.label_37:
	mov	rsi, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	xor	rsi, qword ptr fs:[0x28] # Size:9, Opcode: 0x33,0x00,0x00,0x00
	je	.label_39 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	call	__stack_chk_fail # Size:5, Opcode: 0xe8,0x00,0x00,0x00
.label_39:
	leave	 # Size:1, Opcode: 0xc9,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl sys_close
	.type sys_close, @function
sys_close:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	sub	rsp, 0x30 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	dword ptr [rbp - 0x24], edi # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr fs:[0x28] # Size:9, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	mov	dword ptr [rbp - 0x18], 3 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x24] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rbp - 0x14], eax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x24] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	and	eax, 0x40000000 # Size:5, Opcode: 0x25,0x00,0x00,0x00
	test	eax, eax # Size:2, Opcode: 0x85,0x00,0x00,0x00
	je	.label_46 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x24] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	and	eax, 0xbfffffff # Size:5, Opcode: 0x25,0x00,0x00,0x00
	mov	edi, eax # Size:2, Opcode: 0x89,0x00,0x00,0x00
	call	lwip_close # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	dword ptr [rbp - 0x10], eax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x10] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	test	eax, eax # Size:2, Opcode: 0x85,0x00,0x00,0x00
	jns	.label_48 # Size:2, Opcode: 0x79,0x00,0x00,0x00
	mov	rax,  qword ptr [word ptr [rip + current_task]] # Size:7, Opcode: 0x8b,0x00,0x00,0x00
	mov	eax, dword ptr [rax + 0x78] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	neg	eax # Size:2, Opcode: 0xf7,0x00,0x00,0x00
	jmp	.label_49 # Size:5, Opcode: 0xe9,0x00,0x00,0x00
.label_48:
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_49 # Size:5, Opcode: 0xe9,0x00,0x00,0x00
.label_46:
	call	is_uhyve # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	test	eax, eax # Size:2, Opcode: 0x85,0x00,0x00,0x00
	je	.label_47 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x24] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rbp - 0x10], eax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	dword ptr [rbp - 0xc], 0xffffffff # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	lea	rax, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8d,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	virt_to_phys # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	esi, eax # Size:2, Opcode: 0x89,0x00,0x00,0x00
	mov	edi, 0x480 # Size:5, Opcode: 0xbf,0x00,0x00,0x00
	call	uhyve_send # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0xc] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	jmp	.label_49 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_47:
	lea	rdi,  qword ptr [word ptr [rip + lwip_lock]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	call	spinlock_irqsave_lock # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	eax,  dword ptr [dword ptr [rip + libc_sd]] # Size:6, Opcode: 0x8b,0x00,0x00,0x00
	test	eax, eax # Size:2, Opcode: 0x85,0x00,0x00,0x00
	jns	.label_50 # Size:2, Opcode: 0x79,0x00,0x00,0x00
	mov	dword ptr [rbp - 0x10], 0 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	jmp	.label_52 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_50:
	mov	eax,  dword ptr [dword ptr [rip + libc_sd]] # Size:6, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rbp - 0x1c], eax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	lea	rcx, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8d,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x1c] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	edx, 8 # Size:5, Opcode: 0xba,0x00,0x00,0x00
	mov	rsi, rcx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	edi, eax # Size:2, Opcode: 0x89,0x00,0x00,0x00
	call	socket_send # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	dword ptr [rbp - 0x10], eax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x10] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	cmp	eax, 8 # Size:3, Opcode: 0x83,0x00,0x00,0x00
	jne	.label_53 # Size:2, Opcode: 0x75,0x00,0x00,0x00
	lea	rcx, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8d,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x1c] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	edx, 4 # Size:5, Opcode: 0xba,0x00,0x00,0x00
	mov	rsi, rcx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	edi, eax # Size:2, Opcode: 0x89,0x00,0x00,0x00
	call	socket_recv # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	jmp	.label_52 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_53:
	nop	 # Size:1, Opcode: 0x90,0x00,0x00,0x00
.label_52:
	lea	rdi,  qword ptr [word ptr [rip + lwip_lock]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	call	spinlock_irqsave_unlock # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x10] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
.label_49:
	mov	rdx, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	xor	rdx, qword ptr fs:[0x28] # Size:9, Opcode: 0x33,0x00,0x00,0x00
	je	.label_51 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	call	__stack_chk_fail # Size:5, Opcode: 0xe8,0x00,0x00,0x00
.label_51:
	leave	 # Size:1, Opcode: 0xc9,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl sys_read
	.type sys_read, @function
sys_read:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	add	rsp, -0x80 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	dword ptr [rbp - 0x64], edi # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x70], rsi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x78], rdx # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr fs:[0x28] # Size:9, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	mov	dword ptr [rbp - 0x40], 4 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x64] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rbp - 0x3c], eax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x78] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x38], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x64] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	and	eax, 0x40000000 # Size:5, Opcode: 0x25,0x00,0x00,0x00
	test	eax, eax # Size:2, Opcode: 0x85,0x00,0x00,0x00
	je	.label_54 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	lea	rdi,  qword ptr [word ptr [rip + lwip_lock]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	call	spinlock_irqsave_lock # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x64] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	and	eax, 0xbfffffff # Size:5, Opcode: 0x25,0x00,0x00,0x00
	mov	ecx, eax # Size:2, Opcode: 0x89,0x00,0x00,0x00
	mov	rdx, qword ptr [rbp - 0x78] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x70] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rsi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	edi, ecx # Size:2, Opcode: 0x89,0x00,0x00,0x00
	call	lwip_read # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	cdqe	 # Size:2, Opcode: 0x98,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x48], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	lea	rdi,  qword ptr [word ptr [rip + lwip_lock]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	call	spinlock_irqsave_unlock # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	cmp	qword ptr [rbp - 0x48], 0 # Size:5, Opcode: 0x83,0x00,0x00,0x00
	jns	.label_58 # Size:2, Opcode: 0x79,0x00,0x00,0x00
	mov	rax,  qword ptr [word ptr [rip + current_task]] # Size:7, Opcode: 0x8b,0x00,0x00,0x00
	mov	eax, dword ptr [rax + 0x78] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	neg	eax # Size:2, Opcode: 0xf7,0x00,0x00,0x00
	cdqe	 # Size:2, Opcode: 0x98,0x00,0x00,0x00
	jmp	.label_57 # Size:5, Opcode: 0xe9,0x00,0x00,0x00
.label_58:
	mov	rax, qword ptr [rbp - 0x48] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	jmp	.label_57 # Size:5, Opcode: 0xe9,0x00,0x00,0x00
.label_54:
	call	is_uhyve # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	test	eax, eax # Size:2, Opcode: 0x85,0x00,0x00,0x00
	je	.label_55 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x64] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rbp - 0x30], eax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x70] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x2c], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x78] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x24], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x1c], -1 # Size:8, Opcode: 0xc7,0x00,0x00,0x00
	lea	rax, qword ptr [rbp - 0x30] # Size:4, Opcode: 0x8d,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	virt_to_phys # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	esi, eax # Size:2, Opcode: 0x89,0x00,0x00,0x00
	mov	edi, 0x500 # Size:5, Opcode: 0xbf,0x00,0x00,0x00
	call	uhyve_send # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x1c] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	jmp	.label_57 # Size:5, Opcode: 0xe9,0x00,0x00,0x00
.label_55:
	mov	eax,  dword ptr [dword ptr [rip + libc_sd]] # Size:6, Opcode: 0x8b,0x00,0x00,0x00
	test	eax, eax # Size:2, Opcode: 0x85,0x00,0x00,0x00
	jns	.label_56 # Size:2, Opcode: 0x79,0x00,0x00,0x00
	mov	rax, -0x26 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	jmp	.label_57 # Size:5, Opcode: 0xe9,0x00,0x00,0x00
.label_56:
	lea	rdi,  qword ptr [word ptr [rip + lwip_lock]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	call	spinlock_irqsave_lock # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	eax,  dword ptr [dword ptr [rip + libc_sd]] # Size:6, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rbp - 0x54], eax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	lea	rcx, qword ptr [rbp - 0x40] # Size:4, Opcode: 0x8d,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x54] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	edx, 0x10 # Size:5, Opcode: 0xba,0x00,0x00,0x00
	mov	rsi, rcx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	edi, eax # Size:2, Opcode: 0x89,0x00,0x00,0x00
	call	socket_send # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	lea	rcx, qword ptr [rbp - 0x30] # Size:4, Opcode: 0x8d,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x54] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	edx, 8 # Size:5, Opcode: 0xba,0x00,0x00,0x00
	mov	rsi, rcx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	edi, eax # Size:2, Opcode: 0x89,0x00,0x00,0x00
	call	socket_recv # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x50], 0 # Size:8, Opcode: 0xc7,0x00,0x00,0x00
	jmp	.label_60 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_61:
	mov	rax, qword ptr [rbp - 0x30] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	sub	rax, qword ptr [rbp - 0x50] # Size:4, Opcode: 0x2b,0x00,0x00,0x00
	mov	rsi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rdx, qword ptr [rbp - 0x50] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x70] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	lea	rcx, qword ptr [rdx + rax] # Size:4, Opcode: 0x8d,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x54] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdx, rsi # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rsi, rcx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	edi, eax # Size:2, Opcode: 0x89,0x00,0x00,0x00
	call	lwip_read # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	cdqe	 # Size:2, Opcode: 0x98,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x48], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	cmp	qword ptr [rbp - 0x48], 0 # Size:5, Opcode: 0x83,0x00,0x00,0x00
	jns	.label_62 # Size:2, Opcode: 0x79,0x00,0x00,0x00
	lea	rdi,  qword ptr [word ptr [rip + lwip_lock]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	call	spinlock_irqsave_unlock # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x48] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	jmp	.label_57 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_62:
	mov	rax, qword ptr [rbp - 0x48] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	add	qword ptr [rbp - 0x50], rax # Size:4, Opcode: 0x01,0x00,0x00,0x00
.label_60:
	mov	rax, qword ptr [rbp - 0x30] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	cmp	qword ptr [rbp - 0x50], rax # Size:4, Opcode: 0x39,0x00,0x00,0x00
	jl	.label_61 # Size:2, Opcode: 0x7c,0x00,0x00,0x00
	lea	rdi,  qword ptr [word ptr [rip + lwip_lock]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	call	spinlock_irqsave_unlock # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x30] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
.label_57:
	mov	rcx, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	xor	rcx, qword ptr fs:[0x28] # Size:9, Opcode: 0x33,0x00,0x00,0x00
	je	.label_59 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	call	__stack_chk_fail # Size:5, Opcode: 0xe8,0x00,0x00,0x00
.label_59:
	leave	 # Size:1, Opcode: 0xc9,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl sys_spinlock_init
	.type sys_spinlock_init, @function
sys_spinlock_init:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	sub	rsp, 0x20 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x18], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	cmp	qword ptr [rbp - 0x18], 0 # Size:5, Opcode: 0x83,0x00,0x00,0x00
	sete	al # Size:3, Opcode: 0x0f,0x94,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_63 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_64 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_63:
	mov	edi, 0x18 # Size:5, Opcode: 0xbf,0x00,0x00,0x00
	call	kmalloc # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	rdx, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rax], rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rax] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	sete	al # Size:3, Opcode: 0x0f,0x94,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_65 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xfffffff4 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_64 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_65:
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rax] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	spinlock_init # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	dword ptr [rbp - 4], eax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	cmp	dword ptr [rbp - 4], 0 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	je	.label_66 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rax] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	kfree # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rax], 0 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
.label_66:
	mov	eax, dword ptr [rbp - 4] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
.label_64:
	leave	 # Size:1, Opcode: 0xc9,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl sys_spinlock_destroy
	.type sys_spinlock_destroy, @function
sys_spinlock_destroy:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	sub	rsp, 0x20 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x18], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	cmp	qword ptr [rbp - 0x18], 0 # Size:5, Opcode: 0x83,0x00,0x00,0x00
	sete	al # Size:3, Opcode: 0x0f,0x94,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_67 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_68 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_67:
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	spinlock_destroy # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	dword ptr [rbp - 4], eax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	cmp	dword ptr [rbp - 4], 0 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	jne	.label_69 # Size:2, Opcode: 0x75,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	kfree # Size:5, Opcode: 0xe8,0x00,0x00,0x00
.label_69:
	mov	eax, dword ptr [rbp - 4] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
.label_68:
	leave	 # Size:1, Opcode: 0xc9,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl sys_spinlock_lock
	.type sys_spinlock_lock, @function
sys_spinlock_lock:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	sub	rsp, 0x10 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	cmp	qword ptr [rbp - 8], 0 # Size:5, Opcode: 0x83,0x00,0x00,0x00
	sete	al # Size:3, Opcode: 0x0f,0x94,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_70 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_71 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_70:
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	spinlock_lock # Size:5, Opcode: 0xe8,0x00,0x00,0x00
.label_71:
	leave	 # Size:1, Opcode: 0xc9,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl sys_spinlock_unlock
	.type sys_spinlock_unlock, @function
sys_spinlock_unlock:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	sub	rsp, 0x10 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	cmp	qword ptr [rbp - 8], 0 # Size:5, Opcode: 0x83,0x00,0x00,0x00
	sete	al # Size:3, Opcode: 0x0f,0x94,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_72 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_73 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_72:
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	spinlock_unlock # Size:5, Opcode: 0xe8,0x00,0x00,0x00
.label_73:
	leave	 # Size:1, Opcode: 0xc9,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl sys_sem_init
	.type sys_sem_init, @function
sys_sem_init:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	sub	rsp, 0x20 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x18], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	dword ptr [rbp - 0x1c], esi # Size:3, Opcode: 0x89,0x00,0x00,0x00
	cmp	qword ptr [rbp - 0x18], 0 # Size:5, Opcode: 0x83,0x00,0x00,0x00
	sete	al # Size:3, Opcode: 0x0f,0x94,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_74 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_75 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_74:
	mov	edi, 0x40 # Size:5, Opcode: 0xbf,0x00,0x00,0x00
	call	kmalloc # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	rdx, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rax], rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rax] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	sete	al # Size:3, Opcode: 0x0f,0x94,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_76 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xfffffff4 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_75 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_76:
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rax] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	edx, dword ptr [rbp - 0x1c] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	esi, edx # Size:2, Opcode: 0x89,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	sem_init # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	dword ptr [rbp - 4], eax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	cmp	dword ptr [rbp - 4], 0 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	je	.label_77 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rax] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	kfree # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rax], 0 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
.label_77:
	mov	eax, dword ptr [rbp - 4] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
.label_75:
	leave	 # Size:1, Opcode: 0xc9,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl sys_sem_destroy
	.type sys_sem_destroy, @function
sys_sem_destroy:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	sub	rsp, 0x20 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x18], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	cmp	qword ptr [rbp - 0x18], 0 # Size:5, Opcode: 0x83,0x00,0x00,0x00
	sete	al # Size:3, Opcode: 0x0f,0x94,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_78 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_79 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_78:
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	sem_destroy # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	dword ptr [rbp - 4], eax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	cmp	dword ptr [rbp - 4], 0 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	jne	.label_80 # Size:2, Opcode: 0x75,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	kfree # Size:5, Opcode: 0xe8,0x00,0x00,0x00
.label_80:
	mov	eax, dword ptr [rbp - 4] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
.label_79:
	leave	 # Size:1, Opcode: 0xc9,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl sys_sem_wait
	.type sys_sem_wait, @function
sys_sem_wait:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	sub	rsp, 0x10 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	cmp	qword ptr [rbp - 8], 0 # Size:5, Opcode: 0x83,0x00,0x00,0x00
	sete	al # Size:3, Opcode: 0x0f,0x94,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_81 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_82 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_81:
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	esi, 0 # Size:5, Opcode: 0xbe,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	sem_wait # Size:5, Opcode: 0xe8,0x00,0x00,0x00
.label_82:
	leave	 # Size:1, Opcode: 0xc9,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl sys_sem_post
	.type sys_sem_post, @function
sys_sem_post:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	sub	rsp, 0x10 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	cmp	qword ptr [rbp - 8], 0 # Size:5, Opcode: 0x83,0x00,0x00,0x00
	sete	al # Size:3, Opcode: 0x0f,0x94,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_83 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_84 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_83:
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	sem_post # Size:5, Opcode: 0xe8,0x00,0x00,0x00
.label_84:
	leave	 # Size:1, Opcode: 0xc9,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl sys_sem_timedwait
	.type sys_sem_timedwait, @function
sys_sem_timedwait:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	sub	rsp, 0x10 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	dword ptr [rbp - 0xc], esi # Size:3, Opcode: 0x89,0x00,0x00,0x00
	cmp	qword ptr [rbp - 8], 0 # Size:5, Opcode: 0x83,0x00,0x00,0x00
	sete	al # Size:3, Opcode: 0x0f,0x94,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_85 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_86 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_85:
	mov	edx, dword ptr [rbp - 0xc] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	esi, edx # Size:2, Opcode: 0x89,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	sem_wait # Size:5, Opcode: 0xe8,0x00,0x00,0x00
.label_86:
	leave	 # Size:1, Opcode: 0xc9,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl sys_sem_cancelablewait
	.type sys_sem_cancelablewait, @function
sys_sem_cancelablewait:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	sub	rsp, 0x10 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	dword ptr [rbp - 0xc], esi # Size:3, Opcode: 0x89,0x00,0x00,0x00
	cmp	qword ptr [rbp - 8], 0 # Size:5, Opcode: 0x83,0x00,0x00,0x00
	sete	al # Size:3, Opcode: 0x0f,0x94,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_87 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_88 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_87:
	mov	edx, dword ptr [rbp - 0xc] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	esi, edx # Size:2, Opcode: 0x89,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	sem_wait # Size:5, Opcode: 0xe8,0x00,0x00,0x00
.label_88:
	leave	 # Size:1, Opcode: 0xc9,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl sys_clone
	.type sys_clone, @function
sys_clone:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	sub	rsp, 0x20 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x10], rsi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x18], rdx # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rax,  qword ptr [word ptr [rip + current_task]] # Size:7, Opcode: 0x8b,0x00,0x00,0x00
	movzx	eax, byte ptr [rax + 0x29] # Size:4, Opcode: 0x0f,0xb6,0x00,0x00
	movzx	ecx, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	mov	rsi, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdx, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	clone_task # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	leave	 # Size:1, Opcode: 0xc9,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl main
	.type main, @function
main:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl atomic_int64_test_and_set
	.type atomic_int64_test_and_set, @function
atomic_int64_test_and_set:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x10], rsi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rdx, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	xchg	qword ptr [rdx], rax # Size:3, Opcode: 0x87,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x10], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl atomic_int64_inc
	.type atomic_int64_inc, @function
atomic_int64_inc:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x18], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], 1 # Size:8, Opcode: 0xc7,0x00,0x00,0x00
	mov	rcx, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdx, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	xadd	qword ptr [rcx], rax # Size:4, Opcode: 0x0f,0xc1,0x00,0x00
	mov	qword ptr [rbp - 8], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	add	qword ptr [rbp - 8], 1 # Size:5, Opcode: 0x83,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl atomic_int64_read
	.type atomic_int64_read, @function
atomic_int64_read:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rax] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl atomic_int64_set
	.type atomic_int64_set, @function
atomic_int64_set:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	sub	rsp, 0x10 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x10], rsi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rdx, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rsi, rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	atomic_int64_test_and_set # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	nop	 # Size:1, Opcode: 0x90,0x00,0x00,0x00
	leave	 # Size:1, Opcode: 0xc9,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl spinlock_init
	.type spinlock_init, @function
spinlock_init:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	sub	rsp, 8 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	cmp	qword ptr [rbp - 8], 0 # Size:5, Opcode: 0x83,0x00,0x00,0x00
	sete	al # Size:3, Opcode: 0x0f,0x94,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_89 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_90 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_89:
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	esi, 0 # Size:5, Opcode: 0xbe,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	atomic_int64_set # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	add	rax, 8 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	esi, 1 # Size:5, Opcode: 0xbe,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	atomic_int64_set # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x10], 4 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x14], 0 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
.label_90:
	leave	 # Size:1, Opcode: 0xc9,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl spinlock_destroy
	.type spinlock_destroy, @function
spinlock_destroy:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	cmp	qword ptr [rbp - 8], 0 # Size:5, Opcode: 0x83,0x00,0x00,0x00
	sete	al # Size:3, Opcode: 0x0f,0x94,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_91 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_92 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_91:
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x10], 4 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x14], 0 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
.label_92:
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl spinlock_lock
	.type spinlock_lock, @function
spinlock_lock:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	sub	rsp, 0x18 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x18], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	cmp	qword ptr [rbp - 0x18], 0 # Size:5, Opcode: 0x83,0x00,0x00,0x00
	sete	al # Size:3, Opcode: 0x0f,0x94,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_93 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_95 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_93:
	mov	rax,  qword ptr [word ptr [rip + current_task]] # Size:7, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x10], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	edx, dword ptr [rax + 0x10] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	eax, dword ptr [rax] # Size:2, Opcode: 0x8b,0x00,0x00,0x00
	cmp	edx, eax # Size:2, Opcode: 0x39,0x00,0x00,0x00
	jne	.label_94 # Size:2, Opcode: 0x75,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	eax, dword ptr [rax + 0x14] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	lea	edx, dword ptr [rax + 1] # Size:3, Opcode: 0x8d,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x14], edx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_95 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_94:
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	atomic_int64_inc # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	jmp	.label_96 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_97:
	pause	 # Size:2, Opcode: 0x90,0x00,0x00,0x00
.label_96:
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	add	rax, 8 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	atomic_int64_read # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	cmp	qword ptr [rbp - 8], rax # Size:4, Opcode: 0x39,0x00,0x00,0x00
	jne	.label_97 # Size:2, Opcode: 0x75,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	edx, dword ptr [rax] # Size:2, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x10], edx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x14], 1 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
.label_95:
	leave	 # Size:1, Opcode: 0xc9,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl spinlock_unlock
	.type spinlock_unlock, @function
spinlock_unlock:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	sub	rsp, 8 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	cmp	qword ptr [rbp - 8], 0 # Size:5, Opcode: 0x83,0x00,0x00,0x00
	sete	al # Size:3, Opcode: 0x0f,0x94,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_98 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_100 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_98:
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	eax, dword ptr [rax + 0x14] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	lea	edx, dword ptr [rax - 1] # Size:3, Opcode: 0x8d,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x14], edx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	eax, dword ptr [rax + 0x14] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	test	eax, eax # Size:2, Opcode: 0x85,0x00,0x00,0x00
	jne	.label_99 # Size:2, Opcode: 0x75,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x10], 4 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	add	rax, 8 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	atomic_int64_inc # Size:5, Opcode: 0xe8,0x00,0x00,0x00
.label_99:
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
.label_100:
	leave	 # Size:1, Opcode: 0xc9,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl spinlock_irqsave_init
	.type spinlock_irqsave_init, @function
spinlock_irqsave_init:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	sub	rsp, 8 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	cmp	qword ptr [rbp - 8], 0 # Size:5, Opcode: 0x83,0x00,0x00,0x00
	sete	al # Size:3, Opcode: 0x0f,0x94,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_101 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_102 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_101:
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	esi, 0 # Size:5, Opcode: 0xbe,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	atomic_int64_set # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	add	rax, 8 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	esi, 1 # Size:5, Opcode: 0xbe,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	atomic_int64_set # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x10], 4 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x14], 0 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	byte ptr [rax + 0x18], 0 # Size:4, Opcode: 0xc6,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
.label_102:
	leave	 # Size:1, Opcode: 0xc9,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl spinlock_irqsave_destroy
	.type spinlock_irqsave_destroy, @function
spinlock_irqsave_destroy:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	cmp	qword ptr [rbp - 8], 0 # Size:5, Opcode: 0x83,0x00,0x00,0x00
	sete	al # Size:3, Opcode: 0x0f,0x94,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_103 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_104 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_103:
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x10], 4 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x14], 0 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	byte ptr [rax + 0x18], 0 # Size:4, Opcode: 0xc6,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
.label_104:
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl spinlock_irqsave_lock
	.type spinlock_irqsave_lock, @function
spinlock_irqsave_lock:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	sub	rsp, 0x30 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x28], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	cmp	qword ptr [rbp - 0x28], 0 # Size:5, Opcode: 0x83,0x00,0x00,0x00
	sete	al # Size:3, Opcode: 0x0f,0x94,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_105 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_106 # Size:5, Opcode: 0xe9,0x00,0x00,0x00
.label_105:
	call	irq_nested_disable # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	byte ptr [rbp - 0x11], al # Size:3, Opcode: 0x88,0x00,0x00,0x00
	mov	rax,  qword ptr [word ptr [rip + current_task]] # Size:7, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x10], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x28] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	edx, dword ptr [rax + 0x10] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	eax, dword ptr [rax] # Size:2, Opcode: 0x8b,0x00,0x00,0x00
	cmp	edx, eax # Size:2, Opcode: 0x39,0x00,0x00,0x00
	jne	.label_107 # Size:2, Opcode: 0x75,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x28] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	eax, dword ptr [rax + 0x14] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	lea	edx, dword ptr [rax + 1] # Size:3, Opcode: 0x8d,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x28] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x14], edx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_106 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_107:
	mov	rax, qword ptr [rbp - 0x28] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	atomic_int64_inc # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	jmp	.label_108 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_109:
	pause	 # Size:2, Opcode: 0x90,0x00,0x00,0x00
.label_108:
	mov	rax, qword ptr [rbp - 0x28] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	add	rax, 8 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	atomic_int64_read # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	cmp	qword ptr [rbp - 8], rax # Size:4, Opcode: 0x39,0x00,0x00,0x00
	jne	.label_109 # Size:2, Opcode: 0x75,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x28] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	movzx	edx, byte ptr [rbp - 0x11] # Size:4, Opcode: 0x0f,0xb6,0x00,0x00
	mov	byte ptr [rax + 0x18], dl # Size:3, Opcode: 0x88,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	edx, dword ptr [rax] # Size:2, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x28] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x10], edx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x28] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x14], 1 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
.label_106:
	leave	 # Size:1, Opcode: 0xc9,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl spinlock_irqsave_unlock
	.type spinlock_irqsave_unlock, @function
spinlock_irqsave_unlock:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	sub	rsp, 0x10 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	cmp	qword ptr [rbp - 8], 0 # Size:5, Opcode: 0x83,0x00,0x00,0x00
	sete	al # Size:3, Opcode: 0x0f,0x94,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_110 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_112 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_110:
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	eax, dword ptr [rax + 0x14] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	lea	edx, dword ptr [rax - 1] # Size:3, Opcode: 0x8d,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x14], edx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	eax, dword ptr [rax + 0x14] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	test	eax, eax # Size:2, Opcode: 0x85,0x00,0x00,0x00
	jne	.label_111 # Size:2, Opcode: 0x75,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x10], 4 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	add	rax, 8 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	atomic_int64_inc # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	movzx	eax, byte ptr [rax + 0x18] # Size:4, Opcode: 0x0f,0xb6,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	mov	edi, eax # Size:2, Opcode: 0x89,0x00,0x00,0x00
	call	irq_nested_enable # Size:5, Opcode: 0xe8,0x00,0x00,0x00
.label_111:
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
.label_112:
	leave	 # Size:1, Opcode: 0xc9,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl kputs
	.type kputs, @function
kputs:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl irq_nested_disable
	.type irq_nested_disable, @function
irq_nested_disable:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl irq_nested_enable
	.type irq_nested_enable, @function
irq_nested_enable:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, edi # Size:2, Opcode: 0x89,0x00,0x00,0x00
	mov	byte ptr [rbp - 4], al # Size:3, Opcode: 0x88,0x00,0x00,0x00
	nop	 # Size:1, Opcode: 0x90,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl lwip_write
	.type lwip_write, @function
lwip_write:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	dword ptr [rbp - 4], edi # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x10], rsi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x18], rdx # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl lwip_read
	.type lwip_read, @function
lwip_read:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	dword ptr [rbp - 4], edi # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x10], rsi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x18], rdx # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl lwip_close
	.type lwip_close, @function
lwip_close:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	dword ptr [rbp - 4], edi # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl virt_to_phys
	.type virt_to_phys, @function
virt_to_phys:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl is_uhyve
	.type is_uhyve, @function
is_uhyve:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl kputchar
	.type kputchar, @function
kputchar:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	dword ptr [rbp - 4], edi # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl kmalloc
	.type kmalloc, @function
kmalloc:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl kfree
	.type kfree, @function
kfree:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	nop	 # Size:1, Opcode: 0x90,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl timer_wait
	.type timer_wait, @function
timer_wait:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	dword ptr [rbp - 4], edi # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl udelay
	.type udelay, @function
udelay:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	dword ptr [rbp - 4], edi # Size:3, Opcode: 0x89,0x00,0x00,0x00
	nop	 # Size:1, Opcode: 0x90,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl sem_init
	.type sem_init, @function
sem_init:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	dword ptr [rbp - 0xc], esi # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl sem_destroy
	.type sem_destroy, @function
sem_destroy:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl sem_wait
	.type sem_wait, @function
sem_wait:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	dword ptr [rbp - 0xc], esi # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl sem_post
	.type sem_post, @function
sem_post:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl clone_task
	.type clone_task, @function
clone_task:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x10], rsi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x18], rdx # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, ecx # Size:2, Opcode: 0x89,0x00,0x00,0x00
	mov	byte ptr [rbp - 0x1c], al # Size:3, Opcode: 0x88,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl strlen
	.type strlen, @function
strlen:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl memcpy
	.type memcpy, @function
memcpy:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x10], rsi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x18], rdx # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl get_pages
	.type get_pages, @function
get_pages:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl page_map
	.type page_map, @function
page_map:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x10], rsi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x18], rdx # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x20], rcx # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl put_pages
	.type put_pages, @function
put_pages:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x10], rsi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl has_nx
	.type has_nx, @function
has_nx:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl vma_alloc
	.type vma_alloc, @function
vma_alloc:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	dword ptr [rbp - 0xc], esi # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl vma_free
	.type vma_free, @function
vma_free:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x10], rsi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00


	.section .comment
	.align 32
	.globl xxxxxxxxxxxxxxxxx
	.type xxxxxxxxxxxxxxxxx, @other
xxxxxxxxxxxxxxxxx:
	.byte 127
	.byte 69
	.byte 76
	.byte 70
	.byte 2
	.byte 1
	.byte 1
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 3
	.byte 0
	.byte 62
	.byte 0
	.byte 1
	.byte 0
	.byte 0
	.byte 0
	.byte 80
	.byte 16
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 64
	.byte 0
	.byte 0
	label_117:

	.section .symtab
	.align 32
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 232
	.byte 102
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 64
	.byte 0
	.byte 56
	.byte 0
	.byte 11
	.byte 0
	.byte 64
	.byte 0
	.byte 29
	.byte 0
	.byte 28
	.byte 0
	.byte 6
	.byte 0
	.byte 0
	.byte 0
	.byte 4
	.byte 0
	.quad 9999999999999999
	.quad 9999999999999999
	.quad 9999999999999999
	.byte 0
	.byte 0
	.byte 104
	.byte 2
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 104
	.byte 2
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 8
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 3
	.byte 0
	.byte 0
	.byte 0
	.byte 4
	.byte 0
	.byte 0
	.byte 0
	.byte 168
	.byte 2
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 168
	.byte 2
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 168
	.byte 2
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 28
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 28
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 1
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 1
	.byte 0
	.byte 0
	.byte 0
	.byte 4
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 56
	.byte 6
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 56
	.byte 6
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 16
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 1
	.byte 0
	.byte 0
	.byte 0
	.byte 5
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 16
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 16
	.byte 0
	.byte 0
	.byte 0
	.byte 0

	.section .shstrtab
	.align 32
	label_120:

	.section .symtab
	.align 32
	.byte 16
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 253
	.byte 18
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 253
	.byte 18
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 16
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 1
	.byte 0
	.byte 0
	.byte 0
	.byte 4
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 48
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 48
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 48
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 208
	.byte 10
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 208
	.byte 10
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 16
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 1
	.byte 0
	.byte 0
	.byte 0
	.byte 6
	.byte 0
	.byte 0
	.byte 0
	.byte 184
	.byte 61
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 184
	.byte 77
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 184
	.byte 77
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 144
	.byte 22
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 8
	.byte 23
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 16
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 2
	.byte 0
	.byte 0
	.byte 0
	.byte 6
	.byte 0
	.byte 0
	.byte 0
	.byte 200
	.byte 61
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 200
	.byte 77
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 200
	.byte 77
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 240
	.byte 1
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 240
	.byte 1
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 8
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 4
	.byte 0
	.byte 0
	.byte 0
	.byte 4
	.byte 0
	.byte 0
	.byte 0
	.byte 196
	.byte 2
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 196
	.byte 2
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 196
	.byte 2
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 68
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 68
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 4
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 80
	.byte 229
	.byte 116
	.byte 100
	.byte 4
	.byte 0
	.byte 0
	.byte 0
	.byte 4
	.byte 48
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 4
	.byte 48
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 4
	.byte 48
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 36
	.byte 2
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 36
	.byte 2
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 4
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 81
	.byte 229
	.byte 116
	.byte 100
	.byte 6
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 16
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 82
	.byte 229
	.byte 116
	.byte 100
	.byte 4
	.byte 0
	.byte 0
	.byte 0
	.byte 184
	.byte 61
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 184
	.byte 77
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 184
	.byte 77
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 72
	.byte 2
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 72
	.byte 2
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 1
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0

	.section .strtab
	.align 32
	label_119:

	.section .symtab
	.align 32
	.label_118:

	.section .rodata
	.align 32
	.byte 1
	.byte 0
	.byte 2
	.byte 0

	.section .data
	.align 32
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.globl lwip_lock
	.type lwip_lock, @object
lwip_lock:
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 1
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 4
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.globl task_table
	.type task_table, @object
task_table:
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 5
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.globl current_task
	.type current_task, @object
current_task:
	.quad task_table

	.section .bss
	.align 32
	.globl completed.7930
	.type completed.7930, @object
completed.7930:
	.byte 0x0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.globl libc_sd
	.type libc_sd, @object
libc_sd:
	.quad 0x0
	.quad 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.globl stdio_lock
	.type stdio_lock, @object
stdio_lock:
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
		.globl _end
	.type _end, @notype
_end:
