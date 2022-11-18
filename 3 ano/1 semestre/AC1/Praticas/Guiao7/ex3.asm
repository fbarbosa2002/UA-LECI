	.text
			
strlen:	li	$t0,0	# $t0 -> len = 0

while:	lb	$t1,0($a0)	# $t1 -> *s
	
	addiu	$a0,$a0,1	# *s++
	beq	$t1,'\0',endw
	
	addiu	$t0,$t0,1
	
	j	while

endw:	move	$v0,$t0		# return len

	jr	$ra
	
	
	.text
	
exchange:		# *c1 -> $a0 // *c2 -> $a1

	lb	$t0,0($a0)
	lb	$t1,0($a1)
	
	sb	$t0,0($a1)
	sb	$t1,0($a0)
	
	jr	$ra
	
	
	.text
# Mapa de registos: 
# str: $a0 -> $s0 (argumento é passado em $a0) 
# p1: $s1 (registo callee-saved) 
# p2: $s2 (registo callee-saved) 
# 
strrev: 
	addiu 	$sp,$sp,-16 # reserva espaço na stack 
 	sw 	$ra,0($sp) # guarda endereço de retorno 
 	sw 	$s0,4($sp) # guarda valor dos registos 
 	sw 	$s1,8($sp) # $s0, $s1 e $s2 
 	sw 	$s2,12($sp) # 
 	
 	move 	$s0,$a0 # registo "callee-saved" 
 	move 	$s1,$a0 # p1 = str 
 	move	$s2,$a0 # p2 = str 
while1: 
	lb	$t0,0($s2)	# while( *p2 != '\0' ) { 
	beq	$t0,'\0',endw1
 	addiu	$s2,$s2,1 	# p2++; 
 	j	while1 		# } 
endw1:	addiu	$s2,$s2,-1 	# p2--; 
 	
while2: bge	$s1,$s2,endw2			# while(p1 < p2) { 
 	 
 	move 	$a0,$s1 # 
 	move 	$a1,$s2 # 
 	jal 	exchange # exchange(p1,p2) 
 	addiu	$s1,$s1,1
 	addiu	$s2,$s2,-1
 	 
 	j 	while2 # } 
 	
endw2:
 	move 	$v0,$s0 # return str 
 	lw 	$ra,0($sp) # repõe endereço de retorno 
 	lw 	$s0,4($sp) # repõe o valor dos registos 
 	lw 	$s1,8($sp) # $s0, $s1 e $s2 
	lw 	$s2,12($sp) # 
 	addiu 	$sp,$sp,16 # liberta espaço da stack 
 	jr	$ra # termina a sub-rotina 

	.text
	
strcpy:	
	li	$t0,0
	
do:	
	
	
	addu	$t2,$a1,$t0
	
	lb	$t1,0($t2)
	
	addu	$t3,$a0,$t0
	
	sb	$t1,0($t3)
	
	addiu	$t0,$t0,1
	
	bne	$t1,'\0',do
	
	move	$v0,$a0
	jr	$ra
	
	
	
	#Mapa de registos 
	# $t0 -> strlen(str1)
	# $t1 -> exit_value
	.data
	
str1:	.asciiz "I serodatupmoC ed arutetiuqrA"
str2:	.space 31
str3:	.asciiz "String too long: "
strn:	.asciiz "\n"
	.eqv	print_string,4
	.eqv	print_int10,1
	.eqv	STR_MAX_SIZE,30
	
	.text
	
	.globl main
	
main:	addiu	$sp,$sp,-4
	sw	$ra,0($sp)
	
	la	$a0,str1
	
	jal	strlen
	
	move	$t0,$v0

if:	bgt	$t0,STR_MAX_SIZE,else

	la	$a0,str2
	la	$a1,str1
	
	jal	strcpy
	
	move	$a0,$v0
	li	$v0,print_string
	syscall
	
	la	$a0,strn
	li	$v0,print_string
	syscall
	
	la	$a0,str2
	jal	strrev
	move	$a0,$v0
	li	$v0,print_string
	syscall
	
	li	$t1,0	
	j	endif
	
	
else:	la	$a0,str3
	li	$v0,print_string
	syscall
	
	la	$a0,str1
	jal	strlen
	move	$a0,$v0
	
	li	$v0,print_int10
	syscall
	
	li	$t1,-1
	
endif:	move 	$v0,$t1
	lw	$ra,0($sp)
	addiu	$sp,$sp,4
	jr	$ra