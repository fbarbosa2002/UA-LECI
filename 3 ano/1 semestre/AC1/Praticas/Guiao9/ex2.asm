	
#	ft e um parametro de entrada, logo esta armazenado no $f12
	.data
	
c5:	.double 5.0
c9:	.double 9.0
c32:	.double 32.0

	.text
	
f2c:	l.d	$f2,c5
	l.d	$f4,c9
	l.d	$f6,c32
	
	sub.d	$f8,$f12,$f6	# (ft -32.0)
	mul.d	$f8,$f8,$f4	# 9.0 * (ft -32.0)
	
	div.d	$f0,$f2,$f8	# return 5.0 / 9.0 * (ft - 32.0)
	
	jr	$ra
	
	
	.data
string:	.asciiz	"Numero para converter de graus Fahrenheit para graus Celsius: "
str_res:.asciiz "\nResultado convertido: "
	
	.eqv	read_double, 7
	.eqv	print_double, 3
	.eqv	print_string,4
	.text
	.globl main
	
main:	la	$a0,string
	li	$v0,print_string
	syscall
	
	li	$v0,read_double
	syscall
	
	mov.d	$f12,$f0
	jal	f2c
	
	la	$a0,str_res
	li	$v0,print_string
	syscall
	
	mov.d	$f12,$f0
	li	$v0,print_double 
	syscall
	