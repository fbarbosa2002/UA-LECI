.data

n1:		.double 1.0
n2:		.double 0.0
n3:		.double 0.5

.text
.globl sqrt 

sqrt:		la $t0,n1
		l.d $f2,0($t0)			#xn
		
		la $t0,n2
		l.d $f4,0($t0)			#n2	
		
		la $t0,n3
		l.d $f10,0($t0)
		
		li $t0,0			#i
		
if:		c.le.d $f12,$f4
		bc1t else 
		
do:		mov.d $f6,$f2
		
		div.d $f2,$f12,$f6
		add.d $f2,$f2,$f6
		mul.d $f2,$f2,$f10
		
		
		
		
while:		c.eq.d $f6,$f2
		bc1t endif
anddi:		addiu $t0,$t0,1
		blt $t0,25,do
		j endif
		
else:		mov.d $f2,$f4

endif:		mov.d $f0,$f2
		
		jr $ra 
		
		