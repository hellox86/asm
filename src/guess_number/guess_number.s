global main
extern printf
extern scanf
section .bss
	seed resd 1
	number resd 1
section .data
	fmt db "%u", 0xa, 0
	fmtout db "%d", 0
	winout db "Вы выиграли", 0xa, 0
	sstart db "Угадай число", 0xa, 0
	range dd 100

section .text
	
main:
	;; game string
	mov rdi, sstart
	xor rax, rax
	call printf

	;; get time
	
	mov rax, 201
	mov rdi, seed
	syscall
	

	mov rax, [seed]
	shl rax, 13
	xor rax, [seed]
	mov [seed], rax

	mov rax, [seed]
	shr rax, 17
	xor rax, [seed]
	mov [seed], rax

	mov rax, [seed]
	shl rax, 5
	xor rax, [seed]
	mov [seed], rax

	mov rax, [seed]
	mov rcx, [range]
	xor rdx, rdx
	div rcx
	mov [seed], rdx
	
	mov rdi, fmt
	mov rsi, [seed]
	xor rax, rax
	call printf

loop:
	mov eax, [seed]
	mov ebx, [number]
	
	cmp eax, ebx
	je exit
	push rbp
	mov rdi, fmtout
	mov rsi, number
	call scanf
	pop rbp
	

	jmp loop
	
exit:		
	mov rdi, winout
	xor rax, rax
	call printf

	mov rdi, 0
	mov rax, 60
	syscall
	

