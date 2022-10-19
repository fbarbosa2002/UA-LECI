#	Mapa de registos
#	$t0 -> num
#	$t1 -> p
#	$t2 -> *p


	.data
	
str:	.space 	20
str2:	.asciiz "O numero de caracteres numericos da string e: "

	.eqv	print_string,4
	.eqv	read_string,8
	.eqv	print_int10,1
	
	.text
	.globl 	main
	
main:	la 	$a0,str
	li 	$a1,20
	li 	$v0,read_string
	syscall
	
	
	la	$t1,str
	
while:	lb	$t2,0($t1)
	beq	$t2,0,endw
	
	blt 	$t2,'0',endif
	bgt	$t2,'9',endif
	
	addi 	$t0,$t0,1
	
endif:
	addi	$t1,$t1,1
	j 	while
	
endw:	la 	$a0,str2
	li	$v0,print_string
	syscall
	
	move 	$a0,$t0
	li	$v0,print_int10
	syscall
	jr $ra
	