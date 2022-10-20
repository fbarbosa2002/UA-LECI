#	Mapa de registos
#	$t0 -> p
#	$t1 -> pultimo
#	$t2 -> *p
#	$t3 -> soma
#	$t4 -> registo auxiliar 
#	$t5 -> array
#	$t6 -> counter 
#	$t7 -> registo auxiliar 2

#	Exercicio igual ao 3a mas onde é possivel definir o tamanho do array e onde os valores do array sao lidos do teclado	
	.data
	
array:	.space 16
string:	.asciiz "\nIntroduza um numero: "
string2:.asciiz "\nA soma do seu array e: "
string3:.asciiz "\nTamanho do array: "
	.eqv 	read_int,5
	.eqv	print_int10,1	
	.eqv 	espaco,16
	.eqv	print_string,4
	
	.text
	.globl main
	
main:	
	la	$t5,array
	li	$t3,0		# soma -> 0
	li	$t6,0		# counter -> 0
	
	
	la	$a0,string3
	li	$v0,print_string
	syscall
	li	$v0,read_int
	syscall
	move	$t4,$v0
	move 	$t7,$v0
	
	sub	$t4,$t4,1
	mul	$t4,$t4,4
while:	
	bge	$t6,$t7,endw
	
	la	$a0,string
	li	$v0,print_string
	syscall
	
	li	$v0,read_int
	syscall
	
	sw	$v0,0($t5)

		
	addiu	$t5,$t5,4
	addiu	$t6,$t6,1
	j	while
	
endw:	la	$t0,array	# $t0 -> p
	addu	$t1,$t0,$t4	# $t1 -> putlimo


whiles:	bgt	$t0,$t1,endws
	
	lw	$t2,0($t0)
	
	addu	$t3,$t3,$t2
	
	addiu	$t0,$t0,4
	j	whiles
	
endws:	la	$a0,string2
	li	$v0,print_string
	syscall
	
	move	$a0,$t3
	li	$v0,print_int10
	syscall
	
	jr $ra
