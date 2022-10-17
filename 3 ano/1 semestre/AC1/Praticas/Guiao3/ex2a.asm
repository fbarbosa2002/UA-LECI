#	Mapa de registos 

#	$t0 -> i
#	$t1 -> value
#	$t2 -> bit


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

	andi 	$t2,$t1, 0x80000000
	
if:	beq 	$t2,$0,else
	
	li	$a0,'1'
	li 	$v0,print_char
	syscall
	
	j	endif
	
else:	li 	$a0,'0'
	li	$v0, print_char
	syscall
	
endif:	sll 	$t1,$t1,1

	addiu 	$t0,$t0,1
	j 	for
	
	
endfor:	jr 	$ra