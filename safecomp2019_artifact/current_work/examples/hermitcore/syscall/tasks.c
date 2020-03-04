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
#include "../tasks_types.h"

/** @brief Array of task structures (aka PCB)
 *
 * A task's id will be its position in this array.
 */
static task_t task_table[MAX_TASKS] = { \
        [0]                 = {0, TASK_IDLE, 0, NULL, NULL, NULL, TASK_DEFAULT_FLAGS, 0, 0, 0, 0, NULL, 0, NULL, NULL, 0, 0, 0, NULL, FPU_STATE_INIT}, \
        [1 ... MAX_TASKS-1] = {0, TASK_INVALID, 0, NULL, NULL, NULL, TASK_DEFAULT_FLAGS, 0, 0, 0, 0, NULL, 0, NULL, NULL, 0, 0, 0, NULL, FPU_STATE_INIT}};

// make this define is only used once per executable (the declare in tasks_types
// can be used wherever, of course)
DEFINE_PER_CORE(task_t*, current_task, task_table+0);
