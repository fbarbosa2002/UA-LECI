#Add integers and print the result
.data

.eqv print_int10,1
.eqv read_int,5
	
.text

.globl main

main:	ori $v0, $0, read_int 
	syscall
	or $t0, $0, $v0  	#Primeiro valor lido e guardado em $t0
	
	ori $v0, $0, read_int 
	syscall
	or $t1, $0, $v0		#Segundo valor lido e guardado em $t1
	
	add $t2, $t0, $t1	#Soma
	
	or $a0,$0, $t2
	ori $v0, $0, print_int10
	syscall 		#print do resultado final
	
	jr $ra 