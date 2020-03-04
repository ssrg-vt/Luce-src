	.intel_syntax noprefix

	.section	.text
	.align	32
	.globl main
	.type main, @function
main:
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl task_list_remove_task
	.type task_list_remove_task, @function
task_list_remove_task:
	mov	rdx, qword ptr [rsi + 0x60] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rsi + 0x58] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	test	rdx, rdx # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_10 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	qword ptr [rdx + 0x58], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rsi + 0x58] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
.label_10:
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_11 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	qword ptr [rax + 0x60], rdx # Size:4, Opcode: 0x89,0x00,0x00,0x00
.label_11:
	cmp	qword ptr [rdi + 8], rsi # Size:4, Opcode: 0x39,0x00,0x00,0x00
	je	.label_12 # Size:2, Opcode: 0x74,0x00,0x00,0x00
.label_13:
	cmp	qword ptr [rdi], rsi # Size:3, Opcode: 0x39,0x00,0x00,0x00
	je	.label_14 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00
.label_14:
	mov	qword ptr [rdi], rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00
.label_12:
	mov	rdx, qword ptr [rsi + 0x60] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rdi + 8], rdx # Size:4, Opcode: 0x89,0x00,0x00,0x00
	jmp	.label_13 # Size:2, Opcode: 0xeb,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl task_list_push_back
	.type task_list_push_back, @function
task_list_push_back:
	test	rsi, rsi # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_15 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	test	rdi, rdi # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_15 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	rax, qword ptr [rdi + 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_16 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	qword ptr [rsi + 0x60], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rsi + 0x58], 0 # Size:8, Opcode: 0xc7,0x00,0x00,0x00
	mov	qword ptr [rax + 0x58], rsi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rdi + 8], rsi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00
.label_16:
	mov	qword ptr [rsp - 0x10], rsi # Size:5, Opcode: 0x89,0x00,0x00,0x00
	movq	xmm0, qword ptr [rsp - 0x10] # Size:6, Opcode: 0x0f,0x7e,0x00,0x00
	punpcklqdq	xmm0, xmm0 # Size:4, Opcode: 0x0f,0x6c,0x00,0x00
	movups	xmmword ptr [rdi], xmm0 # Size:3, Opcode: 0x0f,0x11,0x00,0x00
	pxor	xmm0, xmm0 # Size:4, Opcode: 0x0f,0xef,0x00,0x00
	movups	xmmword ptr [rsi + 0x58], xmm0 # Size:4, Opcode: 0x0f,0x11,0x00,0x00
.label_15:
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl task_list_pop_front
	.type task_list_pop_front, @function
task_list_pop_front:
	test	rdi, rdi # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_17 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	rax, qword ptr [rdi] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_18 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	rdx, qword ptr [rax + 0x58] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rdi], rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	test	rdx, rdx # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_19 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	qword ptr [rdx + 0x60], 0 # Size:8, Opcode: 0xc7,0x00,0x00,0x00
.label_18:
	pxor	xmm0, xmm0 # Size:4, Opcode: 0x0f,0xef,0x00,0x00
	movups	xmmword ptr [rax + 0x58], xmm0 # Size:4, Opcode: 0x0f,0x11,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00
.label_19:
	pxor	xmm0, xmm0 # Size:4, Opcode: 0x0f,0xef,0x00,0x00
	mov	qword ptr [rdi + 8], 0 # Size:8, Opcode: 0xc7,0x00,0x00,0x00
	movups	xmmword ptr [rax + 0x58], xmm0 # Size:4, Opcode: 0x0f,0x11,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00
.label_17:
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl readyqueues_push_back
	.type readyqueues_push_back, @function
readyqueues_push_back:
	movzx	ecx, byte ptr [rsi + 0x29] # Size:4, Opcode: 0x0f,0xb6,0x00,0x00
	mov	edi, edi # Size:2, Opcode: 0x89,0x00,0x00,0x00
	lea	rdx,  qword ptr [word ptr [rip + readyqueues]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	lea	r8, qword ptr [rdi + rdi*8] # Size:4, Opcode: 0x8d,0x00,0x00,0x00
	lea	eax, dword ptr [rcx - 1] # Size:3, Opcode: 0x8d,0x00,0x00,0x00
	cdqe	 # Size:2, Opcode: 0x98,0x00,0x00,0x00
	lea	rax, qword ptr [rax + r8*4 + 2] # Size:5, Opcode: 0x8d,0x00,0x00,0x00
	shl	rax, 4 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	lea	r9, qword ptr [rdx + rax] # Size:4, Opcode: 0x8d,0x00,0x00,0x00
	mov	r8, qword ptr [r9 + 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	test	r8, r8 # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_20 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	qword ptr [rsi + 0x60], r8 # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rsi + 0x58], 0 # Size:8, Opcode: 0xc7,0x00,0x00,0x00
	mov	qword ptr [r8 + 0x58], rsi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [r9 + 8], rsi # Size:4, Opcode: 0x89,0x00,0x00,0x00
.label_21:
	lea	rax, qword ptr [rdi + rdi*8] # Size:4, Opcode: 0x8d,0x00,0x00,0x00
	mov	esi, 1 # Size:5, Opcode: 0xbe,0x00,0x00,0x00
	shl	rax, 6 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	shl	esi, cl # Size:2, Opcode: 0xd3,0x00,0x00,0x00
	or	dword ptr [rdx + rax + 0x18], esi # Size:4, Opcode: 0x09,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00
.label_20:
	mov	qword ptr [rsp - 0x10], rsi # Size:5, Opcode: 0x89,0x00,0x00,0x00
	movq	xmm0, qword ptr [rsp - 0x10] # Size:6, Opcode: 0x0f,0x7e,0x00,0x00
	punpcklqdq	xmm0, xmm0 # Size:4, Opcode: 0x0f,0x6c,0x00,0x00
	movaps	xmmword ptr [rdx + rax], xmm0 # Size:4, Opcode: 0x0f,0x29,0x00,0x00
	pxor	xmm0, xmm0 # Size:4, Opcode: 0x0f,0xef,0x00,0x00
	movups	xmmword ptr [rsi + 0x58], xmm0 # Size:4, Opcode: 0x0f,0x11,0x00,0x00
	jmp	.label_21 # Size:2, Opcode: 0xeb,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl readyqueues_remove
	.type readyqueues_remove, @function
readyqueues_remove:
	movzx	ecx, byte ptr [rsi + 0x29] # Size:4, Opcode: 0x0f,0xb6,0x00,0x00
	mov	rax, qword ptr [rsi + 0x60] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	r8, qword ptr [rsi + 0x58] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	lea	edx, dword ptr [rcx - 1] # Size:3, Opcode: 0x8d,0x00,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_22 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	qword ptr [rax + 0x58], r8 # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	r8, qword ptr [rsi + 0x58] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
.label_22:
	test	r8, r8 # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_23 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	qword ptr [r8 + 0x60], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
.label_23:
	mov	edi, edi # Size:2, Opcode: 0x89,0x00,0x00,0x00
	movsxd	rdx, edx # Size:3, Opcode: 0x63,0x00,0x00,0x00
	lea	r9,  qword ptr [word ptr [rip + readyqueues]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	lea	rax, qword ptr [rdi + rdi*8] # Size:4, Opcode: 0x8d,0x00,0x00,0x00
	lea	rax, qword ptr [rdx + rax*4 + 2] # Size:5, Opcode: 0x8d,0x00,0x00,0x00
	shl	rax, 4 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	add	rax, r9 # Size:3, Opcode: 0x01,0x00,0x00,0x00
	cmp	rsi, qword ptr [rax + 8] # Size:4, Opcode: 0x3b,0x00,0x00,0x00
	je	.label_24 # Size:2, Opcode: 0x74,0x00,0x00,0x00
.label_25:
	lea	rax, qword ptr [rdi + rdi*8] # Size:4, Opcode: 0x8d,0x00,0x00,0x00
	lea	rax, qword ptr [rdx + rax*4 + 2] # Size:5, Opcode: 0x8d,0x00,0x00,0x00
	shl	rax, 4 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	add	rax, r9 # Size:3, Opcode: 0x01,0x00,0x00,0x00
	mov	rdx, qword ptr [rax] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	cmp	rsi, rdx # Size:3, Opcode: 0x39,0x00,0x00,0x00
	je	.label_26 # Size:2, Opcode: 0x74,0x00,0x00,0x00
.label_27:
	test	rdx, rdx # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_28 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00
.label_28:
	lea	rax, qword ptr [rdi + rdi*8] # Size:4, Opcode: 0x8d,0x00,0x00,0x00
	mov	edx, 0xfffffffe # Size:5, Opcode: 0xba,0x00,0x00,0x00
	shl	rax, 6 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	rol	edx, cl # Size:2, Opcode: 0xd3,0x00,0x00,0x00
	and	dword ptr [r9 + rax + 0x18], edx # Size:5, Opcode: 0x21,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00
.label_26:
	mov	qword ptr [rax], r8 # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rdx, r8 # Size:3, Opcode: 0x89,0x00,0x00,0x00
	jmp	.label_27 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_24:
	mov	r10, qword ptr [rsi + 0x60] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rax + 8], r10 # Size:4, Opcode: 0x89,0x00,0x00,0x00
	jmp	.label_25 # Size:2, Opcode: 0xeb,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl get_task
	.type get_task, @function
get_task:
	mov	eax, 0xfffffff4 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	test	rsi, rsi # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_29 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	add	eax, 0xa # Size:3, Opcode: 0x83,0x00,0x00,0x00
	cmp	edi, 3 # Size:3, Opcode: 0x83,0x00,0x00,0x00
	ja	.label_29 # Size:2, Opcode: 0x77,0x00,0x00,0x00
	mov	edi, edi # Size:2, Opcode: 0x89,0x00,0x00,0x00
	lea	rdx, qword ptr [rdi + rdi*4] # Size:4, Opcode: 0x8d,0x00,0x00,0x00
	mov	rax, rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	lea	rdx,  qword ptr [word ptr [rip + task_table]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	shl	rax, 8 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	add	rdx, rax # Size:3, Opcode: 0x01,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	mov	ecx, dword ptr [rdx + 4] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	test	ecx, ecx # Size:2, Opcode: 0x85,0x00,0x00,0x00
	je	.label_29 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	qword ptr [rsi], rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
.label_29:
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl multitasking_init
	.type multitasking_init, @function
multitasking_init:
	cmp	dword ptr [dword ptr [rip + label_30]],  5 # Size:7, Opcode: 0x83,0x00,0x00,0x00
	lea	rdx,  qword ptr [word ptr [rip + task_table]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	mov	eax, 0xfffffff4 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jne	.label_31 # Size:2, Opcode: 0x75,0x00,0x00,0x00
	mov	byte ptr [byte ptr [rip + label_32]],  0 # Size:7, Opcode: 0xc6,0x00,0x00,0x00
	pxor	xmm0, xmm0 # Size:4, Opcode: 0x0f,0xef,0x00,0x00
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	mov	qword ptr [word ptr [rip + current_task]],  rdx # Size:7, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [word ptr [rip + readyqueues]],  rdx # Size:7, Opcode: 0x89,0x00,0x00,0x00
	movups	xmmword ptr [word ptr [rip + label_33]],  xmm0 # Size:7, Opcode: 0x0f,0x11,0x00,0x00
.label_31:
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl is_task_available
	.type is_task_available, @function
is_task_available:
	mov	edx,  dword ptr [dword ptr [rip + label_34]] # Size:6, Opcode: 0x8b,0x00,0x00,0x00
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	test	edx, edx # Size:2, Opcode: 0x85,0x00,0x00,0x00
	setne	al # Size:3, Opcode: 0x0f,0x95,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl get_readyqueue
	.type get_readyqueue, @function
get_readyqueue:
	lea	rax,  qword ptr [word ptr [rip + readyqueues]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl set_idle_task
	.type set_idle_task, @function
set_idle_task:
	push	rbx # Size:1, Opcode: 0x53,0x00,0x00,0x00
	lea	rdi,  qword ptr [word ptr [rip + table_lock]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	call	spinlock_irqsave_lock # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	ebx,  dword ptr [dword ptr [rip + label_30]] # Size:6, Opcode: 0x8b,0x00,0x00,0x00
	test	ebx, ebx # Size:2, Opcode: 0x85,0x00,0x00,0x00
	je	.label_35 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	ecx,  dword ptr [dword ptr [rip + label_36]] # Size:6, Opcode: 0x8b,0x00,0x00,0x00
	test	ecx, ecx # Size:2, Opcode: 0x85,0x00,0x00,0x00
	je	.label_37 # Size:6, Opcode: 0x0f,0x84,0x00,0x00
	mov	edx,  dword ptr [dword ptr [rip + label_38]] # Size:6, Opcode: 0x8b,0x00,0x00,0x00
	test	edx, edx # Size:2, Opcode: 0x85,0x00,0x00,0x00
	je	.label_39 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax,  dword ptr [dword ptr [rip + label_40]] # Size:6, Opcode: 0x8b,0x00,0x00,0x00
	mov	ebx, 0xffffffff # Size:5, Opcode: 0xbb,0x00,0x00,0x00
	test	eax, eax # Size:2, Opcode: 0x85,0x00,0x00,0x00
	je	.label_41 # Size:6, Opcode: 0x0f,0x84,0x00,0x00
	lea	rdi,  qword ptr [word ptr [rip + table_lock]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	call	spinlock_irqsave_unlock # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	eax, ebx # Size:2, Opcode: 0x89,0x00,0x00,0x00
	pop	rbx # Size:1, Opcode: 0x5b,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00
.label_39:
	mov	ebx, 2 # Size:5, Opcode: 0xbb,0x00,0x00,0x00
.label_35:
	mov	eax, ebx # Size:2, Opcode: 0x89,0x00,0x00,0x00
	lea	rcx,  qword ptr [word ptr [rip + task_table]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	pxor	xmm0, xmm0 # Size:4, Opcode: 0x0f,0xef,0x00,0x00
	lea	rdx, qword ptr [rax + rax*4] # Size:4, Opcode: 0x8d,0x00,0x00,0x00
	lea	rdi,  qword ptr [word ptr [rip + table_lock]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	shl	rdx, 8 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	lea	rax, qword ptr [rcx + rdx] # Size:4, Opcode: 0x8d,0x00,0x00,0x00
	mov	qword ptr [rax + 4], 5 # Size:8, Opcode: 0xc7,0x00,0x00,0x00
	mov	dword ptr [rax], ebx # Size:2, Opcode: 0x89,0x00,0x00,0x00
	movaps	xmmword ptr [rcx + rdx + 0x10], xmm0 # Size:5, Opcode: 0x0f,0x29,0x00,0x00
	mov	qword ptr [rax + 0x20], 0 # Size:8, Opcode: 0xc7,0x00,0x00,0x00
	mov	byte ptr [rax + 0x29], 0 # Size:4, Opcode: 0xc6,0x00,0x00,0x00
	mov	qword ptr [rax + 0x48], 0 # Size:8, Opcode: 0xc7,0x00,0x00,0x00
	mov	qword ptr [word ptr [rip + readyqueues]],  rax # Size:7, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [word ptr [rip + current_task]],  rax # Size:7, Opcode: 0x89,0x00,0x00,0x00
	call	spinlock_irqsave_unlock # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	eax, ebx # Size:2, Opcode: 0x89,0x00,0x00,0x00
	pop	rbx # Size:1, Opcode: 0x5b,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00
.label_37:
	mov	ebx, 1 # Size:5, Opcode: 0xbb,0x00,0x00,0x00
	jmp	.label_35 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_41:
	mov	ebx, 3 # Size:5, Opcode: 0xbb,0x00,0x00,0x00
	jmp	.label_35 # Size:2, Opcode: 0xeb,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl get_next_core_id
	.type get_next_core_id, @function
get_next_core_id:
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	cmp	qword ptr [word ptr [rip + readyqueues]],  0 # Size:8, Opcode: 0x83,0x00,0x00,0x00
	sete	al # Size:3, Opcode: 0x0f,0x94,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl block_task
	.type block_task, @function
block_task:
	push	r15 # Size:2, Opcode: 0x57,0x00,0x00,0x00
	push	r14 # Size:2, Opcode: 0x56,0x00,0x00,0x00
	lea	r14,  qword ptr [word ptr [rip + task_table]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	push	r13 # Size:2, Opcode: 0x55,0x00,0x00,0x00
	mov	r13d, 0xffffffea # Size:6, Opcode: 0xbd,0x00,0x00,0x00
	push	r12 # Size:2, Opcode: 0x54,0x00,0x00,0x00
	mov	r12d, edi # Size:3, Opcode: 0x89,0x00,0x00,0x00
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	push	rbx # Size:1, Opcode: 0x53,0x00,0x00,0x00
	lea	rbx, qword ptr [r12 + r12*4] # Size:4, Opcode: 0x8d,0x00,0x00,0x00
	shl	rbx, 8 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	add	rbx, r14 # Size:3, Opcode: 0x01,0x00,0x00,0x00
	sub	rsp, 0x18 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	call	irq_nested_disable # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	cmp	dword ptr [rbx + 4], 2 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	ebp, dword ptr [rbx + 8] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	byte ptr [rsp + 0xf], al # Size:4, Opcode: 0x88,0x00,0x00,0x00
	jne	.label_42 # Size:6, Opcode: 0x0f,0x85,0x00,0x00
	lea	rax, qword ptr [rbp + rbp*8] # Size:5, Opcode: 0x8d,0x00,0x00,0x00
	mov	dword ptr [rbx + 4], 3 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	lea	r13,  qword ptr [word ptr [rip + readyqueues]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	shl	rax, 6 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	lea	r15, qword ptr [r13 + rax + 0x220] # Size:8, Opcode: 0x8d,0x00,0x00,0x00
	mov	rdi, r15 # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	spinlock_irqsave_lock # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	movzx	ecx, byte ptr [rbx + 0x29] # Size:4, Opcode: 0x0f,0xb6,0x00,0x00
	mov	rdi, qword ptr [rbx + 0x60] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	lea	edx, dword ptr [rcx - 1] # Size:3, Opcode: 0x8d,0x00,0x00,0x00
	test	rdi, rdi # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_43 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	rax, qword ptr [rbx + 0x58] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rdi + 0x58], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
.label_43:
	lea	rax, qword ptr [r12 + r12*4] # Size:4, Opcode: 0x8d,0x00,0x00,0x00
	shl	rax, 8 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	mov	rsi, qword ptr [r14 + rax + 0x58] # Size:5, Opcode: 0x8b,0x00,0x00,0x00
	test	rsi, rsi # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_44 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	qword ptr [rsi + 0x60], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
.label_44:
	movsxd	rdx, edx # Size:3, Opcode: 0x63,0x00,0x00,0x00
	lea	rax, qword ptr [rbp + rbp*8] # Size:5, Opcode: 0x8d,0x00,0x00,0x00
	lea	rax, qword ptr [rdx + rax*4 + 2] # Size:5, Opcode: 0x8d,0x00,0x00,0x00
	shl	rax, 4 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	add	rax, r13 # Size:3, Opcode: 0x01,0x00,0x00,0x00
	cmp	rbx, qword ptr [rax + 8] # Size:4, Opcode: 0x3b,0x00,0x00,0x00
	je	.label_45 # Size:2, Opcode: 0x74,0x00,0x00,0x00
.label_46:
	lea	rax, qword ptr [rbp + rbp*8] # Size:5, Opcode: 0x8d,0x00,0x00,0x00
	lea	rax, qword ptr [rdx + rax*4 + 2] # Size:5, Opcode: 0x8d,0x00,0x00,0x00
	shl	rax, 4 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	add	rax, r13 # Size:3, Opcode: 0x01,0x00,0x00,0x00
	mov	rdx, qword ptr [rax] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	cmp	rbx, rdx # Size:3, Opcode: 0x39,0x00,0x00,0x00
	je	.label_47 # Size:2, Opcode: 0x74,0x00,0x00,0x00
.label_48:
	test	rdx, rdx # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_49 # Size:2, Opcode: 0x74,0x00,0x00,0x00
.label_50:
	lea	rax, qword ptr [rbp + rbp*8] # Size:5, Opcode: 0x8d,0x00,0x00,0x00
	mov	rdi, r15 # Size:3, Opcode: 0x89,0x00,0x00,0x00
	shl	rax, 6 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	sub	dword ptr [r13 + rax + 0x14], 1 # Size:6, Opcode: 0x83,0x00,0x00,0x00
	xor	r13d, r13d # Size:3, Opcode: 0x31,0x00,0x00,0x00
	call	spinlock_irqsave_unlock # Size:5, Opcode: 0xe8,0x00,0x00,0x00
.label_42:
	movzx	edi, byte ptr [rsp + 0xf] # Size:5, Opcode: 0x0f,0xb6,0x00,0x00
	call	irq_nested_enable # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	add	rsp, 0x18 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	eax, r13d # Size:3, Opcode: 0x89,0x00,0x00,0x00
	pop	rbx # Size:1, Opcode: 0x5b,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	pop	r12 # Size:2, Opcode: 0x5c,0x00,0x00,0x00
	pop	r13 # Size:2, Opcode: 0x5d,0x00,0x00,0x00
	pop	r14 # Size:2, Opcode: 0x5e,0x00,0x00,0x00
	pop	r15 # Size:2, Opcode: 0x5f,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00
.label_45:
	lea	rdi, qword ptr [r12 + r12*4] # Size:4, Opcode: 0x8d,0x00,0x00,0x00
	shl	rdi, 8 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	mov	rdi, qword ptr [r14 + rdi + 0x60] # Size:5, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rax + 8], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	jmp	.label_46 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_49:
	lea	rax, qword ptr [rbp + rbp*8] # Size:5, Opcode: 0x8d,0x00,0x00,0x00
	mov	edx, 0xfffffffe # Size:5, Opcode: 0xba,0x00,0x00,0x00
	shl	rax, 6 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	rol	edx, cl # Size:2, Opcode: 0xd3,0x00,0x00,0x00
	and	dword ptr [r13 + rax + 0x18], edx # Size:5, Opcode: 0x21,0x00,0x00,0x00
	jmp	.label_50 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_47:
	mov	qword ptr [rax], rsi # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rdx, rsi # Size:3, Opcode: 0x89,0x00,0x00,0x00
	jmp	.label_48 # Size:5, Opcode: 0xe9,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl block_current_task
	.type block_current_task, @function
block_current_task:
	push	r15 # Size:2, Opcode: 0x57,0x00,0x00,0x00
	push	r14 # Size:2, Opcode: 0x56,0x00,0x00,0x00
	lea	r14,  qword ptr [word ptr [rip + task_table]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	push	r13 # Size:2, Opcode: 0x55,0x00,0x00,0x00
	mov	r13d, 0xffffffea # Size:6, Opcode: 0xbd,0x00,0x00,0x00
	push	r12 # Size:2, Opcode: 0x54,0x00,0x00,0x00
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	push	rbx # Size:1, Opcode: 0x53,0x00,0x00,0x00
	sub	rsp, 0x18 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	rax,  qword ptr [word ptr [rip + current_task]] # Size:7, Opcode: 0x8b,0x00,0x00,0x00
	mov	r12d, dword ptr [rax] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	call	irq_nested_disable # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	lea	rbx, qword ptr [r12 + r12*4] # Size:4, Opcode: 0x8d,0x00,0x00,0x00
	mov	byte ptr [rsp + 0xf], al # Size:4, Opcode: 0x88,0x00,0x00,0x00
	shl	rbx, 8 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	add	rbx, r14 # Size:3, Opcode: 0x01,0x00,0x00,0x00
	cmp	dword ptr [rbx + 4], 2 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	ebp, dword ptr [rbx + 8] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	jne	.label_51 # Size:6, Opcode: 0x0f,0x85,0x00,0x00
	lea	rax, qword ptr [rbp + rbp*8] # Size:5, Opcode: 0x8d,0x00,0x00,0x00
	mov	dword ptr [rbx + 4], 3 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	lea	r13,  qword ptr [word ptr [rip + readyqueues]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	shl	rax, 6 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	lea	r15, qword ptr [r13 + rax + 0x220] # Size:8, Opcode: 0x8d,0x00,0x00,0x00
	mov	rdi, r15 # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	spinlock_irqsave_lock # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	movzx	ecx, byte ptr [rbx + 0x29] # Size:4, Opcode: 0x0f,0xb6,0x00,0x00
	mov	rdi, qword ptr [rbx + 0x60] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	lea	edx, dword ptr [rcx - 1] # Size:3, Opcode: 0x8d,0x00,0x00,0x00
	test	rdi, rdi # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_52 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	rax, qword ptr [rbx + 0x58] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rdi + 0x58], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
.label_52:
	lea	rax, qword ptr [r12 + r12*4] # Size:4, Opcode: 0x8d,0x00,0x00,0x00
	shl	rax, 8 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	mov	rsi, qword ptr [r14 + rax + 0x58] # Size:5, Opcode: 0x8b,0x00,0x00,0x00
	test	rsi, rsi # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_53 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	qword ptr [rsi + 0x60], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
.label_53:
	movsxd	rdx, edx # Size:3, Opcode: 0x63,0x00,0x00,0x00
	lea	rax, qword ptr [rbp + rbp*8] # Size:5, Opcode: 0x8d,0x00,0x00,0x00
	lea	rax, qword ptr [rdx + rax*4 + 2] # Size:5, Opcode: 0x8d,0x00,0x00,0x00
	shl	rax, 4 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	add	rax, r13 # Size:3, Opcode: 0x01,0x00,0x00,0x00
	cmp	rbx, qword ptr [rax + 8] # Size:4, Opcode: 0x3b,0x00,0x00,0x00
	je	.label_54 # Size:2, Opcode: 0x74,0x00,0x00,0x00
.label_55:
	lea	rax, qword ptr [rbp + rbp*8] # Size:5, Opcode: 0x8d,0x00,0x00,0x00
	lea	rax, qword ptr [rdx + rax*4 + 2] # Size:5, Opcode: 0x8d,0x00,0x00,0x00
	shl	rax, 4 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	add	rax, r13 # Size:3, Opcode: 0x01,0x00,0x00,0x00
	mov	rdx, qword ptr [rax] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	cmp	rbx, rdx # Size:3, Opcode: 0x39,0x00,0x00,0x00
	je	.label_56 # Size:2, Opcode: 0x74,0x00,0x00,0x00
.label_57:
	test	rdx, rdx # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_58 # Size:2, Opcode: 0x74,0x00,0x00,0x00
.label_59:
	lea	rax, qword ptr [rbp + rbp*8] # Size:5, Opcode: 0x8d,0x00,0x00,0x00
	mov	rdi, r15 # Size:3, Opcode: 0x89,0x00,0x00,0x00
	shl	rax, 6 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	sub	dword ptr [r13 + rax + 0x14], 1 # Size:6, Opcode: 0x83,0x00,0x00,0x00
	xor	r13d, r13d # Size:3, Opcode: 0x31,0x00,0x00,0x00
	call	spinlock_irqsave_unlock # Size:5, Opcode: 0xe8,0x00,0x00,0x00
.label_51:
	movzx	edi, byte ptr [rsp + 0xf] # Size:5, Opcode: 0x0f,0xb6,0x00,0x00
	call	irq_nested_enable # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	add	rsp, 0x18 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	eax, r13d # Size:3, Opcode: 0x89,0x00,0x00,0x00
	pop	rbx # Size:1, Opcode: 0x5b,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	pop	r12 # Size:2, Opcode: 0x5c,0x00,0x00,0x00
	pop	r13 # Size:2, Opcode: 0x5d,0x00,0x00,0x00
	pop	r14 # Size:2, Opcode: 0x5e,0x00,0x00,0x00
	pop	r15 # Size:2, Opcode: 0x5f,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00
.label_54:
	lea	rdi, qword ptr [r12 + r12*4] # Size:4, Opcode: 0x8d,0x00,0x00,0x00
	shl	rdi, 8 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	mov	rdi, qword ptr [r14 + rdi + 0x60] # Size:5, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rax + 8], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	jmp	.label_55 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_58:
	lea	rax, qword ptr [rbp + rbp*8] # Size:5, Opcode: 0x8d,0x00,0x00,0x00
	mov	edx, 0xfffffffe # Size:5, Opcode: 0xba,0x00,0x00,0x00
	shl	rax, 6 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	rol	edx, cl # Size:2, Opcode: 0xd3,0x00,0x00,0x00
	and	dword ptr [r13 + rax + 0x18], edx # Size:5, Opcode: 0x21,0x00,0x00,0x00
	jmp	.label_59 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_56:
	mov	qword ptr [rax], rsi # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rdx, rsi # Size:3, Opcode: 0x89,0x00,0x00,0x00
	jmp	.label_57 # Size:2, Opcode: 0xeb,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl scheduler
	.type scheduler, @function
scheduler:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	lea	rdi,  qword ptr [word ptr [rip + label_60]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	push	rbx # Size:1, Opcode: 0x53,0x00,0x00,0x00
	sub	rsp, 8 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	rbp,  qword ptr [word ptr [rip + current_task]] # Size:7, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rbp + 8], 0 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	call	spinlock_irqsave_lock # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	edx, dword ptr [rbp + 4] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	cmp	edx, 4 # Size:3, Opcode: 0x83,0x00,0x00,0x00
	je	.label_61 # Size:6, Opcode: 0x0f,0x84,0x00,0x00
	mov	eax,  dword ptr [dword ptr [rip + go_down]] # Size:6, Opcode: 0x8b,0x00,0x00,0x00
	mov	rbx, rbp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [word ptr [rip + label_62]],  0 # Size:11, Opcode: 0xc7,0x00,0x00,0x00
	test	eax, eax # Size:2, Opcode: 0x85,0x00,0x00,0x00
	jne	.label_64 # Size:6, Opcode: 0x0f,0x85,0x00,0x00
.label_67:
	mov	eax,  dword ptr [dword ptr [rip + label_65]] # Size:6, Opcode: 0x8b,0x00,0x00,0x00
	mov	rcx, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_68 # Size:2, Opcode: 0x74,0x00,0x00,0x00
.label_66:
	bsr	rax, rax # Size:4, Opcode: 0x0f,0xbd,0x00,0x00
	cmp	rax, 0x1f # Size:4, Opcode: 0x83,0x00,0x00,0x00
	jbe	.label_71 # Size:2, Opcode: 0x76,0x00,0x00,0x00
.label_68:
	cmp	edx, 2 # Size:3, Opcode: 0x83,0x00,0x00,0x00
	je	.label_72 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	cmp	edx, 5 # Size:3, Opcode: 0x83,0x00,0x00,0x00
	je	.label_72 # Size:2, Opcode: 0x74,0x00,0x00,0x00
.label_70:
	mov	rbx,  qword ptr [word ptr [rip + readyqueues]] # Size:7, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [word ptr [rip + current_task]],  rbx # Size:7, Opcode: 0x89,0x00,0x00,0x00
.label_72:
	lea	rdi,  qword ptr [word ptr [rip + label_60]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	call	spinlock_irqsave_unlock # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	lea	rax, qword ptr [rbp + 0x10] # Size:4, Opcode: 0x8d,0x00,0x00,0x00
	cmp	rbx, rbp # Size:3, Opcode: 0x39,0x00,0x00,0x00
	mov	edx, 0 # Size:5, Opcode: 0xba,0x00,0x00,0x00
	cmove	rax, rdx # Size:4, Opcode: 0x0f,0x44,0x00,0x00
.label_74:
	add	rsp, 8 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	pop	rbx # Size:1, Opcode: 0x5b,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00
.label_71:
	movzx	esi, byte ptr [rbx + 0x29] # Size:4, Opcode: 0x0f,0xb6,0x00,0x00
	cmp	rsi, rax # Size:3, Opcode: 0x39,0x00,0x00,0x00
	ja	.label_73 # Size:6, Opcode: 0x0f,0x87,0x00,0x00
	cmp	edx, 2 # Size:3, Opcode: 0x83,0x00,0x00,0x00
	jne	.label_75 # Size:2, Opcode: 0x75,0x00,0x00,0x00
	mov	dword ptr [rbx + 4], 1 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	qword ptr [word ptr [rip + label_62]],  rbx # Size:7, Opcode: 0x89,0x00,0x00,0x00
.label_75:
	lea	rdx, qword ptr [rax + 1] # Size:4, Opcode: 0x8d,0x00,0x00,0x00
	lea	r8,  qword ptr [word ptr [rip + readyqueues]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	shl	rdx, 4 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	lea	rsi, qword ptr [rax - 1] # Size:4, Opcode: 0x8d,0x00,0x00,0x00
	add	rdx, r8 # Size:3, Opcode: 0x01,0x00,0x00,0x00
	mov	rbx, qword ptr [rdx] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	test	rbx, rbx # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_76 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	rdi, qword ptr [rbx + 0x58] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rdx], rdi # Size:3, Opcode: 0x89,0x00,0x00,0x00
	test	rdi, rdi # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_78 # Size:6, Opcode: 0x0f,0x84,0x00,0x00
	mov	qword ptr [rdi + 0x60], 0 # Size:8, Opcode: 0xc7,0x00,0x00,0x00
.label_76:
	mov	edx, dword ptr [rbx + 4] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	pxor	xmm0, xmm0 # Size:4, Opcode: 0x0f,0xef,0x00,0x00
	movups	xmmword ptr [rbx + 0x58], xmm0 # Size:4, Opcode: 0x0f,0x11,0x00,0x00
	test	edx, edx # Size:2, Opcode: 0x85,0x00,0x00,0x00
	je	.label_77 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	lea	rdx, qword ptr [rsi + 2] # Size:4, Opcode: 0x8d,0x00,0x00,0x00
	shl	rdx, 4 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	cmp	qword ptr [r8 + rdx], 0 # Size:5, Opcode: 0x83,0x00,0x00,0x00
	je	.label_79 # Size:2, Opcode: 0x74,0x00,0x00,0x00
.label_80:
	mov	dword ptr [rbx + 4], 2 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	qword ptr [rbx + 0x40], 0 # Size:8, Opcode: 0xc7,0x00,0x00,0x00
	mov	qword ptr [word ptr [rip + current_task]],  rbx # Size:7, Opcode: 0x89,0x00,0x00,0x00
	jmp	.label_72 # Size:5, Opcode: 0xe9,0x00,0x00,0x00
.label_61:
	mov	eax,  dword ptr [dword ptr [rip + go_down]] # Size:6, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [word ptr [rip + label_62]],  rbp # Size:7, Opcode: 0x89,0x00,0x00,0x00
	test	eax, eax # Size:2, Opcode: 0x85,0x00,0x00,0x00
	jne	.label_63 # Size:2, Opcode: 0x75,0x00,0x00,0x00
	mov	eax,  dword ptr [dword ptr [rip + label_65]] # Size:6, Opcode: 0x8b,0x00,0x00,0x00
	mov	rbx, rbp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rcx, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	jne	.label_66 # Size:6, Opcode: 0x0f,0x85,0x00,0x00
	jmp	.label_70 # Size:5, Opcode: 0xe9,0x00,0x00,0x00
.label_77:
	jmp	.label_77 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_73:
	cmp	edx, 2 # Size:3, Opcode: 0x83,0x00,0x00,0x00
	jne	.label_75 # Size:6, Opcode: 0x0f,0x85,0x00,0x00
	jmp	.label_72 # Size:5, Opcode: 0xe9,0x00,0x00,0x00
.label_79:
	btr	ecx, eax # Size:3, Opcode: 0x0f,0xb3,0x00,0x00
	mov	dword ptr [dword ptr [rip + label_65]],  ecx # Size:6, Opcode: 0x89,0x00,0x00,0x00
	jmp	.label_80 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_78:
	mov	qword ptr [rdx + 8], 0 # Size:8, Opcode: 0xc7,0x00,0x00,0x00
	jmp	.label_76 # Size:5, Opcode: 0xe9,0x00,0x00,0x00
.label_64:
	cmp	edx, 5 # Size:3, Opcode: 0x83,0x00,0x00,0x00
	je	.label_69 # Size:2, Opcode: 0x74,0x00,0x00,0x00
.label_63:
	mov	rbx,  qword ptr [word ptr [rip + readyqueues]] # Size:7, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [word ptr [rip + current_task]],  rbx # Size:7, Opcode: 0x89,0x00,0x00,0x00
	mov	edx, dword ptr [rbx + 4] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	jmp	.label_67 # Size:5, Opcode: 0xe9,0x00,0x00,0x00
.label_69:
	lea	rdi,  qword ptr [word ptr [rip + label_60]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	call	spinlock_irqsave_unlock # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	jmp	.label_74 # Size:5, Opcode: 0xe9,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl spinlock_init
	.type spinlock_init, @function
spinlock_init:
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	test	rdi, rdi # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_81 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	xchg	qword ptr [rdi], rax # Size:3, Opcode: 0x87,0x00,0x00,0x00
	mov	eax, 1 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	xchg	qword ptr [rdi + 8], rax # Size:4, Opcode: 0x87,0x00,0x00,0x00
	mov	qword ptr [rdi + 0x10], 4 # Size:8, Opcode: 0xc7,0x00,0x00,0x00
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
.label_81:
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl spinlock_destroy
	.type spinlock_destroy, @function
spinlock_destroy:
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	test	rdi, rdi # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_82 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	qword ptr [rdi + 0x10], 4 # Size:8, Opcode: 0xc7,0x00,0x00,0x00
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
.label_82:
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl spinlock_lock
	.type spinlock_lock, @function
spinlock_lock:
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	test	rdi, rdi # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_83 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	rcx,  qword ptr [word ptr [rip + current_task]] # Size:7, Opcode: 0x8b,0x00,0x00,0x00
	mov	eax, dword ptr [rcx] # Size:2, Opcode: 0x8b,0x00,0x00,0x00
	cmp	dword ptr [rdi + 0x10], eax # Size:3, Opcode: 0x39,0x00,0x00,0x00
	je	.label_84 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	edx, 1 # Size:5, Opcode: 0xba,0x00,0x00,0x00
	xadd	qword ptr [rdi], rdx # Size:4, Opcode: 0x0f,0xc1,0x00,0x00
	mov	rax, qword ptr [rdi + 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	add	rdx, 1 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	cmp	rax, rdx # Size:3, Opcode: 0x39,0x00,0x00,0x00
	je	.label_85 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	nop	 # Size:2, Opcode: 0x90,0x00,0x00,0x00
	pause	 # Size:2, Opcode: 0x90,0x00,0x00,0x00
.label_85:
	mov	eax, dword ptr [rcx] # Size:2, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rdi + 0x14], 1 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	dword ptr [rdi + 0x10], eax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
.label_83:
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00
.label_84:
	add	dword ptr [rdi + 0x14], 1 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl spinlock_unlock
	.type spinlock_unlock, @function
spinlock_unlock:
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	test	rdi, rdi # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_86 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, dword ptr [rdi + 0x14] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	lea	edx, dword ptr [rax - 1] # Size:3, Opcode: 0x8d,0x00,0x00,0x00
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	mov	dword ptr [rdi + 0x14], edx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	test	edx, edx # Size:2, Opcode: 0x85,0x00,0x00,0x00
	jne	.label_86 # Size:2, Opcode: 0x75,0x00,0x00,0x00
	mov	dword ptr [rdi + 0x10], 4 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	edx, 1 # Size:5, Opcode: 0xba,0x00,0x00,0x00
	xadd	qword ptr [rdi + 8], rdx # Size:5, Opcode: 0x0f,0xc1,0x00,0x00
.label_86:
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl spinlock_irqsave_init
	.type spinlock_irqsave_init, @function
spinlock_irqsave_init:
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	test	rdi, rdi # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_87 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	xchg	qword ptr [rdi], rax # Size:3, Opcode: 0x87,0x00,0x00,0x00
	mov	eax, 1 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	xchg	qword ptr [rdi + 8], rax # Size:4, Opcode: 0x87,0x00,0x00,0x00
	mov	qword ptr [rdi + 0x10], 4 # Size:8, Opcode: 0xc7,0x00,0x00,0x00
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	mov	byte ptr [rdi + 0x18], 0 # Size:4, Opcode: 0xc6,0x00,0x00,0x00
.label_87:
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl spinlock_irqsave_destroy
	.type spinlock_irqsave_destroy, @function
spinlock_irqsave_destroy:
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	test	rdi, rdi # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_88 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	qword ptr [rdi + 0x10], 4 # Size:8, Opcode: 0xc7,0x00,0x00,0x00
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	mov	byte ptr [rdi + 0x18], 0 # Size:4, Opcode: 0xc6,0x00,0x00,0x00
.label_88:
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl spinlock_irqsave_lock
	.type spinlock_irqsave_lock, @function
spinlock_irqsave_lock:
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	test	rdi, rdi # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_89 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	push	rbx # Size:1, Opcode: 0x53,0x00,0x00,0x00
	mov	rbx, rdi # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	irq_nested_disable # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	rsi,  qword ptr [word ptr [rip + current_task]] # Size:7, Opcode: 0x8b,0x00,0x00,0x00
	mov	edi, dword ptr [rsi] # Size:2, Opcode: 0x8b,0x00,0x00,0x00
	cmp	dword ptr [rbx + 0x10], edi # Size:3, Opcode: 0x39,0x00,0x00,0x00
	je	.label_90 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	ecx, 1 # Size:5, Opcode: 0xb9,0x00,0x00,0x00
	xadd	qword ptr [rbx], rcx # Size:4, Opcode: 0x0f,0xc1,0x00,0x00
	mov	rdx, qword ptr [rbx + 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	add	rcx, 1 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	cmp	rdx, rcx # Size:3, Opcode: 0x39,0x00,0x00,0x00
	je	.label_91 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	nop	word ptr [rax + rax] # Size:9, Opcode: 0x0f,0x1f,0x00,0x00
	pause	 # Size:2, Opcode: 0x90,0x00,0x00,0x00
.label_91:
	mov	byte ptr [rbx + 0x18], al # Size:3, Opcode: 0x88,0x00,0x00,0x00
	mov	eax, dword ptr [rsi] # Size:2, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rbx + 0x14], 1 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	dword ptr [rbx + 0x10], eax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	pop	rbx # Size:1, Opcode: 0x5b,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00
.label_90:
	add	dword ptr [rbx + 0x14], 1 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	pop	rbx # Size:1, Opcode: 0x5b,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00
.label_89:
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl spinlock_irqsave_unlock
	.type spinlock_irqsave_unlock, @function
spinlock_irqsave_unlock:
	push	rbx # Size:1, Opcode: 0x53,0x00,0x00,0x00
	mov	ebx, 0xffffffea # Size:5, Opcode: 0xbb,0x00,0x00,0x00
	test	rdi, rdi # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_92 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, dword ptr [rdi + 0x14] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	xor	ebx, ebx # Size:2, Opcode: 0x31,0x00,0x00,0x00
	lea	edx, dword ptr [rax - 1] # Size:3, Opcode: 0x8d,0x00,0x00,0x00
	mov	dword ptr [rdi + 0x14], edx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	test	edx, edx # Size:2, Opcode: 0x85,0x00,0x00,0x00
	je	.label_93 # Size:2, Opcode: 0x74,0x00,0x00,0x00
.label_92:
	mov	eax, ebx # Size:2, Opcode: 0x89,0x00,0x00,0x00
	pop	rbx # Size:1, Opcode: 0x5b,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00
.label_93:
	mov	dword ptr [rdi + 0x10], 4 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	eax, 1 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	xadd	qword ptr [rdi + 8], rax # Size:5, Opcode: 0x0f,0xc1,0x00,0x00
	movzx	edi, byte ptr [rdi + 0x18] # Size:4, Opcode: 0x0f,0xb6,0x00,0x00
	call	irq_nested_enable # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	eax, ebx # Size:2, Opcode: 0x89,0x00,0x00,0x00
	pop	rbx # Size:1, Opcode: 0x5b,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl kputs
	.type kputs, @function
kputs:
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl irq_nested_disable
	.type irq_nested_disable, @function
irq_nested_disable:
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl irq_nested_enable
	.type irq_nested_enable, @function
irq_nested_enable:
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl lwip_write
	.type lwip_write, @function
lwip_write:
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl lwip_read
	.type lwip_read, @function
lwip_read:
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl lwip_close
	.type lwip_close, @function
lwip_close:
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl virt_to_phys
	.type virt_to_phys, @function
virt_to_phys:
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl is_uhyve
	.type is_uhyve, @function
is_uhyve:
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl kputchar
	.type kputchar, @function
kputchar:
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl kmalloc
	.type kmalloc, @function
kmalloc:
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl kfree
	.type kfree, @function
kfree:
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl timer_wait
	.type timer_wait, @function
timer_wait:
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl udelay
	.type udelay, @function
udelay:
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl sem_init
	.type sem_init, @function
sem_init:
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl sem_destroy
	.type sem_destroy, @function
sem_destroy:
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl sem_wait
	.type sem_wait, @function
sem_wait:
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl sem_post
	.type sem_post, @function
sem_post:
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl clone_task
	.type clone_task, @function
clone_task:
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl strlen
	.type strlen, @function
strlen:
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl memcpy
	.type memcpy, @function
memcpy:
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl get_pages
	.type get_pages, @function
get_pages:
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl page_map
	.type page_map, @function
page_map:
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl put_pages
	.type put_pages, @function
put_pages:
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl has_nx
	.type has_nx, @function
has_nx:
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl vma_alloc
	.type vma_alloc, @function
vma_alloc:
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl vma_free
	.type vma_free, @function
vma_free:
	xor	eax, eax # Size:2, Opcode: 0x31,0x00,0x00,0x00
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
	label_98:

	.section .symtab
	.align 32
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 184
	.byte 87
	.byte 0
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
	.quad 99999999999999999999
	.quad 99999999999999999999
	.quad 99999999999999999999
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
	.byte 168
	.byte 5
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 168
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
	.byte 61
	.byte 13
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 61
	.byte 13
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
	.byte 56
	.byte 7
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 56
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
	.byte 25
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 24
	.byte 25
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
	.byte 188
	.byte 1
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 188
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
	label_100:

	.section .symtab
	.align 32
	.label_99:

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
	.globl table_lock
	.type table_lock, @object
table_lock:
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
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
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
label_30:
	.quad 0x5
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
label_33:
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
label_32:
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
label_36:
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
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
label_38:
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
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
label_40:
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
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
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
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.globl readyqueues
	.type readyqueues, @object
readyqueues:
	.quad task_table
label_62:
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
label_34:
	.quad 0x0
	.quad 0
label_65:
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
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
label_60:
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

	.section .bss
	.align 32
	.byte 0
	.byte 0
	.byte 0
	.globl go_down
	.type go_down, @object
go_down:
	.quad 0x0
	.quad 0
		.globl _end
	.type _end, @notype
_end:
