	.data
soma:	.float	0.0

	.text
	.globl	var
	
	# Mapa de registos
	# media:	$f2
	# soma:		$f4
	# i:		$t0
	
var:	addiu	$sp,$sp,-20
	sw	$ra,0($sp)
	sw	$s0,4($sp)
	sw	$s1,8($sp)
	sw	$s2,12($sp)
	s.s	$f20,16($sp)
	move	$s0,$a0
	move	$s1,$a1
	
	jal	average
	mov.d	$f20,$f0
	
	cvt.s.d	$f20,$f20
	
	li	$s2,0
	l.s	$f4,soma
	
for:	bge	$s2,$s1,endf
	
	sll	$t1,$s2,3
	add	$t1,$t1,$s0		# &array[i]
	l.d	$f6,0($t1)
	cvt.s.d	$f6,$f6
	sub.s	$f12,$f6,$f20
	li	$a0,2
	jal	xtoy	
	add.s	$f4,$f4,$f0		# soma += xtoy((float)array[i] - media, 2);
			
	addiu	$s2,$s2,1
	j	for
endf:
	mtc1	$s1,$f20
	cvt.d.w	$f20,$f20
	
	cvt.d.s	$f4,$f4
	
	div.d	$f0,$f4,$f20
	
	lw	$ra,0($sp)
	lw	$s0,4($sp)
	lw	$s1,8($sp)
	lw	$s2,12($sp)
	l.s	$f20,16($sp)
	addiu	$sp,$sp,20
	
	jr	$ra