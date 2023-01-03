	.eqv 	off_id,0
	.eqv 	off_fn,4
	.eqv 	off_ln,22
	.eqv	off_gr,40
	.data
sum:	.float	0.0
max_grade:
	.float -20.0
	.text
	.globl max
	
max:	mul	$t3,$a1,44
	addu	$t3,$t3,$a0
	l.s	$f2,sum
	l.s	$f4,max_grade
	
for:	bge	$a0,$t3,endfor
	l.s	$f6,off_gr($a0)
	add.s	$f2,$f2,$f6
	
if:	c.le.s	$f6,$f4
	bc1t	endif
	
	mov.s	$f4,$f6
	move	$t0,$a0
endif:
	addiu	$a0,$a0,44
	j	for
endfor:
	mtc1	$a1,$f8
	cvt.s.w	$f8,$f8
	
	div.s	$f10,$f2,$f8
	s.s	$f10,0($a2)
	move	$v0,$t0
	jr	$ra
