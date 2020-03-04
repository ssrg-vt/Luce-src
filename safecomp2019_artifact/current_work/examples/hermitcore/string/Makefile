PROG=string
FLAGS=

RAMBLR=../../../ramblr/ramblr_execution_wrapper.py
ANGR=../../../ramblr/angr_thy_gen.py
DUMP=../../../ramblr/data_dump.py

FUNCTIONS=_memcpy _memset _memcmp _strlen _strncpy _strcpy _strcmp _strncmp

default:
	$(CC) $(FLAGS) $(PROG).c -o $(PROG)
	$(RAMBLR) -i $(PROG) -o $(PROG).s
	$(ANGR) -i $(PROG) -o $(shell pwd) $(FUNCTIONS)
	$(DUMP) -i $(PROG) -o $(PROG).json $(FUNCTIONS)

opt:
	$(CC) $(FLAGS) -O3 $(PROG).c -o $(PROG)_opt
	$(RAMBLR) -i $(PROG)_opt -o $(PROG)_opt.s
	$(ANGR) -i $(PROG)_opt -o $(shell pwd) -s _opt $(FUNCTIONS)
	$(DUMP) -i $(PROG)_opt -o $(PROG)_opt.json $(FUNCTIONS)
