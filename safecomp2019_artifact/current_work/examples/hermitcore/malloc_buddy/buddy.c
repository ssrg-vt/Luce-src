/*
 * Copyright (c) 2014, Steffen Vogel, RWTH Aachen University
 *                     All rights reserved.
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
 * @author Steffen Vogel <steffen.vogel@rwth-aachen.de>
 */

#define __KERNEL__

#include "malloc.h"
#include "../dummy.h"
#include "../spinlock.h"
#include "../vma.h"
#include "../x64_page.h"

#define BUILTIN_EXPECT(exp, b)  __builtin_expect((exp), (b))

/// A linked list for each binary size exponent
static buddy_t* buddy_lists[BUDDY_LISTS] = { [0 ... BUDDY_LISTS-1] = NULL };

extern spinlock_irqsave_t hermit_mm_lock;
spinlock_irqsave_t hermit_mm_lock;

/** @brief Check if larger free buddies are available */
int buddy_large_avail(uint8_t exp)
{
	while ((exp<BUDDY_MAX) && !buddy_lists[exp-BUDDY_MIN])
		exp++;

	return exp != BUDDY_MAX;
}

/** @brief Calculate the required buddy size */
int buddy_exp(size_t sz)
{
	int exp;
	for (exp=0; sz>(1<<exp); exp++);

	if (exp > BUDDY_MAX)
		exp = 0;
	if (exp < BUDDY_MIN)
		exp = BUDDY_MIN;

	return exp;
}

/** @brief Get a free buddy by potentially splitting a larger one */
buddy_t* buddy_get(uint8_t exp)
{
	spinlock_irqsave_lock(&hermit_mm_lock);
	buddy_t** list = &buddy_lists[exp-BUDDY_MIN];
	buddy_t* buddy = *list;
	buddy_t* split;

	if (buddy)
		// there is already a free buddy =>
		// we remove it from the list
		*list = buddy->next;
	else if ((exp >= BUDDY_ALLOC) && !buddy_large_avail(exp))
		// theres no free buddy larger than exp =>
		// we can allocate new memory
		buddy = (buddy_t*) palloc(1<<exp, VMA_HEAP);
	else {
		// we recursivly request a larger buddy...
		buddy = buddy_get(exp+1);
		if (BUILTIN_EXPECT(!buddy, 0))
			goto out;

		// ... and split it, by putting the second half back to the list
		split = (buddy_t*) ((size_t) buddy + (1<<exp));
		split->next = *list;
		*list = split;
	}

out:
	spinlock_irqsave_unlock(&hermit_mm_lock);

	return buddy;
}

/** @brief Put a buddy back to its free list
 *
 * TODO: merge adjacent buddies (memory compaction)
 */
void buddy_put(buddy_t* buddy)
{
	spinlock_irqsave_lock(&hermit_mm_lock);
	buddy_t** list = &buddy_lists[buddy->prefix.exponent-BUDDY_MIN];
	buddy->next = *list;
	*list = buddy;
	spinlock_irqsave_unlock(&hermit_mm_lock);
}

void* palloc(size_t sz, uint32_t flags)
{
	size_t phyaddr, viraddr, bits;
	uint32_t npages = PAGE_CEIL(sz) >> PAGE_BITS;
	int err;

	LOG_DEBUG("palloc(%zd) (%u pages)\n", sz, npages);

	// get free virtual address space
	viraddr = vma_alloc(PAGE_CEIL(sz), flags);
	if (BUILTIN_EXPECT(!viraddr, 0))
		return NULL;

	// get continous physical pages
	phyaddr = get_pages(npages);
	if (BUILTIN_EXPECT(!phyaddr, 0)) {
		vma_free(viraddr, viraddr+npages*PAGE_SIZE);
		return NULL;
	}

	//TODO: interpretation of from (vma) flags is missing
	bits = PG_RW|PG_GLOBAL|PG_NX;

	// map physical pages to VMA
	err = page_map(viraddr, phyaddr, npages, bits);
	if (BUILTIN_EXPECT(err, 0)) {
		vma_free(viraddr, viraddr+npages*PAGE_SIZE);
		put_pages(phyaddr, npages);
		return NULL;
	}

	return (void*) viraddr;
}

int main(int argc, char* argv[]) {
	int y = buddy_exp(argc);
	buddy_t* b = buddy_get(argc);
    buddy_put(b);

	return y;
}
