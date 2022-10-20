#	Mapa de registos
#	$t0 -> p
#	$t1 -> *p


#	Igual ao exercicio adicional mas resolvido de forma a funcionar com qualquer tipo de string


#	'a' -> 0x61
#	'z' -> 0x7A
#	'A' -> 0x41
#	'Z' -> 0x5A


#define SIZE 20 

#void main(void) 
#{ 
	#static char str[SIZE+1]; 
 	#char *p; 
 	#print_string("Introduza uma string: "); 
 	#read_string(str, SIZE); 
 	#p = str; 
 	#while (*p != '\0') 
 	#{ 
 		#if(*p >=  'a' && *p <= 'z')
 		#{
 			#*p = *p – 'a' + 'A'; // 'a'=0x61, 'A'=0x41, 'a'-'A'=0x20 
 		#}
 		#p++; 
 	#} 
 	#print_string(str); 
#}
	.data
	
string:	.asciiz "Introduza uma string: "
str:	.space 21

	.eqv print_string,4
	.eqv read_string,8
	.eqv SIZE,20
	
	.text
	.globl main
	
	
main:	la	$a0,string
	li	$v0,print_string
	syscall
	
	la	$a0,str
	li	$a1,SIZE
	li	$v0,read_string
	syscall
	
	la	$t0,str
	
while:	lb	$t1,0($t0)
	
	beq 	$t1,'\0',endw
	
if:	blt	$t1,'a',endif
	bgt	$t1,'z',endif
	
	sub	$t1,$t1,'a'
	addi	$t1,$t1,'A'
	
	sb	$t1,0($t0)
	
endif:	addi 	$t0,$t0,1
	j	while
	
endw:

	la	$a0,str
	li	$v0,print_string
	syscall
	
	jr	$ra
