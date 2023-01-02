	.data
	
sum:	.double 0.0	
	.text
	.globl	average
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