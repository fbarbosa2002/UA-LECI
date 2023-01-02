	# define SIZE 15
	
	# int toi( char * )
	# int avz( int *, int);
	
	# int func2(int *f1,int k, char *av[])
	#{
	#	int i ;
	#	int res = -1 ;
	
	#	if (k >= 2) && (k<=SIZE) {
	#		i= 2;
	#		do{
	#			f1[i] = toi(av[i])
	#			i++ ; 
	#		} while(i < k) ;
	#		res = avz(f1,k) ;
	#		print_int10(res) ;
	#	}else
	#		print_string("Invalid argc");
	#	return res;
	#}
	
	# Mapa de registos
	# f1: $a0 -> $s0
	# k: $a1 -> $s1
	# av: $a2 -> $s2
	# i: $s3
	# res: $s4
	
		 
	.data
	.eqv 	SIZE,15
	.eqv	print_int10,1
	.eqv	print_string,4
str:	.asciiz "Invalid argc "
	.text
	.globl	main

main:	addiu	$sp,$sp,-20
	sw	$ra,0($sp)
	sw	$s0,4($sp)
	sw	$s1,8($sp)
	sw	$s2,8($sp)
	sw	$s3,12($sp)
	sw	$s4,16($sp)
	
	li	$s4,-1			# res = -1 ;
	move	$s0,$a0
	move	$s1,$a1
	move	$s2,$a2
	
if:	blt	$s1,2,else
	bgt	$s1,SIZE,else
	
	li	$s3,2

do:	add	$a0,$s2,$s3
	jal	toi
	move	$t0,$v0
	sll	$t1,$s3,2
	add	$t1,$t1,$s0
	sw	$t0,0($t1)		# f1[i] = toi(av[i])
	
	addiu	$s3,$s3,1
	
while:	blt	$s3,$s1,do
	move	$a0,$s0
	move	$a1,$s1
	jal	avz
	move	$s4,$v0			# res = avz(f1,k) ;
	
	move	$a0,$s4
	li	$v0,print_int10
	syscall
	
	j	endif
else:
	la	$a0,str
	li	$v0,print_string
	syscall
endif:	
	move	$v0,$s4
	
	lw	$ra,0($sp)
	lw	$s0,4($sp)
	lw	$s1,8($sp)
	lw	$s2,8($sp)
	lw	$s3,12($sp)
	lw	$s4,16($sp)
	addiu	$sp,$sp,20	
	jr	$ra