#	Mapa de registos 

#	$t0 -> i
#	$t1 -> value
#	$t2 -> bit
#	$t3 -> resto da divisao

	.data
	
str1:	.asciiz "\nIntroduza um numero: "
str2:	.asciiz "\nO valor em binario e: "

	.eqv read_int, 5
	.eqv print_string, 4
	.eqv print_char, 11
	
	
	.text
	.globl main

main:	la	$a0, str1
	li	$v0, 4
	syscall
	
	li 	$v0,5
	syscall
	
	move 	$t1, $v0
	
	li 	$t0,0
	li 	$t2,0
	
	la	$a0,str2
	li	$v0,4
	syscall
	
	
for:	bge 	$t0,32,endfor

	rem 	$t3,$t0,4
	
	bne 	$t3,0,moveon
	
	li	$a0, ' '
	li 	$v0, print_char
	syscall
	
	
moveon:	andi 	$t2,$t1, 0x80000000
	srl	$t2,$t2,31
	
	addi	$t2,$t2,'0'
	move	$a0,$t2
	li 	$v0,print_char
	syscall
	
	
	sll 	$t1,$t1,1

	addiu 	$t0,$t0,1
	j 	for
	
	
endfor:	jr 	$ra