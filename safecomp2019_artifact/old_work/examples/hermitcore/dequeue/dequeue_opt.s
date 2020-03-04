	.intel_syntax noprefix

	.section	.text
	.align	32
	.globl main
	.type main, @function
main:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	push	rbx # Size:1, Opcode: 0x53,0x00,0x00,0x00
	mov	ebp, 1 # Size:5, Opcode: 0xbd,0x00,0x00,0x00
	sub	rsp, 0x158 # Size:7, Opcode: 0x81,0x00,0x00,0x00
	mov	rax, qword ptr fs:[0x28] # Size:9, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rsp + 0x148], rax # Size:8, Opcode: 0x89,0x00,0x00,0x00
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	mov	rax, qword ptr [rsi + 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	lea	rbx, qword ptr [rsp + 0x10] # Size:5, Opcode: 0x8d,0x00,0x00,0x00
	lea	rsi, qword ptr [rsp + 0xc] # Size:5, Opcode: 0x8d,0x00,0x00,0x00
	mov	rdi, rbx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	movsx	ax, byte ptr [rax] # Size:4, Opcode: 0x0f,0xbe,0x00,0x00
	mov	qword ptr [rsp + 0x10], 0 # Size:9, Opcode: 0xc7,0x00,0x00,0x00
	mov	qword ptr [rsp + 0x18], 0 # Size:9, Opcode: 0xc7,0x00,0x00,0x00
	mov	qword ptr [rsp + 0x28], 0x100 # Size:9, Opcode: 0xc7,0x00,0x00,0x00
	mov	qword ptr [rsp + 0x30], 2 # Size:9, Opcode: 0xc7,0x00,0x00,0x00
	mov	word ptr [rsp + 0xc], ax # Size:5, Opcode: 0x89,0x00,0x00,0x00
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	mov	word ptr [rsp + 0xe], ax # Size:5, Opcode: 0x89,0x00,0x00,0x00
	lea	rax, qword ptr [rsp + 0x40] # Size:5, Opcode: 0x8d,0x00,0x00,0x00
	mov	qword ptr [rsp + 0x20], rax # Size:5, Opcode: 0x89,0x00,0x00,0x00
	call	dequeue_push # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	test	eax, eax # Size:2, Opcode: 0x85,0x00,0x00,0x00
	je	.label_4 # Size:2, Opcode: 0x74,0x00,0x00,0x00
label_3:
	mov	rdx, qword ptr [rsp + 0x148] # Size:8, Opcode: 0x8b,0x00,0x00,0x00
	xor	rdx, qword ptr fs:[0x28] # Size:9, Opcode: 0x33,0x00,0x00,0x00
.label_27:
	mov	eax, ebp # Size:2, Opcode: 0x89,0x00,0x00,0x00
	jne	.label_5 # Size:2, Opcode: 0x75,0x00,0x00,0x00
	add	rsp, 0x158 # Size:7, Opcode: 0x81,0x00,0x00,0x00
	pop	rbx # Size:1, Opcode: 0x5b,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00
.label_4:
	lea	rsi, qword ptr [rsp + 0xe] # Size:5, Opcode: 0x8d,0x00,0x00,0x00
	mov	rdi, rbx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	dequeue_pop # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	test	eax, eax # Size:2, Opcode: 0x85,0x00,0x00,0x00
	jne	label_3 # Size:2, Opcode: 0x75,0x00,0x00,0x00
	movsx	ebp, word ptr [rsp + 0xe] # Size:5, Opcode: 0x0f,0xbf,0x00,0x00
	jmp	label_3 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_5:
	call	__stack_chk_fail # Size:5, Opcode: 0xe8,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl dequeue_init
	.type dequeue_init, @function
dequeue_init:
	test	rdi, rdi # Size:3, Opcode: 0x85,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	je	.label_14 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	qword ptr [rdi], 0 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	qword ptr [rdi + 8], 0 # Size:8, Opcode: 0xc7,0x00,0x00,0x00
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	mov	qword ptr [rdi + 0x10], rsi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rdi + 0x18], rdx # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rdi + 0x20], rcx # Size:4, Opcode: 0x89,0x00,0x00,0x00
.label_14:
	ret	 # Size:2, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl dequeue_push
	.type dequeue_push, @function
dequeue_push:
	test	rdi, rdi # Size:3, Opcode: 0x85,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	je	.label_15 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	push	rbx # Size:1, Opcode: 0x53,0x00,0x00,0x00
	xor	edx, edx # Size:2, Opcode: 0x31,0x00,0x00,0x00
	sub	rsp, 8 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	rcx, qword ptr [rdi + 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	lea	rax, qword ptr [rcx + 1] # Size:4, Opcode: 0x8d,0x00,0x00,0x00
	div	qword ptr [rdi + 0x18] # Size:4, Opcode: 0xf7,0x00,0x00,0x00
	cmp	qword ptr [rdi], rdx # Size:3, Opcode: 0x39,0x00,0x00,0x00
	mov	rbp, rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	je	.label_16 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	rdx, qword ptr [rdi + 0x20] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rbx, rdi # Size:3, Opcode: 0x89,0x00,0x00,0x00
	imul	rcx, rdx # Size:4, Opcode: 0x0f,0xaf,0x00,0x00
	add	rcx, qword ptr [rdi + 0x10] # Size:4, Opcode: 0x03,0x00,0x00,0x00
	mov	rdi, rcx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	memcpy # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	qword ptr [rbx + 8], rbp # Size:4, Opcode: 0x89,0x00,0x00,0x00
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
.label_17:
	add	rsp, 8 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	pop	rbx # Size:1, Opcode: 0x5b,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00
.label_15:
	ret	 # Size:2, Opcode: 0xc3,0x00,0x00,0x00
.label_16:
	mov	eax, 0xffffffb5 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_17 # Size:2, Opcode: 0xeb,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl dequeue_pop
	.type dequeue_pop, @function
dequeue_pop:
	test	rsi, rsi # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_18 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	test	rdi, rdi # Size:3, Opcode: 0x85,0x00,0x00,0x00
	push	rbx # Size:1, Opcode: 0x53,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	mov	rbx, rdi # Size:3, Opcode: 0x89,0x00,0x00,0x00
	je	.label_19 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	rax, qword ptr [rdi] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	cmp	rax, qword ptr [rdi + 8] # Size:4, Opcode: 0x3b,0x00,0x00,0x00
	je	.label_20 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	rdx, qword ptr [rbx + 0x20] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdi, rsi # Size:3, Opcode: 0x89,0x00,0x00,0x00
	imul	rax, rdx # Size:4, Opcode: 0x0f,0xaf,0x00,0x00
	add	rax, qword ptr [rbx + 0x10] # Size:4, Opcode: 0x03,0x00,0x00,0x00
	mov	rsi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	memcpy # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	rax, qword ptr [rbx] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	xor	edx, edx # Size:2, Opcode: 0x31,0x00,0x00,0x00
	add	rax, 1 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	div	qword ptr [rbx + 0x18] # Size:4, Opcode: 0xf7,0x00,0x00,0x00
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	mov	qword ptr [rbx], rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
.label_19:
	pop	rbx # Size:1, Opcode: 0x5b,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00
.label_18:
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00
.label_20:
	mov	eax, 0xfffffffe # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	pop	rbx # Size:1, Opcode: 0x5b,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00


	.section .comment
	.align 32
label_23:
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
	.byte 128
	.byte 6
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
	label_26:

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
	.byte 29
	.byte 0
	.byte 28
	.byte 0
	.byte 6
	.byte 0
	.byte 0
	.byte 0
	.byte 5
	.byte 0
	.quad label_23
	.quad label_23
	.quad label_23
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
	.byte 232
	.byte 10
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 232
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
	.byte 176
	.byte 13
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 176
	.byte 13
	.byte 32
	.byte 0
	.byte 0
	.byte 0

	.section .shstrtab
	.align 32
	label_29:

	.section .symtab
	.align 32
	.byte 176
	.byte 13
	.byte 32
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 96
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
	.byte 192
	.byte 13
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 192
	.byte 13
	.byte 32
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 192
	.byte 13
	.byte 32
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
	.byte 20
	.byte 9
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 20
	.byte 9
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 20
	.byte 9
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 84
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 84
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
	.byte 176
	.byte 13
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 176
	.byte 13
	.byte 32
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 176
	.byte 13
	.byte 32
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 80
	.byte 2
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 80
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
	label_28:

	.section .symtab
	.align 32
	.label_27:

	.section .rodata
	.align 16
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

	.section .bss
	.align 16
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
