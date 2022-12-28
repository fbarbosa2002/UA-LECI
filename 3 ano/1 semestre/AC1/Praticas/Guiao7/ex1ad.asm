	# INSERT FUNCTION
	
	# Mapa de registos
	# $a0 -> *array
	# $a1 -> value
	# $a2 -> pos
	# $a3 -> size
	# $t0 -> i
	
	.text
insert:	

if:	ble	$a2,$a3,else			#  if(pos > size) 
	
	li	$v0,1				# return 1
	j	endif
	
else:	addi	$t0,$a3,-1			# i = size-1

for:	sll	$t2,$t0,2
	addu	$t2,$t2,$a0			# $t2 = &array[0]
	blt	$t0,$a2,endfor			#  for(i = size-1; i >= pos; i--) 
	
	lw	$t1,0($t2)	
	sw	$t1,4($t2)			#  array[i+1] = array[i]; 
		
	addi	$t0,$t0,-1			# i--
	j	for

endfor:
	sll	$t0,$a2,2
	addu	$t0,$t0,$a0
	sw	$a1,0($t0)			#  array[pos] = value; 

	li	$v0,0				# return 0
	
endif:	jr	$ra


	# PRINT_ARRAY FUNCTION
	# Mapa de registos
	# $a0 -> *a
	# $a1 -> n
	# $t0 -> a + n
	# $t1 -> a
	
	.data
str:	.asciiz ", "
	.eqv	print_int10,1
	.eqv	print_string,4
	.text
	
print_array:
	sll	$t0,$a1,2
	addu	$t0,$a0,$t0			#  int *p = a + n; 
	move	$t1,$a0
	
for1:	bge	$t1,$t0,endf1			#  for(; a < p; a++) 

	lw	$t2,0($t1)
	move	$a0,$t2
	li	$v0,print_int10
	syscall					#  print_int10( *a ); 
	
	la	$a0,str
	li	$v0,print_string
	syscall					#  print_string(", "); 
	
	addiu	$t1,$t1,4			# a++
	j	for1
	
endf1:	jr	$ra	


	.data
	.align 	2
array:	.space	50	
str1:	.asciiz "Size of array: "
str2:	.asciiz "array["
str3:	.asciiz "] = "
str4:	.asciiz "\nEnter the value to be inserted: "
str5:	.asciiz "\nEnter the position: "
str6:	.asciiz "\nOriginal array: "
str7:	.asciiz "\nModified array: "
	
	.eqv	read_int,5
	.eqv	print_string,4
	.eqv	print_int10,1
	
	.text
	.globl	main
	# Mapa de registos
	# $s0 -> array_size
	# $s1 -> insert_value
	# $s2 -> insert_pos
	
main:	addiu	$sp,$sp,-16
	sw	$ra,0($sp)
	sw 	$s0,4($sp)
	sw	$s1,8($sp)
	sw	$s2,12($sp)
	
	la	$a0,str1
	li	$v0,print_string
	syscall				#  print_string("Size of array : "); 
	
	li	$v0,read_int
	syscall
	move	$s0,$v0			#  array_size = read_int(); 

	li	$t0,0			# i = 0
		
for2:	bge	$t0,$s0,endfor2		#  for(i=0; i < array_size; i++) 

	la	$a0,str2
	li	$v0,print_string
	syscall				#  print_string("array["); 
	
	move	$a0,$t0
	li	$v0,print_int10
	syscall				#  print_int10(i); 

				
	la	$a0,str3
	li	$v0,print_string
	syscall				#  print_string("] = "); 
	
	la	$t2,array
	sll	$t3,$t0,2
	addu	$t2,$t2,$t3
	li	$v0,read_int
	syscall
	sw	$v0,0($t2)		#  array[i] = read_int(); 
	
	addiu	$t0,$t0,1		# i++
	j	for2
endfor2:	
	la	$a0,str4
	li	$v0,print_string
	syscall				#  print_string("Enter the value to be inserted: "); 
	
	li	$v0,read_int
	syscall
	move	$s1,$v0			#  insert_value = read_int(); 
	
	la	$a0,str5
	li	$v0,print_string
	syscall				#  print_string("Enter the position: "); 
	
	li	$v0,read_int
	syscall
	move	$s2,$v0			#  insert_pos = read_int(); 
	
	la	$a0,str6
	li	$v0,print_string
	syscall				#  print_string("\nOriginal array: "); 
	
	la	$a0,array
	move	$a1,$s0
	jal	print_array		#  print_array(array, array_size); 
	
	la	$a0,array
	move	$a1,$s1
	move	$a2,$s2
	move	$a3,$s0
	jal	insert			#  insert(array, insert_value, insert_pos, array_size); 
	
	la	$a0,str7
	li	$v0,print_string
	syscall				#  print_string("\nModified array: "); 
	
	la	$a0,array
	addiu	$s0,$s0,1
	move	$a1,$s0
	jal	print_array		#  print_array(array, array_size + 1); 
	
	li	$v0,0			# return 0
	
	lw	$ra,0($sp)
	lw	$s0,4($sp)
	lw	$s1,8($sp)
	lw	$s2,12($sp)
	addiu	$sp,$sp,8
	jr	$ra