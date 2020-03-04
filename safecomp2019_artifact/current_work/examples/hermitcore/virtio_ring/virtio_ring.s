	.intel_syntax noprefix

	.section	.text
	.align	32
	.globl vring_init
	.type vring_init, @function
vring_init:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	dword ptr [rbp - 0xc], esi # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x18], rdx # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x20], rcx # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	edx, dword ptr [rbp - 0xc] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax], edx # Size:2, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdx, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rax + 8], rdx # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0xc] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	shl	rax, 4 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	mov	rdx, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	add	rdx, rax # Size:3, Opcode: 0x01,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rax + 0x10], rdx # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rax + 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	edx, dword ptr [rbp - 0xc] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	add	rdx, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	add	rax, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	add	rax, 4 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	rdx, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x20] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	add	rax, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	lea	rdx, qword ptr [rax + 1] # Size:4, Opcode: 0x8d,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x20] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	neg	rax # Size:3, Opcode: 0xf7,0x00,0x00,0x00
	and	rax, rdx # Size:3, Opcode: 0x21,0x00,0x00,0x00
	mov	rdx, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rax + 0x18], rdx # Size:4, Opcode: 0x89,0x00,0x00,0x00
	nop	 # Size:1, Opcode: 0x90,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl vring_size
	.type vring_size, @function
vring_size:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	dword ptr [rbp - 4], edi # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x10], rsi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 4] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	lea	rdx, qword ptr [rax*8] # Size:8, Opcode: 0x8d,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 4] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	add	eax, 3 # Size:3, Opcode: 0x83,0x00,0x00,0x00
	mov	eax, eax # Size:2, Opcode: 0x89,0x00,0x00,0x00
	add	rax, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	lea	edx, dword ptr [rax + rax] # Size:3, Opcode: 0x8d,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	add	eax, edx # Size:2, Opcode: 0x01,0x00,0x00,0x00
	lea	edx, dword ptr [rax - 1] # Size:3, Opcode: 0x8d,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	neg	eax # Size:2, Opcode: 0xf7,0x00,0x00,0x00
	and	edx, eax # Size:2, Opcode: 0x21,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 4] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	shl	eax, 3 # Size:3, Opcode: 0xc1,0x00,0x00,0x00
	add	eax, edx # Size:2, Opcode: 0x01,0x00,0x00,0x00
	add	eax, 6 # Size:3, Opcode: 0x83,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl vring_need_event
	.type vring_need_event, @function
vring_need_event:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	ecx, esi # Size:2, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, edx # Size:2, Opcode: 0x89,0x00,0x00,0x00
	mov	edx, edi # Size:2, Opcode: 0x89,0x00,0x00,0x00
	mov	word ptr [rbp - 4], dx # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	edx, ecx # Size:2, Opcode: 0x89,0x00,0x00,0x00
	mov	word ptr [rbp - 8], dx # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	word ptr [rbp - 0xc], ax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	movzx	eax, word ptr [rbp - 8] # Size:4, Opcode: 0x0f,0xb7,0x00,0x00
	sub	ax, word ptr [rbp - 4] # Size:4, Opcode: 0x2b,0x00,0x00,0x00
	lea	edx, dword ptr [rax - 1] # Size:3, Opcode: 0x8d,0x00,0x00,0x00
	movzx	eax, word ptr [rbp - 8] # Size:4, Opcode: 0x0f,0xb7,0x00,0x00
	sub	ax, word ptr [rbp - 0xc] # Size:4, Opcode: 0x2b,0x00,0x00,0x00
	cmp	dx, ax # Size:3, Opcode: 0x39,0x00,0x00,0x00
	setb	al # Size:3, Opcode: 0x0f,0x92,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl main
	.type main, @function
main:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
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
	label_14:

	.section .symtab
	.align 32
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 80
	.byte 57
	.byte 0
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
	.quad 99999999999999
	.quad 99999999999999
	.quad 99999999999999
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
	.byte 48
	.byte 5
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 48
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
	.byte 157
	.byte 2
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 157
	.byte 2
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
	.byte 32
	.byte 2
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 40
	.byte 2
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

	.section .strtab
	.align 32
	label_16:

	.section .symtab
	.align 32
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
	.label_15:

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
