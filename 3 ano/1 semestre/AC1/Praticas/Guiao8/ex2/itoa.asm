# Mapa de registos 
# n: $a0 -> $s0 
# b: $a1 -> $s1 
# s: $a2 -> $s2 
# p: $s3 
# digit: $t0 
# Sub-rotina interm�dia 

	
	
	.text
	
	.globl itoa
	
itoa: 	addiu 	$sp,$sp,-20 # reserva espa�o na stack 
 	sw 	$ra,0($sp)
 	sw 	$s0,4($sp) # guarda registos $sx e $ra 
 	sw	$s1,8($sp)
 	sw	$s2,12($sp)
 	sw	$s3,16($sp)
	
	move 	$s0,$a0 # copia n, b e s para registos 
 	move	$s1,$a1 # "callee-saved" 
 	move	$s2,$a2
 	move 	$s3,$a2 # p = s; 
do: 	# do { 
 	
 	rem	$t0,$s0,$s1
 	div	$s0,$s0,$s1
 	
 	move	$a0,$t0	
 	jal	toascii
 	sb	$v0,0($s3)
 	addiu	$s3,$s3,1
 	    
 	bgt 	$s0,0,do # } while(n > 0); 
 	
enddo:	sb 	$0,0($s3) # *p = 0; 
	move	$a0,$s2 
 	jal 	strrev # strrev( s ); 
 	move	$v0,$s2
 	
	lw	$ra,0($sp)
	lw	$s0,4($sp)
 	lw	$s1,8($sp)
 	lw	$s2,12($sp)
 	lw	$s3,16($sp) 
 	addiu 	$sp,$sp,20 # liberta espa�o na stack 

 	jr 	$ra # 
