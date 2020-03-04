PROG=tasks
FLAGS=
FILES=$(PROG).c ../spinlock/spinlock.c ../dummy.c

RAMBLR=../../../ramblr/ramblr_execution_wrapper.py
ANGR=../../../ramblr/angr_thy_gen.py
DUMP=../../../ramblr/data_dump.py

FUNCTIONS=task_list_remove_task task_list_push_back task_list_pop_front \
readyqueues_push_back readyqueues_remove get_task multitasking_init \
is_task_available get_readyqueue set_idle_task get_next_core_id \
block_current_task msb

FUNCTIONS_OPT=task_list_remove_task task_list_push_back task_list_pop_front \
readyqueues_push_back readyqueues_remove get_task multitasking_init \
is_task_available get_readyqueue set_idle_task get_next_core_id \
block_current_task

default:
	$(CC) $(FLAGS) $(FILES) -o $(PROG)
	$(RAMBLR) -i $(PROG) -o $(PROG).s
	$(ANGR) -i $(PROG) -o $(shell pwd) $(FUNCTIONS)
	$(DUMP) -i $(PROG) -o $(PROG).json $(FUNCTIONS)

opt:
	$(CC) $(FLAGS) -O3 $(FILES) -o $(PROG)_opt
	$(RAMBLR) -i $(PROG)_opt -o $(PROG)_opt.s
	$(ANGR) -i $(PROG)_opt -o $(shell pwd) -s _opt $(FUNCTIONS_OPT)
	$(DUMP) -i $(PROG)_opt -o $(PROG)_opt.json $(FUNCTIONS_OPT)
