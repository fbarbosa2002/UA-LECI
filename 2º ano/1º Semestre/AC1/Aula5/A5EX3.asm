	#Código em C

#define SIZE 10
#define TRUE 1
#define FALSE 0
#void main(void)
#{
# static int lista[SIZE];
# int houveTroca, i, aux;
# // inserir aqui o código para leitura de valores e
# // preenchimento do array
# for(...)
# {
# ...
# }
# do
# {
# houveTroca = FALSE;
# for (i=0; i < SIZE-1; i++)
# {
# if (lista[i] > lista[i+1])
# {
# aux = lista[i];
# lista[i] = lista[i+1];
# lista[i+1] = aux;
# houveTroca = TRUE;
# }
# }
# } while (houveTroca==TRUE);
# // inserir aqui o código de impressão do conteúdo do array
# for(...)
# {
# ...
# }
#}



# Mapa de registos
#p=$t0
#*p=$t1
#lista+size=$t2
# SIZE-1: $t3
# houve_troca: $t4
# i: $t5
# lista: $t6
# lista + i: $t7


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
 
main: 	 # código para leitura de valores
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
 
do: 	# do {
 	li $t4,FALSE # houve_troca = FALSE;
 	li $t5,0 # i = 0;
 	la $t6,lista
	li $t3,SIZE
	subu $t3, $t3, 1 #SIZE-1 =$t3
for1:	bge $t5, $t3, endfor1

if: 	sll $t7,$t5,2 # $t7 = i * 4
 	addu $t7,$t7,$t6 # $t7 = &lista[i]
 	lw $t8,0($t7) # $t8 = lista[i]
 	lw $t9,4($t7) # $t9 = lista[i+1]
 	ble $t8,$t9,endif # if(lista[i] > lista[i+1]){
 	sw $t8,4($t7) # lista[i+1] = $t8
 	sw $t9,0($t7) # lista[i] = $t9
 	li $t4,TRUE #
	j if # }
 	
endif: 	
	addiu $t5,$t5,1 # i++;
 	j  for1 # }
 	
endfor1:beq $t4, TRUE, do
	li $t5,0   # } while(houve_troca == TRUE);
 	
for2: 	bge $t5,SIZE,endfor2
	
	sll $t2, $t5, 2
	addu $t2, $t2, $t6
	lw $t1,0($t2)
	
	or $a0, $0, $t1
 	ori $v0, $0, print_int10
 	syscall
 	
 	la $a0, str2
	ori $v0, $0, print_string
	syscall
 	
 	addi $t5, $t5, 1
 	
 	j for2 	
 		
endfor2:jr $ra	
 	 
 	 # termina o programa 
