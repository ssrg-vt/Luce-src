# Make sure the Artifact setup script has been run before using.

PROG=example
FLAGS=-std=c99
ACODE_FLAGS=
FILES=$(PROG).c
EXAMPLES=$(ARTIFACT)/../examples
PROGDIR=$(EXAMPLES)/paper_example
PROGPATH=$(PROGDIR)/$(PROG)
ACODE=$(ARTIFACT)/../code_abstraction
DUMMYDATA=$(EXAMPLES)/dummy.data

default:
	$(CC) $(FLAGS) $(FILES) -o $(PROG)
	objdump -M intel -M hex --no-show-raw-insn -d $(PROG) > $(PROG).objdump
	cd $(ACODE); ./main $(ACODE_FLAGS) $(PROGPATH).objdump $(DUMMYDATA) $(PROGPATH).config > $(PROGPATH).out

# Cannot use optimized version, has Z3 error
#opt:
#	$(CC) $(FLAGS) -O3 $(FILES) -o $(PROG)_opt
#	objdump -M intel -M hex --no-show-raw-insn -d $(PROG)_opt > $(PROG)_opt.objdump
#	cd $(ACODE); ./main $(ACODE_FLAGS) $(PROGPATH)_opt.objdump $(DUMMYDATA) $(PROGPATH).config > $(PROGPATH)_opt.out
