

	.eqv 	SIZE,3				#define SIZE 3 
	.eqv	print_string,4
	.eqv	print_char,11
	
	.data

array:	.word 	str1,str2,str3			# static char *array[SIZE]={"Array", "de", "ponteiros"}; 

str1:	.asciiz "Array"
str2:	.asciiz "de"
str3:	.asciiz "Ponteiros"

    
	.text
	
	.globl main
	
main:	li	$t0,0	# i -> $t0
	la	$t1,array
	
for:	bge 	$t0,SIZE,endf			# for(i=0; i < SIZE; i++) 
	
	sll	$t2,$t0,2
	addu	$t3,$t2,$t1
	lw	$a0,0($t3)
	li	$v0,print_string
	syscall					# print_string(array[i]); 
	
	li	$a0,'\n'
	li	$v0,print_char
	syscall					# print_char('\n'); 
	
	addiu	$t0,$t0,1			# i++
	j	for				# jump to for

endf:	
	jr	$ra
	 	
	  	