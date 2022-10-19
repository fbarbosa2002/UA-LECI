#	Mapa de registos
#	$t0 -> num
#	$t1 -> i
#	$t2 -> str
#	$t3 -> str + i
#	$t4 -> str[i]

	.data

str2:	.asciiz	"O numero de caracteres numericos da string e: "
	
	.eqv	SIZE,20
	.eqv	read_string,8
	.eqv	print_int10,1
	.eqv	print_string,4

str:	.space	21
	
	
	.text
	
	.globl	main
	
main:	la	$a0,str
	li	$a1,SIZE
	li	$v0,read_string
	syscall
	
	
	li 	$t0,0
	li	$t1,0
	la	$t2,str		# $t2 -> str ou &str[0]
while:	
	
	addu	$t3,$t2,$t1
	
	lb	$t4,0($t3)
	
	beq	$t4,'\0',endw
	

if:	blt	$t4,'0',endif
	bgt	$t4,'9',endif
		
	addi	$t0,$t0,1
	
endif:	
	addiu	$t1,$t1,1
	j 	while

endw:	la 	$a0,str2
	li	$v0,print_string
	syscall
	
	move 	$a0,$t0
	li 	$v0,print_int10
	syscall
	

	
	jr $ra
	
