	# STRREV FUNCTION
	
	.text
	
strcpy:	li	$t0,0
	
do:	addu	$t2,$a1,$t0
	lb	$t1,0($t2)
	addu	$t3,$a0,$t0
	sb	$t1,0($t3)
	addiu	$t0,$t0,1
	bne	$t1,'\0',do
	
	move	$v0,$a0
	jr	$ra
	
	# STRCAT FUNCTION
	
	.text
	
strcat:	addiu	$sp,$sp,-4
	sw	$ra,0($sp)
	
	move	$t1,$a0
	
while:	lb	$t0,0($t1)
	beq	$t0,'\0',endw
	addiu	$t1,$t1,1
	j	while	
	
endw:	move	$a0,$t1
	jal	strcpy
	
	move	$v0,$a1
	
	lw	$ra,0($sp)
	addiu	$sp,$sp,4
	
	jr	$ra
	
	.data
	
str1:	.asciiz "Arquitetura de "
str2:	.space	50
str3:	.asciiz "Computadores I"
str:	.asciiz "\n"
	.eqv	print_string,4
	
	.text
	
	.globl	main
	
main:	addiu	$sp,$sp,-4
	sw	$ra,0($sp)
	
	la	$a0,str2
	la	$a1,str1
	jal	strcpy
	
	la	$a0,str2
	li	$v0,print_string
	syscall
	
	la	$a0,str
	li	$v0,print_string
	syscall
	
	la	$a0,str2
	la	$a1,str3
	jal	strcat
	la	$a0,str2
	li	$v0,print_string
	syscall
	li	$v0,0
	lw	$ra,0($sp)
	addiu	$sp,$sp,4
	jr	$ra	
	