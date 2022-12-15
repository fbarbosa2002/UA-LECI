#typedef struct 
#{ 
# unsigned int id_number; 
# char first_name[18]; 
# char last_name[15]; 
# float grade; 
#} student; 
	
	.data
	.eqv print_string,4
	.eqv print_intu10,36
	.eqv print_float,2
	.eqv print_char,11
	
	.eqv 	off_id,0
	.eqv 	off_fn,4
	.eqv 	off_ln,22
	.eqv	off_gr,40
	
	.align 2
	
stg:	.word	72343
	
	.asciiz "Napoleao"
	.space 9		# Tamanho de Napolao --> 9 // tamanho de first name --> 18 // 18-9 = 9
	
	.asciiz "Bonaparte"
	.space 5		# tamanho de Bonaparte --> 10 // tamanho de last name --> 15 // 15-10 = 5
	
	.align 2		# alinhar a 4
	
	.float 5.1
	
str1:	.asciiz "\nN. Mec: "
str2:	.asciiz "\nNome: "
str3:	.asciiz "\nNota: "
	
	.text
	.globl	main
	
main:	la	$a0,str1
	li	$v0,print_string
	syscall				#  print_string("\nN. Mec: "); 
	
	la	$t0,stg			# Get the initial address of the structure
	lw	$a0,off_id($t0)		# Get the value of the adress with the correspondent offset
	li	$v0,print_intu10
	syscall				#  print_intu10(stg.id_number); 
	
	la	$a0,str2
	li	$v0,print_string
	syscall				#  print_string("\nNome: "); 
	
	la	$a0,stg
	addi	$a0,$a0,off_ln		# initial address of the structure + offset of the last name
	li	$v0,print_string
	syscall				# print_string(stg.last_name); 

	
	li	$a0,','
	li	$v0,print_char
	syscall				# print_char(','); 

	
	la	$a0,stg
	addi	$a0,$a0,off_fn		# initial address of the structure + offset of first name
	li	$v0,print_string
	syscall				# print_string(stg.first_name); 

 	la	$a0,str3
 	li	$v0,print_string
 	syscall				# print_string("\nNota: "); 
	
	la	$t0,stg
	l.s	$f12,off_gr($t0)
	li	$v0,print_float
	syscall				# print_float(stg.grade); 

	
	li	$v0,0
	
	jr	$ra 
	
	
	
	
	
	