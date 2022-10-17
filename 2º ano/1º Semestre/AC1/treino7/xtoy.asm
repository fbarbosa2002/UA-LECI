.data

n1:		.float 1.0
.text
.globl xtoy

xtoy:		addiu $sp,$sp,-28
		sw $ra,0($sp)
		sw $s0,4($sp)
		sw $s1,8($sp)
		s.s $f20,12($sp)
		s.s $f22,20($sp)
		

		la $t0,n1
		l.s $f20,0($t0)			#result 
		
		li $s0,0			#i
		
		mov.s $f22,$f12			#x
		
		move $s1,$a0			#y
		
		move $a0,$s1
		jal abss
		move $t1,$v0
		
		
for:		bge $s0,$t1,endfor
	
		
if:		ble $s1,0,else

		mul.s $f20,$f20,$f22
		j endif	
		
else:		div.s $f20,$f20,$f22

endif:		
		addi $s0,$s0,1
		j for

endfor:		mov.s $f0,$f20
		
		lw $s0,4($sp)
		lw $s1,8($sp)
		l.s $f20,12($sp)
		l.s $f22,20($sp)
		lw $ra,0($sp)
		addiu $sp,$sp,28
		
		
		jr $ra