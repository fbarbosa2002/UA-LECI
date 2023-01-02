	# define SIZE 8
	
	# int main(void)
	#{
	
	#	static int list[SIZE]
	#	int rv, n ;
	#	int sum = 0 , nit = 0 ;
	#	int *pt ;
	
	#	for (pt = list ; pt < (list + SIZE) ; pt ++) {
	#		*pt = read_int() ;
	#	}
	#	for(n = 0 ; n < SIZE ; n++) {
	#		if (list[n] >= 0) {
	#			sum += list[n] ;
	#			nit++ ;
	#		}
	#	}
	#	if (nit > 0) {
	#		print_int10(sum/nit) ;
	#		rv = 0 ;
	#	} else {
	#		print_string("Media invalida\n") ;
	#		rv -= 1 ;
	#	}
	#	return rv ;
	
	#	Mapa de registos
	#	rv:	$t0
	#	n:	$t1
	#	sum:	$t2
	#	nit:	$t3
	#	pt:	$t4
	#list+SIZE:	$t5
	
	.data
list:	.space	32	# 8 * 4
	.eqv	SIZE,8
	.eqv	print_int10,1
	.eqv	print_string,4
	.eqv	read_int,5	
str:	.asciiz "Media invalida\n "
 	.text
 	 
	.globl	main
	
main:	li	$t2,0			# sum = 0 ;
	li	$t3,0			# nit = 0 ;
	
	la	$t4,list
	li	$t5,SIZE
	sll	$t5,$t5,2
	addu	$t5,$t5,$t4		# list + SIZE
	
for1:	bge	$t4,$t5,endf1		# pt < list + SIZE
	
	li	$v0,read_int
	syscall
	sw	$v0,0($t4)		# *pt = read_int() ;
	
	addiu	$t4,$t4,4
	j	for1

endf1:

	li	$t1,0			# n = 0 ;
	
for2:	bge	$t1,SIZE,endf2		# n < SIZE

	la	$t4,list
	sll	$t5,$t1,2
	addu	$t4,$t4,$t5		# list[n]
	lw	$t4,0($t4)
	
if1:	blt	$t4,0,endif1		
	
	addu	$t2,$t2,$t4
	addiu	$t3,$t3,1
	
endif1:
	addiu	$t1,$t1,1
	j	for2

endf2:

if2:	ble	$t3,0,else2
	
	div	$a0,$t2,$t3
	li	$v0,print_int10
	syscall
	li	$t0,0
	
	j	endif2
else2:	
	la	$a0,str
	li	$v0,print_string
	syscall
	
	li	$t0,-1
endif2:
			
	move	$v0,$t0
	
	jr	$ra