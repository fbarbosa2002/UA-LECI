.data

n1:		.float  2.59375
n2:		.float 0.0

.text
.globl main

main:		la $t0,n1
		l.s $f4,0($t0)
		
		la $t0,n2
		l.s $f6,0($t0)
		
		
do:		li $v0,5
		syscall
		mtc1 $v0,$f2
		cvt.s.w $f2,$f2
		
		
		mul.s $f12,$f4,$f2
		li $v0,2
		syscall
		
while:		c.eq.s $f12,$f6
		bc1f do 
		
		jr $ra				
		