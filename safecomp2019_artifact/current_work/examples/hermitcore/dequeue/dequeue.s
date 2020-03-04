	.intel_syntax noprefix

	.section	.text
	.align	16
	.globl dequeue_init
	.type dequeue_init, @function
dequeue_init:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	sub	rsp, 0x20 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x10], rsi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x18], rdx # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x20], rcx # Size:4, Opcode: 0x89,0x00,0x00,0x00
	cmp	qword ptr [rbp - 8], 0 # Size:5, Opcode: 0x83,0x00,0x00,0x00
	sete	al # Size:3, Opcode: 0x0f,0x94,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_10 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_11 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_10:
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rax], 0 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rax + 8], 0 # Size:8, Opcode: 0xc7,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdx, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rax + 0x28], rdx # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdx, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rax + 0x30], rdx # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdx, qword ptr [rbp - 0x20] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rax + 0x38], rdx # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	add	rax, 0x10 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	spinlock_init # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
.label_11:
	leave	 # Size:1, Opcode: 0xc9,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl dequeue_push
	.type dequeue_push, @function
dequeue_push:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	sub	rsp, 0x20 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x18], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x20], rsi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	cmp	qword ptr [rbp - 0x18], 0 # Size:5, Opcode: 0x83,0x00,0x00,0x00
	sete	al # Size:3, Opcode: 0x0f,0x94,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_12 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_13 # Size:5, Opcode: 0xe9,0x00,0x00,0x00
.label_12:
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	add	rax, 0x10 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	spinlock_lock # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rax + 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	lea	rdx, qword ptr [rax + 1] # Size:4, Opcode: 0x8d,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rcx, qword ptr [rax + 0x30] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	edx, 0 # Size:5, Opcode: 0xba,0x00,0x00,0x00
	div	rcx # Size:3, Opcode: 0xf7,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rdx # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rax] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	cmp	qword ptr [rbp - 8], rax # Size:4, Opcode: 0x39,0x00,0x00,0x00
	jne	.label_14 # Size:2, Opcode: 0x75,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	add	rax, 0x10 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	spinlock_unlock # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	eax, 0xffffffb5 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_13 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_14:
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdx, qword ptr [rax + 0x38] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rcx, qword ptr [rax + 0x28] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rsi, qword ptr [rax + 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rax + 0x38] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	imul	rax, rsi # Size:4, Opcode: 0x0f,0xaf,0x00,0x00
	add	rcx, rax # Size:3, Opcode: 0x01,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x20] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rsi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rdi, rcx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	memcpy # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdx, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rax + 8], rdx # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	add	rax, 0x10 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	spinlock_unlock # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
.label_13:
	leave	 # Size:1, Opcode: 0xc9,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl dequeue_pop
	.type dequeue_pop, @function
dequeue_pop:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	sub	rsp, 0x10 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x10], rsi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	cmp	qword ptr [rbp - 8], 0 # Size:5, Opcode: 0x83,0x00,0x00,0x00
	sete	al # Size:3, Opcode: 0x0f,0x94,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_15 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_17 # Size:5, Opcode: 0xe9,0x00,0x00,0x00
.label_15:
	cmp	qword ptr [rbp - 0x10], 0 # Size:5, Opcode: 0x83,0x00,0x00,0x00
	sete	al # Size:3, Opcode: 0x0f,0x94,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_16 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_17 # Size:5, Opcode: 0xe9,0x00,0x00,0x00
.label_16:
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	add	rax, 0x10 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	spinlock_lock # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdx, qword ptr [rax] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rax + 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	cmp	rdx, rax # Size:3, Opcode: 0x39,0x00,0x00,0x00
	jne	.label_18 # Size:2, Opcode: 0x75,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	add	rax, 0x10 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	spinlock_unlock # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	eax, 0xfffffffe # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_17 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_18:
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdx, qword ptr [rax + 0x38] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rcx, qword ptr [rax + 0x28] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rsi, qword ptr [rax] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rax + 0x38] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	imul	rax, rsi # Size:4, Opcode: 0x0f,0xaf,0x00,0x00
	add	rcx, rax # Size:3, Opcode: 0x01,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rsi, rcx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	memcpy # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rax] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	lea	rdx, qword ptr [rax + 1] # Size:4, Opcode: 0x8d,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rcx, qword ptr [rax + 0x30] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	edx, 0 # Size:5, Opcode: 0xba,0x00,0x00,0x00
	div	rcx # Size:3, Opcode: 0xf7,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rax], rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	add	rax, 0x10 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	spinlock_unlock # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
.label_17:
	leave	 # Size:1, Opcode: 0xc9,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	16
	.globl main
	.type main, @function
main:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	sub	rsp, 0x170 # Size:7, Opcode: 0x81,0x00,0x00,0x00
	mov	dword ptr [rbp - 0x164], edi # Size:6, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x170], rsi # Size:7, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr fs:[0x28] # Size:9, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x170] # Size:7, Opcode: 0x8b,0x00,0x00,0x00
	add	rax, 8 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	rax, qword ptr [rax] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	movzx	eax, byte ptr [rax] # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	cbw	 # Size:2, Opcode: 0x98,0x00,0x00,0x00
	mov	word ptr [rbp - 0x158], ax # Size:7, Opcode: 0x89,0x00,0x00,0x00
	mov	word ptr [rbp - 0x156], 0 # Size:9, Opcode: 0xc7,0x00,0x00,0x00
	lea	rsi, qword ptr [rbp - 0x110] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	lea	rax, qword ptr [rbp - 0x150] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	mov	ecx, 2 # Size:5, Opcode: 0xb9,0x00,0x00,0x00
	mov	edx, 0x100 # Size:5, Opcode: 0xba,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	dequeue_init # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	test	eax, eax # Size:2, Opcode: 0x85,0x00,0x00,0x00
	setne	al # Size:3, Opcode: 0x0f,0x95,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	mov	dword ptr [rbp - 0x154], eax # Size:6, Opcode: 0x89,0x00,0x00,0x00
	cmp	dword ptr [rbp - 0x154], 0 # Size:7, Opcode: 0x83,0x00,0x00,0x00
	je	.label_19 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x154] # Size:6, Opcode: 0x8b,0x00,0x00,0x00
	jmp	.label_20 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_19:
	lea	rdx, qword ptr [rbp - 0x158] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	lea	rax, qword ptr [rbp - 0x150] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	mov	rsi, rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	dequeue_push # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	test	eax, eax # Size:2, Opcode: 0x85,0x00,0x00,0x00
	setne	al # Size:3, Opcode: 0x0f,0x95,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	mov	dword ptr [rbp - 0x154], eax # Size:6, Opcode: 0x89,0x00,0x00,0x00
	cmp	dword ptr [rbp - 0x154], 0 # Size:7, Opcode: 0x83,0x00,0x00,0x00
	je	.label_21 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x154] # Size:6, Opcode: 0x8b,0x00,0x00,0x00
	jmp	.label_20 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_21:
	lea	rdx, qword ptr [rbp - 0x156] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	lea	rax, qword ptr [rbp - 0x150] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	mov	rsi, rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	dequeue_pop # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	test	eax, eax # Size:2, Opcode: 0x85,0x00,0x00,0x00
	setne	al # Size:3, Opcode: 0x0f,0x95,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	mov	dword ptr [rbp - 0x154], eax # Size:6, Opcode: 0x89,0x00,0x00,0x00
	cmp	dword ptr [rbp - 0x154], 0 # Size:7, Opcode: 0x83,0x00,0x00,0x00
	je	.label_23 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x154] # Size:6, Opcode: 0x8b,0x00,0x00,0x00
	jmp	.label_20 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_23:
	movzx	eax, word ptr [rbp - 0x156] # Size:7, Opcode: 0x0f,0xb7,0x00,0x00
	cwde	 # Size:1, Opcode: 0x98,0x00,0x00,0x00
.label_20:
	mov	rcx, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	xor	rcx, qword ptr fs:[0x28] # Size:9, Opcode: 0x33,0x00,0x00,0x00
	je	.label_22 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	call	__stack_chk_fail # Size:5, Opcode: 0xe8,0x00,0x00,0x00
.label_22:
	leave	 # Size:1, Opcode: 0xc9,0x00,0x00,0x00
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
	je	.label_24 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_25 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_24:
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
.label_25:
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
	je	.label_26 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_27 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_26:
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x10], 4 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x14], 0 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
.label_27:
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
	je	.label_28 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_30 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_28:
	mov	rax,  qword ptr [word ptr [rip + current_task]] # Size:7, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x10], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	edx, dword ptr [rax + 0x10] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	eax, dword ptr [rax] # Size:2, Opcode: 0x8b,0x00,0x00,0x00
	cmp	edx, eax # Size:2, Opcode: 0x39,0x00,0x00,0x00
	jne	.label_29 # Size:2, Opcode: 0x75,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	eax, dword ptr [rax + 0x14] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	lea	edx, dword ptr [rax + 1] # Size:3, Opcode: 0x8d,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x14], edx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_30 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_29:
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	atomic_int64_inc # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	jmp	.label_31 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_32:
	pause	 # Size:2, Opcode: 0x90,0x00,0x00,0x00
.label_31:
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	add	rax, 8 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	atomic_int64_read # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	cmp	qword ptr [rbp - 8], rax # Size:4, Opcode: 0x39,0x00,0x00,0x00
	jne	.label_32 # Size:2, Opcode: 0x75,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	edx, dword ptr [rax] # Size:2, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x10], edx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x14], 1 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
.label_30:
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
	je	.label_33 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_35 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_33:
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	eax, dword ptr [rax + 0x14] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	lea	edx, dword ptr [rax - 1] # Size:3, Opcode: 0x8d,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x14], edx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	eax, dword ptr [rax + 0x14] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	test	eax, eax # Size:2, Opcode: 0x85,0x00,0x00,0x00
	jne	.label_34 # Size:2, Opcode: 0x75,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x10], 4 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	add	rax, 8 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	atomic_int64_inc # Size:5, Opcode: 0xe8,0x00,0x00,0x00
.label_34:
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
.label_35:
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
	je	.label_36 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_37 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_36:
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
.label_37:
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
	je	.label_38 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_39 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_38:
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x10], 4 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x14], 0 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	byte ptr [rax + 0x18], 0 # Size:4, Opcode: 0xc6,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
.label_39:
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
	je	.label_40 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_41 # Size:5, Opcode: 0xe9,0x00,0x00,0x00
.label_40:
	call	irq_nested_disable # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	byte ptr [rbp - 0x11], al # Size:3, Opcode: 0x88,0x00,0x00,0x00
	mov	rax,  qword ptr [word ptr [rip + current_task]] # Size:7, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x10], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x28] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	edx, dword ptr [rax + 0x10] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	eax, dword ptr [rax] # Size:2, Opcode: 0x8b,0x00,0x00,0x00
	cmp	edx, eax # Size:2, Opcode: 0x39,0x00,0x00,0x00
	jne	.label_42 # Size:2, Opcode: 0x75,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x28] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	eax, dword ptr [rax + 0x14] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	lea	edx, dword ptr [rax + 1] # Size:3, Opcode: 0x8d,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x28] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x14], edx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_41 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_42:
	mov	rax, qword ptr [rbp - 0x28] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	atomic_int64_inc # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	jmp	.label_43 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_44:
	pause	 # Size:2, Opcode: 0x90,0x00,0x00,0x00
.label_43:
	mov	rax, qword ptr [rbp - 0x28] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	add	rax, 8 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	atomic_int64_read # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	cmp	qword ptr [rbp - 8], rax # Size:4, Opcode: 0x39,0x00,0x00,0x00
	jne	.label_44 # Size:2, Opcode: 0x75,0x00,0x00,0x00
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
.label_41:
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
	je	.label_45 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_47 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_45:
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	eax, dword ptr [rax + 0x14] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	lea	edx, dword ptr [rax - 1] # Size:3, Opcode: 0x8d,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x14], edx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	eax, dword ptr [rax + 0x14] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	test	eax, eax # Size:2, Opcode: 0x85,0x00,0x00,0x00
	jne	.label_46 # Size:2, Opcode: 0x75,0x00,0x00,0x00
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
.label_46:
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
.label_47:
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
	label_52:

	.section .symtab
	.align 32
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 248
	.byte 83
	.byte 0
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
	.byte 232
	.byte 5
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 232
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

	.section .shstrtab
	.align 32
	label_55:

	.section .symtab
	.align 32
	.byte 16
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 189
	.byte 10
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 189
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
	.byte 176
	.byte 7
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 176
	.byte 7
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
	.byte 45
	.byte 0
	.byte 0
	.byte 0
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
	.byte 61
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
	.byte 152
	.byte 22
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
	.byte 45
	.byte 0
	.byte 0
	.byte 0
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
	.byte 61
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
	.byte 132
	.byte 1
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 132
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
	.byte 184
	.byte 45
	.byte 0
	.byte 0
	.byte 0
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
	.byte 61
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
	label_54:

	.section .symtab
	.align 32
	.label_53:

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
	.align 8
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
