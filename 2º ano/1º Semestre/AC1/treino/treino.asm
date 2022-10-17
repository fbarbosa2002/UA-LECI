.data


array:		.space 200
str2:		.asciiz "Size of array:	"
str3:		.asciiz "array["
str4:		.asciiz "] = "
str5:		.asciiz "\nEnter the value to be inserted: "
str6:		.asciiz "\nEnter the position: "
str7:		.asciiz "\nOriginal array: "
str8:		.asciiz "\nModified array: "
.text
.globl main

main:		addiu $sp,$sp,-20
		sw $ra,0($sp)
		sw $s0,4($sp)
		sw $s1,8($sp)
		sw $s2,12($sp)
		sw $s3,16($sp)
		
		la $a0,str2
		li $v0,4
		syscall
		
		li $v0,5
		syscall
		move $s0,$v0
		li $t0,0
		la $t5,array
for2:		bge $t0,$s0,endf2						
		
		la $a0,str3
		li $v0,4
		syscall
		
		move $a0,$t0
		li $v0,1
		syscall
		
		la $a0,str4
		li $v0,4
		syscall
		
		
		
		li $v0,5
		syscall
		
		
		la $t2,array
		
		
		mul $t1,$t0,4
		
		addu $t3,$t2,$t1
		
		sw $v0,0($t3)
		
		addiu $t0,$t0,1
		
		j for2
		
endf2:		la $a0,str5
		li $v0,4
		syscall
		
		li $v0,5
		syscall 
		move $s1,$v0			#insert_value=$s1
		
		la $a0,str6
		li $v0,4
		syscall
		
		li $v0,5
		syscall
		move $s2,$v0			#insert_pos=$s2
		
		la $a0,str7
		li $v0,4
		syscall 
		
		move $s3,$t5
		move $a0,$s3
		move $a1,$s0
		jal print_array
		
		move $a0,$s3
		move $a1,$s1
		move $a2,$s2
		move $a3,$s0
		jal insert
		
		la $a0,str8
		li $v0,4
		syscall
		
		move $a0,$s3
		addiu $s0,$s0,1
		move $a1,$s0
		jal print_array
		
		li $v0,0
		
		
		
		
		
		
		
		
		lw $ra,0($sp)
		lw $s0,4($sp)
		lw $s1,8($sp)
		lw $s2,12($sp)
		lw $s3,16($sp)
		addiu $sp,$sp,20
		jr $ra

