.data
str1:		.asciiz "Numero: "
str2: 		.asciiz "Resultado: "
.text
.globl main

main:		addiu $sp,$sp,-4
		sw $ra, 0($sp)
		

		la $a0,str1
		li $v0,4
		syscall
		
		li $v0,7
		syscall
		
		mov.d $f12,$f0
		
		jal sqrt
		mov.d $f12,$f0
		
		
		la $a0,str2
		li $v0,4
		syscall
		
		
		li $v0,3
		syscall
		
		lw $ra,0($sp)
		addiu $sp,$sp,4
		
		
		jr $ra 