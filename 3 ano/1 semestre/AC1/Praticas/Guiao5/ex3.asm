#	Mapa de registos
#	$t0 -> lista
#	$t1 -> lista +SIZE
#	$t2 -> houve_troca
#	$t3 -> i
#	$t4 -> lista
#	$t5 -> lista + i
#	$t6 -> lista[i]
#	$t7 -> lista[i+1]



	.data

	.eqv SIZE,10
	.eqv TRUE,1
	.eqv FALSE,0
	.eqv read_int,5
	.eqv print_int10,1
	.eqv print_string,4
	.eqv print_char,11
	
lista:	.space 40	#SIZE*4
	
str1:	.asciiz	"Conteudo do array antes da ordenacao: "
str2:	.asciiz "Conteudo do array ja ordenado: "
	.text
	.globl main
	
main:	la	$t0,lista
	
	li	$t1,SIZE
	mul	$t1,$t1,4
	addu	$t1,$t1,$t0	#lista + size
	
	la	$a0,str1
	li	$v0,print_string
	syscall
	
for:	bge	$t0,$t1,endfor	#acessar e fazer leitura de valores por ponteiros

	li	$v0,read_int
	syscall
	sw	$v0,0($t0)

	
	addiu	$t0,$t0,4
	j	for
	
endfor:	
	la	$t4,lista
	
do:	li	$t2,FALSE
	li	$t3,0
	

for2:	bge	$t3,9,endfor2
	
	mul	$t5,$t3,4
	addu	$t5,$t5,$t4
	
	lw	$t6,0($t5)
	lw	$t7,4($t5)
			
if:	ble	$t6,$t7,endif
	li	$t2,TRUE	
	sw	$t6,4($t5)
	sw	$t7,0($t5)
		
endif:		
	addiu	$t3,$t3,1
	j	for2
endfor2:
	beq	$t2,TRUE,do

	
	la	$t0,lista
	
	li	$t1,SIZE
	mul	$t1,$t1,4
	addu	$t1,$t1,$t0	#lista + size
	
	la	$a0,str2
	li	$v0,print_string
	syscall	
	
for3:	bge	$t0,$t1,endfor3

	
	lw	$a0,0($t0)
	li	$v0,print_int10
	syscall
	
	li	$a0, ','
	li	$v0,print_char 
	syscall
	
	addiu	$t0,$t0,4
	j for3

endfor3:

	jr	$ra
	
	