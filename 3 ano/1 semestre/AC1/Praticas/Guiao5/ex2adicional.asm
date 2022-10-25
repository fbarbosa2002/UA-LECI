#	Mapa de registos	
#	i -> $t0
#	lista -> $t1
#	&lista[i] -> $t2
#	SIZE  || lista + SIZE-> $t3
#	SIZE - 1 -> $t4 
#	j -> $t5
#	&lista[j] -> $t6
#	lista[i] -> $t7
#	lista[j] -> $t8
	.data
	
	.eqv SIZE,10 
	.eqv read_int,5
	.eqv print_string,4
	.eqv print_char,11
	.eqv print_int10,1
string:	.asciiz "Array ordenado: "

lista:	.word 40

	.text
	.globl main
	
main:	li	$t0,0	# i=0
	la	$t1,lista
	li	$t3,SIZE
forinicial:

	bge	$t0,SIZE,endforinicial	 # if i>10 -> endforinicial
	mul	$t2,$t0,4		# i * 4
	addu	$t2,$t2,$t1		# &lista[i]
	
	li	$v0,read_int		
	syscall
	sw	$v0,0($t2)		# $v0 -> lista[i]
	

	addiu	$t0,$t0,1		# i++
	j	forinicial
	
endforinicial:

	li	$t0,0			# i = 0
	la	$t1,lista
	li	$t3,SIZE
	addiu	$t4,$t3,-1		# SIZE - 1
	
	
for1:	bge	$t0,$t4,endfor1

	addiu	$t5,$t0,1		# j = i + 1

for2:	bge	$t5,$t3,endfor2

	mul	$t2,$t0,4		# i * 4
	addu	$t2,$t2,$t1		#&lista[i]
	lw	$t7,0($t2)		#lista[i]
	
	mul	$t6,$t5,4
	addu	$t6,$t6,$t1
	lw	$t8,0($t6)		#lista[j]
	
if:	ble	$t7,$t8,endif		#lista[i] > lista[j]
	
	sw	$t7,0($t6)
	sw	$t8,0($t2)

endif:
	addiu	$t5,$t5,1
	j for2
	
endfor2:
	addiu	$t0,$t0,1
	j 	for1
endfor1:	
	
	
	la	$t1,lista
	li	$t3,SIZE
	mul	$t3,$t3,4
	addu	$t3,$t3,$t1
	la	$a0,string
	li	$v0,print_string
	syscall
forprint:
	bge	$t1,$t3,endforprint
	
	lw	$a0,0($t1)
	li	$v0,print_int10
	syscall
	
	li	$a0,';'
	li	$v0,print_char 
	syscall
	addiu	$t1,$t1,4
	j	forprint		
endforprint:
