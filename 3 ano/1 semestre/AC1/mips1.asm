
.data


X2:	.space 3
X1:	.word 4
.text
.globl main

main:	la	$t0,X1
	ori	$t1,$t0,0
	xor	$t2,$t1,$t0
	add	$t3,$t3,$t3
	addu	$t3,$t3,$t3
	addiu	$t3,$t3,0xFFFF
	sub	$t3,$t3,3
	lw $t3,0($t0)
	ble	$t3,$t4,main
	j main
	jr $ra