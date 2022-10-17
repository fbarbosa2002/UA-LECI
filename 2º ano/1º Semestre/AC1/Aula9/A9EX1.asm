	.data
PI:	.float 3.1415926
KI:	.float 0.0
	.text
	.globl main
	
main:
do:	li $v0,5
	syscall				#$v0= read_int
	la $t0,PI
	l.s $f4,0($t0)			#$f0=PI
	
	mtc1 $v0,$f6			#val=$f6
	cvt.s.w $f6,$f6			#$f6=(float)val 	
	mul.s $f12,$f4,$f6		#res=(float)val*PI
	li $v0,2
	
	syscall				#print_float(res)

while:	mtc1 $0,$f8
	c.eq.s $f12,$f8			#if $f12==$f8
	bc1f do 
	
	jr $ra	
