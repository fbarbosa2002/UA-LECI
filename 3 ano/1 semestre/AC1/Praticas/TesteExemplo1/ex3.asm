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
#	$t5 -> a+N
#	$t6 -> *p1
#	$t7 -> *p2
#	$t8 -> *p1 % 2

	.data
	
	.eqv	SIZE,35
	.eqv	print_int10,1
	.eqv	read_int,5
	.eqv	print_char,11
	
a:	.space 140			# 35 * 4
be:	.space 140

	.text
	.globl main
	
main:
	li	$t0,0		# n_even = 0
	li	$t1,0		# n_odd = 0
	
	la	$t2,a
	
	li	$t4,SIZE
	mul	$t4,$t4,4	# $t4 -> SIZE
	
	addu	$t5,$t2,$t4	# $t5 -> a+N
	
for1:	bge	$t2,$t5,endf1
	
	li	$v0,read_int
	syscall
	
	sw	$v0,0($t2)
	  
	addiu	$t2,$t2,4  
	j 	for1
	
	  
endf1:	la	$t2,a
	la	$t3,be
	  
for2:	bge	$t2,$t5,endf2

	lw	$t6,0($t2)
	rem	$t8,$t6,2
	
if:	bne	$t8,0,else

	sw	$t6,0($t3)
	addiu	$t3,$t3,4
	addiu	$t1,$t1,1
	
	j	endif
else:
	addiu 	$t0,$t0,1
	
endif:	addiu	$t2,$t2,4
	j 	for2
	
	
endf2:	
	la	$t3,be
	mul	$t1,$t1,4
	addu	$t1,$t1,$t3

for3:	bge	$t3,$t1,endf3

	lw	$a0,0($t3)
	li	$v0,print_int10
	syscall
	
	li	$a0,','
	li	$v0,print_char
	syscall
	
	
	addiu	$t3,$t3,4
	j	for3
endf3:	

	jr	$ra