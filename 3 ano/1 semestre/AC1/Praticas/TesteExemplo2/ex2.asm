	#float func3(float *a,float t,int n)
	#{
	#	float oldg = -1.0 ;
	#	float g = 1.0 ;
	#	float s = 0 ;
	#	int k ;
	
	#	for(k = 0 ; k < n ; k ++){
	#		while((g-oldg) > t) {
	#			oldg = g ;
	#			g = (g + a[k] / t) ;
	#		}
	#		s = s + g ;
	#		a[k] = g ;
	#	}
	# 	return s / (float) n ; 
	#} 
	
	# Mapa de registos
	# a:	$a0
	# t:	$f12
	# n:	$a1
	# oldg:	$f2
	# g:	$f4
	# s:	$f6
	# k:	$t0
	
	.data
oldg:	.float	-1.0
g:	.float	1.0
s:	.float	0.0

	.text
	.globl	main

main:	li	$t0,0			# k = 0 ;
	l.s	$f2,oldg		# float oldg = -1.0 ;
	l.s	$f4,g			# float g = 1.0 ;
	l.s	$f6,s			# float s = 0 ;
	
for:	bge	$t0,$a1,endf		# k < n
	
	
	sll	$t1,$t0,2
	addu	$t1,$t1,$a0		# &a -> endereço de memoria de a
	
	sub.s	$f8,$f4,$f2		# $f8 -> g-oldg

while:	c.le.s	$f8,$f12
	bc1t	endw			# while((g-oldg) > t) 
	
	mov.s	$f2,$f4			# oldg = g ; 
		
	
	l.s	$f10,0($t1)		# $f10 -> a[k]
	div.s	$f10,$f10,$f12		# a[k] / t
	add.s	$f4,$f4,$f10		# g = (g + a[k] / t) ;
	
	j	while

endw:	add.s	$f6,$f6,$f4		# s = s + g ;
	s.s	$f4,0($t1)		# a[k] = g
	
	addiu	$t0,$t0,1		# k++ ; 
	j	for
	
endf:	mtc1	$a2,$f2
	cvt.s.w	$f2,$f2
	
	div.s	$f0,$f6,$f2		# return s / (float)n; 
	
	jr	$ra