#	Para testar este exercicio ir a : Settings -> Ativar 'Program arguments provided to MIPS program'
#	Depois de compilar escrever os argumentos na zona de Program Arguments na secçao de Text Segment
#	Digitar os argumentos que quiser separados por um espaço

	.eqv	print_int10,1
	.eqv	print_string,4
	.data
str1:	.asciiz "Nr de parametros: "
str2:	.asciiz "\nP"
str3:	.asciiz ": "

	.text
	.globl	main
	
main:	move	$t0,$a0
	move	$t1,$a1
	
	la	$a0,str1
	li	$v0,print_string
	syscall
	
	move	$a0,$t0
	li	$v0,print_int10
	syscall
	
	li	$t2,0

for:	bge	$t2,$t0,endf
	
	la	$a0,str2
	li	$v0,print_string
	syscall
	
	move	$a0,$t2
	li	$v0,print_int10
	syscall
	
	la	$a0,str3
	li	$v0,print_string
	syscall
	
	sll	$t3,$t2,2
	addu	$t3,$t3,$t1
	lw	$a0,0($t3)
	li	$v0,print_string
	syscall
	
	addiu	$t2,$t2,1
	j	for
endf:	
	li	$v0,0
	jr	$ra