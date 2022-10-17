#	Mapa de registos 

#	$t0 -> i
#	$t1 -> value
#	$t2 -> bit
#	$t3 -> resto da divisao
#	$t4 -> flag
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
	li 	$t4,0
	
	la	$a0,str2
	li	$v0,4
	syscall
	
	
for:	bge 	$t0,32,endfor

	srl	$t2, $t1, 31
	
if:	beq	$t4, 1, set
	beq	$t2,0,endif
	
		
set:	li 	$t4,1
	
	rem	$t3,$t0,4
	
if3:	bne	$t3,0,endif2
	
	li 	$a0, ' '
	li	$v0, print_char 
	syscall
	
endif2:	addi	$t2,$t2,'0'
	
	move	 $a0,$t2
	li 	$v0,print_char
	syscall
	

endif:	sll	$t1, $t1, 1
	
	addiu	$t0,$t0,1
	j	for
	
endfor:	jr 	$ra