#Código em C

#void main(void)
#{
 #int soma, value, i;

# for(i=0, soma=0; i < 5; i++)
 #{
 #print_string("Introduza um numero: ");
 #value = read_int();
 #if(value > 0)
 #soma = soma + value;
 #else
 #print_string("Valor ignorado\n");
 #}
 #print_string("A soma dos positivos e': ");
 #print_int10(soma);
#} 
# Mapa de registos:
# $t0 – soma
# $t1 – value
# $t2 - i
 .data
str1: 	.asciiz "Introduza um numero: "
str2: 	.asciiz "Valor ignorado \n"
str3: 	.asciiz "A soma dos positivos é: "

	.eqv print_string,4
	.eqv read_int,5 
	.eqv print_int10,1

 .text
 
 .globl main
 	
main:	li $t0,0 # soma = 0;
 	li $t2, 0 # i = 0;
 	
for: 	bge  $t2,5,endfor # while(i < 5) {
 	
 	la $a0, str1
 	ori $v0, $0, print_string # print_string("...");
 	syscall
 	
 	ori $v0, $0, read_int
 	syscall
 	or $t1, $0, $v0 # value=read_int();
 	
	ble $t1,$0,else # if(value > 0)
 	add $t0,$t0,$t1 # soma += value;
 	
 	ori $v0,$0, print_string 
 	la $a0, str3
 	syscall
 	
 	or $a0, $0, $t0
 	ori $v0, $0, print_int10
 	syscall
 	
 	j endif #
 	
else: 	la $a0, str2
	ori $v0, $0, print_string
	syscall	# else
 		# print_string("...");
 	j endif
 	
endif: 	addi $t2, $t2,1 # i++;
 	j for # }
 	
endfor:
 	la $a0, str3
 	ori $v0, $0, print_string # print_string("...");
 	or $a0, $0, $t0
 	ori $v0, $0, print_int10 # print_int10(soma);
 	jr $ra