	.data
str1:	.asciiz "\nValor para calcular a raiz quadrada: "
str2:	.asciiz "\nResultado: "
	.eqv	print_string,4
	.eqv	read_double,7
	.eqv	print_double,3
	.text
	.globl	main
	
main:	addiu	$sp,$sp,-4
	sw	$ra,0($sp)
	
	la	$a0,str1
	li	$v0,print_string
	syscall
	
	li	$v0,read_double
	syscall
	mov.d	$f12,$f0
	
	la	$a0,str2
	li	$v0,print_string
	syscall
	
	jal	sqrt
	mov.d	$f12,$f0
	
	
	li	$v0,print_double
	syscall
	
	lw	$ra,0($sp)
	addiu	$sp,$sp,4
	
	jr	$ra