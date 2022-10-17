#	Mapa de registos
#	$t0 -> res
#	$t1 -> i
#	$t2 -> mdor
#	$t3 -> mdo

	.data
	

str1:	.asciiz "Introduza dois numeros: "
str2:	.asciiz "Resultado: "
	
	.eqv print_string,4
	.eqv read_int,5
	.eqv print_int10,1
	
	.text
	
	.globl 	main
	
main:	li 	$t0,0
	li 	$t1,0
	
	la	$a0,str1
	li	$v0,print_string
	syscall
	
	li	$v0,read_int
	syscall
	
	move	$t2,$v0
	andi	$t2,$t2,0x0F		#mdor = read_int & 0x0F
	
	li	$v0,read_int
	syscall
	
	move	$t3,$v0
	andi	$t3,$t3,0x0F		#mdo = read_int & 0x0F
	
while:	beq 	$t2,0,endw
	bge	$t1,4,endw
	
	andi 	$t4,$t2,0x00000001
if:	beq	$t4,0,endif
	
	add	$t0,$t0,$t3

endif: 	sll	$t3,$t3,1
	srl	$t2,$t2,1
	
	addiu $t1,$t1,1
	j while

endw:	la	$a0,str2
	li	$v0,print_string
	syscall
	
	
	move $a0,$t0
	li $v0,print_int10
	syscall
	
	jr $ra
			

	
	
	
	
	
	
	
