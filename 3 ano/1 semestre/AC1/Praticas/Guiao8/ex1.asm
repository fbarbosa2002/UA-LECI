	.text
	
atoi:	li	$t0,0		# res -> 0

while:	
	
	lb	$t1,0($a0)
	
	blt	$t1,'0',endw
	bgt	$t1,'9',endw
	
	
	sub	$t2,$t1,'0'
	addiu	$a0,$a0,1
	mul	$t0,$t0,10
	addu	$t0,$t0,$t2
	j	while
	
endw:
	move	$v0,$t0
	jr	$ra
	
	
	.data
	
string:	.asciiz "2000 e 3000 sao anos bissextos"
	.eqv	print_int10,1
	.text
	
	.globl main
	
main:	
	addiu	$sp,$sp,-4
	sw	$ra,0($sp)
	
	la	$a0,string
	jal	atoi
	move	$a0,$v0
	
	li	$v0,print_int10
	syscall
	
	lw	$ra,0($sp)
	addiu	$sp,$sp,4
	li	$v0,0
	
	
	jr	$ra
	
