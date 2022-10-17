#Print a letter 
.data

Character:	.byte 'm'
.text
.globl main

main:	li $v0,4
	la $a0, Character
	syscall
	
	jr $ra
