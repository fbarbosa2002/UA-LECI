	# Mapa de registos
	# $s0 -> dst
	# $s1 -> src
	# $t0 -> len_dst
	# $t1 -> len_src
	
	.data
	.text
	.globl	insert
	
insert:	addiu	$sp,$sp,-20
	sw	$ra,0($sp)
	sw	$s0,4($sp)
	sw	$s1,8($sp)
	sw	$s2,12($sp)
	sw	$s3,16($sp)
	move	$s0,$a0
	move	$s1,$a1
	
	move	$a0,$s0
	jal	strlen
	move	$s2,$v0			#  len_dst = strlen(dst); -> $s2

	move	$a0,$s1
	jal	strlen
	move	$s3,$v0			#  len_src = strlen(src); -> $s3

	
if:	bgt	$a2,$s2,endif
	
	move	$t2,$s2
	
for1:	blt 	$t2,$a2,endf1		# for(i = len_dst; i >= pos; i--) 
	
	addu	$t3,$t2,$s0
	lb	$t3,0($t3)
	addu	$t4,$t2,$s3
	addu	$t4,$t4,$s0
	sb	$t3,0($t4)		#  dst[i + len_src] = dst[i]; 

	addiu	$t2,$t2,-1
	j	for1

endf1:

	li	$t2,0
for2:	bge	$t2,$s3,endf2
	
	addu	$t3,$t2,$s1
	lb	$t3,0($t3)
	addu	$t4,$t2,$a2
	addu	$t4,$t4,$s0
	sb	$t3,0($t4)
	
	addiu	$t2,$t2,1
	j	for2
endf2:

endif:	move	$v0,$s0

	lw	$ra,0($sp)
	lw	$s0,4($sp)
	lw	$s1,8($sp)
	lw	$s2,12($sp)
	lw	$s3,16($sp)
	addiu	$sp,$sp,20
	jr	$ra		
