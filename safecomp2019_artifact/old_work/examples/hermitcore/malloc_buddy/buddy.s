	.intel_syntax noprefix

	.section	.text
	.align	16
	.globl buddy_large_avail
	.type buddy_large_avail, @function
buddy_large_avail:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, edi # Size:2, Opcode: 0x89,0x00,0x00,0x00
	mov	byte ptr [rbp - 4], al # Size:3, Opcode: 0x88,0x00,0x00,0x00
	jmp	label_11 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
label_12:
	movzx	eax, byte ptr [rbp - 4] # Size:4, Opcode: 0x0f,0xb6,0x00,0x00
	add	eax, 1 # Size:3, Opcode: 0x83,0x00,0x00,0x00
	mov	byte ptr [rbp - 4], al # Size:3, Opcode: 0x88,0x00,0x00,0x00
label_11:
	cmp	byte ptr [rbp - 4], 0x1f # Size:4, Opcode: 0x80,0x00,0x00,0x00
	ja	label_13 # Size:2, Opcode: 0x77,0x00,0x00,0x00
	movzx	eax, byte ptr [rbp - 4] # Size:4, Opcode: 0x0f,0xb6,0x00,0x00
	sub	eax, 6 # Size:3, Opcode: 0x83,0x00,0x00,0x00
	cdqe	 # Size:2, Opcode: 0x98,0x00,0x00,0x00
	lea	rdx, qword ptr [rax*8] # Size:8, Opcode: 0x8d,0x00,0x00,0x00
	lea	rax,  qword ptr [word ptr [buddy_lists]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	mov	rax, qword ptr [rdx + rax] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	label_12 # Size:2, Opcode: 0x74,0x00,0x00,0x00
label_13:
	cmp	byte ptr [rbp - 4], 0x20 # Size:4, Opcode: 0x80,0x00,0x00,0x00
	setne	al # Size:3, Opcode: 0x0f,0x95,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl buddy_exp
	.type buddy_exp, @function
buddy_exp:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x18], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
.label_28:
	mov	dword ptr [rbp - 4], 0 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	jmp	.label_14 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_16:
	add	dword ptr [rbp - 4], 1 # Size:4, Opcode: 0x83,0x00,0x00,0x00
.label_14:
	mov	eax, dword ptr [rbp - 4] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	edx, 1 # Size:5, Opcode: 0xba,0x00,0x00,0x00
	mov	ecx, eax # Size:2, Opcode: 0x89,0x00,0x00,0x00
	shl	edx, cl # Size:2, Opcode: 0xd3,0x00,0x00,0x00
	mov	eax, edx # Size:2, Opcode: 0x89,0x00,0x00,0x00
	cdqe	 # Size:2, Opcode: 0x98,0x00,0x00,0x00
	cmp	qword ptr [rbp - 0x18], rax # Size:4, Opcode: 0x39,0x00,0x00,0x00
	ja	.label_16 # Size:2, Opcode: 0x77,0x00,0x00,0x00
	cmp	dword ptr [rbp - 4], 0x20 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	jle	.label_15 # Size:2, Opcode: 0x7e,0x00,0x00,0x00
	mov	dword ptr [rbp - 4], 0 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
.label_15:
	cmp	dword ptr [rbp - 4], 5 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	jg	.label_17 # Size:2, Opcode: 0x7f,0x00,0x00,0x00
	mov	dword ptr [rbp - 4], 6 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
.label_17:
	mov	eax, dword ptr [rbp - 4] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl buddy_get
	.type buddy_get, @function
buddy_get:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	sub	rsp, 0x30 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	eax, edi # Size:2, Opcode: 0x89,0x00,0x00,0x00
	mov	byte ptr [rbp - 0x24], al # Size:3, Opcode: 0x88,0x00,0x00,0x00
	movzx	eax, byte ptr [rbp - 0x24] # Size:4, Opcode: 0x0f,0xb6,0x00,0x00
	sub	eax, 6 # Size:3, Opcode: 0x83,0x00,0x00,0x00
	cdqe	 # Size:2, Opcode: 0x98,0x00,0x00,0x00
	lea	rdx, qword ptr [rax*8] # Size:8, Opcode: 0x8d,0x00,0x00,0x00
	lea	rax,  qword ptr [word ptr [buddy_lists]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	add	rax, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x10], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rax] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x18], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	cmp	qword ptr [rbp - 0x18], 0 # Size:5, Opcode: 0x83,0x00,0x00,0x00
	je	.label_20 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdx, qword ptr [rax] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rax], rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	jmp	.label_19 # Size:5, Opcode: 0xe9,0x00,0x00,0x00
.label_20:
	cmp	byte ptr [rbp - 0x24], 0xf # Size:4, Opcode: 0x80,0x00,0x00,0x00
	jbe	.label_21 # Size:2, Opcode: 0x76,0x00,0x00,0x00
	movzx	eax, byte ptr [rbp - 0x24] # Size:4, Opcode: 0x0f,0xb6,0x00,0x00
	mov	edi, eax # Size:2, Opcode: 0x89,0x00,0x00,0x00
	call	buddy_large_avail # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	test	eax, eax # Size:2, Opcode: 0x85,0x00,0x00,0x00
	jne	.label_21 # Size:2, Opcode: 0x75,0x00,0x00,0x00
	movzx	eax, byte ptr [rbp - 0x24] # Size:4, Opcode: 0x0f,0xb6,0x00,0x00
	mov	edx, 1 # Size:5, Opcode: 0xba,0x00,0x00,0x00
	mov	ecx, eax # Size:2, Opcode: 0x89,0x00,0x00,0x00
	shl	edx, cl # Size:2, Opcode: 0xd3,0x00,0x00,0x00
	mov	eax, edx # Size:2, Opcode: 0x89,0x00,0x00,0x00
	cdqe	 # Size:2, Opcode: 0x98,0x00,0x00,0x00
	mov	esi, 0xb # Size:5, Opcode: 0xbe,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	palloc # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x18], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	jmp	.label_19 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_21:
	movzx	eax, byte ptr [rbp - 0x24] # Size:4, Opcode: 0x0f,0xb6,0x00,0x00
	add	eax, 1 # Size:3, Opcode: 0x83,0x00,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	mov	edi, eax # Size:2, Opcode: 0x89,0x00,0x00,0x00
	call	buddy_get # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x18], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	cmp	qword ptr [rbp - 0x18], 0 # Size:5, Opcode: 0x83,0x00,0x00,0x00
	sete	al # Size:3, Opcode: 0x0f,0x94,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	jne	.label_18 # Size:2, Opcode: 0x75,0x00,0x00,0x00
	movzx	eax, byte ptr [rbp - 0x24] # Size:4, Opcode: 0x0f,0xb6,0x00,0x00
	mov	edx, 1 # Size:5, Opcode: 0xba,0x00,0x00,0x00
	mov	ecx, eax # Size:2, Opcode: 0x89,0x00,0x00,0x00
	shl	edx, cl # Size:2, Opcode: 0xd3,0x00,0x00,0x00
	mov	eax, edx # Size:2, Opcode: 0x89,0x00,0x00,0x00
	movsxd	rdx, eax # Size:3, Opcode: 0x63,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	add	rax, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdx, qword ptr [rax] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rax], rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdx, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rax], rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	jmp	.label_19 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_18:
	nop	 # Size:1, Opcode: 0x90,0x00,0x00,0x00
.label_19:
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	leave	 # Size:1, Opcode: 0xc9,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl buddy_put
	.type buddy_put, @function
buddy_put:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x18], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	movzx	eax, byte ptr [rax] # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	sub	eax, 6 # Size:3, Opcode: 0x83,0x00,0x00,0x00
	cdqe	 # Size:2, Opcode: 0x98,0x00,0x00,0x00
	lea	rdx, qword ptr [rax*8] # Size:8, Opcode: 0x8d,0x00,0x00,0x00
	lea	rax,  qword ptr [word ptr [buddy_lists]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	add	rax, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdx, qword ptr [rax] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rax], rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdx, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rax], rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	nop	 # Size:1, Opcode: 0x90,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl palloc
	.type palloc, @function
palloc:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	dword ptr [rbp - 0xc], esi # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl main
	.type main, @function
main:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	sub	rsp, 0x20 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	dword ptr [rbp - 0x14], edi # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x20], rsi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x14] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	cdqe	 # Size:2, Opcode: 0x98,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	buddy_exp # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	dword ptr [rbp - 0xc], eax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x14] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	mov	edi, eax # Size:2, Opcode: 0x89,0x00,0x00,0x00
	call	buddy_get # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	buddy_put # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0xc] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	leave	 # Size:1, Opcode: 0xc9,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00


	.section .comment
	.align 32
label_24:
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
	.byte 240
	.byte 4
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 64
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	label_27:

	.section .symtab
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
	.byte 64
	.byte 56
	.byte 9
	.byte 64
	.byte 28
	.byte 0
	.byte 27
	.byte 0
	.byte 6
	.byte 0
	.byte 0
	.byte 0
	.byte 5
	.byte 0
	.quad label_24
	.quad label_24
	.quad label_24
	.byte 0
	.byte 0
	.byte 248
	.byte 1
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 248
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
	.byte 3
	.byte 0
	.byte 0
	.byte 0
	.byte 4
	.byte 0
	.byte 0
	.byte 0
	.byte 56
	.byte 2
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 56
	.byte 2
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 56
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
	.byte 176
	.byte 10
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 176
	.byte 10
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 32
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
	.byte 240
	.byte 13
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 240

	.section .shstrtab
	.align 32
	label_30:

	.section .symtab
	.align 32
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 240
	.byte 13
	.byte 32
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 32
	.byte 2
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 40
	.byte 3
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 32
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
	.byte 0
	.byte 14
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 14
	.byte 32
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 14
	.byte 32
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 192
	.byte 1
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 192
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
	.byte 84
	.byte 2
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 84
	.byte 2
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 84
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
	.byte 164
	.byte 8
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 164
	.byte 8
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 164
	.byte 8
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 100
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 100
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
	.byte 240
	.byte 13
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 240
	.byte 13
	.byte 32
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 240
	.byte 13
	.byte 32
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 16
	.byte 2
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 16
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

	.section .strtab
	.align 32
	label_29:

	.section .symtab
	.align 32
	.label_28:

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

	.section .data
	.align 32
	.globl completed.7641
	.type completed.7641, @object
completed.7641:
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
	.globl buddy_lists
	.type buddy_lists, @object
buddy_lists:
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
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
