.data

n1:		.double 5.0
n2:		.double 9.0
n3:		.double 32.0

.text
.globl f2c

f2c:		la $t0,n1
		l.d $f2,0($t0)
		
		la $t0,n2
		l.d $f4,0($t0)
		
		la $t0,n3
		l.d $f6,0($t0)
		
		sub.d $f12,$f12,$f6
		div.d $f2, $f2,$f4
		mul.d $f0,$f12,$f2
		
		
		jr $ra
		