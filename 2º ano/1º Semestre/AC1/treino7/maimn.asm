.data
str1:		.asciiz "Numero: "
str2:		.asciiz "Expoente do numero: "
str3:		.asciiz "Resultado: "

.text
.globl main

main: 		addiu $sp,$sp,-4
		sw $ra,0($sp)
		
		
		la $a0,str1
		li $v0,4
		syscall
		
		li $v0,6
		syscall
		mov.s $f2,$f0
		
		la $a0,str2
		li $v0,4
		syscall
		
		li $v0,5
		syscall
		
		move $t0,$v0
		
		move $a0,$t0
		mov.s $f12,$f2
		jal xtoy
		
		la $a0,str3
		li $v0,4
		syscall
		
		mov.s $f12,$f0
		li $v0,2
		syscall
		
		
		
		lw $ra,0($sp)
		addiu $sp,$sp,4
		jr $ra
		