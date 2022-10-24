#	Mapa de registos
#	$t0 -> i
#	$t1 -> lista
#	$t2 -> lista + i
#	$t3 -> SIZE

	.data
	
	.eqv SIZE,5
	.eqv print_string,4
	.eqv read_int,5
	
str1:	.asciiz "\nIntroduza um numero: "	# 23 espacos de enderecamento -> para alinhar a multiplo de 4, alinhar 1 para a frente

	.align 	1
	
lista:	.space 	20

	.text
	
	.globl 	main
	
main:	li	$t0,0
	la	$t1,lista
	
	
for:	bge	$t0,SIZE,endfor
	
	la	$a0,str1
	li	$v0,print_string
	syscall
	
	li	$v0,read_int
	syscall
	
	mul	$t2,$t0,4
	add	$t2,$t2,$t1
	sw	$v0,0($t2)

	addiu	$t0,$t0,1
	j	for
	
endfor:
	jr	$ra