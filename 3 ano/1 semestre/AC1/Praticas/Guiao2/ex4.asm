
# $t0 - numero em binario 
# $t1 - numero convertido para gray


	.data
	
	.eqv number, 1

string:	.asciiz "Numero para converter: "
string2:.asciiz "\nNumero convertido: "			
	.text
	
	.globl main
	
	
main:	la $a0,string
	li $v0,4
	syscall	# print string
	
	li $v0,5
	syscall # read integer
	
	
	or $t0,$0,$v0

	srl $t2,$t0,1
	
	xor $t1,$t0,$t2
	
	la $a0,string2
	li $v0,4
	syscall	#print string
	
	move $a0, $t1
	li $v0,1
	syscall	#print integer
	