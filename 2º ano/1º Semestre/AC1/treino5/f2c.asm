.data
n1:		.double 0.0

.text
.globl f2c 


f2c:		la $t0,n1
		l.d $f2,0($t0)
		
		move $t2,$a0
		
		move $t1,$a1
		
for:		ble $t1,0,endf

		mul $t5,$t1,8
		addu $t3,$t5,$t2
		
		l.d $f4,0($t3)
		
		add.d $f2,$f2,$f4

		addiu $t1,$t1,-1
		j for 
		
endf:		mtc1.d $a1,$f6
		cvt.d.w $f6,$f6
		
		div.d $f0,$f2,$f6
		
		jr $ra 
		
		
