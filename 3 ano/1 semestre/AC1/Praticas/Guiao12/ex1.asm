	.eqv 	off_id,0
	.eqv 	off_fn,4
	.eqv 	off_ln,22
	.eqv	off_gr,40
	.eqv 	MAX_STUDENTS , 4
	.eqv 	print_int10,1
	
	.data
	
	
starray:	
	.space 176
	.align 2
	
	.text
	.globl 	main


main:	addiu	$sp,$sp,-4
	sw	$ra,0($sp)

	la	$a0,starray
	li	$a1,MAX_STUDENTS
	jal	read_data
	
	la	$a0,starray
	li	$a1,MAX_STUDENTS
	jal	print_student
	
	
	lw	$ra,0($sp)
	addiu	$sp,$sp,4
	
	jr	$ra
