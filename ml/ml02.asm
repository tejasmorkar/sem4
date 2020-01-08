;Block Transfer non Overlapped without String Instruction

section .data
	msg0 db 10, "Assignment No. 2", 10, "---------------------------------------------", 10, "Block Transfer non Overlapped without String Instruction", 10
	msg0_len equ $-msg0
	msg1 db 10, "Before Transfer: "
	msg1_len equ $-msg1
	msg2 db 10, "After Tranfer: "
	msg2_len equ $-msg2
	msg3 db 10, "Source Block: "
	msg3_len equ $-msg3
	msg4 db 10, "Destination Block: "
	msg4_len equ $-msg4
	br db 10, 10
	br_len equ $-br
	
	sblock db 11h,22h,33h,44h,55h
	dblock times 5 db 0
	
section .bss
	char_ans resb 16

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
	 	mov rsi,sblock
		call _display

		PRINT msg2, msg2_len
		mov rsi,dblock-2
		call _display
		call block_transfer
		
		PRINT msg3, msg3_len
		mov rsi,sblock
		call _display

		PRINT msg4, msg4_len
		mov rsi,dblock-2
		call _display
	 	
	 	PRINT br, br_len
 		EXIT
 		
	_display:
		mov rbp,5
		next_num:
			mov al,[rsi]
			push rsi
			call display
			pop rsi
			inc rsi
			dec rbp
			jnz next_num
		PRINT br, br_len
		ret

		display:
			mov rbx,16
			mov rcx,2
			mov rsi,char_ans+1

		cnt:
			mov rdx,0
			div rbx
			cmp dl,09h
			jbe add30
			add dl,07h

		add30:
			add dl,30h
			mov [rsi],dl
			dec rsi
			dec rcx
			jnz cnt
			PRINT char_ans,2
			ret

		block_transfer:
		 	mov rsi,sblock+4
		 	mov rdi,dblock+2
		 	mov rcx,5
		 
			back:
		 	;mov al,[rsi]
		 	;mov [rdi],al
		 	;dec rsi
		 	;dec rdi
		 	;dec rcx
		 	;jnz back
		 	STD
		 	REP MOVSB
		ret
 		

