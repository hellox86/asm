.SILENT:
all: 
	nasm -f elf64 -o program.o guess_number.s
	gcc -m64 program.o -o program -lc -no-pie
	rm -rf program.o
run:
	./program
