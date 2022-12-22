	.data
	.eqv 	off_id,0
	.eqv 	off_fn,4
	.eqv 	off_ln,22
	.eqv	off_gr,40
	
	.eqv 	print_int10,1
	.eqv	print_string,4
	.eqv	print_float,2
	.eqv	print_char,11

str1:	.asciiz "Student "
	
	.text
	
	.globl	print_student
	
print_student:


	move	$t0,$a0
	li	$t1,0
	move	$t2,$a1
	
	
for:	mul	$t3,$t1,44
	addu	$t3,$t3,$t0
	bge	$t1,$t2,endfor	
	
	la	$a0,str1
	li	$v0,print_string
	syscall
	
	move	$a0,$t1
	li	$v0,print_int10
	syscall
	
	li	$a0,'\n'
	li	$v0,print_char
	syscall
	
	
	
	
	lw	$a0,off_id($t3)
	li	$v0,print_int10
	syscall
	li	$a0,'\n'
	li	$v0,print_char
	syscall
	
	

	addiu	$a0,$t3,off_fn
	li	$v0,print_string
	syscall
	li	$a0,'\n'
	li	$v0,print_char
	syscall
	
	
	addiu	$a0,$t3,off_ln
	li	$v0,print_string
	syscall
	li	$a0,'\n'
	li	$v0,print_char
	syscall
	
	move	$a0,$t3
	l.s	$f12,off_gr($t3)
	li	$v0,print_float
	syscall
	li	$a0,'\n'
	li	$v0,print_char
	syscall
	
	addiu	$t1,$t1,1
	j	for

endfor:
	jr	$ra
	
