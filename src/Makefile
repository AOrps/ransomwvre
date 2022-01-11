SHELL=/bin/bash

# https://stackoverflow.com/questions/16924333/makefile-compiling-from-directory-to-another-directory

all = compile

# dep : Builds the dependency unless file exists
dep:
ifneq ($(wildcard ../v/v),)
# @echo "built v"
	@printf ""
else
# @echo "not built"
	@
endif

compile: clean
	@../v/v main.v

run: compile
	@./main

clean: dep
ifneq (,$(wildcard ./main))
	@rm ./main
endif