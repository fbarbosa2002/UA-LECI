.data
n1:		.double 1.0
n2:		.double 0.5
n3:		.double 0.0
.text
.globl sqrt

sqrt:		la $t0,n1		#xn=1.0=$f4
		l.d $f4,0($t0)
		
		la $t0,n2		#0.5=$f6
		l.d $f6,0($t0)
		
		la $t0,n3		#0.0=$f8
		l.d $f8,0($t0)
		
		li $t1,0		#i=0
				
		
if: 		c.le.d $f12,$f8
		bc1t else 

do:		mov.d $f2,$f4
		
		div.d $f10,$f12,$f4
		add.d $f10,$f10,$f4
		mul.d $f4,$f6,$f10
		
while:		c.eq.d $f2,$f4
		bc1t endif 
		
andd:		addi $t1,$t1,1
		
		blt $t1,25,do 
		j endif 
else: 		mov.d $f4,$f8

endif:		mov.d $f0,$f4
				 
		jr $ra 
		
	