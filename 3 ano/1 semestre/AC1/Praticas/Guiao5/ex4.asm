#	Mapa de registos
#	$t0 -> lista
#	$t1 -> (SIZE - 1) + lista == pultimo
#	$t2 -> houvetroca
#	$t3 -> *p
#	$t4 -> *(p + 1)
#	$t5 -> aux
#	$t6 -> i
	.data
	.eqv SIZE,10
	.eqv TRUE,1
	.eqv FALSE,0
	.eqv print_string,4
	.eqv read_int,5
	.eqv print_int10,1
	.eqv print_char,11
		
lista:	.space 40
string1:.asciiz "Array incial: "
string2:.asciiz "Array ordenado: "
	.text
	.globl main
	
main:	la	$t0,lista
	
	li	$t1,SIZE
	mul	$t1,$t1,4	# (SIZE) * 4
	addu	$t1,$t1,$t0	# ((SIZE * 4) + lista == ultimo elemento da lista
	
	la	$a0,string1
	li	$v0,print_string
	syscall
	
forinicial:
	bge	$t0,$t1,endforinicial
	
	li	$v0,read_int
	syscall
	
	sw	$v0,0($t0)
	
	addiu	$t0,$t0,4
	j	forinicial
	
endforinicial:
	
	la	$t0,lista
	
	li	$t1,SIZE
	sub	$t1,$t1,1	# (SIZE - 1)
	mul	$t1,$t1,4	# (SIZE - 1) * 4
	addu	$t1,$t1,$t0	# ((SIZE - 1) * 4) + lista == penultimo elemento da lista
	
do:	li	$t2,FALSE	
	la	$t0,lista
	
for:	bge	$t0,$t1,endfor

	lw	$t3,0($t0)	# *p
	lw	$t4,4($t0)	# *(p+1)
	
if:	ble	$t3,$t4,endif

	move	$t5,$t3		#aux = *p
	sw	$t4,0($t0)	# *p = *(p+1)
	sw	$t5,4($t0)	# *(p+1) = aux
	li	$t2,TRUE	# houveTroca == true
endif:	
	addiu	$t0,$t0,4
	j	for
endfor:
	beq	$t2,TRUE,do
	
	
	la	$t0,lista
	li	$t6,0
	la	$a0,string2
	li	$v0,print_string
	syscall
	
forprint:
	bge	$t6,SIZE,endforprint
	mul	$t7,$t6,4
	addu	$t7,$t7,$t0
	lw	$a0,0($t7)
	li	$v0,print_int10
	syscall
	
	li	$a0,','
	li	$v0,print_char
	syscall
	
	
	
	addiu	$t6,$t6,1
	j 	forprint
	
endforprint:

	jr	$ra