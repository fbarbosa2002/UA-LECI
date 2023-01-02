
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
				
	.globl	strlen			
strlen:	li	$t0,0	# $t0 -> len = 0

while:	lb	$t1,0($a0)	# $t1 -> *s
	
	addiu	$a0,$a0,1	# *s++
	beq	$t1,'\0',endw
	
	addiu	$t0,$t0,1
	
	j	while

endw:	move	$v0,$t0		# return len

	jr	$ra
	
	