.data
.text
.globl divv

divv:		move $t0,$a0		#$t0=dividendo 
		move $t1,$a1		#$t1=divisor 
		
		sll $t1,$t1,16
		
		andi $t0,$t0,0xFFFF
		sll $t0,$t0,1
		
		li $t3,0		#i=0
		
for: 		bge $t3,16,endf

		li $t4,0
		
if:		blt $t0,$t1,endif

		sub $t0,$t0,$t1
		li $t4,1
		
endif:		sll $t0,$t0,1
		or $t0,$t0,$t4
		
		addiu $t3,$t3,1
		j for
		
endf:		srl $t6,$t0,1
		andi $t6,$t0,0xFFFF0000
		andi $t7,$t0,0xFFFF
		
		or $v0,$t6,$t7
		
		jr $ra 
		
		
		