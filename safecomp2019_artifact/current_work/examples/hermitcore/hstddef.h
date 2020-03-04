/*
 * Copyright (c) 2010, Stefan Lankes, RWTH Aachen University
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *    * Redistributions of source code must retain the above copyright
 *      notice, this list of conditions and the following disclaimer.
 *    * Redistributions in binary form must reproduce the above copyright
 *      notice, this list of conditions and the following disclaimer in the
 *      documentation and/or other materials provided with the distribution.
 *    * Neither the name of the University nor the names of its contributors
 *      may be used to endorse or promote products derived from this
 *      software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

/**
 * @author Stefan Lankes
 * @file arch/x86/include/asm/stddef.h
 * @brief Standard datatypes
 *
 * This file contains typedefs for standard datatypes for numerical and character values.
 */

#ifndef __ARCH_STDDEF_H__
#define __ARCH_STDDEF_H__

#ifdef __cplusplus
extern "C" {
#endif

#define MAX_CORES 1 // Leviathan doesn't handle concurrency yet
#define MAX_TASKS 4 // need something

#define per_core(var) (var)

#define set_per_core(var, value) (var = value)

#if __SIZEOF_POINTER__ == 4

#define KERNEL_SPACE	(1UL << 30) /*  1 GiB */

/// This type is used to represent the size of an object.
typedef unsigned long size_t;
/// Pointer differences
typedef long ptrdiff_t;
/// It is similar to size_t, but must be a signed type.
typedef long ssize_t;
/// The type represents an offset and is similar to size_t, but must be a signed type.
typedef long off_t;
#elif __SIZEOF_POINTER__ == 8

#define KERNEL_SPACE (1ULL << 30)

// A popular type for addresses
typedef unsigned long long size_t;
/// Pointer differences
typedef long long ptrdiff_t;
typedef unsigned long uintptr_t;
#ifdef __KERNEL__
typedef long long ssize_t;
typedef long long off_t;
#endif
#else
#error unsupported architecture
#endif

/// Unsigned 64 bit integer
typedef unsigned long uint64_t;
/// Signed 64 bit integer
typedef long int64_t;
/// Unsigned 32 bit integer
typedef unsigned int uint32_t;
/// Signed 32 bit integer
typedef int int32_t;
/// Unsigned 16 bit integer
typedef unsigned short uint16_t;
/// Signed 16 bit integer
typedef short int16_t;
/// Unsigned 8 bit integer (/char)
typedef unsigned char uint8_t;
/// Signed 8 bit integer (/char)
///////////////////////typedef char int8_t;
/// 16 bit wide char type
typedef unsigned short wchar_t;

#ifndef _WINT_T
#define _WINT_T
typedef wchar_t wint_t;
#endif

/// This defines registers, which are saved for a "user-level" context swicth
typedef struct mregs {
	/// R15 register
	uint64_t r15;
	/// R14 register
	uint64_t r14;
	/// R13 register
	uint64_t r13;
	/// R12 register
	uint64_t r12;
	/// R9 register
	uint64_t r9;
	/// R8 register
	uint64_t r8;
	/// RDI register
	uint64_t rdi;
	/// RSI register
	uint64_t rsi;
	/// RBP register
	uint64_t rbp;
	/// RBX register
	uint64_t rbx;
	/// RDX register
	uint64_t rdx;
	/// RCX register
	uint64_t rcx;
	/// RSP register
	uint64_t rsp;
	/// RIP
	uint64_t rip;
	/// MXCSR
	uint32_t mxcsr;
} mregs_t;

/// This defines what the stack looks like after the task context is saved
struct state {
	/// GS register
	uint64_t gs;
	/// FS regsiter for TLS support
	uint64_t fs;
	/// R15 register
	uint64_t r15;
	/// R14 register
	uint64_t r14;
	/// R13 register
	uint64_t r13;
	/// R12 register
	uint64_t r12;
	/// R11 register
	uint64_t r11;
	/// R10 register
	uint64_t r10;
	/// R9 register
	uint64_t r9;
	/// R8 register
	uint64_t r8;
	/// RDI register
	uint64_t rdi;
	/// RSI register
	uint64_t rsi;
	/// RBP register
	uint64_t rbp;
	/// (pseudo) RSP register
	uint64_t rsp;
	/// RBX register
	uint64_t rbx;
	/// RDX register
	uint64_t rdx;
	/// RCX register
	uint64_t rcx;
	/// RAX register
	uint64_t rax;

	/// Interrupt number
	uint64_t int_no;

	// pushed by the processor automatically
	uint64_t error;
	uint64_t rip;
	uint64_t cs;
	uint64_t rflags;
	uint64_t userrsp;
	uint64_t ss;
};

typedef struct {
	void	*ss_sp;		/* Stack base or pointer.  */
	int	ss_flags;	/* Flags.  */
	size_t	ss_size;	/* Stack size.  */
} stack_t;

const int32_t is_uhyve(void);
const int32_t is_single_kernel(void);

const char* get_cmdline(void);
int init_rcce(void);
void print_cpu_status(int isle);

/**************************************************************
 * From include/hermit/stddef.h, not sure what else is needed *
 **************************************************************/
// size of the whole application
extern size_t image_size;

#define TIMER_FREQ	100 /* in HZ */
#define CLOCK_TICK_RATE	1193182 /* 8254 chip's internal oscillator frequency */
#define CACHE_LINE	64
#define HEAP_START	(PAGE_2M_CEIL(((size_t)&kernel_start + image_size + (16ULL << 10))))
#define HEAP_SIZE	(1ULL << 37)
#define KMSG_SIZE	0x1000
#define INT_SYSCALL	0x80
#define MAILBOX_SIZE	128
//#define WITH_PCI_IDS

#define BYTE_ORDER             LITTLE_ENDIAN

#define DYNAMIC_TICKS

#define UHYVE_PORT_WRITE		0x400
#define UHYVE_PORT_OPEN			0x440
#define UHYVE_PORT_CLOSE		0x480
#define UHYVE_PORT_READ			0x500
#define UHYVE_PORT_EXIT			0x540
#define UHYVE_PORT_LSEEK		0x580

#define UHYVE_PORT_PFAULT		0x511

// Networkports
#define UHYVE_PORT_NETINFO		0x600
#define UHYVE_PORT_NETWRITE		0x640
#define UHYVE_PORT_NETREAD		0x680
#define UHYVE_PORT_NETSTAT		0x700

/* Ports and data structures for uhyve command line arguments and envp
 * forwarding */
#define UHYVE_PORT_CMDSIZE		0x740
#define UHYVE_PORT_CMDVAL		0x780


#define BUILTIN_EXPECT(exp, b)		__builtin_expect((exp), (b))
//#define BUILTIN_EXPECT(exp, b)	(exp)
#define NORETURN			__attribute__((noreturn))

#define NULL 		((void*) 0)

/// represents a task identifier
typedef unsigned int tid_t;

#define DECLARE_PER_CORE(type, name) extern type name
#define DEFINE_PER_CORE(type, name, def_value) type name = def_value
#define DEFINE_PER_CORE_STATIC(type, name, def_value) static type name = def_value

/* needed to find the task, which is currently running on this core */
struct task;
DECLARE_PER_CORE(struct task*, current_task);

#if MAX_CORES > 1
/* allows fast access to the core id */
DECLARE_PER_CORE(uint32_t, __core_id);
#define CORE_ID per_core(__core_id)
#else
#define CORE_ID 0
#endif

#ifdef __cplusplus
}
#endif

#endif
