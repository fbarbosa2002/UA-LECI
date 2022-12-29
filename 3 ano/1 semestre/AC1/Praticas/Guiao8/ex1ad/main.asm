
	.data
str1:	.asciiz "Dividendo: "
str2:	.asciiz "\nDivisor: "
str3:	.asciiz "\nResultado: "
	.eqv	print_string,4
	.eqv	read_int,5
	.eqv	print_int10,1
	
	.text
	.globl	main
	
main:	addiu	$sp,$sp,-4
	sw	$ra,0($sp)
	la	$a0,str1
	li	$v0,print_string
	syscall
	li	$v0,read_int
	syscall
	move	$t0,$v0
	
	la	$a0,str2
	li	$v0,print_string
	syscall
	li	$v0,read_int
	syscall
	move	$t1,$v0
	
	move	$a0,$t0
	move	$a1,$t1
	jal	divi
	move	$t2,$v0
	
	la	$a0,str3
	li	$v0,print_string
	syscall
	
	move	$a0,$t2
	li	$v0,print_int10
	syscall
	
	lw	$ra,0($sp)
	addiu	$sp,$sp,4
	jr	$ra
	