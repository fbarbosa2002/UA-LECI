.data
		.eqv SIZE,10
a:		.space SIZE

.text
.globl main

main:		addiu $sp,$sp,-4
		sw $ra,0($sp)
		
		li $t0,0
		la $t1,a
for:		bge $t0,SIZE,endf
		
		mul $t2,$t0,8
		addu $t3,$t2,$t1 
		
		
		li $v0,5
		syscall
		
		mtc1 $v0,$f2
		cvt.d.w $f2,$f2

		s.d $f2,0($t3)
		
		addiu $t0,$t0,1
		j for
		
endf:		la $a0,a
		li $a1,10
		jal f2c
		
		mov.d $f12,$f0
		li $v0,3
		syscall
		
		lw $ra,0($sp)
		addiu $sp,$sp,4
		
		jr $ra