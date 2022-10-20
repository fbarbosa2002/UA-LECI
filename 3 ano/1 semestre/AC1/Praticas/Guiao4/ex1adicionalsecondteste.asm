#	Mapa de registos
#	$t0 -> p
#	$t1 -> *p
#	$t2 -> decision 1 or 2

#	Igual ao exercicio adicional mas resolvido de forma a funcionar com qualquer tipo de string 
#	Possivel escolher de minuscula para maiuscula ou vice versa



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
	
string:	.asciiz "\nIntroduza uma string: "
string2:.asciiz "De maiuscula para minuscula(1) ou de minuscula para maiuscula(2) ? \n "
str:	.space 21

	.eqv print_string,4
	.eqv read_string,8
	.eqv read_int,5
	.eqv SIZE,20
	
	.text
	.globl main
	
	
main:	la	$a0,string2
	li	$v0,print_string
	syscall
	
	li	$v0,read_int
	syscall
	move 	$t2,$v0
        

	la	$a0,string
	li	$v0,print_string
	syscall
	
	la	$a0,str
	li	$a1,SIZE
	li	$v0,read_string
	syscall
	
	la	$t0,str
	
while:	lb	$t1,0($t0)
	
	beq 	$t1,'\0',endw
	
if:	beq	$t2,1,secondif
	blt	$t1,'a',endif
	bgt	$t1,'z',endif
	
	
	sub	$t1,$t1,'a'
	addi	$t1,$t1,'A'
	
	sb	$t1,0($t0)
	j	endif

secondif:
	blt	$t1,'A',endif
	bgt	$t1,'Z',endif
	
	sub	$t1,$t1,'A'
	addi	$t1,$t1,'a'
	
	sb	$t1,0($t0)
	
	
endif:	addi 	$t0,$t0,1
	j	while
	
endw:

	la	$a0,str
	li	$v0,print_string
	syscall
	
	jr	$ra
