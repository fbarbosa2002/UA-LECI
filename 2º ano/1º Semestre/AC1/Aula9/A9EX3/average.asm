.data

n1:		.double 0.0
.text
.globl average
average:	la $t0,n1
		l.d $f0,0($t0)
		
		move $t0,$a0		#$t0=&array 
		move $t1,$a1
		
for:		ble $t1,$0,endf
		
		addiu $t2,$t1,1
		sll $t2,$t2,3
		
		addu $t3,$t0,$t2
		
		l.d $f2,0($t3)
		
		add.d $f0,$f0,$f2
		
		
		addiu $t1,$t1,-1
		
		j for 
		
endf:		mtc1 $a1,$f4
		cvt.d.w $f4,$f4
		div.d $f0,$f0,$f4
		
		jr $ra
			
		
		
		
		