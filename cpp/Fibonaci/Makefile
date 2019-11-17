MAIN = main
HEADERS = fibonaci
CC = g++ -std=c++11
COMPILE = -c
EXE = $(MAIN)
OPTIMIZE = -Os
SHELL = /bin/bash
ARGS = 3

all: link
	@echo "Executing....."
	@echo ">>> Output <<<"
	@$(SHELL) -c './$(EXE) $(ARGS)'
link: compile
	@echo -n "Linking..."
	@$(SHELL) -c '$(CC) -o $(EXE) *.o'
compile: $(MAIN).cpp $(HEADERS).cpp
	@echo -n "Compiling..."
	@$(SHELL) -c '$(CC) $(OPTIMIZE) $(COMPILE) $^'
clean:
	@echo "Cleaning..."
	@$(SHELL) -c 'rm -f *~ *.o $(EXE)'
