SHELL=/bin/bash

all = compile

compile: clean
	@../v/v main.v

run: compile
	@./main

clean:
ifneq (,$(wildcard ./main))
	@rm ./main
endif