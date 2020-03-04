# Make sure the Leviathan setup script has been run before using.

PROG=qemu_img_xen
FLAGS=
ACODE_FLAGS=-c
EXAMPLES=$(LEVIATHAN)/../examples
DUMMYDATA=$(EXAMPLES)/dummy.data

.PHONY: all

all:
	code-abstraction $(PROG).objdump $(DUMMYDATA) $(PROG).config $(ACODE_FLAGS) > $(PROG).out
