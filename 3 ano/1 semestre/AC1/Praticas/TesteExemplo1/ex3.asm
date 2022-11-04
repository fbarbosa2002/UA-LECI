#define N 35

#void main(void){

#	static int a[N], b[N];
#	int n_even = 0 ;
#	int n_odd = 0 ;
#	int *p1,*p2 ;

#	for ( p1=a; p1< (a+N); p1 ++){
#		*p1 = read_int();
#	}
  
#	for ( p1=a; p2=b; p1 < (a + N); p1++){
#		if(*p1 % 2 == 0){
#			*p2++ = *p1 ;
#			n_odd++;
#		}
#		else
#		{
#			n_even++;
#		}
#	}

#	for ( p2=b; p2<(b + n_odd); p2++){
#		print_int10(*p2);
#	}

#}

#	Mapa de registos
#	$t0 -> n_even
#	$t1 -> n_odd
#	$t2 -> p1
#	$t3 -> p2
#	$t4 -> N
#	$t5 -> a+N// b+ n_odd
#	$t6 -> *p1
	.data
	.eqv	print_int10,1
	.eqv	read_int,5
	.eqv	N,35	
a:	.space 140
be:	.space 140

	.text
	.globl 	main
	
main:	li	$t0,0
	li	$t1,0
	
	la	$t2,a
	
	li	$t4,N
	mul	$t4,$t4,4	#N*4
	add	$t5,$t4,$t2
	
for1:	bne	$t2,$t5,endfor1
	
	li	$v0,read_int
	syscall
	
	sw	$v0,0($t2)	# *p1 = read_int()

	addiu	$t2,$t2,4
	j	for1
	
endfor1:
	la	$t2,a
	la	$t3,be
	add	$t5,$t4,$t2
	
for2:	bge	$t2,$t5,endfor2
	
	lw	$t6,0($t2)
	
	rem	$t7,$t6,2
	
if:	bne	$t7,0,else
	
	sw	$t6,0($t3)
	addiu	$t3,$t3,4
	addiu	$t1,$t1,1
	
	j	endif
else:	addiu	$t0,$t0,1
	

endif:
	addiu	$t2,$t2,4
	j	for2
	
endfor2:
	la	$t3,be
	mul	$t1,$t1,4
	addu	$t4,$t3,$t1
	

for3:	bge	$t3,$t4,endfor3

	lw	$t7,0($t3)
	move	$a0,$t7
	li	$v0,print_int10
	syscall
	
	
	addiu	$t3,$t3,4
	j	for3	
endfor3:
	jr	$ra
