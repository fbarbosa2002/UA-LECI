#define SIZE 8
#void main(void)
#{

#	static int val[SIZE] = {8,4,15,-1987,327,-9,27,16};
#	int i,v;

#	i=0;

#	do{

#		v = val[i];
#		val[i] = val[i+SIZE/2];
#		val[i+SIZE/2] = v;

#	while(++i < (SIZE/2));

#	print_string("Result is: ");
#	i=0;

#	do{
#		print_int10(val[i++]);
#		print_char(',');
#	while(i<SIZE);

#	Mapa de registos
#	i: $t0
#	v: $t1
#	&val[0]: $t2
#	SIZE: $t3
#	SIZE/2: $t4
#	endereco de memoria inicial: $t5
#	endereco de memoria a metade: $t6

	.data
	
	.eqv SIZE,8
	.eqv print_string,4
	.eqv print_int10,1
	.eqv print_char,11

string:	.asciiz "Result is: "
val:	.word 1,2,3,4,5,6,7,8 
	 	 
	 
	.text
	
	.globl main
	
main:	
	li	$t0,0			# i -> 0
	li	$t3,SIZE	
	mul	$t3,$t3,4		# size -> *4
	
	div	$t4,$t3,2		# size/2
	
	la	$t2,val		
	
do1:	addu	$t5,$t2,$t0		# $t5 -> val[i]
	lw	$t1,0($t5)		# v -> val[i]
	
	addu	$t6,$t4,$t0
	addu	$t6,$t6,$t2
	lw	$t7,0($t6)
	sw	$t1,0($t6)
	sw	$t7,0($t5)
	
while1:	addiu	$t0,$t0,4
	blt	$t0,$t4,do1
	
	la	$a0,string
	li	$v0,print_string
	syscall
	
	li	$t0,0
	
do2:	addu 	$t7,$t2,$t0
	lw	$t5,0($t7)
	
	move	$a0,$t5
	li	$v0,print_int10
	syscall
	addiu	$t0,$t0,4
	li	$a0,','
	li	$v0,print_char
	syscall
	
while2:	blt	$t0,$t3,do2

	jr $ra
	
