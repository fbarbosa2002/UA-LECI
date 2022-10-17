.data
		.eqv SIZE,10
a:		.space 80

.text
.globl main

main: 		addiu $sp,$sp,-4
		sw $ra,0($sp)
		
		li $t0,0
		la $t1,a
		
		
for:		bge $t0,SIZE,endf 
		
		sll $t2,$t0,3
		addu $t3,$t1,$t2
		
		li $v0,7
		syscall
		
		mtc1 $v0,$f2
		
		cvt.d.w $f2,$f2
		
		s.d $f2,0($t3)
		
		addiu $t0,$t0,1
		
		j for 

endf:		 
		
		move $a0,$t1 
		li $a1,10
		jal max
		
		mov.d $f12,$f0
		li $v0,3
		syscall 
		
		
		
		lw $ra,0($sp)
		addiu $sp,$sp,4
		li $v0,0 
		
		jr $ra 
		
		
		
		