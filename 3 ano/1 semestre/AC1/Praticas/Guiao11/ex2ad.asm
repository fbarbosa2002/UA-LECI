	.eqv	off_a1,0
	.eqv	off_i,16
	.eqv 	off_a2,20
	.eqv	off_g,40
	
	.data
	
	.align 2
	
s1:	.asciiz "Str_1"
	.space 8
	
	.align 2
	
	.word 2021
	
	.asciiz "Str_2"
	.space 11
	
	.align 3
	
	.double 2.718281828459045
	
	.text
	
	
	.globl f1
	
f1:	la	$t0,s1
	l.d	$f0,off_g($t0)

	