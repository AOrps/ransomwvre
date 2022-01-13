# Default SHELL
SHELL=/bin/bash

# Build Defaults
SOURCEDIR = src
EXECUTABLE = ransomwvre

# Testing Defaults
TESTDIR = test

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

# test: outputs result from command line encryption and decryption
test: compile
# Initializes test file
	@cat $(TESTDIR)/file3.txt > $(TESTDIR)/enc.txt
# Start Case
	@echo "Start"
	@echo "+++++++++++++++++++++++++++++++++++++++++++++++"
	@cat $(TESTDIR)/enc.txt 
	@echo -e "\n+++++++++++++++++++++++++++++++++++++++++++++++"
	@echo ""

# Encryption
	@echo "Encryption"
	@echo "-----------------------------------------------" 
	@./$(EXECUTABLE) -x $(TESTDIR)/enc.txt
	@cat $(TESTDIR)/enc.txt 
	@echo -e "\n-----------------------------------------------"
	@echo ""

# Decryption
	@echo "Decryption"
	@echo "==============================================="
	@./$(EXECUTABLE) -d $(TESTDIR)/enc.txt
	@cat $(TESTDIR)/enc.txt 
	@echo -e "\n==============================================="
	@echo ""


clean:
ifneq (,$(wildcard ./$(EXECUTABLE)))
	@rm $(EXECUTABLE)
endif

cclean: clean
ifneq (,$(wildcard ./v))
	@rm -rf ./v
	@rm $(TESTDIR)/enc.txt
endif