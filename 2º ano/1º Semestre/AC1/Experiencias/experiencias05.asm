#Código em C

#if(a > b && b != 0)
#c = b << 2;
#else
#c = (a & b) ^ (a | b);

.data

	.eqv read_int,5
	.eqv print_string,4
	.eqv print_int10,1

str1:	.asciiz "Introduza três números: "
str2:	.asciiz "Os seus números são: "
str3:	.asciiz ", "

#Mapa de registos 

# $t0:a
# $t1:b
# $t2:c


.text
.globl main

main:	la $a0, str1
	li $v0, print_string
	syscall
	
	li $v0, read_int
	syscall 
	move $t0, $v0
	
	li $v0, read_int
	syscall 
	move $t1, $v0
	
	li $v0, read_int
	syscall 
	move $t2, $v0
	
	la $a0, str2
	li $v0, print_string
	syscall
	
	move $a0, $t0
	li $v0, print_int10
	syscall
	
	la $a0, str3
	li $v0, print_string
	syscall
	
	move $a0, $t1
	li $v0, print_int10
	syscall
	
	la $a0, str3
	li $v0, print_string
	syscall
	
	move $a0, $t2
	li $v0, print_int10
	syscall
	
if:	sgt $t3, $t0, $t1
	sne $t4, $t1, 0
	and $t5, $t4, $t3
	bne $t5, 1, endif 	#if(a > b && b != 0)
	sll $t2,$t1,2			#c = b << 2;

endif:	and $t6, $t0, $t1 
	or $t7, $t0, $t1
	xor $t2, $t6, $t7#c = (a & b) ^ (a | b);

	move $a0, $t2
	li $v0, print_int10
	syscall
	jr $ra