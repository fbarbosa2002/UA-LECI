	.eqv 	off_id,0
	.eqv 	off_fn,4
	.eqv 	off_ln,22
	.eqv	off_gr,40
	.eqv 	MAX_STUDENTS , 4
	.eqv 	print_int10,1
	.eqv	print_string,4
	.eqv	print_float,2
	.data
	
	
starray:	
	.space 176
	.align 2
media:	.space 4
str:	.asciiz "\nMedia: "	
	.text
	.globl 	main


main:	addiu	$sp,$sp,-4
	sw	$ra,0($sp)

	la	$a0,starray
	li	$a1,MAX_STUDENTS
	jal	read_data
	
	la	$a0,starray
	li	$a1,MAX_STUDENTS
	la	$a2,media
	jal	max
	move	$t2,$v0
	la	$a0,str
	li	$v0,print_string
	syscall
	
	la	$t0,media
	l.s	$f12,0($t0)
	li	$v0,print_float
	syscall
	
	move	$a0,$t2
	li	$a1,1
	
	jal	print_student
	
	lw	$ra,0($sp)
	addiu	$sp,$sp,4
	
	jr	$ra
