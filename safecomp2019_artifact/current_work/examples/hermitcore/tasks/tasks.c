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
#include "../dummy.h"
#include "../errno.h"
#include "../spinlock.h"
#include "../tasks_types.h"

/*
 * Note that linker symbols are not variables, they have no memory allocated for
 * maintaining a value, rather their address is their value.
 */
extern atomic_int32_t cpu_online;

volatile uint32_t go_down = 0;

/** @brief Array of task structures (aka PCB)
 *
 * A task's id will be its position in this array.
 */
static task_t task_table[MAX_TASKS] = { \
        [0]                 = {0, TASK_IDLE, 0, NULL, NULL, NULL, TASK_DEFAULT_FLAGS, 0, 0, 0, 0, NULL, 0, NULL, NULL, 0, 0, 0, NULL, FPU_STATE_INIT}, \
        [1 ... MAX_TASKS-1] = {0, TASK_INVALID, 0, NULL, NULL, NULL, TASK_DEFAULT_FLAGS, 0, 0, 0, 0, NULL, 0, NULL, NULL, 0, 0, 0, NULL, FPU_STATE_INIT}};

static spinlock_irqsave_t table_lock = SPINLOCK_IRQSAVE_INIT;

#if MAX_CORES > 1
static readyqueues_t readyqueues[MAX_CORES] = { \
		[0 ... MAX_CORES-1]   = {NULL, NULL, 0, 0, 0, {[0 ... MAX_PRIO-2] = {NULL, NULL}}, {NULL, NULL}, SPINLOCK_IRQSAVE_INIT}};
#else
static readyqueues_t readyqueues[1] = {[0] = {task_table+0, NULL, 0, 0, 0, {[0 ... MAX_PRIO-2] = {NULL, NULL}}, {NULL, NULL}, SPINLOCK_IRQSAVE_INIT}};
#endif

DEFINE_PER_CORE(task_t*, current_task, task_table+0);

#if MAX_CORES > 1
DEFINE_PER_CORE(uint32_t, __core_id, 0);
#endif

/*static inline*/
void task_list_remove_task(task_list_t* list, task_t* task)
{
	if (task->prev)
		task->prev->next = task->next;

	if (task->next)
		task->next->prev = task->prev;

	if (list->last == task)
		list->last = task->prev;

	if (list->first == task)
		list->first = task->next;
}

/*static inline*/
void task_list_push_back(task_list_t* list, task_t* task)
{
	if(BUILTIN_EXPECT((task == NULL) || (list == NULL), 0)) {
		return;
	}

	if (list->last) {
		task->prev = list->last;
		task->next = NULL;
		list->last->next = task;
		list->last = task;
	} else {
		list->last = list->first = task;
		task->next = task->prev = NULL;
	}
}

/*static inline*/
task_t* task_list_pop_front(task_list_t* list)
{
	if(BUILTIN_EXPECT((list == NULL), 0)) {
		return NULL;
	}

	task_t* task = list->first;

	if(list->first) {
		// advance list
		list->first = list->first->next;

		if(list->first) {
			// first element has no previous element
			list->first->prev = NULL;
		} else {
			// no first element => no last element either
			list->last = NULL;
		}
	}

	task->next = task->prev = NULL;
	return task;
}

/*static inline*/
void readyqueues_push_back(uint32_t core_id, task_t* task)
{
	// idle task (prio=0) doesn't have a queue
	task_list_t* readyqueue = &readyqueues[core_id].queue[task->prio - 1];

	task_list_push_back(readyqueue, task);

	// update priority bitmap
	readyqueues[core_id].prio_bitmap |= (1 << task->prio);
}

/*static inline*/
void readyqueues_remove(uint32_t core_id, task_t* task)
{
	// idle task (prio=0) doesn't have a queue
	task_list_t* readyqueue = &readyqueues[core_id].queue[task->prio - 1];

	task_list_remove_task(readyqueue, task);

	// no valid task in queue => update priority bitmap
	if (readyqueue->first == NULL)
		readyqueues[core_id].prio_bitmap &= ~(1 << task->prio);
}

int get_task(tid_t id, task_t** task)
{
	if (BUILTIN_EXPECT(task == NULL, 0)) {
		return -ENOMEM;
	}

	if (BUILTIN_EXPECT(id >= MAX_TASKS, 0)) {
		return -ENOENT;
	}

	if (BUILTIN_EXPECT(task_table[id].status == TASK_INVALID, 0)) {
		return -EINVAL;
	}

	*task = &task_table[id];

	return 0;
}

int multitasking_init(void)
{
	uint32_t core_id = CORE_ID;

	if (BUILTIN_EXPECT(task_table[0].status != TASK_IDLE, 0)) {
		LOG_ERROR("Task 0 is not an idle task\n");
		return -ENOMEM;
	}

	task_table[0].prio = IDLE_PRIO;
	task_table[0].stack = NULL; // will be initialized later
	task_table[0].ist_addr = NULL; // will be initialized later
	set_per_core(current_task, task_table+0);

	readyqueues[core_id].idle = task_table+0;

	return 0;
}

int is_task_available(void)
{
	uint32_t core_id = CORE_ID;

	return readyqueues[core_id].nr_tasks > 0 ? 1 : 0;
}

void* get_readyqueue(void)
{
	return &readyqueues[CORE_ID];
}

tid_t set_idle_task(void)
{
	uint32_t core_id = CORE_ID;
	tid_t id = ~0;

	spinlock_irqsave_lock(&table_lock);

	for(uint32_t i=0; i<MAX_TASKS; i++) {
		if (task_table[i].status == TASK_INVALID) {
			task_table[i].id = id = i;
			task_table[i].status = TASK_IDLE;
			task_table[i].last_core = core_id;
			task_table[i].last_stack_pointer = NULL;
			task_table[i].stack = NULL;
			task_table[i].ist_addr = NULL;
			task_table[i].prio = IDLE_PRIO;
			task_table[i].heap = NULL;
			readyqueues[core_id].idle = task_table+i;
			set_per_core(current_task, readyqueues[core_id].idle);

			break;
		}
	}

	spinlock_irqsave_unlock(&table_lock);

	return id;
}

// static
uint32_t get_next_core_id(void)
{
	uint32_t i;
	static uint32_t core_id = MAX_CORES;

	if (core_id >= MAX_CORES)
		core_id = CORE_ID;

	// we assume OpenMP applications
	// => number of threads is (normaly) equal to the number of cores
	// => search next available core
	for(i=0, core_id=(core_id+1)%MAX_CORES; i<2*MAX_CORES; i++, core_id=(core_id+1)%MAX_CORES)
		if (readyqueues[core_id].idle)
			break;

	if (BUILTIN_EXPECT(!readyqueues[core_id].idle, 0)) {
		LOG_ERROR("BUG: no core available!\n");
		return MAX_CORES;
	}

	return core_id;
}

// Not verified but needed for a subcall
int block_task(tid_t id)
{
	task_t* task;
	uint32_t core_id;
	int ret = -EINVAL;
	uint8_t flags;

	flags = irq_nested_disable();

	task = &task_table[id];
	core_id = task->last_core;

	if (task->status == TASK_RUNNING) {
		LOG_DEBUG("block task %d on core %d\n", id, core_id);

		task->status = TASK_BLOCKED;

		spinlock_irqsave_lock(&readyqueues[core_id].lock);

		// remove task from ready queue
		readyqueues_remove(core_id, task);

		// reduce the number of ready tasks
		readyqueues[core_id].nr_tasks--;
		LOG_DEBUG("update nr_tasks on core %d to %d\n", core_id, readyqueues[core_id].nr_tasks);

		spinlock_irqsave_unlock(&readyqueues[core_id].lock);

		ret = 0;
	}

	irq_nested_enable(flags);

	return ret;
}

int block_current_task(void)
{
	return block_task(per_core(current_task)->id);
}

#include "../x64_processor.h"
int main()
{
	return msb(0);
}
