
.data

		.eqv SIZE,10
		
lista:		.word 8, -4, 3, 5, 124, -15, 87, 9, 27, 15
str1:		.asciiz "Conteudo do array:\n "
str2:		.asciiz "; "

.text

.globl main

main:		la $a0,str1
		li $v0,4
		syscall 
		la $t0,lista
		
		
		li $t1,SIZE
		mul $t2,$t1,4
		addu $t3,$t2,$t0
		 
for:		bge $t0,$t3,endf
		
		lw $t4,0($t0)
		move $a0,$t4
		li $v0,1
		syscall
		
		la $a0, str2
		li $v0,4
		syscall 
		
		addiu $t0,$t0,4
		j for 
		
endf:	
		jr $ra 