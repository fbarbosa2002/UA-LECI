	.data
	.eqv	print_string,4
	.eqv	read_float,6
	.eqv	read_int,5
	.eqv	print_float,2
str1:	.asciiz "\nBase: "
str2:	.asciiz "\nExpoente: "
str3:	.asciiz "\nResultado final: "	
	.text
	
	.globl	main
	
main:	addiu	$sp,$sp,-4
	sw	$ra,0($sp)
	
	la	$a0,str1
	li	$v0,print_string
	syscall
	
	li	$v0,read_float
	syscall
	mov.s	$f12,$f0
	
	la	$a0,str2
	li	$v0,print_string
	syscall
	
	li	$v0,read_int
	syscall
	move	$a0,$v0
	
	jal	xtoy
	mov.s	$f12,$f0
	
	la	$a0,str3
	li	$v0,print_string
	syscall
	
	li	$v0,print_float
	syscall
	
	lw	$ra,0($sp)
	addiu	$sp,$sp,4
	jr	$ra
	
	