	.data
result:	.float	1.0
	.text
	.globl	xtoy

xtoy:	addiu	$sp,$sp,-8
	sw	$ra,0($sp)
	sw	$s0,4($sp)
	
	move	$s0,$a0
	jal	abss
	move	$t1,$v0			# abs(y)
	li	$t0,0			# i
	l.s	$f2,result		# result
	
for:	bge	$t0,$t1,endf
	
if:	ble	$s0,0,else

	mul.s	$f2,$f2,$f12
	j	endif
else:
	div.s	$f2,$f2,$f12
	
endif:
	addiu	$t0,$t0,1
	j	for
endf:
	mov.s	$f0,$f2
	
	lw	$ra,0($sp)
	lw	$s0,4($sp)
	addiu	$sp,$sp,8
	
	jr	$ra
	
	