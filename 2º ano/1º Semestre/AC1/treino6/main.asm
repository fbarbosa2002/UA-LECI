.data

		.eqv SIZE,5
array:		.space 40

str1:		.asciiz "Introduza um numero: "
str2:		.asciiz "Mediana: "

.text
.globl main

main:		addiu $sp,$sp,-4
		sw $ra,0($sp)
		li $t0,0
		la $t1,array
		
for:		bge $t0,SIZE,endf
		
		la $a0,str1
		li $v0,4
		syscall
		
		li $v0,7
		syscall
		
	
		
		sll $t2,$t0,3
		addu $t2,$t2,$t1
		s.d $f0,0($t2)
		
		
		addiu $t0,$t0,1
		j for
		
		
endf:		move $a0,$t1
		li $a1,SIZE
		jal median
		
		mov.d $f12,$f0
		
		la $a0,str2
		li $v0,4
		syscall
		
		li $v0,3
		syscall
		
		
		
		lw $ra,0($sp)
		addiu $sp,$sp,4
		
		jr $ra 
		