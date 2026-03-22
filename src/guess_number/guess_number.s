
global main
extern printf
extern scanf
	
section .data
	gameTitle db "Угадай число", 0xa, 0
	win db "Вы угадали!", 0xa, 0
	seed dd 1
	fmti db "%d", 10, 0	
	range dd 100
	tst dd 0
	
section .text
 
main:
	push rbp
	mov rdi, gameTitle
	xor rax, rax
	call printf
	pop rbp
	xor rax, rax
	
	call get_random_value

	call game_loop
	call print_int

	mov rdi, 0
	mov rax, 60
	syscall

game_loop:
	mov rcx, fmti
	mov rdx, tst
	
	call scanf
	
	ret

print_int:
	push rbp
	mov rdi, fmti
	mov rsi, [tst]
	xor rax, rax
	call printf   	 
 	pop rbp
	xor rax, rax
	ret
get_random_value:
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
	
	ret
	
