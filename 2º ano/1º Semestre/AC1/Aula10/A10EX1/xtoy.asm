.data
n1:		.double 1.0
.text
.globl xtoy
xtoy:		addiu $sp,$sp,-28
		sw $ra,0($sp)
		sw $s0,4($sp)
		sw $s1,8($sp)
		s.d $f20,12($sp)
		s.d $f22,20($sp)
		
		li $s0,0
		la $t0,n1
		
		l.d $f20,0($t0)
		move $s1,$a0
		mov.d $f22,$f12
		move $a0,$s1
		jal abss
		move $t1,$v0
		
for:		bge $s0,$t1,endf	

if:		ble $s1,0,else

		mul.d $f20,$f20,$f22
		j endif

else:		div.d $f20,$f20,$f22

endif:		addi $s0,$s0,1
		j for 				

endf:		mov.d $f0,$f20
		lw $ra,0($sp)
		lw $s0,4($sp)
		lw $s1,8($sp)
		l.d $f20,12($sp)
		l.d $f22,20($sp)
		addiu $sp,$sp,28
		jr $ra
