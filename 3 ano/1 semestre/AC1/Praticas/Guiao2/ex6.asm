	
	.data
	
intnum:	.asciiz "Introduza dois numeros: \n"
somnum:	.asciiz "A soma dos dois numeros = "

	.eqv print_string , 4
	.eqv read_int,5
	.eqv print_int10, 1
	.text
	
	.globl main
	

main: 	la $a0, intnum
	ori $v0,$0,print_string
	syscall		# print the string
	
	
	ori $v0, $0, read_int
	syscall
	
	move $t0,$v0
	
	ori $v0,$0, read_int
	syscall
	
	move $t1,$v0
	
	add $t2,$t1,$t0
	
	la $a0, somnum
	ori $v0,$0, print_string
	syscall
	
	move $a0,$t2
	ori $v0, $0, print_int10
	syscall
	
	
	jr $ra
	
	
	
	
