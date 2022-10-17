.data
		.eqv SIZE,5
lista:		.space 20
str:		.asciiz "\nIntroduza um numero: "
.text

.globl main

main: 		li $t0,0
		la $t1,lista
		
for:		bge $t0,SIZE,endf 

		la $a0,str
		li $v0,4
		syscall
		
		
		li $v0,5
		syscall 
		
		la $t1,lista 
		sll $t2,$t0,2
		addu $t2,$t1,$t2
		sw $v0,0($t2)
		
		addiu $t0,$t0,1
		j for
		
endf: 		
		jr $ra 		