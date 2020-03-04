PROG=spinlock
FLAGS=
FILES=main.c spinlock.c tasks.c ../dummy.c

RAMBLR=../../../ramblr/ramblr_execution_wrapper.py
ANGR=../../../ramblr/angr_thy_gen.py
DUMP=../../../ramblr/data_dump.py

FUNCTIONS=spinlock_init spinlock_destroy spinlock_lock spinlock_unlock \
spinlock_irqsave_init spinlock_irqsave_destroy spinlock_irqsave_lock \
spinlock_irqsave_unlock \
atomic_int64_test_and_set atomic_int64_inc atomic_int64_read atomic_int64_set

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
