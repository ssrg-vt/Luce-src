	.intel_syntax noprefix

	.section	.text
	.align	32
	.globl task_list_remove_task
	.type task_list_remove_task, @function
task_list_remove_task:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x10], rsi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rax + 0x60] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_10 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rax + 0x60] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdx, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdx, qword ptr [rdx + 0x58] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rax + 0x58], rdx # Size:4, Opcode: 0x89,0x00,0x00,0x00
.label_10:
	mov	rax, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rax + 0x58] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_11 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rax + 0x58] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdx, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdx, qword ptr [rdx + 0x60] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rax + 0x60], rdx # Size:4, Opcode: 0x89,0x00,0x00,0x00
.label_11:
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rax + 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	cmp	qword ptr [rbp - 0x10], rax # Size:4, Opcode: 0x39,0x00,0x00,0x00
	jne	.label_12 # Size:2, Opcode: 0x75,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdx, qword ptr [rax + 0x60] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rax + 8], rdx # Size:4, Opcode: 0x89,0x00,0x00,0x00
.label_12:
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rax] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	cmp	qword ptr [rbp - 0x10], rax # Size:4, Opcode: 0x39,0x00,0x00,0x00
	jne	.label_13 # Size:2, Opcode: 0x75,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdx, qword ptr [rax + 0x58] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rax], rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
.label_13:
	nop	 # Size:1, Opcode: 0x90,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl task_list_push_back
	.type task_list_push_back, @function
task_list_push_back:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x10], rsi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	cmp	qword ptr [rbp - 0x10], 0 # Size:5, Opcode: 0x83,0x00,0x00,0x00
	sete	al # Size:3, Opcode: 0x0f,0x94,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	jne	.label_14 # Size:6, Opcode: 0x0f,0x85,0x00,0x00
	cmp	qword ptr [rbp - 8], 0 # Size:5, Opcode: 0x83,0x00,0x00,0x00
	sete	al # Size:3, Opcode: 0x0f,0x94,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	jne	.label_14 # Size:2, Opcode: 0x75,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rax + 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_15 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdx, qword ptr [rax + 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rax + 0x60], rdx # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rax + 0x58], 0 # Size:8, Opcode: 0xc7,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rax + 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdx, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rax + 0x58], rdx # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdx, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rax + 8], rdx # Size:4, Opcode: 0x89,0x00,0x00,0x00
	jmp	.label_16 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_15:
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdx, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rax], rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdx, qword ptr [rax] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rax + 8], rdx # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rax + 0x60], 0 # Size:8, Opcode: 0xc7,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdx, qword ptr [rax + 0x60] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rax + 0x58], rdx # Size:4, Opcode: 0x89,0x00,0x00,0x00
	jmp	.label_16 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_14:
	nop	 # Size:1, Opcode: 0x90,0x00,0x00,0x00
.label_16:
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl task_list_pop_front
	.type task_list_pop_front, @function
task_list_pop_front:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x18], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	cmp	qword ptr [rbp - 0x18], 0 # Size:5, Opcode: 0x83,0x00,0x00,0x00
	sete	al # Size:3, Opcode: 0x0f,0x94,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_17 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_19 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_17:
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rax] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rax] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_18 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rax] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdx, qword ptr [rax + 0x58] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rax], rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rax] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_20 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rax] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rax + 0x60], 0 # Size:8, Opcode: 0xc7,0x00,0x00,0x00
	jmp	.label_18 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_20:
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rax + 8], 0 # Size:8, Opcode: 0xc7,0x00,0x00,0x00
.label_18:
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rax + 0x60], 0 # Size:8, Opcode: 0xc7,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdx, qword ptr [rax + 0x60] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rax + 0x58], rdx # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
.label_19:
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl readyqueues_push_back
	.type readyqueues_push_back, @function
readyqueues_push_back:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	sub	rsp, 0x20 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	dword ptr [rbp - 0x14], edi # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x20], rsi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x20] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	movzx	eax, byte ptr [rax + 0x29] # Size:4, Opcode: 0x0f,0xb6,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	sub	eax, 1 # Size:3, Opcode: 0x83,0x00,0x00,0x00
	movsxd	rcx, eax # Size:3, Opcode: 0x63,0x00,0x00,0x00
	mov	edx, dword ptr [rbp - 0x14] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	shl	rax, 3 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	add	rax, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	shl	rax, 2 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	add	rax, rcx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	add	rax, 2 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	shl	rax, 4 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	mov	rdx, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	lea	rax,  qword ptr [word ptr [rip + readyqueues]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	add	rax, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rdx, qword ptr [rbp - 0x20] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rsi, rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	task_list_push_back # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	edx, dword ptr [rbp - 0x14] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	shl	rax, 3 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	add	rax, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	shl	rax, 6 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	mov	rdx, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	lea	rax,  qword ptr [word ptr [rip + label_21]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	mov	edx, dword ptr [rdx + rax] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x20] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	movzx	eax, byte ptr [rax + 0x29] # Size:4, Opcode: 0x0f,0xb6,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	mov	esi, 1 # Size:5, Opcode: 0xbe,0x00,0x00,0x00
	mov	ecx, eax # Size:2, Opcode: 0x89,0x00,0x00,0x00
	shl	esi, cl # Size:2, Opcode: 0xd3,0x00,0x00,0x00
	mov	eax, esi # Size:2, Opcode: 0x89,0x00,0x00,0x00
	mov	ecx, edx # Size:2, Opcode: 0x89,0x00,0x00,0x00
	or	ecx, eax # Size:2, Opcode: 0x09,0x00,0x00,0x00
	mov	edx, dword ptr [rbp - 0x14] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	shl	rax, 3 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	add	rax, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	shl	rax, 6 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	mov	rdx, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	lea	rax,  qword ptr [word ptr [rip + label_21]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	mov	dword ptr [rdx + rax], ecx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	nop	 # Size:1, Opcode: 0x90,0x00,0x00,0x00
	leave	 # Size:1, Opcode: 0xc9,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl readyqueues_remove
	.type readyqueues_remove, @function
readyqueues_remove:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	sub	rsp, 0x20 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	dword ptr [rbp - 0x14], edi # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x20], rsi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x20] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	movzx	eax, byte ptr [rax + 0x29] # Size:4, Opcode: 0x0f,0xb6,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	sub	eax, 1 # Size:3, Opcode: 0x83,0x00,0x00,0x00
	movsxd	rcx, eax # Size:3, Opcode: 0x63,0x00,0x00,0x00
	mov	edx, dword ptr [rbp - 0x14] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	shl	rax, 3 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	add	rax, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	shl	rax, 2 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	add	rax, rcx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	add	rax, 2 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	shl	rax, 4 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	mov	rdx, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	lea	rax,  qword ptr [word ptr [rip + readyqueues]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	add	rax, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rdx, qword ptr [rbp - 0x20] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rsi, rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	task_list_remove_task # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rax] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	jne	.label_22 # Size:2, Opcode: 0x75,0x00,0x00,0x00
	mov	edx, dword ptr [rbp - 0x14] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	shl	rax, 3 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	add	rax, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	shl	rax, 6 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	mov	rdx, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	lea	rax,  qword ptr [word ptr [rip + label_21]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	mov	edx, dword ptr [rdx + rax] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x20] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	movzx	eax, byte ptr [rax + 0x29] # Size:4, Opcode: 0x0f,0xb6,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	mov	esi, 1 # Size:5, Opcode: 0xbe,0x00,0x00,0x00
	mov	ecx, eax # Size:2, Opcode: 0x89,0x00,0x00,0x00
	shl	esi, cl # Size:2, Opcode: 0xd3,0x00,0x00,0x00
	mov	eax, esi # Size:2, Opcode: 0x89,0x00,0x00,0x00
	not	eax # Size:2, Opcode: 0xf7,0x00,0x00,0x00
	mov	ecx, edx # Size:2, Opcode: 0x89,0x00,0x00,0x00
	and	ecx, eax # Size:2, Opcode: 0x21,0x00,0x00,0x00
	mov	edx, dword ptr [rbp - 0x14] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	shl	rax, 3 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	add	rax, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	shl	rax, 6 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	mov	rdx, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	lea	rax,  qword ptr [word ptr [rip + label_21]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	mov	dword ptr [rdx + rax], ecx # Size:3, Opcode: 0x89,0x00,0x00,0x00
.label_22:
	nop	 # Size:1, Opcode: 0x90,0x00,0x00,0x00
	leave	 # Size:1, Opcode: 0xc9,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl get_task
	.type get_task, @function
get_task:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	dword ptr [rbp - 4], edi # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x10], rsi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	cmp	qword ptr [rbp - 0x10], 0 # Size:5, Opcode: 0x83,0x00,0x00,0x00
	sete	al # Size:3, Opcode: 0x0f,0x94,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_23 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xfffffff4 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_25 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_23:
	cmp	dword ptr [rbp - 4], 3 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	seta	al # Size:3, Opcode: 0x0f,0x97,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_24 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xfffffffe # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_25 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_24:
	mov	edx, dword ptr [rbp - 4] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	shl	rax, 2 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	add	rax, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	shl	rax, 8 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	mov	rdx, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	lea	rax,  qword ptr [word ptr [rip + label_26]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	mov	eax, dword ptr [rdx + rax] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	test	eax, eax # Size:2, Opcode: 0x85,0x00,0x00,0x00
	sete	al # Size:3, Opcode: 0x0f,0x94,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_27 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_25 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_27:
	mov	edx, dword ptr [rbp - 4] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	shl	rax, 2 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	add	rax, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	shl	rax, 8 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	lea	rdx,  qword ptr [word ptr [rip + task_table]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	add	rdx, rax # Size:3, Opcode: 0x01,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rax], rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
.label_25:
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl multitasking_init
	.type multitasking_init, @function
multitasking_init:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	dword ptr [rbp - 4], 0 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	eax,  dword ptr [dword ptr [rip + label_26]] # Size:6, Opcode: 0x8b,0x00,0x00,0x00
	cmp	eax, 5 # Size:3, Opcode: 0x83,0x00,0x00,0x00
	setne	al # Size:3, Opcode: 0x0f,0x95,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_28 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xfffffff4 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_29 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_28:
	mov	byte ptr [byte ptr [rip + label_30]],  0 # Size:7, Opcode: 0xc6,0x00,0x00,0x00
	mov	qword ptr [word ptr [rip + label_31]],  0 # Size:11, Opcode: 0xc7,0x00,0x00,0x00
	mov	qword ptr [word ptr [rip + label_32]],  0 # Size:11, Opcode: 0xc7,0x00,0x00,0x00
	lea	rax,  qword ptr [word ptr [rip + task_table]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	mov	qword ptr [word ptr [rip + current_task]],  rax # Size:7, Opcode: 0x89,0x00,0x00,0x00
	mov	edx, dword ptr [rbp - 4] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	shl	rax, 3 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	add	rax, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	shl	rax, 6 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	mov	rcx, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	lea	rax,  qword ptr [word ptr [rip + readyqueues]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	lea	rdx,  qword ptr [word ptr [rip + task_table]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	mov	qword ptr [rcx + rax], rdx # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
.label_29:
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl is_task_available
	.type is_task_available, @function
is_task_available:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	dword ptr [rbp - 4], 0 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	edx, dword ptr [rbp - 4] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	shl	rax, 3 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	add	rax, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	shl	rax, 6 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	mov	rdx, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	lea	rax,  qword ptr [word ptr [rip + label_33]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	mov	eax, dword ptr [rdx + rax] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	test	eax, eax # Size:2, Opcode: 0x85,0x00,0x00,0x00
	setne	al # Size:3, Opcode: 0x0f,0x95,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl get_readyqueue
	.type get_readyqueue, @function
get_readyqueue:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	lea	rax,  qword ptr [word ptr [rip + readyqueues]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl set_idle_task
	.type set_idle_task, @function
set_idle_task:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	sub	rsp, 0x10 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	dword ptr [rbp - 4], 0 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	dword ptr [rbp - 0xc], 0xffffffff # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	lea	rdi,  qword ptr [word ptr [rip + table_lock]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	call	spinlock_irqsave_lock # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	dword ptr [rbp - 8], 0 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	jmp	.label_34 # Size:5, Opcode: 0xe9,0x00,0x00,0x00
.label_35:
	mov	edx, dword ptr [rbp - 8] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	shl	rax, 2 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	add	rax, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	shl	rax, 8 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	mov	rdx, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	lea	rax,  qword ptr [word ptr [rip + label_26]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	mov	eax, dword ptr [rdx + rax] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	test	eax, eax # Size:2, Opcode: 0x85,0x00,0x00,0x00
	jne	.label_36 # Size:6, Opcode: 0x0f,0x85,0x00,0x00
	mov	eax, dword ptr [rbp - 8] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rbp - 0xc], eax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	edx, dword ptr [rbp - 8] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	shl	rax, 2 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	add	rax, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	shl	rax, 8 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	mov	rcx, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	lea	rdx,  qword ptr [word ptr [rip + task_table]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0xc] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rcx + rdx], eax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	edx, dword ptr [rbp - 8] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	shl	rax, 2 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	add	rax, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	shl	rax, 8 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	mov	rdx, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	lea	rax,  qword ptr [word ptr [rip + label_26]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	mov	dword ptr [rdx + rax], 5 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	edx, dword ptr [rbp - 8] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	shl	rax, 2 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	add	rax, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	shl	rax, 8 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	mov	rcx, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	lea	rdx,  qword ptr [word ptr [rip + label_37]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 4] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rcx + rdx], eax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	edx, dword ptr [rbp - 8] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	shl	rax, 2 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	add	rax, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	shl	rax, 8 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	mov	rdx, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	lea	rax,  qword ptr [word ptr [rip + label_38]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	mov	qword ptr [rdx + rax], 0 # Size:8, Opcode: 0xc7,0x00,0x00,0x00
	mov	edx, dword ptr [rbp - 8] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	shl	rax, 2 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	add	rax, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	shl	rax, 8 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	mov	rdx, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	lea	rax,  qword ptr [word ptr [rip + label_31]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	mov	qword ptr [rdx + rax], 0 # Size:8, Opcode: 0xc7,0x00,0x00,0x00
	mov	edx, dword ptr [rbp - 8] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	shl	rax, 2 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	add	rax, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	shl	rax, 8 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	mov	rdx, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	lea	rax,  qword ptr [word ptr [rip + label_32]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	mov	qword ptr [rdx + rax], 0 # Size:8, Opcode: 0xc7,0x00,0x00,0x00
	mov	edx, dword ptr [rbp - 8] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	shl	rax, 2 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	add	rax, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	shl	rax, 8 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	mov	rdx, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	lea	rax,  qword ptr [word ptr [rip + label_30]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	mov	byte ptr [rdx + rax], 0 # Size:4, Opcode: 0xc6,0x00,0x00,0x00
	mov	edx, dword ptr [rbp - 8] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	shl	rax, 2 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	add	rax, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	shl	rax, 8 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	mov	rdx, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	lea	rax,  qword ptr [word ptr [rip + label_39]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	mov	qword ptr [rdx + rax], 0 # Size:8, Opcode: 0xc7,0x00,0x00,0x00
	mov	edx, dword ptr [rbp - 8] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	shl	rax, 2 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	add	rax, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	shl	rax, 8 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	mov	rdx, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	lea	rax,  qword ptr [word ptr [rip + task_table]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	lea	rcx, qword ptr [rdx + rax] # Size:4, Opcode: 0x8d,0x00,0x00,0x00
	mov	edx, dword ptr [rbp - 4] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	shl	rax, 3 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	add	rax, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	shl	rax, 6 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	mov	rdx, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	lea	rax,  qword ptr [word ptr [rip + readyqueues]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	mov	qword ptr [rdx + rax], rcx # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	edx, dword ptr [rbp - 4] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	shl	rax, 3 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	add	rax, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	shl	rax, 6 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	mov	rdx, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	lea	rax,  qword ptr [word ptr [rip + readyqueues]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	mov	rax, qword ptr [rdx + rax] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [word ptr [rip + current_task]],  rax # Size:7, Opcode: 0x89,0x00,0x00,0x00
	jmp	.label_40 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_36:
	add	dword ptr [rbp - 8], 1 # Size:4, Opcode: 0x83,0x00,0x00,0x00
.label_34:
	cmp	dword ptr [rbp - 8], 3 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	jbe	.label_35 # Size:6, Opcode: 0x0f,0x86,0x00,0x00
.label_40:
	lea	rdi,  qword ptr [word ptr [rip + table_lock]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	call	spinlock_irqsave_unlock # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0xc] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	leave	 # Size:1, Opcode: 0xc9,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl get_next_core_id
	.type get_next_core_id, @function
get_next_core_id:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	eax,  dword ptr [dword ptr [rip + core_id.2502]] # Size:6, Opcode: 0x8b,0x00,0x00,0x00
	test	eax, eax # Size:2, Opcode: 0x85,0x00,0x00,0x00
	je	.label_41 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	dword ptr [dword ptr [rip + core_id.2502]],  0 # Size:10, Opcode: 0xc7,0x00,0x00,0x00
.label_41:
	mov	dword ptr [rbp - 4], 0 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	dword ptr [dword ptr [rip + core_id.2502]],  0 # Size:10, Opcode: 0xc7,0x00,0x00,0x00
	jmp	.label_42 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_43:
	mov	eax,  dword ptr [dword ptr [rip + core_id.2502]] # Size:6, Opcode: 0x8b,0x00,0x00,0x00
	mov	edx, eax # Size:2, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	shl	rax, 3 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	add	rax, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	shl	rax, 6 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	mov	rdx, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	lea	rax,  qword ptr [word ptr [rip + readyqueues]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	mov	rax, qword ptr [rdx + rax] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	jne	.label_44 # Size:2, Opcode: 0x75,0x00,0x00,0x00
	add	dword ptr [rbp - 4], 1 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	dword ptr [dword ptr [rip + core_id.2502]],  0 # Size:10, Opcode: 0xc7,0x00,0x00,0x00
.label_42:
	cmp	dword ptr [rbp - 4], 1 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	jbe	.label_43 # Size:2, Opcode: 0x76,0x00,0x00,0x00
	jmp	.label_45 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_44:
	nop	 # Size:1, Opcode: 0x90,0x00,0x00,0x00
.label_45:
	mov	eax,  dword ptr [dword ptr [rip + core_id.2502]] # Size:6, Opcode: 0x8b,0x00,0x00,0x00
	mov	edx, eax # Size:2, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	shl	rax, 3 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	add	rax, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	shl	rax, 6 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	mov	rdx, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	lea	rax,  qword ptr [word ptr [rip + readyqueues]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	mov	rax, qword ptr [rdx + rax] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	sete	al # Size:3, Opcode: 0x0f,0x94,0x00,0x00
	movzx	eax, al # Size:3, Opcode: 0x0f,0xb6,0x00,0x00
	test	rax, rax # Size:3, Opcode: 0x85,0x00,0x00,0x00
	je	.label_46 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 1 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_47 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_46:
	mov	eax,  dword ptr [dword ptr [rip + core_id.2502]] # Size:6, Opcode: 0x8b,0x00,0x00,0x00
.label_47:
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl block_task
	.type block_task, @function
block_task:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	sub	rsp, 0x30 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	dword ptr [rbp - 0x24], edi # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	dword ptr [rbp - 0x10], 0xffffffea # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	call	irq_nested_disable # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	byte ptr [rbp - 0x11], al # Size:3, Opcode: 0x88,0x00,0x00,0x00
	mov	edx, dword ptr [rbp - 0x24] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	shl	rax, 2 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	add	rax, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	shl	rax, 8 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	lea	rdx,  qword ptr [word ptr [rip + task_table]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	add	rax, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	eax, dword ptr [rax + 8] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rbp - 0xc], eax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	eax, dword ptr [rax + 4] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	cmp	eax, 2 # Size:3, Opcode: 0x83,0x00,0x00,0x00
	jne	.label_48 # Size:6, Opcode: 0x0f,0x85,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 4], 3 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	edx, dword ptr [rbp - 0xc] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	shl	rax, 3 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	add	rax, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	shl	rax, 6 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	lea	rdx, qword ptr [rax + 0x220] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	lea	rax,  qword ptr [word ptr [rip + readyqueues]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	add	rax, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	spinlock_irqsave_lock # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	rdx, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0xc] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rsi, rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	edi, eax # Size:2, Opcode: 0x89,0x00,0x00,0x00
	call	readyqueues_remove # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	edx, dword ptr [rbp - 0xc] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	shl	rax, 3 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	add	rax, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	shl	rax, 6 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	mov	rdx, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	lea	rax,  qword ptr [word ptr [rip + label_33]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	mov	eax, dword ptr [rdx + rax] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	lea	ecx, dword ptr [rax - 1] # Size:3, Opcode: 0x8d,0x00,0x00,0x00
	mov	edx, dword ptr [rbp - 0xc] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	shl	rax, 3 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	add	rax, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	shl	rax, 6 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	mov	rdx, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	lea	rax,  qword ptr [word ptr [rip + label_33]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	mov	dword ptr [rdx + rax], ecx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	edx, dword ptr [rbp - 0xc] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, rdx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	shl	rax, 3 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	add	rax, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	shl	rax, 6 # Size:4, Opcode: 0xc1,0x00,0x00,0x00
	lea	rdx, qword ptr [rax + 0x220] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	lea	rax,  qword ptr [word ptr [rip + readyqueues]] # Size:7, Opcode: 0x8d,0x00,0x00,0x00
	add	rax, rdx # Size:3, Opcode: 0x01,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	spinlock_irqsave_unlock # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	dword ptr [rbp - 0x10], 0 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
.label_48:
	movzx	eax, byte ptr [rbp - 0x11] # Size:4, Opcode: 0x0f,0xb6,0x00,0x00
	mov	edi, eax # Size:2, Opcode: 0x89,0x00,0x00,0x00
	call	irq_nested_enable # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	eax, dword ptr [rbp - 0x10] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	leave	 # Size:1, Opcode: 0xc9,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl block_current_task
	.type block_current_task, @function
block_current_task:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax,  qword ptr [word ptr [rip + current_task]] # Size:7, Opcode: 0x8b,0x00,0x00,0x00
	mov	eax, dword ptr [rax] # Size:2, Opcode: 0x8b,0x00,0x00,0x00
	mov	edi, eax # Size:2, Opcode: 0x89,0x00,0x00,0x00
	call	block_task # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl msb
	.type msb, @function
msb:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x18], rdi # Size:4, Opcode: 0x89,0x00,0x00,0x00
	cmp	qword ptr [rbp - 0x18], 0 # Size:5, Opcode: 0x83,0x00,0x00,0x00
	jne	.label_49 # Size:2, Opcode: 0x75,0x00,0x00,0x00
	mov	eax, 0x40 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_50 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_49:
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	bsr	rax, rax # Size:4, Opcode: 0x0f,0xbd,0x00,0x00
	mov	qword ptr [rbp - 8], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
.label_50:
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
	ret	 # Size:1, Opcode: 0xc3,0x00,0x00,0x00

	.section	.text
	.align	32
	.globl main
	.type main, @function
main:
	push	rbp # Size:1, Opcode: 0x55,0x00,0x00,0x00
	mov	rbp, rsp # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	edi, 0 # Size:5, Opcode: 0xbf,0x00,0x00,0x00
	call	msb # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	pop	rbp # Size:1, Opcode: 0x5d,0x00,0x00,0x00
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
	je	.label_51 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_52 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_51:
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
.label_52:
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
	je	.label_53 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_54 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_53:
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x10], 4 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x14], 0 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
.label_54:
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
	je	.label_55 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_57 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_55:
	mov	rax,  qword ptr [word ptr [rip + current_task]] # Size:7, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x10], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	edx, dword ptr [rax + 0x10] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	eax, dword ptr [rax] # Size:2, Opcode: 0x8b,0x00,0x00,0x00
	cmp	edx, eax # Size:2, Opcode: 0x39,0x00,0x00,0x00
	jne	.label_56 # Size:2, Opcode: 0x75,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	eax, dword ptr [rax + 0x14] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	lea	edx, dword ptr [rax + 1] # Size:3, Opcode: 0x8d,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x14], edx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_57 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_56:
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	atomic_int64_inc # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	jmp	.label_58 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_59:
	pause	 # Size:2, Opcode: 0x90,0x00,0x00,0x00
.label_58:
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	add	rax, 8 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	atomic_int64_read # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	cmp	qword ptr [rbp - 8], rax # Size:4, Opcode: 0x39,0x00,0x00,0x00
	jne	.label_59 # Size:2, Opcode: 0x75,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	edx, dword ptr [rax] # Size:2, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x10], edx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x18] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x14], 1 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
.label_57:
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
	je	.label_60 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_62 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_60:
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	eax, dword ptr [rax + 0x14] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	lea	edx, dword ptr [rax - 1] # Size:3, Opcode: 0x8d,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x14], edx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	eax, dword ptr [rax + 0x14] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	test	eax, eax # Size:2, Opcode: 0x85,0x00,0x00,0x00
	jne	.label_61 # Size:2, Opcode: 0x75,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x10], 4 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	add	rax, 8 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	atomic_int64_inc # Size:5, Opcode: 0xe8,0x00,0x00,0x00
.label_61:
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
.label_62:
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
	je	.label_63 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_64 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_63:
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
.label_64:
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
	je	.label_65 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_66 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_65:
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x10], 4 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x14], 0 # Size:7, Opcode: 0xc7,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	byte ptr [rax + 0x18], 0 # Size:4, Opcode: 0xc6,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
.label_66:
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
	je	.label_67 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_68 # Size:5, Opcode: 0xe9,0x00,0x00,0x00
.label_67:
	call	irq_nested_disable # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	byte ptr [rbp - 0x11], al # Size:3, Opcode: 0x88,0x00,0x00,0x00
	mov	rax,  qword ptr [word ptr [rip + current_task]] # Size:7, Opcode: 0x8b,0x00,0x00,0x00
	mov	qword ptr [rbp - 0x10], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x28] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	edx, dword ptr [rax + 0x10] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x10] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	eax, dword ptr [rax] # Size:2, Opcode: 0x8b,0x00,0x00,0x00
	cmp	edx, eax # Size:2, Opcode: 0x39,0x00,0x00,0x00
	jne	.label_69 # Size:2, Opcode: 0x75,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x28] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	eax, dword ptr [rax + 0x14] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	lea	edx, dword ptr [rax + 1] # Size:3, Opcode: 0x8d,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 0x28] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x14], edx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_68 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_69:
	mov	rax, qword ptr [rbp - 0x28] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	atomic_int64_inc # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	mov	qword ptr [rbp - 8], rax # Size:4, Opcode: 0x89,0x00,0x00,0x00
	jmp	.label_70 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_71:
	pause	 # Size:2, Opcode: 0x90,0x00,0x00,0x00
.label_70:
	mov	rax, qword ptr [rbp - 0x28] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	add	rax, 8 # Size:4, Opcode: 0x83,0x00,0x00,0x00
	mov	rdi, rax # Size:3, Opcode: 0x89,0x00,0x00,0x00
	call	atomic_int64_read # Size:5, Opcode: 0xe8,0x00,0x00,0x00
	cmp	qword ptr [rbp - 8], rax # Size:4, Opcode: 0x39,0x00,0x00,0x00
	jne	.label_71 # Size:2, Opcode: 0x75,0x00,0x00,0x00
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
.label_68:
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
	je	.label_72 # Size:2, Opcode: 0x74,0x00,0x00,0x00
	mov	eax, 0xffffffea # Size:5, Opcode: 0xb8,0x00,0x00,0x00
	jmp	.label_74 # Size:2, Opcode: 0xeb,0x00,0x00,0x00
.label_72:
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	eax, dword ptr [rax + 0x14] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	lea	edx, dword ptr [rax - 1] # Size:3, Opcode: 0x8d,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	dword ptr [rax + 0x14], edx # Size:3, Opcode: 0x89,0x00,0x00,0x00
	mov	rax, qword ptr [rbp - 8] # Size:4, Opcode: 0x8b,0x00,0x00,0x00
	mov	eax, dword ptr [rax + 0x14] # Size:3, Opcode: 0x8b,0x00,0x00,0x00
	test	eax, eax # Size:2, Opcode: 0x85,0x00,0x00,0x00
	jne	.label_73 # Size:2, Opcode: 0x75,0x00,0x00,0x00
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
.label_73:
	mov	eax, 0 # Size:5, Opcode: 0xb8,0x00,0x00,0x00
.label_74:
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
	.globl xxxxxxxxxxxxxxxxxxxxxxxxxx
	.type xxxxxxxxxxxxxxxxxxxxxxxxxx, @other
xxxxxxxxxxxxxxxxxxxxxxxxxx:
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
	label_79:

	.section .symtab
	.align 32
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 80
	.byte 88
	.byte 0
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
	.quad 9999999999999999999
	.quad 9999999999999999999
	.quad 9999999999999999999
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
	.byte 237
	.byte 15
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 237
	.byte 15
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
	.byte 104
	.byte 9
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 104
	.byte 9
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
	.byte 216
	.byte 24
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 224
	.byte 24
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
	.byte 220
	.byte 1
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 220
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
	.label_80:

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
label_26:
	.quad 0x5
	.quad 0
label_37:
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
label_38:
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
label_31:
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
label_30:
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
label_39:
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
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
	.globl core_id.2502
	.type core_id.2502, @object
core_id.2502:
	.quad 0x1
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
	.globl readyqueues
	.type readyqueues, @object
readyqueues:
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
label_33:
	.byte 0
	.byte 0
	.byte 0
	.byte 0
label_21:
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
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
