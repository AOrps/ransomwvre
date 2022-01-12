# Default SHELL
SHELL=/bin/bash

# Build Defaults
SOURCEDIR = src
EXECUTABLE = ransomwvre

all : compile

dep: 
ifneq (,$(wildcard ./v))
# V source compiled into dir
	@printf ""
else
# V source not compiled into dir
	@./$(SOURCEDIR)/dep.sh
endif

compile: dep clean
	@./v/v $(SOURCEDIR)/main.v
	@mv $(SOURCEDIR)/main $(EXECUTABLE)

run: compile
	@./$(EXECUTABLE)

clean:
ifneq (,$(wildcard ./$(EXECUTABLE)))
	@rm $(EXECUTABLE)
endif

cclean: clean
ifneq (,$(wildcard ./v))
	@rm -rf ./v
	@rm test/enc.txt
endif