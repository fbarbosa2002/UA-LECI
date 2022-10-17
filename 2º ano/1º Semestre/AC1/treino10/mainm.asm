
#unsigned int id_number;		4	4	0 
# char first_name[18]; 			1	18	4
# char last_name[15]; 			1	15	22	
# float grade; 				4	4	40	
#					4	44

.data
		.eqv MAX_STUDENTS,4

st_array:	.space 176
media:		.space 4
str1:		.asciiz"\nMedia: "
.text
.globl main

main:		addiu $sp,$sp,-4
		sw $ra,0($sp)

		li $a1,MAX_STUDENTS
		la $a0,st_array
		jal read_data
		
		la $a0,st_array
		li $a1,MAX_STUDENTS
		la $a2,media
		jal max 
		move $s0,$v0
		
		la $a0,str1
		li $v0,4
		syscall
		
		
		la $t0,media
		l.s $f12,0($t0)
		li $v0,2
		syscall
		
		
		move $a0,$s0
		jal print_student
		
		li $v0,0
		
		
		lw $ra,0($sp)
		addiu $sp,$sp,4
		
		jr $ra