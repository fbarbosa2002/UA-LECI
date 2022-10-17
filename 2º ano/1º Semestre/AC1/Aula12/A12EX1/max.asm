.data

n1:		.float -20.0
n2:		.float 0.0
.text
.globl max

max:		la $t0,n1
		l.s $f6,0($t0)
		
		la $t0,n2
		l.s $f4,0($t0)
		
		move $t0,$a0		#$t0=&st
		move $t1,$a1		#t1=ns
		move $t2,$a2		#$t2=*media 
		
		mul $a1,$a1,44
		addu $t3,$t0,$a1
		
		li $t4,0		#pmax=0
		
for:		bge $t0,$t3,endf
		
		l.s $f8,40($t0)
		add.s $f4,$f4,$f8
		
if:		c.lt.s $f8,$f6
		bc1t endif
		
		mov.s $f6,$f8
		move $t4,$t0
		
endif:		addiu $t0,$t0,44
		j for

endf:		mtc1 $t1, $f10
		cvt.s.w $f10,$f10	
		div.s $f10,$f4,$f10
		s.s $f10,0($t2)
		move $v0,$t4
		
		jr $ra 
		
				
		