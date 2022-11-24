	.text
	
atoi:	li	$t0,0		# res -> 0

while_atoi:	
	
	lb	$t1,0($a0)
	
	blt	$t1,'0',endw_atoi
	bgt	$t1,'1',endw_atoi
	
	
	sub	$t2,$t1,'0'
	addiu	$a0,$a0,1
	mul	$t0,$t0,2
	addu	$t0,$t0,$t2
	j	while_atoi
	
endw_atoi:
	move	$v0,$t0
	jr	$ra
	
	
	.data
	
string:	.asciiz "10001 e 2024 sao anos bissextos"
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
	
