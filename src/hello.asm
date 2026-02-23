
global _start 			; Делаю видимым для линкера метку start
section .data	
	hello: db 'Hello, World!', 0xa ; строка с переводом каретки на новуюстроку (0xa)
	helloLen: equ $-hello

section .text

_start:

	mov eax, 4 ; системный вызов(обращение к ядру) для write
	mov ebx, 1 ; файловый дескритор для вывода - 1(stdout)
	mov ecx, hello 		; адрес строки
	mov edx, helloLen 	; длина строки
	int 0x80
	mov ebx, 0 		; код ошибки 0(все успешно)
	mov eax, 0x1		; системный вызов для exit
	int 0x80 		; выполняю системный вызов
	
