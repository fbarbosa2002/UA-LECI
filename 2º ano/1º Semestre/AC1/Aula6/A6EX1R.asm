.data

		.eqv SIZE,3
str1:		.asciiz "Array"
str2:		.asciiz "de"
str3:		.asciiz "Ponteiros"
		.align 2
array:		.word str1,str2,str3

.text
.globl main
main:		li $t0,0

for:		bge $t0,SIZE,endf

		la $t1,array
		mul $t2,$t0,4
		addu $t2,$t2,$t1
		
		lw $t2,0($t2)
		move $a0,$t2
		li $v0,4
		syscall 
		
		li $a0,'\n'
		li $v0,11
		syscall
		
		addiu $t0,$t0,1
		j for
		
endf:		jr $ra