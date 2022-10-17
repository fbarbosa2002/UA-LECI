#Código em C

#int main(void)
#{
# static char str[]="2020 e 2024 sao anos bissextos";
# print_int10( atoi(str) );
# return 0;
#}
 
#unsigned int atoi(char *s)
#{
 #unsigned int digit, res = 0;
 #while( (*s >= '0') && (*s <= '9') )
 #{
 #digit = *s++ - '0';
 #res = 10 * res + digit;
 #}
 #return res;
#} 



# Mapa de registos
# res: $v0
# s: $a0
# *s: $t0
# digit: $t1
# Sub-rotina terminal: não devem ser usados registos $sx

.data

	.eqv print_int10,1
str:	.asciiz "2020 e 2024 sao anos bissextos"

.text
.globl main

main:	addiu $sp,$sp,-4
	sw $ra,0($sp)
	la $a0,str
	jal atoi
	
	li $v0,1
	syscall
	
	lw  $ra,0($sp)
	addiu $sp,$sp,4
	jr $ra	
	
	
	
atoi: 	li $v0,0 # res = 0;

while: 	lb $t0,0($a0)# while(*s >= ...)
 	blt $t0,'0',endw #
 	bgt $t0,'9',endw # {
 	
 	sub $t1,$t0,0x30 # digit = *s – '0'
 	addiu $a0,$a0,1 # s++;
 	mul $v0,$v0,10 # res = 10 * res;
 	add $v0,$v0,$t1 # res = 10 * res + digit;
 	
 	j while# }

endw:	
	
	
	jr $ra # termina sub-rotina 
