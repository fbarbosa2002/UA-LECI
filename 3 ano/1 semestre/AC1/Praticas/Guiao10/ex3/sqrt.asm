	# Mapa de registos
	# $t0 -> i
	# $f4 -> xn
	# $f12 -> val
	# $f6 -> aux
	
	.data
xn:	.double	1.0
aux:	.double 0.0
aux2:	.double 0.5

	.text
	
	.globl	sqrt

sqrt:	li	$t0,0
	l.d	$f2,aux
	l.d	$f4,xn
	
if:	c.le.d	$f12,$f2
	bc1t	else


do:	mov.d	$f6,$f4
	l.d	$f10,aux2	
	div.d	$f8,$f12,$f4
	add.d	$f4,$f8,$f4
	mul.d	$f4,$f4,$f10
	
while:	c.eq.d	$f6,$f4
	bc1t	endif
	
	addiu	$t0,$t0,1
	blt	$t0,25,do
	
	j	endif	
else:
	l.d	$f4,aux
endif:
	
	mov.d	$f0,$f4	
	jr	$ra
