;write assembly code to find number of positive elements from 64 bit array

section .data
	msg0 db 10, "Positive/Negative elements from 64 bit array", 10
	msg0_len equ $-msg0
	msg1 db "---------------------------------------------", 10
	msg1_len equ $-msg1
	msg2 db 10, "The number of positive elements are: "
	msg2_len equ $-msg2
	msg3 db 10, "The number of negative elements are: "
	msg3_len equ $-msg3
	br db 10, 10
	br_len equ $-br ;$

%MACRO PRINT 2
	MOV rax, 1
	MOV rdi, 1
	MOV rsi, %1
	MOV rdx, %2
	SYSCALL
%ENDMACRO

%MACRO EXIT 0
	MOV rax, 60
	MOV rdi, 0
	SYSCALL
%ENDMACRO
	
section .text
	 global _start
	 _start:
	 	PRINT msg0, msg0_len
	 	PRINT msg1, msg1_len
	 	PRINT msg2, msg2_len
	 	PRINT msg3, msg3_len
	 	
	 	PRINT br, br_len
 		EXIT

