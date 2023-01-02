	.eqv	SIZE,10
	.eqv	print_string,4
	.eqv 	print_int10,1
	.eqv	read_int,5
	
	.data
str1:	.asciiz "array["
str2:	.asciiz "]="
str3:	.asciiz "*, "
str4:	.asciiz ", "
str5:	.asciiz "\n# repetidos: "
	.align 2
array:	.space	40
aux_array:
	.space	40
	
	.text
	
	.globl	main
	
main:	addiu	$sp,$sp,-4
	sw	$ra,0($sp)
	
	li	$t0,0
	li	$t7,0
for1:	bge	$t0,SIZE,endf1
	
	la	$a0,str1
	li	$v0,print_string
	syscall
	
	move	$a0,$t0
	li	$v0,print_int10
	syscall
	
	la	$a0,str2
	li	$v0,print_string
	syscall
	
	la	$a0,array
	sll	$t1,$t0,2
	addu	$t1,$t1,$a0
	li	$v0,read_int
	syscall	
	sw	$v0,0($t1)
	
	addiu	$t0,$t0,1
	j	for1
endf1:
	la	$a0,array
	la	$a1,aux_array
	li	$a2,SIZE
	jal	find_duplicates
	
	li	$t0,0
	
for2:	bge	$t0,SIZE,endf2
	
	sll	$t2,$t0,2
	la	$t1,aux_array
	addu	$t2,$t2,$t1
	lw	$t2,0($t2)
	
if1:	blt	$t2,2,else1
	la	$a0,str3
	li	$v0,print_string
	syscall
	addiu	$t7,$t7,1
	j	endif1
else1:
	sll	$t2,$t0,2
	la	$t1,array
	addu	$t2,$t2,$t1
	lw	$a0,0($t2)
	li	$v0,print_int10
	syscall
	
	la	$a0,str4
	li	$v0,print_string
	syscall

endif1:
	addiu	$t0,$t0,1
	j	for2
endf2:
	la	$a0,str5
	li	$v0,print_string
	syscall
	
	move	$a0,$t7
	li	$v0,print_int10
	syscall
	li	$v0,0	
	lw	$ra,0($sp)
	addiu	$sp,$sp,4
	jr	$ra
	