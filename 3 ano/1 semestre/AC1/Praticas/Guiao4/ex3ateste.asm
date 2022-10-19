#	Mapa de registos
#	$t0 -> p
#	$t1 -> pultimo
#	$t2 -> *p
#	$t3 -> soma



	
	.data
	
array:	.space 16
string:	.asciiz "\nIntroduza um numero: "

	.eqv 	read_int,5
	.eqv	print_int10,1
	.eqv	SIZE,4	
	.eqv 	espaco,16
	.eqv	print_string,4
	
	.text
	.globl main
	
main:	
	la	$t5,array
	
	li	$t6,0
while:	
	bgt	$t6,16,endw
	
	la	$a0,string
	li	$v0,print_string
	syscall
	
	li	$v0,read_int
	syscall
	
	sw	$v0,0($t5)

		
	addiu	$t5,$t5,4
	addiu	$t6,$t6,4
	j	while
	
endw:	jr $ra
