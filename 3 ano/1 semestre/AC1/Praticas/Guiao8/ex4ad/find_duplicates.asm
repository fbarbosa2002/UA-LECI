	# Mapa de registos
	# $a0 -> *array
	# $a1 -> *dup_array
	# $a2 -> size
	# $t0 -> i
	# $t1 -> j
	# $t2 -> token
	
	.text
	.globl	find_duplicates

find_duplicates:

	li	$t0,0
	
for1:	bge	$t0,$a2,endf1

	sll	$t3,$t0,2
	addu	$t3,$t3,$a1
	sw	$0,0($t3)		#  dup_array[i] = 0; 
	
	li	$t1,0
	li	$t2,1

for2:	bge	$t1,$a2,endf2

	sll	$t3,$t0,2
	addu	$t3,$t3,$a0
	lw	$t3,0($t3)
	
	sll	$t4,$t1,2
	addu	$t4,$t4,$a0
	lw	$t4,0($t4)
	
if:	bne	$t3,$t4,endif
	
	sll	$t5,$t1,2
	addu	$t5,$t5,$a1
	sw	$t2,0($t5)
	
	addiu	$t2,$t2,1
endif:
	addiu	$t1,$t1,1
	j	for2
endf2:
	addiu	$t0,$t0,1
	j	for1
endf1:
	jr	$ra