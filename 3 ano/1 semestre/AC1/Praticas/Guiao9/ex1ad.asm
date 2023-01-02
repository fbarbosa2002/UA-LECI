	.data
	
sum:	.double 0.0	
	.text
	
average:	
	l.d	$f2,sum
	move	$t0,$a1
	
	
for1:	ble	$t0,0,endf1
	
	addiu	$t1,$t0,-1
	sll	$t1,$t1,3
	addu	$t1,$t1,$a0
	l.d	$f4,0($t1)
	
	add.d	$f2,$f2,$f4
	
	addiu	$t0,$t0,-1
	j	for1

endf1:	mtc1.d	$a1,$f6
	cvt.d.w	$f6,$f6
	
	div.d	$f0,$f2,$f6
	
	jr	$ra
	
	.text

max:	addiu	$t0,$a1,-1
	sll	$t0,$t0,3
	add	$t0,$t0,$a0
	move	$t1,$a0
	
	l.d	$f2,8($a0)
	
for3:	bgt	$t1,$t0,endf3
	l.d	$f4,0($t1)

if:	c.le.d	$f4,$f2
	bc1t	endif
	
	mov.d	$f2,$f4	
	
endif:	
	
	addiu	$t1,$t1,8
	j	for3
	
endf3:	mov.d	$f0,$f2
	jr	$ra	
	
	.text
	.eqv	TRUE,1
	.eqv	FALSE,0
	
median:		

do:	li	$t1,FALSE

	li	$t0,0
	addiu	$t2,$a1,-1

for4:	bge	$t0,$t2,endf4

	sll	$t3,$t0,3
	add	$t3,$t3,$a0
	l.d	$f2,0($t3)
	l.d	$f4,8($t3)
	
if1:	c.le.d	$f2,$f4
	bc1t	endif1
	
	mov.d	$f6,$f2
	s.d	$f4,0($t3)
	s.d	$f6,8($t3)
	li	$t1,TRUE
	
endif1:
	addiu	$t0,$t0,1
	j	for4
endf4:

while:	beq	$t1,TRUE,do

	div	$t0,$a1,2
	sll	$t0,$t0,3
	addu	$t0,$t0,$a0
	l.d	$f0,0($t0)
	
	jr	$ra	

	.data
	.eqv	SIZE,3
	.eqv	read_int,5
	.eqv	print_double,3
	.eqv	print_string,4
	.eqv	print_int10,1
str1:	.asciiz "array["
str2:	.asciiz "]="
str3:	.asciiz "\nValor maximo do array: "
str4:	.asciiz "\nMedia do array: "
str5:	.asciiz	"\nMediana do array: "
	.align 3
a:	.space	24

	.text
	.globl	main
	
main:	addiu	$sp,$sp,-4
	sw	$ra,0($sp)
	
	li	$t0,0
	
for2:	bge	$t0,SIZE,endf2
	la	$a0,str1
	li	$v0,print_string
	syscall
	
	move	$a0,$t0
	li	$v0,print_int10
	syscall
	
	la	$a0,str2
	li	$v0,print_string
	syscall
	
	li	$v0,read_int
	syscall
	mtc1.d	$v0,$f2
	cvt.d.w	$f2,$f2
	
	la	$t1,a
	sll	$t2,$t0,3
	addu	$t2,$t2,$t1
	s.d	$f2,0($t2)
		
	addiu	$t0,$t0,1
	j	for2
endf2:	
	la	$a0,str4
	li	$v0,print_string
	syscall
	
	la	$a0,a
	li	$a1,SIZE
	jal	average
	mov.d	$f12,$f0
	li	$v0,print_double
	syscall	
	
	la	$a0,str3
	li	$v0,print_string
	syscall
	
	la	$a0,a
	li	$a1,SIZE
	jal	max
	mov.d	$f12,$f0
	li	$v0,print_double
	syscall
	
	la	$a0,str5
	li	$v0,print_string
	syscall
	
	la	$a0,a
	li	$a1,SIZE
	jal	median
	mov.d	$f12,$f0
	li	$v0,print_double
	syscall
	li	$v0,0
	lw	$ra,0($sp)
	addiu	$sp,$sp,4
	jr	$ra
		