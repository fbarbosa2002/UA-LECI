
# $t0 - valor a deslocar
# Imm - numero de bits a deslocar
# $t1 - $t0 << Imm
# $t2 - $t0 >> Imm
# $t3 - $t0 >> Imm

	.data
	
	.eqv Imm , 4
	
	.text
	
	.globl main
	
main:	li $t0, 0x862A5C1B

	sll $t1,$t0, Imm
	
	srl $t2,$t0,Imm
	
	sra $t3,$t0,Imm
	
	jr $ra 