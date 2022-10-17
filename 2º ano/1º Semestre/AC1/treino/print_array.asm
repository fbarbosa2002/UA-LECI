.data
str:		.asciiz "; "
.text
.globl print_array

print_array:	move $t0,$a0
		move $t1,$a1
		mul $t1,$t1,4
		addu $t2,$t1,$t0
		
		
		
for1:		bge $t0,$t2,endf1
		
		lw $a0,0($t0)
		li $v0,1
		syscall
		
		la $a0,str
		li $v0,4
		syscall
		
		
		addiu $t0,$t0,4
		j for1
		
endf1:		jr $ra 	
		
