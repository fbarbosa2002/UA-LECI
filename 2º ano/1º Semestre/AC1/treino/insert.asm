.data
.text
.globl insert

insert:		move	$t0, $a0		
		move	$t1, $a1	
		move 	$t2, $a2	
		move	$t3, $a3
		
if:		ble $t2,$t3,else 
		li $v0,1
		j endfi
		
else:		addiu $t4,$t3,-1

for:		blt $t4,$t2,endf
		
		mul $t5,$t4,4
		addu $t0,$t0,$t5
		lw $t6,0($t0)
		sw $t6,4($t0)
		
		
				
		addiu $t4,$t4,-1
		j for
		
endf:		mul $t5,$t4,4
		addu $t0,$t0,$t5
		sw $t1,-4($t0)
		li $v0,0
		
		
endfi:		jr $ra
		