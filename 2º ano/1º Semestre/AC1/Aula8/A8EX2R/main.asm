.data
		.eqv STR_MAX_SIZE,33
		
str:		.space STR_MAX_SIZE
str1:		.asciiz "\n"
.text
.globl main

main:		addiu $sp,$sp,-8
		sw $ra,0($sp)
		sw $s0,4($sp)
		
do:		li $v0,5
		syscall 
		move $s0,$v0
		
		move $a0,$s0
		li $a1,2
		la $a2,str
		jal itoa
		move $a0,$v0
		li $v0,4
		syscall 
		
		la $a0,str1
		li $v0,4
		syscall 
		
		
		move $a0,$v0
		li $a1,8
		la $a2,str
		jal itoa
		move $a0,$v0
		li $v0,4
		syscall 
		
		la $a0,str1
		li $v0,4
		syscall 
		
		
		move $a0,$v0
		li $a1,16
		la $a2,str
		jal itoa
		move $a0,$v0
		li $v0,4
		syscall 
		
		la $a0,str1
		li $v0,4
		syscall 
		
while:		bne $s0,0,do
		
		li $v0,0
		
	
		lw $ra,0($sp)
		lw $s0,4($sp)
		addiu $sp,$sp,8
		
		jr $ra 
		