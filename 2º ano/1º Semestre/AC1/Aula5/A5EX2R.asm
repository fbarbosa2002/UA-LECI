.data

		.eqv SIZE,10
lista:		.word 8, -4, 3, 5, 124, -15, 87, 9, 27, 15
str:		.asciiz "Conteudo do array:\n "
str2:		.asciiz "; "
.text
.globl main

main:		la $t0,lista 
		
		la $a0,str
		li $v0,4
		syscall
		li $t1,SIZE 
		sll $t1,$t1,2
		addu $t1,$t0,$t1
		
for:		bge $t0,$t1,endf

	 	lw $t2,0($t0)
	 	move $a0,$t2
	 	li $v0,1
	 	syscall
	 	
	 	la $a0,str2
	 	li $v0,4
	 	syscall
		addiu $t0,$t0,4
		j for 
endf:		jr $ra 