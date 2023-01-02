	.data
	
sum:	.double 0.0	
	.text
	
average:	
	l.d	$f2,sum
	move	$t0,$a1
	
	
for1:	ble	$t0,0,endf1
	
	addiu	$t1,$t0,-1
	sll	$t1,$t1,3
	addu	$t1,$t1,$a0
	l.d	$f4,0($t1)
	
	add.d	$f2,$f2,$f4
	
	addiu	$t0,$t0,-1
	j	for1

endf1:	mtc1.d	$a1,$f6
	cvt.d.w	$f6,$f6
	
	div.d	$f0,$f2,$f6
	
	jr	$ra
	
	
	.data
	.eqv	SIZE,10
	.eqv	read_int,5
	.eqv	print_double,3
	
	.align 3
a:	.space	80

	.text
	.globl	main
	
main:	addiu	$sp,$sp,-4
	sw	$ra,0($sp)
	
	li	$t0,0
	
for2:	bge	$t0,SIZE,endf2

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
	la	$a0,a
	li	$a1,SIZE
	jal	average
	mov.d	$f12,$f0
	li	$v0,print_double
	syscall	
	li	$v0,0
	lw	$ra,0($sp)
	addiu	$sp,$sp,4
	jr	$ra
		