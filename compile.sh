#!/bin/bash
# elf это executable and linkable file, elf32 и elf_i386 - 32битный exe, хоть и понятия не совсем одинаковы, но так проще

if [[ $(grep -i Microsoft /proc/version) ]]; then
	nasm -f elf64 -o program.o src/hello.asm 
	ld -m elf_x86_64 -o program program.o
	rm -rf program.o	
else
	nasm -f elf32 -o program.o src/hello.asm # Компилирую asm file в machine code
	ld -m elf_i386 -o program program.o # Использую линкер чтобы скомпоновать program.o в executable файл
	rm -rf program.o	
fi
