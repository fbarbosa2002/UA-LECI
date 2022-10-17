.data

	.eqv read_int,5
	.eqv print_string,4
	.eqv print_int10,1
	.eqv print_char,11
	
str1:	.asciiz "Digite até 20 numeros(0 para terminar"
str2:	.asciiz " Os maximos /minimos são: "
str3:	.asciiz ":"
.text
.globl main

main:	li $t1,0
	li $t2, 0x7FFFFFFF
	li $t3, 0x80000000
	
	la $a0, str1
	li $v0, print_string
	syscall
	
do:	
	move $a0, $t0
	li $v0, read_int
	syscall
	move $t0,$v0
	
if:	beq $t0, 0, endif

if1:	ble $t0,$t3,endif1
	move $t3,$t0

endif1:
if2:	bge $t0,$t2,endif2
	move $t2, $t0

endif2:
endif:	addiu $t1,$t1,1

	slti $t4,$t1,20
	sne $t5,$t0,0
	and $t6, $t5, $t4
	
while:	slti $t4,$t1,20
	sne $t5,$t0,0
	and $t6, $t5, $t4
	beq $t6,1, do
	
enddo:	la $a0,str2
	li $v0, print_string
	syscall
	
	move $a0,$t3
	li $v0, print_int10
	syscall
	
	la $a0,str3
	li $v0,print_string 
	syscall
	
	move $a0, $t2
	li $v0, print_int10
	syscall
	
	jr $ra