	.eqv	print_string,4
	.eqv 	read_string,8
	.eqv	read_int,5
	.data
	.align 	2
str1:	.space	101
	.align 	2
str2:	.space	51	
str3:	.asciiz "\nEnter a string: "
str4:	.asciiz "\nEnter a string to insert: "
str5:	.asciiz "\nEnter the position: "
str6:	.asciiz "\nOriginal string: "
str7:	.asciiz "\nModified string: "

	.text
	.globl	main

main:	addiu	$sp,$sp,-4
	sw	$ra,0($sp)
	
	la	$a0,str3
	li	$v0,print_string
	syscall					#  print_string("Enter a string: "); 
	
	la	$a0,str1
	li	$a1,50
	li	$v0,read_string	
	syscall					# read_string(str1, 50); 
		
	la	$a0,str4
	li	$v0,print_string
	syscall					# print_string("Enter a string to insert: "); 
	
	la	$a0,str2
	li	$a1,50
	li	$v0,read_string
	syscall					#  read_string(str2, 50); 

	la	$a0,str5
	li	$v0,print_string
	syscall					# print_string("Enter the position: "); 
	
	li	$v0,read_int
	syscall
	move	$t0,$v0				# insert_pos = read_int(); 
	
	la	$a0,str6
	li	$v0,print_string
	syscall					#  print_string("Original string: "); 
	
	la	$a0,str1
	li	$v0,print_string
	syscall					# print_string(str1); 

	la	$a0,str1
	la	$a1,str2
	move	$a2,$t0
	jal	insert				# insert(str1, str2, insert_pos); 
		
	la	$a0,str7
	li	$v0,print_string
	syscall					# print_string("\nModified string: "); 
	
	la	$a0,str1
	li	$v0,print_string
	syscall					# print_string(str1); 

	li	$v0,0				# return 0
	
	lw	$ra,0($sp)
	addiu	$sp,$sp,4
	jr	$ra
	
		
	
	
	