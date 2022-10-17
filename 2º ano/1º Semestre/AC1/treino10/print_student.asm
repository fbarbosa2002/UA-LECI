.data
str1:		.asciiz "N.Mec: "
str2:		.asciiz "\nPrimeiro Nome: "
str3:		.asciiz "\nUltimo Nome: "
str4: 		.asciiz "\nNota: "

.text
.globl print_student
print_student:		move $t0,$a0

			la $a0,str1
			li $v0,4
			syscall
			
			lw $a0,0($t0)
			li $v0,36
			syscall
			
			la $a0,str2
			li $v0,4
			syscall
			
			addiu $a0,$t0,4
			li $v0,4
			syscall
			
			la $a0,str3
			li $v0,4
			syscall
			addiu $a0,$t0,22
			li $v0,4
			syscall
			
			la $a0,str4
			li $v0,4
			syscall
			l.s $f12,40($t0)
			li $v0,2
			syscall