	.data
	.eqv	SIZE,10
	.eqv	read_int,5
	.eqv	print_double,3
	.eqv	print_string,4
	.eqv	print_int10,1
str1:	.asciiz "array["
str2:	.asciiz "]="
str3:	.asciiz "\nVariancia do array: "
str4:	.asciiz "\nDesvio padrão do array: "
	.align 3
a:	.space	80

	.text
	.globl	main
main:	addiu	$sp,$sp,-4
	sw	$ra,0($sp)
	
	li	$t0,0
	
for2:	bge	$t0,SIZE,endf2
	la	$a0,str1
	li	$v0,print_string
	syscall
	
	move	$a0,$t0
	li	$v0,print_int10
	syscall
	
	la	$a0,str2
	li	$v0,print_string
	syscall
	
	li	$v0,read_int
	syscall
	mtc1.d	$v0,$f2
	cvt.d.w	$f2,$f2
	
	la	$t1,a
	sll	$t2,$t0,3
	addu	$t2,$t2,$t1
	s.d	$f2,0($t2)
		
	addiu	$t0,$t0,1
	j	for2
endf2:	
	la	$a0,str4
	li	$v0,print_string
	syscall
	
	la	$a0,a
	li	$a1,SIZE
	jal	var
	mov.d	$f12,$f0
	li	$v0,print_double
	syscall	
	
	la	$a0,str3
	li	$v0,print_string
	syscall
	
	la	$a0,a
	li	$a1,SIZE
	jal	stdev
	mov.d	$f12,$f0
	li	$v0,print_double
	syscall
	
	li	$v0,0
	lw	$ra,0($sp)
	addiu	$sp,$sp,4
	jr	$ra
		