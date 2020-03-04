PROG=buddy
FLAGS=
FILES=$(PROG).c ../spinlock/spinlock.c ../spinlock/tasks.c ../dummy.c

RAMBLR=../../../ramblr/ramblr_execution_wrapper.py
ANGR=../../../ramblr/angr_thy_gen.py
DUMP=../../../ramblr/data_dump.py
FUNCTIONS=buddy_large_avail buddy_exp buddy_get buddy_put palloc

default:
	$(CC) $(FLAGS) $(FILES) -o $(PROG)
	$(RAMBLR) -i $(PROG) -o $(PROG).s
	$(ANGR) -i $(PROG) -o $(shell pwd) $(FUNCTIONS)
	$(DUMP) -i $(PROG) -o $(PROG).json $(FUNCTIONS)

opt:
	$(CC) $(FLAGS) -O3 $(FILES) -o $(PROG)_opt
	$(RAMBLR) -i $(PROG)_opt -o $(PROG)_opt.s
	$(ANGR) -i $(PROG)_opt -o $(shell pwd) -s _opt $(FUNCTIONS)
	$(DUMP) -i $(PROG)_opt -o $(PROG)_opt.json $(FUNCTIONS)
