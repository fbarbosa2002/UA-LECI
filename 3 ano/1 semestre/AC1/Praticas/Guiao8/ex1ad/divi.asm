	.text
	.globl	divi
	
divi:	sll	$a1,$a1,16		#  divisor = divisor << 16; 
	
	andi	$a0,$a0,0xFFFF
	sll	$a0,$a0,1		#  dividendo = (dividendo & 0xFFFF) << 1; 
	
	li	$t0,0
for:	bge	$t0,16,endfor		#  for(i=0; i < 16; i++) 

	li	$t1,0			# bit = 0; 

if:	blt	$a0,$a1,endif		# if(dividendo >= divisor) 

	sub	$a0,$a0,$a1		# dividendo = dividendo - divisor; 
	li	$t1,1			# bit = 1; 

endif:	sll	$a0,$a0,1
	or	$a0,$a0,$t1		#  dividendo = (dividendo << 1) | bit; 

	addiu	$t0,$t0,1
	j	for

endfor:	srl	$t2,$a0,1
	andi	$t2,$t2,0xFFFF0000	# resto = (dividendo >> 1) & 0xFFFF0000; 
	andi	$t3,$a0,0xFFFF		# quociente = dividendo & 0xFFFF; 

	or	$v0,$t2,$t3
	
	jr	$ra
	

	
	