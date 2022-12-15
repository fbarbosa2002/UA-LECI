#	Mapa de registos
#	$t0 -> val
#	$f1 -> float(val) 
#	$f2 -> 2.52795
#	$f3 -> res
#	$f4 -> 0.0
	.data
constfl:	.float	2.53795
zero:		.float 0.0	
	.text
	.globl main
	
main:	

do:	li	$v0,5
	syscall
	move	$t0,$v0		
	mtc1	$t0,$f1		#	Move to Coprocessor 1	
	cvt.s.w	$f1,$f1		#	Convert from integer to float
		
	l.s	$f2,constfl
	
	mul.s	$f3,$f1,$f2	# res = (float)val * 2.53795
	
	mov.s	$f12,$f3
	li	$v0,2		# print_float(res)
	syscall
	
while:	l.s	$f4,zero	# $f4 = 0.0
	c.eq.s $f3,$f4		# Compare if $f3 is equal to $f4 
	
	bc1f	do		# If not equal jump to do
	
	jr	$ra
