

	.text
				# o argumento da funcao e passado em $a0
				# o return da funcao e passado em $v0
				
				#int strlen(char *s) 
				#{ 
 					
 					#int len=0; 
 					#while(*s++ != '\0') 
						 #len++; 
 					#return len; 
 					
				#}	
				
				
strlen:	li	$t0,0	# $t0 -> len = 0

while:	lb	$t1,0($a0)	# $t1 -> *s
	
	addiu	$a0,$a0,1	# *s++
	beq	$t1,'\0',endw
	
	addiu	$t0,$t0,1
	
	j	while

endw:	move	$v0,$t0		# return len

	jr	$ra
	
	
	.data
string:	.asciiz "Arquitetura de Computadores I"
	.eqv	print_int10,1
	.text
	
	.globl 	main

main:	addiu	$sp,$sp,-4
	sw	$ra,0($sp)
	
	la	$a0,string	
	jal	strlen
	
	move	$a0,$v0
	li	$v0,print_int10
	syscall
	
	lw	$ra,0($sp)
	addiu	$sp,$sp,4
	
	jr	$ra
	

	
	
	

