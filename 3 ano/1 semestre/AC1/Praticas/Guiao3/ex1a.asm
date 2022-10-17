#	Mapa de registos
#	$t0 -> i
#	$t1 -> soma 
#	$t2 -> value


	.data

str1:	.asciiz "\nIntroduza um numero: "
str2:	.asciiz "Valor ignorado\n"
str3:	.asciiz "A soma dos positivos e: "
	
	.eqv print_string,4
	.eqv read_int,5
	.eqv print_int10,1
	
	
	.text
	.globl main
	
main:	li	$t0, 0		# i -> 0
	li 	$t1, 0		# soma -> 0
	
for:	bge 	$t0,5,endfor	# condition ->	i<5

	la 	$a0,str1
	li 	$v0,print_string
	syscall			# 'Introduza um numero'
	
	li 	$v0,read_int
	syscall			# Ler inteiro
	
	move 	$t2,$v0		#value = read_int()
	
	
if:	ble 	$t2,0,else	#if value >0
	
	addu 	$t1,$t1,$t2
	
	j 	endif
	

else:	la	$a0,str2	#else
	li 	$v0,print_string
	syscall
	
	
	

endif:	addiu 	$t0,$t0,1

	j 	for
	
	
endfor:	la 	$a0,str3
	li 	$v0,print_string
	syscall
	
	move 	$a0,$t1
	li 	$v0,print_int10
	syscall
	
	
	jr 	$ra
