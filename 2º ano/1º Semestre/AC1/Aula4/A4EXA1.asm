#Código em C

#define SIZE 20
#void main(void)
#{
# static char str[SIZE+1];
# char *p;
# print_string("Introduza uma string: ");
# read_string(str, SIZE);
# p = str;
# while (*p != '\0')
# {
# *p = *p – 'a' + 'A'; // 'a'=0x61, 'A'=0x41, 'a'-'A'=0x20
# p++;
# }
# print_string(str);
#}

#Mapa de registos 
#t0: SIZE
#t1: SIZE-1
#t2: p
.data
	.eqv SIZE,20
	.eqv print_string,4
	.eqv read_string,8
str1:	.asciiz "Introduza um string: "
str2:	.space 19

.text
.globl main

main:	li $t0,SIZE
	sub $t1, $t0, 1 #$t1: SIZE-1
	
	la $a0, str1
	li $v0, print_string
	syscall
	
	la $a0,str2
	li $a1, SIZE
	li $v0, read_string
	syscall
	
	move $t2, $v0
	lw $t3,0($t2)
	
	addiu $t4, $t4, 0x20
while: 	beq $t3,'\0',endw
	sub $t3, $t3, $t4	
	addiu $t2, $t2, 4
	
endw:	move $a0,$t2
	li $v0, print_string
	syscall
	
	jr $ra








 