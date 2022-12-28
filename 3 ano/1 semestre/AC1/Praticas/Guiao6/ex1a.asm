#	Para testar este exercicio ir a : Settings -> Ativar 'Program arguments provided to MIPS program'
#	Depois de compilar escrever os argumentos na zona de Program Arguments na secçao de Text Segment
#	Digitar os argumentos que quiser separados por um espaço

	.eqv	print_int10,1
	.eqv	print_string,4
	.eqv	print_char,11
	.data
str1:	.asciiz "Nr de parametros: "
str2:	.asciiz "\nP"
str3:	.asciiz ": "
str4:	.asciiz "\n\t Nr de caracteres: "
str5:	.asciiz "\n\t Nr de letras maiusculas: "
str6:	.asciiz "\n\t Nr de letras minusculas: "
str7:	.asciiz "\n String com maior caracteres: "
	.text
	.globl	main
	
main:	move	$t0,$a0
	move	$t1,$a1
	
	la	$a0,str1
	li	$v0,print_string
	syscall
	move	$a0,$t0
	li	$v0,print_int10
	syscall				# print_string(nr de parametros)
	
	li	$t2,0
	li	$t7,0
	
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
	
	li	$t4,0
	li	$t6,0			# contador de letras maiusculas
	
while:	
	lw	$t5,0($t3)
	addu	$t5,$t5,$t4
	lb	$t5,0($t5)
	beq	$t5,'\0',endw

if:	blt	$t5,65,endif
	bgt	$t5,90,endif
		
	addiu	$t6,$t6,1

endif:

		
	addiu	$t4,$t4,1
	j	while


endw:	

if2:	blt	$t4,$t7,endif2
	move	$t7,$t4
	move	$t8,$t2
	
endif2:

	la	$a0,str4
	li	$v0,print_string
	syscall
	move	$a0,$t4
	li	$v0,print_int10
	syscall				# print_string(nr de caracteres)
	
	
	la	$a0,str5
	li	$v0,print_string
	syscall
	move	$a0,$t6
	li	$v0,print_int10
	syscall				# print_string(nr de letras maiusculas)
	
	la	$a0,str6
	li	$v0,print_string
	syscall
	sub	$t6,$t4,$t6
	move	$a0,$t6
	li	$v0,print_int10
	syscall				# print_string(nr de letras minusculas)
	
	
	

	
	addiu	$t2,$t2,1	
	j	for
endf:	
	la	$a0,str7
	li	$v0,print_string
	syscall
	move	$a0,$t8
	li	$v0,print_int10
	syscall
	
	li	$v0,0
	jr	$ra