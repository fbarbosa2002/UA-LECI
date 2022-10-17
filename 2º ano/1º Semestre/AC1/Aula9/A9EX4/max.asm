.data
.text
.globl max

max:		move $t0,$a0
		move $t1,$a1
		
		addiu $t1,$t1,-1
		sll $t1,$t1,3
		addu $t3,$t1,$t0
		
		l.d $f0,0($t0)
		
		addiu $t0,$t0,8
		
for:		bgt $t0,$t3,endf

		l.d $f2,0($t0)

if:		c.le.d $f2,$f0
		bc1t endif 
		
		mov.d $f0,$f2
		
endif:		addiu $t0,$t0,8
		j for 
		
endf:		jr $ra 	
		
		