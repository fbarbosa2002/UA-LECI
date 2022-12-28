

	
	.eqv 	SIZE,3			#define SIZE 3 
	.eqv	print_string,4
	.eqv 	print_char,11
	.eqv	print_int10,1
	.data
	
array:	.word	str1,str2,str3		# static char *array[SIZE]={"Array", "de", "ponteiros"}; 

str1:	.asciiz "Array"
str2:	.asciiz "de"
str3:	.asciiz "Ponteiros"
str4:	.asciiz "\nString #"
str5:	.asciiz ": "
	.text
	
	.globl	main
	
main:	li	$t0,0			# i -> $t0

for:	bge	$t0,SIZE,endf
	
	la	$a0,str4
	li	$v0,print_string
	syscall				# print_string( "\nString #" ); 
	
	move	$a0,$t0
	li	$v0,print_int10
	syscall				# print_int10( i ); 
	
	la	$a0,str5
	li	$v0,print_string
	syscall				# print_string( ": " ); 
	
	li	$t1,0
	

while:	
	la	$t2,array
	sll	$t3,$t0,2
	addu	$t2,$t3,$t2
	lw	$t2,0($t2)
	addu	$t2,$t2,$t1
	lb	$t2,0($t2)
	beq	$t2,'\0',endw		# while(array[i][j] != '\0') 
	
	move	$a0,$t2
	li	$v0,print_char
	syscall				# print_char(array[i][j]); 
	
	li	$a0,'-'
	li	$v0,print_char
	syscall				# print_char('-'); 
	
	
	addiu	$t1,$t1,1		# j++; 
	j	while
endw:
	addiu	$t0,$t0,1
	j	for
	
endf:	jr	$ra