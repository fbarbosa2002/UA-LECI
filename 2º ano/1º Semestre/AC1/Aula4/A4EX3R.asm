# Mapa de registos 
# p: $t0 
# pultimo:$t1 
# *p $t2 
# soma: $t3
.data
		.eqv SIZE,4
		
array:		.word 7692,23,5,234

.text
.globl main
main:		li $t3,0
		la $t0,array
		li $t4,3
		mul $t4,$t4,4
		addu $t1,$t0,$t4
		
		
while:		bgtu $t0,$t1,endw

		lw $t2,0($t0)
		addu $t3,$t3,$t2
		
		addiu $t0,$t0,4
		j while
		 
endw:		move $a0,$t3
		li $v0,36
		syscall
		