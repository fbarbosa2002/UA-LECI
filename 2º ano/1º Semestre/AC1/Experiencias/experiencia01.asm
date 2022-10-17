#Print a string 
.data

str1:	.asciiz "Hello Word"

.text
.globl main

main:	li $v0, 4
	la $a0, str1
	syscall
	
	jr $ra