# Mapa de registos 
# str: $s0 
# val: $s1 
# O main �, neste caso, uma sub-rotina interm�dia 
 	.data 
 	.align	2
str: 	.space 33 
 	.eqv STR_MAX_SIZE,33 
 	.eqv read_int,5
 	.eqv print_string,4
 	.text 
 	.globl main 
main: 	addiu 	$sp,$sp,-8 # reserva espa�o na stack 
 	sw	$s0,0($sp) # guarda registos $sx na stack 
 	sw 	$ra,4($sp) # guarda $ra na stack 
do: # do { 
 	li 	$v0,read_int 
 	syscall # 
 	move 	$s1,$v0 # val = read_int() 
  	
  	move	$a0,$s1
  	li	$a1,2
	la	$a2,str
  	jal	itoa
  	move	$a0,$v0
  	li	$v0,print_string
  	syscall

  	move	$a0,$s1
  	li	$a1,8
	la	$a2,str
  	jal	itoa
  	move	$a0,$v0
  	li	$v0,print_string
  	syscall
  	
  	move	$a0,$s1
  	li	$a1,16
	la	$a2,str
  	jal	itoa
  	move	$a0,$v0
  	li	$v0,print_string
  	syscall
  	
  	  	  	
	bne 	$s1,0,do # } while(val != 0) 
 	li	$v0,0	  # return 0; 
 	lw	$s0,0($sp)# repoe registos $sx 
 	lw 	$ra,4($sp) # rep�e registo $ra 
 	addiu 	$sp,$sp,8 # liberta espa�o na stack 
 	jr 	$ra # termina programa
