.data

		.eqv FALSE,0
		.eqv TRUE,1
.text
.globl  median

median:		move $t0,$a0
		move $t1,$a1
		
do:		li $t2,FALSE 			#houveTroca
		li $t3,0
		
		addiu $t4,$t1,-1
		sll $t4,$t4,3
		
for:		bge $t3,$t4,endf
		
		
		addu $t5,$t3,$t0
		
		l.d $f2,0($t5)
		l.d $f4,8($t5)
		
if:		c.le.d $f2,$f4
		bc1t endif
		
		s.d $f4,0($t5)
		s.d $f2,8($t5)
		
		li $t2,TRUE
		
endif:
		addiu $t3,$t3,8
		j for
		
endf:		beq $t2,1,do

		srl $t1,$a1,1
		sll $t2,$t1,3
		
		addu $t7,$t2,$a0
		
		l.d $f0,0($t7)
		
		
		jr $ra
				

