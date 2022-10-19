#	Mapa d e registos
#	$t0 -> p
#	$t1 -> pultimo
#	$t2 -> *p
#	$t3 -> soma



	
	.data
	
array:	.word	1,2,3,4
	
	.eqv	print_int10,1
	.eqv	SIZE,4	

	.text
	.globl main
	
main:	li	$t3,0
	li	$t4,SIZE
	sub	$t4,$t4,1
	mul	$t4,$t4,4
	
	la	$t0,array
	addu	$t1,$t0,$t4
	
while:	bgtu	$t0,$t1,endw
	
	lw	$t2,0($t0)
	add	$t3,$t3,$t2
	
	addiu	$t0,$t0,4
	j	while
	
endw:	move	$a0,$t3
	li	$v0,print_int10
	syscall
	
	jr	$ra