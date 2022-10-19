#	Mapa de registos
#	$t0 -> p
#	$t1 -> *p


	.data
	
string:	.asciiz "Introduza uma string: "
str:	.space 21

	.eqv print_string,4
	.eqv read_string,8
	.eqv SIZE,20
	
	.text
	.globl main
	
	
main:	la	$a0,string
	li	$v0,print_string
	syscall
	
	la	$a0,str
	li	$a1,SIZE
	li	$v0,read_string
	syscall
	
	la	$t0,str
	
while:	lb	$t1,0($t0)
	
	beq 	$t1,'\0',endw
	
	sub	$t1,$t1,'a'
	addi	$t1,$t1,'A'
	
	sb	$t1,0($t0)
	
	addi 	$t0,$t0,1
	j	while
	
endw:

	la	$a0,str
	li	$v0,print_string
	syscall
	
	jr	$ra