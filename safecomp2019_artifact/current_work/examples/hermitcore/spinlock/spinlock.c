/*
 * Copyright (c) 2011, Stefan Lankes, RWTH Aachen University
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
 * @file include/hermit/spinlock.h
 * @brief Spinlock functions
 */

#include "../dummy.h"
#include "../errno.h"
#include "../spinlock_types.h"
#include "../tasks_types.h"
#include "../x64_atomic64.h"

#ifdef __cplusplus
extern "C" {
#endif

#define PAUSE	asm volatile ("pause" ::: "memory")

/** @brief Initialization of a spinlock
 *
 * Initialize each spinlock before use!
 *
 * @param s Pointer to the spinlock structure to initialize.
 * @return
 * - 0 on success
 * - -EINVAL (-22) on failure
 */
//inline static
int spinlock_init(spinlock_t* s) {
	if (BUILTIN_EXPECT(!s, 0))
		return -EINVAL;

	atomic_int64_set(&s->queue, 0);
	atomic_int64_set(&s->dequeue, 1);
	s->owner = MAX_TASKS;
	s->counter = 0;

	return 0;
}

/** @brief Destroy spinlock after use
 * @return
 * - 0 on success
 * - -EINVAL (-22) on failure
 */
//inline static
int spinlock_destroy(spinlock_t* s) {
	if (BUILTIN_EXPECT(!s, 0))
		return -EINVAL;

	s->owner = MAX_TASKS;
	s->counter = 0;

	return 0;
}

/** @brief Lock spinlock at entry of critical section
 * @return
 * - 0 on success
 * - -EINVAL (-22) on failure
 */
//inline static
int spinlock_lock(spinlock_t* s) {
	if (BUILTIN_EXPECT(!s, 0))
		return -EINVAL;

	task_t* curr_task = per_core(current_task);
	if (s->owner == curr_task->id) {
		s->counter++;
		return 0;
	}

	int64_t ticket = atomic_int64_inc(&s->queue);
	while(atomic_int64_read(&s->dequeue) != ticket) {
		PAUSE;
	}
	s->owner = curr_task->id;
	s->counter = 1;

	return 0;
}

/** @brief Unlock spinlock on exit of critical section
 * @return
 * - 0 on success
 * - -EINVAL (-22) on failure
 */
//inline static
int spinlock_unlock(spinlock_t* s) {
	if (BUILTIN_EXPECT(!s, 0))
		return -EINVAL;

	s->counter--;
	if (!s->counter) {
		s->owner = MAX_TASKS;
		atomic_int64_inc(&s->dequeue);
	}

	return 0;
}

/** @brief Initialization of a irqsave spinlock
 *
 * Initialize each irqsave spinlock before use!
 *
 * @return
 * - 0 on success
 * - -EINVAL (-22) on failure
 */
//inline static
int spinlock_irqsave_init(spinlock_irqsave_t* s) {
	if (BUILTIN_EXPECT(!s, 0))
		return -EINVAL;

	atomic_int64_set(&s->queue, 0);
	atomic_int64_set(&s->dequeue, 1);
	s->owner = MAX_TASKS;
	s->counter = 0;
	s->flags = 0;

	return 0;
}

/** @brief Destroy irqsave spinlock after use
 * @return
 * - 0 on success
 * - -EINVAL (-22) on failure
 */
//inline static
int spinlock_irqsave_destroy(spinlock_irqsave_t* s) {
	if (BUILTIN_EXPECT(!s, 0))
		return -EINVAL;

	s->owner = MAX_TASKS;
	s->counter = 0;
	s->flags = 0;

	return 0;
}

/** @brief Lock spinlock on entry of critical section and disable interrupts
 * @return
 * - 0 on success
 * - -EINVAL (-22) on failure
 */
//inline static
int spinlock_irqsave_lock(spinlock_irqsave_t* s) {
	if (BUILTIN_EXPECT(!s, 0))
		return -EINVAL;

	uint8_t flags = irq_nested_disable();

	task_t* curr_task = per_core(current_task);
	if (s->owner == curr_task->id) {
		s->counter++;
		return 0;
	}

	int64_t ticket = atomic_int64_inc(&s->queue);
	while (atomic_int64_read(&s->dequeue) != ticket) {
		PAUSE;
	}

	s->flags = flags;
	s->owner = curr_task->id;
	s->counter = 1;

	return 0;
}

/** @brief Unlock spinlock on exit of critical section and re-enable interrupts
 * @return
 * - 0 on success
 * - -EINVAL (-22) on failure
 */
//inline static
int spinlock_irqsave_unlock(spinlock_irqsave_t* s) {
	if (BUILTIN_EXPECT(!s, 0))
		return -EINVAL;

	s->counter--;
	if (!s->counter) {
		s->owner = MAX_TASKS;
		atomic_int64_inc(&s->dequeue);
		irq_nested_enable(s->flags);
	}

	return 0;
}

#ifdef __cplusplus
}
#endif
