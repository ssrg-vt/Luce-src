#ifndef __X64_PROCESSOR_H__
#define __X64_PROCESSOR_H__

#include "hstddef.h"

// Stuff from arch/x86_64/include/asm/processor.h

/** @brief search the first most significant bit
 *
 * @param i source operand
 * @return
 * - first bit, which is set in the source operand
 * - invalid value, if not bit ist set
 */
static inline size_t msb(size_t i)
{
	size_t ret;

	if (!i)
		return (sizeof(size_t)*8);
	asm volatile ("bsr %1, %0" : "=r"(ret) : "r"(i) : "cc");

	return ret;
}

// Can't use actual processor stuff right now so stubbing this out
inline static uint64_t get_rdtsc(void) {
	return 0;
}

#endif // __X64_PROCESSOR_H__
