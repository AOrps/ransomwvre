# Default SHELL
SHELL=/bin/bash

# Build Defaults
SOURCEDIR = src
EXECUTABLE = ransomwvre


all : compile

dep: 
ifneq (,$(wildcard ./v))
# V compiled into dir
	@printf ""
else
# V not compiled into dir
	@./$(SOURCEDIR)/dep.sh
endif

compile: dep clean
	@./v/v $(SOURCEDIR)/main.v
	@mv $(SOURCEDIR)/main.v $(EXECUTABLE)
	@rm $(SOURCEDIR)/main

clean:
ifneq (,$(wildcard ./$(EXECUTABLE)))
	@rm $(EXECUTABLE)
endif