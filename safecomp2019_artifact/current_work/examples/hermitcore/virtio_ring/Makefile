PROG=virtio_ring
FLAGS=
FILES=$(PROG).c

RAMBLR=../../../ramblr/ramblr_execution_wrapper.py
ANGR=../../../ramblr/angr_thy_gen.py
DUMP=../../../ramblr/data_dump.py

FUNCTIONS=vring_init vring_size vring_need_event

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
