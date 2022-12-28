


	
	.eqv 	SIZE,3			#define SIZE 3 
	.eqv	print_string,4
	.eqv 	print_char,11
	.data
	
array:	.word	str1,str2,str3		# static char *array[SIZE]={"Array", "de", "ponteiros"}; 

str1:	.asciiz "Array"
str2:	.asciiz "de"
str3:	.asciiz "Ponteiros"

	.text
	
	.globl	main
	
main:	
	la	$t0,array		# p = array; 
	
	li	$t1,SIZE
	sll	$t1,$t1,2
	addu	$t1,$t1,$t0		# pultimo = array + SIZE; 
		
for:	bge	$t0,$t1,endf

	lw	$a0,0($t0)
	li	$v0,print_string
	syscall				# print_string(*p); 
	
	li	$a0,'\n'
	li	$v0,print_char
	syscall				# print_char('\n'); 
			
	
	addiu	$t0,$t0,4
	j	for
	
endf:	jr	$ra