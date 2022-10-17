.data

str1:		.asciiz "Número na base: "
str2:		.asciiz "Número no expoente: "
str3:		.asciiz "Resultado final: "

.text
.globl main

main:		addiu $sp,$sp,-4
		sw $ra,0($sp)

		la $a0,str1
		li $v0,4
		syscall 
		li $v0,7
		syscall
		mov.d $f12,$f0
		
		
		la $a0,str2
		li $v0,4
		syscall
		li $v0,5
		syscall 
		move $a0,$v0
		
		jal xtoy
		mov.d $f12,$f0
		
		la $a0,str3
		li $v0,4
		syscall
		li $v0,3 
		syscall
		
		li $v0,0
		lw $ra,0($sp)
		addiu $sp,$sp,4
		
		jr $ra		
