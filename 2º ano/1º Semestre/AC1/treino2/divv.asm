.data
.text
.globl divv

divv:		move $t0,$a0
		move $t1,$a1
		
		sll $t1,$t1,16
		
		andi $t0,$t0,0xFFFF
		sll $t0,$t0,1
		
		li $t2,0
		
for:		bge $t2,16,endf
		
		li $t3,0
		
if:		blt $t0,$t1,endif

		subu $t0,$t0,$t1
		li $t3,1
		
endif:		sll $t0,$t0,1
		or $t0,$t0,$t3

		addiu $t2,$t2,1
		j for 

endf:		srl $t4,$t0,1
		andi $t4,$t4,0xFFFF0000
		andi $t5,$t0,0xFFFF
		
		or $v0,$t4,$t5
		
		jr $ra 
		