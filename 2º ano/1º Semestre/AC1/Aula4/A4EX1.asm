#Código em C

#define SIZE 20

#void main (void)
#{
# static char str[SIZE+1]; // Reserva espaço para um array de "SIZE+1" bytes no segmento de dados ("SIZE" carateres + terminador)


# int num, i;

# read_string(str, SIZE); "str" é o endereço inicial do espaço reservado para alojar a string (na memória externa)

# num = 0;
# i = 0;
# while( str[i] != '\0' ) // Acede ao carater (byte) na // posição "i" do array e compara-o  com o carater terminador (i.e.'\0' = 0x00)
# {
# if( (str[i] >= '0') && (str[i] <= '9') )
# num++;
# i++;
# }
# print_int10(num); 

# Mapa de registos
# num: $t0
# i: $t1
# str: $t2
# str+i: $t3
# str[i]: $t4
 
.data
.eqv SIZE,20
.eqv read_string,8
.eqv print_int10,1

str: 	.space 21

.text
.globl main

main: 	la $a0, str 		# $a0=&str[0] (endereço da posição 0 do array, i.e., endereço inicial do array)
	li $a1, SIZE 		# $a1=SIZE
	li $v0,read_string
	syscall 		# read_string(str,SIZE)
 	li $t1, 0
 	li $t0, 0 
 				# num=0; i=0;
while:	la $t2,str		# $t2 = str ou &str[0]
 	addu $t2,$t2,$t1 	# $t3 = str+i ou &str[i]
 	lb $t3,0($t2)	 	# $t4 = str[i]
 	beq $t3,'\0',endw 
 		# {
if: 	blt $t3,'0',endif 	# if(str[i] >= '0' &&
 	bgt $t3,'9',endif	# str[i] <= '9');
 	addi $t0,$t0, 1		# num++;
 	
 	
 	
endif:	addi $t1,$t1,1		# i++;
 	j while 	
 				# }
endw: 	or $a0, $0, $t0 
 	ori $v0, $0, print_int10	
 	syscall  
 				# print_int10(num);
 	jr $ra 			# termina o programa 