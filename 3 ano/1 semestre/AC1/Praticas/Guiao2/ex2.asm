
# $t0 - valor
# $t1 - valor negado
	
	.data

	.eqv val_1, 0xe543
		
	.text
	
	.globl main
	
main:	ori $t0,$0,val_1

	nor $t1,$t0,$0
	
	jr $ra