#define SIZE 10
#void main(void)
#{
# static int lista[SIZE];
# int houveTroca;
 #int aux;
 #int *p, *pUltimo;
 #// inserir aqui o código para leitura de valores e
 #// preenchimento do array
 #pUltimo = lista + (SIZE - 1);
 #do
 #{
 #houveTroca = FALSE;
 #for (p = lista; p < pUltimo; p++)
 #{
 #if (*p > *(p+1))
 #{
 #aux = *p;
 #*p = *(p+1);
 #*(p+1) = aux;
 #houveTroca = TRUE;
 #}
 #}
 #} while (houveTroca==TRUE);
 #// inserir aqui o código de impressão do conteúdo do array
#} 

# Mapa de registos
#*p:$t0
#*p+1:$t1
#lista+size:$t2
# SIZE-1: $t3
# houve_troca: $t4
# p: $t5
# pUltimo: $t6 
#aux: $t7
.data
	.eqv FALSE,0
 	.eqv TRUE,1
 	.eqv SIZE,10
 	.eqv print_string,4
 	.eqv read_int,5
 	.eqv,print_int10,1
str1:	.asciiz "Introduza um número: "	
str2:	.asciiz "; "
	.align 2
lista:	.space 40 #SIZE*4
.text
.globl main
main:	li $t3,0
	la $t0,lista #
 	li $t2,SIZE
 	sll $t2, $t2, 2
 	addu $t2, $t2, $t0 #lista+size=$t2

for:	bge $t0, $t2, endfor # for(p < lista+size){
	la $a0,str1
	li $v0,print_string
	syscall
	
	li $v0,read_int
	syscall
	
	sw $v0,0($t0)
	addiu $t0,$t0,4
	
	j for	
endfor:	

	la $t5,lista # $t5 = &lista[0]
 	li $t6,SIZE #
 	subu $t6,$t6,1 # $t7 = SIZE – 1
 	sll $t6,$t6,2 # $t7 = (SIZE – 1) * 4
 	addu $t6,$t5,$t6 # $t6 = lista + (SIZE – 1)	
 	
do:	li $t4, FALSE
	la $t5, lista

for1:	bge $t5, $t6, endfor1
	lw $t0, 0($t5)
	lw $t1, 4($t5)
if:	ble $t0,$t1,endif
	sw $t0,4($t5)
	sw $t1,0($t5)
	
	li $t4,TRUE #

endif:	addiu $t5,$t5,4
	j for1


endfor1:beq $t4, TRUE, do
	
	
	
for2: 	bge $t3,SIZE,endfor2
	
	la $t0,lista	
	sll $t2, $t3, 2
	addu $t2, $t0, $t2	
	or $a0, $0, $t1
 	ori $v0, $0, print_int10
 	lw $a0, 0($t2)
 	syscall
 	
 	la $a0, str2
	ori $v0, $0, print_string
	syscall
 	
 	addiu $t3, $t3, 1
 	
 	j for2 	
 		
endfor2:jr $ra	
 	
