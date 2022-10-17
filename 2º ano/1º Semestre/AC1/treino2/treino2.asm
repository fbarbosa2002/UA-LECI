.data

str1:		.asciiz "Dividendo: "
str2:		.asciiz "Divisor: "
str3:		.asciiz "Resultado: "
.text
.globl main
main:		addiu $sp,$sp,-4
		sw $ra,0($sp)
		
		la $a0,str1
		li $v0,4 
		syscall
		
		li $v0,5
		syscall
		move $t0,$v0
		
		la $a0,str2
		li $v0,4 
		syscall
		
		li $v0,5
		syscall
		move $t1,$v0
		
		
		la $a0,str3
		li $v0,4
		syscall
		
		move $a0,$t0
		move $a1,$t1
		jal divv
		move $a0,$v0
		li $v0,1
		syscall
		
		
		
		lw $ra,0($sp)
		addiu $sp,$sp,4
		jr $ra	
