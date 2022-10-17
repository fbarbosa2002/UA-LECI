.data
n1:		.float -20.0
n2:		.float 0.0
.text
.globl max

max:		la $t0,n1
		l.s $f2,0($t0)		#max_grade
		
		la $t0,n2
		l.s $f4,0($t0)		#sum
		
		move $t0,$a0
		move $t1,$a1
		move $t2,$a2
		
		mul $a1,$a1,44
		addu $t3,$a1,$t0
		
for:		bge $t0,$t3,endf
		
		l.s $f6,40($t0)
		add.s $f4,$f4,$f6
		
if:		c.le.s $f6,$f2
		bc1t endif
		
		mov.s $f2,$f6
		move $t4,$t0
		
endif:		addiu $t0,$t0,44
		j for

endf:		mtc1 $t1,$f8
		cvt.s.w $f8,$f8
		
		div.s $f10,$f4,$f8
		s.s $f10,0($t2)
		
		move $v0,$t4
		
		jr $ra	
		
		
		
				

		
		
		