
global _start

section .data	
	hello: db 'Hello, World!', 0xa ; строка с переводом каретки на новуюстроку (0xa)
	helloLen: equ $-hello

section .text

_start:

	mov rax, 1 ; системный вызов(обращение к ядру) для write
	mov rdi, 1 ; файловый дескритор для вывода - 1(stdout)
	mov rsi, hello 		; адрес строки
	mov rdx, helloLen 	; длина строки
	syscall
	mov rax, 60 		; код ошибки 0(все успешно)
	mov rdi, 0		; системный вызов для exit
	syscall 		; выполняю системный вызов
	
