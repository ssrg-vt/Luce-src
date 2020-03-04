	.intel_syntax noprefix

	.section	.text
	.align	32
	.globl buddy_large_avail
	.type buddy_large_avail, @function
buddy_large_avail:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, edi # Size:2, Opcode: 0x89,0x00,0x00,0x00
	mov	byte ptr [rbp - 4], al # Size:3, Opcode: 0x88,0x00,0x00,0x00
	jmp	.label_10 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_12:
	movzx	eax, byte ptr [rbp - 4] # Size:4, Opcode: 0x0f,0xb6,0x00,0x00
	add	eax, 1 # Size:3, Opcode: 0x83,0x00,0x00,0x00
	mov	byte ptr [rbp - 4], al # Size:3, Opcode: 0x88,0x00,0x00,0x00
.label_10:
	cmp	byte ptr [rbp - 4], 0x1f # Size:4, Opcode: 0x80,0x00,0x00,0x00
	ja	.label_11 # Size:2, Opcode: 0x77,0x00,0x00,0x00
	movzx	eax, byte ptr [rbp - 4] # Size:4, Opcode: 0x0f,0xb6,0x00,0x00
	sub	eax, 6 # Size:3, Opcode: 0x83,0x00,0x00,0x00
	cdqe	 # Size:2, Opcode: 0x98,0x00,0x00,0x00
	lea	rdx, qword ptr [rax*8] # Size:8, Opcode: 0x8d,0x00,0x00,0x00
	lea	rax,  qword ptr [word ptr [rip + buddy_lists]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	mov	rax, qword ptr [rdx + rax] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_12 # Size:2, Opcode: 0x74,0x00,0x00,0x00
.label_11:
	cmp	byte ptr [rbp - 4], 0x20 # Size:4, Opcode: 0x80,0x00,0x00,0x00
	setne	al # Size:3, Opcode: 0x0f,0x95,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl buddy_exp
	.type buddy_exp, @function
buddy_exp:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x18], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	dword ptr [rbp - 4], 0 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	jmp	.label_13 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_14:
	add	dword ptr [rbp - 4], 1 # Size:4, Opcode: 0x83,0x00,0x00,0x00
.label_13:
	mov	eax, dword ptr [rbp - 4] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	edx, 1 # Size:5, Opcode: 0xba,0x00,0x00,0x00
	mov	ecx, eax # Size:2, Opcode: 0x89,0x00,0x00,0x00
	shl	edx, cl # Size:2, Opcode: 0xd3,0x00,0x00,0x00
	mov	eax, edx # Size:2, Opcode: 0x89,0x00,0x00,0x00
	cdqe	 # Size:2, Opcode: 0x98,0x00,0x00,0x00
	cmp	qword ptr [rbp - 0x18], rax # Size:4, Opcode: 0x39,0x00,0x00,0x00
	ja	.label_14 # Size:2, Opcode: 0x77,0x00,0x00,0x00
	cmp	dword ptr [rbp - 4], 0x20 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	jle	.label_15 # Size:2, Opcode: 0x7e,0x00,0x00,0x00
	mov	dword ptr [rbp - 4], 0 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
.label_15:
	cmp	dword ptr [rbp - 4], 5 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	jg	.label_16 # Size:2, Opcode: 0x7f,0x00,0x00,0x00
	mov	dword ptr [rbp - 4], 6 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
.label_16:
	mov	eax, dword ptr [rbp - 4] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl buddy_get
	.type buddy_get, @function
buddy_get:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	sub	rsp, 0x30 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	eax, edi # Size:2, Opcode: 0x89,0x00,0x00,0x00
	mov	byte ptr [rbp - 0x24], al # Size:3, Opcode: 0x88,0x00,0x00,0x00
	lea	rdi,  qword ptr [word ptr [rip + hermit_mm_lock]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	call	spinlock_irqsave_lock # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	movzx	eax, byte ptr [rbp - 0x24] # Size:4, Opcode: 0x0f,0xb6,0x00,0x00
	sub	eax, 6 # Size:3, Opcode: 0x83,0x00,0x00,0x00
	cdqe	 # Size:2, Opcode: 0x98,0x00,0x00,0x00
	lea	rdx, qword ptr [rax*8] # Size:8, Opcode: 0x8d,0x00,0x00,0x00
	lea	rax,  qword ptr [word ptr [rip + buddy_lists]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	add	rax, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x10], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rax] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x18], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	cmp	qword ptr [rbp - 0x18], 0 # Size:5, Opcode: 0x83,0x00,0x00,0x00
	je	.label_17 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdx, qword ptr [rax] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rax], rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	jmp	.label_19 # Size:5, Opcode: 0xe9,0x00,0x00,0x00
.label_17:
	cmp	byte ptr [rbp - 0x24], 0xf # Size:4, Opcode: 0x80,0x00,0x00,0x00
	jbe	.label_18 # Size:2, Opcode: 0x76,0x00,0x00,0x00
	movzx	eax, byte ptr [rbp - 0x24] # Size:4, Opcode: 0x0f,0xb6,0x00,0x00
	mov	edi, eax # Size:2, Opcode: 0x89,0x00,0x00,0x00
	call	buddy_large_avail # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	test	eax, eax # Size:2, Opcode: 0x85,0x00,0x00,0x00
	jne	.label_18 # Size:2, Opcode: 0x75,0x00,0x00,0x00
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
.label_18:
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
	jne	.label_20 # Size:2, Opcode: 0x75,0x00,0x00,0x00
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
.label_20:
	nop	 # Size:1, Opcode: 0x90,0x00,0x00,0x00
.label_19:
	lea	rdi,  qword ptr [word ptr [rip + hermit_mm_lock]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	call	spinlock_irqsave_unlock # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	leave	 # Size:1, Opcode: 0xc9,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl buddy_put
	.type buddy_put, @function
buddy_put:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	sub	rsp, 0x20 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x18], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	lea	rdi,  qword ptr [word ptr [rip + hermit_mm_lock]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	call	spinlock_irqsave_lock # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	movzx	eax, byte ptr [rax] # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	sub	eax, 6 # Size:3, Opcode: 0x83,0x00,0x00,0x00
	cdqe	 # Size:2, Opcode: 0x98,0x00,0x00,0x00
	lea	rdx, qword ptr [rax*8] # Size:8, Opcode: 0x8d,0x00,0x00,0x00
	lea	rax,  qword ptr [word ptr [rip + buddy_lists]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	add	rax, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdx, qword ptr [rax] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rax], rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdx, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rax], rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	lea	rdi,  qword ptr [word ptr [rip + hermit_mm_lock]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	call	spinlock_irqsave_unlock # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	nop	 # Size:1, Opcode: 0x90,0x00,0x00,0x00
	leave	 # Size:1, Opcode: 0xc9,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl palloc
	.type palloc, @function
palloc:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	sub	rsp, 0x30 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x28], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	dword ptr [rbp - 0x2c], esi # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x28] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	add	rax, 0xfff # Size:6, Opcode: 0x05,0x00,0x00,0x00
	shr	rax, 0xc # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	mov	dword ptr [rbp - 0x20], eax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x28] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	lea	rdx, qword ptr [rax + 0xfff] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	movabs	rax, 0x7ffffffffffff000 # Size:10, Opcode: 0xb8,0x00,0x00,0x00
	and	rdx, rax # Size:3, Opcode: 0x21,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x2c] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	esi, eax # Size:2, Opcode: 0x89,0x00,0x00,0x00
	mov	rdi, rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	vma_alloc # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x18], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	cmp	qword ptr [rbp - 0x18], 0 # Size:5, Opcode: 0x83,0x00,0x00,0x00
	sete	al # Size:3, Opcode: 0x0f,0x94,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_21 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_22 # Size:5, Opcode: 0xe9,0x00,0x00,0x00
.label_21:
	mov	eax, dword ptr [rbp - 0x20] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	get_pages # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x10], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	cmp	qword ptr [rbp - 0x10], 0 # Size:5, Opcode: 0x83,0x00,0x00,0x00
	sete	al # Size:3, Opcode: 0x0f,0x94,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_23 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x20] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	shl	rax, 0xc # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	mov	rdx, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	add	rdx, rax # Size:3, Opcode: 0x01,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rsi, rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	vma_free # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_22 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_23:
	call	has_nx # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	test	eax, eax # Size:2, Opcode: 0x85,0x00,0x00,0x00
	je	.label_24 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	movabs	rax, 0x8000000000000002 # Size:10, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_25 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_24:
	mov	eax, 2 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
.label_25:
	mov	qword ptr [rbp - 8], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	edx, dword ptr [rbp - 0x20] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rcx, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rsi, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	page_map # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	dword ptr [rbp - 0x1c], eax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x1c] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	cdqe	 # Size:2, Opcode: 0x98,0x00,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_26 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x20] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	shl	rax, 0xc # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	mov	rdx, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	add	rdx, rax # Size:3, Opcode: 0x01,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rsi, rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	vma_free # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	edx, dword ptr [rbp - 0x20] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rsi, rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	put_pages # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_22 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_26:
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
.label_22:
	leave	 # Size:1, Opcode: 0xc9,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
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

	.section	.text
	.align	32
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
	.align	32
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
	.align	32
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
	.align	32
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
	.align	32
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
	je	.label_27 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_28 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_27:
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
.label_28:
	leave	 # Size:1, Opcode: 0xc9,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
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
	je	.label_29 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_30 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_29:
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x10], 4 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x14], 0 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
.label_30:
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
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
	je	.label_31 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_33 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_31:
	mov	rax,  qword ptr [word ptr [rip + current_task]] # Size:7, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x10], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	edx, dword ptr [rax + 0x10] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	eax, dword ptr [rax] # Size:2, Opcode: 0x8b,0x00,0x00,0x00
	cmp	edx, eax # Size:2, Opcode: 0x39,0x00,0x00,0x00
	jne	.label_32 # Size:2, Opcode: 0x75,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	eax, dword ptr [rax + 0x14] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	lea	edx, dword ptr [rax + 1] # Size:3, Opcode: 0x8d,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x14], edx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_33 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_32:
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	atomic_int64_inc # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	jmp	.label_34 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_35:
	pause	 # Size:2, Opcode: 0x90,0x00,0x00,0x00
.label_34:
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	add	rax, 8 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	atomic_int64_read # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	cmp	qword ptr [rbp - 8], rax # Size:4, Opcode: 0x39,0x00,0x00,0x00
	jne	.label_35 # Size:2, Opcode: 0x75,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	edx, dword ptr [rax] # Size:2, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x10], edx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x14], 1 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
.label_33:
	leave	 # Size:1, Opcode: 0xc9,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
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
	je	.label_36 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_38 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_36:
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	eax, dword ptr [rax + 0x14] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	lea	edx, dword ptr [rax - 1] # Size:3, Opcode: 0x8d,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x14], edx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	eax, dword ptr [rax + 0x14] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	test	eax, eax # Size:2, Opcode: 0x85,0x00,0x00,0x00
	jne	.label_37 # Size:2, Opcode: 0x75,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x10], 4 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	add	rax, 8 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	atomic_int64_inc # Size:5, Opcode: 0xe8,0x00,0x00,0x00
.label_37:
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
.label_38:
	leave	 # Size:1, Opcode: 0xc9,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
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
	je	.label_39 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_40 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_39:
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
.label_40:
	leave	 # Size:1, Opcode: 0xc9,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
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
	je	.label_41 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_42 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_41:
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x10], 4 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x14], 0 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	byte ptr [rax + 0x18], 0 # Size:4, Opcode: 0xc6,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
.label_42:
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
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
	je	.label_43 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_44 # Size:5, Opcode: 0xe9,0x00,0x00,0x00
.label_43:
	call	irq_nested_disable # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	byte ptr [rbp - 0x11], al # Size:3, Opcode: 0x88,0x00,0x00,0x00
	mov	rax,  qword ptr [word ptr [rip + current_task]] # Size:7, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x10], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x28] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	edx, dword ptr [rax + 0x10] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	eax, dword ptr [rax] # Size:2, Opcode: 0x8b,0x00,0x00,0x00
	cmp	edx, eax # Size:2, Opcode: 0x39,0x00,0x00,0x00
	jne	.label_45 # Size:2, Opcode: 0x75,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x28] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	eax, dword ptr [rax + 0x14] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	lea	edx, dword ptr [rax + 1] # Size:3, Opcode: 0x8d,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x28] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x14], edx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_44 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_45:
	mov	rax, qword ptr [rbp - 0x28] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	atomic_int64_inc # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	jmp	.label_46 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_47:
	pause	 # Size:2, Opcode: 0x90,0x00,0x00,0x00
.label_46:
	mov	rax, qword ptr [rbp - 0x28] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	add	rax, 8 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	atomic_int64_read # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	cmp	qword ptr [rbp - 8], rax # Size:4, Opcode: 0x39,0x00,0x00,0x00
	jne	.label_47 # Size:2, Opcode: 0x75,0x00,0x00,0x00
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
.label_44:
	leave	 # Size:1, Opcode: 0xc9,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
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
	je	.label_48 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_50 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_48:
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	eax, dword ptr [rax + 0x14] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	lea	edx, dword ptr [rax - 1] # Size:3, Opcode: 0x8d,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x14], edx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	eax, dword ptr [rax + 0x14] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	test	eax, eax # Size:2, Opcode: 0x85,0x00,0x00,0x00
	jne	.label_49 # Size:2, Opcode: 0x75,0x00,0x00,0x00
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
.label_49:
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
.label_50:
	leave	 # Size:1, Opcode: 0xc9,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
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
	.align	32
	.globl irq_nested_disable
	.type irq_nested_disable, @function
irq_nested_disable:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
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
	.align	32
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
	.align	32
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
	.align	32
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
	.align	32
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
	.align	32
	.globl is_uhyve
	.type is_uhyve, @function
is_uhyve:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
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
	.align	32
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
	.align	32
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
	.align	32
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
	.align	32
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
	.align	32
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
	.align	32
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
	.align	32
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
	.align	32
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
	.align	32
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
	.align	32
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
	.align	32
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
	.align	32
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
	.align	32
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
	.align	32
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
	.align	32
	.globl has_nx
	.type has_nx, @function
has_nx:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
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
	.align	32
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
	.byte 64
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
	label_55:

	.section .symtab
	.align 32
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 48
	.byte 84
	.byte 0
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
	.byte 28
	.byte 0
	.byte 27
	.byte 0
	.byte 6
	.byte 0
	.byte 0
	.byte 0
	.byte 4
	.byte 0
	.quad 9999999999
	.quad 9999999999
	.quad 9999999999
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
	.byte 144
	.byte 5
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 144
	.byte 5
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
	.byte 173
	.byte 10
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 173
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
	.byte 4
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 32
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
	.byte 0
	.byte 0
	.byte 0
	.byte 32
	.byte 0
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
	.byte 8
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
	.byte 240
	.byte 45
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 240
	.byte 61
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 240
	.byte 61
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 88
	.byte 22
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 144
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
	.byte 0
	.byte 46
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 62
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 62
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
	.byte 32
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 4
	.byte 32
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 4
	.byte 32
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 148
	.byte 1
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 148
	.byte 1
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
	.byte 45
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 240
	.byte 61
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 240
	.byte 61
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
	.byte 0
	.byte 0
	.byte 0
	.byte 0

	.section .strtab
	.align 32
	label_57:

	.section .symtab
	.align 32
	.label_56:

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
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
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
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.globl hermit_mm_lock
	.type hermit_mm_lock, @object
hermit_mm_lock:
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
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
