PROG=dequeue
FLAGS=

RAMBLR=../../../forked_ramblr/ramblr_execution_wrapper.py

default:
	$(CC) $(FLAGS) $(PROG).c -o $(PROG)
	$(RAMBLR) -i $(PROG) -o $(PROG).s

opt:
	$(CC) $(FLAGS) -O3 $(PROG).c -o $(PROG)_opt
	$(RAMBLR) -i $(PROG)_opt -o $(PROG)_opt.s
