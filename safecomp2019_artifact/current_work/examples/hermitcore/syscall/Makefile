PROG=syscall
FLAGS=
FILES=$(PROG).c tasks.c ../spinlock/spinlock.c ../dummy.c

RAMBLR=../../../ramblr/ramblr_execution_wrapper.py
ANGR=../../../ramblr/angr_thy_gen.py
DUMP=../../../ramblr/data_dump.py

FUNCTIONS=sys_getpid sys_getprio sys_setprio socket_send socket_recv readv \
writev uhyve_send sys_write sys_open sys_close sys_read sys_spinlock_init \
sys_spinlock_destroy sys_spinlock_lock sys_spinlock_unlock sys_sem_init \
sys_sem_destroy sys_sem_wait sys_sem_post sys_sem_timedwait \
sys_sem_cancelablewait sys_clone

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
