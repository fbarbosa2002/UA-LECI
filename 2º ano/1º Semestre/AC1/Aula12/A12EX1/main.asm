.data

st_array:	.space 176 #44*4(num max students)

str1:		.asciiz "\nMédia"
str2:		.asciiz"\n"
		.align 2
media:		.space 4
.text
.globl main

main:		addiu $sp,$sp,-8
		sw $ra,0($sp)
		sw $s0,4($sp)
		
		la $a0,st_array
		li $a1,4
		jal read_data
		
		la $a0,st_array
		li $a1,4
		la $a2,media 
		jal max
		
		la $a0,str1
		li $v0,4
		syscall
		
		la $t0,media
		l.s $f12,0($t0)
		li $v0,2
		syscall
		
		la $a0,str2
		li $v0,4
		syscall 
		
		move $a0,$s0
		jal print_student 
		
		lw $ra,0($sp)
		lw $s0,4($sp)
		addiu $sp,$sp,8
		
		li $v0,0 	
		jr $ra  	