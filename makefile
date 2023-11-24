SCRIPT_AUTHOR=Radu Daia <radu.daia@pm.me>
SCRIPT_VERSION=v1.0
CC=g++
CFLAGS=-Wall
EXAMPLE_NAME=example
SRC=$(EXAMPLE_NAME).cpp
TYPES=int float double
MACRO_NAME=NUMERIC_TYPE

all: $(TYPES)
	ls -al $(EXAMPLE_NAME)_*

run: $(EXAMPLE_NAME)_* #$(eval SHELL:=/bin/bash)
	for ex in $(TYPES); do echo "$$ex case:"; ./$(EXAMPLE_NAME)_$$ex; done

%: $(SRC)
	$(CC) $^ $(CFLAGS) -D$(MACRO_NAME)=$@ -o $(EXAMPLE_NAME)_$@

.PHONY: clean

clean:
	rm -rf $(EXAMPLE_NAME)_*
