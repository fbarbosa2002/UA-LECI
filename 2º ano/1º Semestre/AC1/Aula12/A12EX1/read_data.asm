.data

str1:		.asciiz "N.Mec: "
str2:		.asciiz	"\nPrimeiro Nome: "
str3:		.asciiz "\nUltimo nome: "
str4:		.asciiz "\nNota: "
.text
.globl read_data
read_data:	li $t0,0
		move $t2,$a1
		move $t1,$a0
		
for:		bge $t0,$t2,endf

		la $a0,str1
		li $v0,4
		syscall 
		li $v0,5
		syscall 
		
		mul $t3,$t0,44
		addu $t3,$t3,$t1
		sw $v0,0($t3)
		
		la $a0,str2
		li $v0,4 
		syscall 
		addiu $a0,$t3,4
		li $a1,18
		li $v0,8
		syscall
		
		la $a0,str3
		li $v0,4
		syscall
		addiu $a0,$t3,22
		li $a1,15
		li $v0,8
		syscall 
		
		la $a0,str4
		li $v0,4
		syscall
		
		li $v0,6
		syscall
		
		addiu $t3,$t3,40
		s.s $f0,0($t3)
		addi $t0,$t0,1
		j for 
		
endf:
		jr $ra 
		
		
