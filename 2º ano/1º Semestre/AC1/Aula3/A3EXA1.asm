#Código em C 

#void main(void)
#{
 #unsigned int gray, bin, mask;

 #print_string("Introduza um numero: ");
 #gray = read_int();
 #mask = gray >> 1;
 #bin = gray;
 #while(mask != 0)
 #{
 #bin = bin ^ mask;
 #mask = mask >> 1;
 #}

 #print_string("\nValor em código Gray: ");
 #print_int16(gray);
 #print_string("\nValor em binario: ");
 #print_int16(bin);
#}

#Mapa de registos 
#$t0: gray
#$t1: mask
#$t2: bin
.data 

str1:	.asciiz "Introduza um número: "
str2:	.asciiz "\n Valor em código Gray: "
str3:	.asciiz "\n Valor em código binário: "

	.eqv print_int16,34
	.eqv read_int,5
	.eqv print_string,4
	.eqv print_int2,35
	
.text
.globl main

main:	la $a0, str1
	li $v0, print_string  	#print_string(str1)
	syscall
	
	li $v0,read_int
	syscall
	
	move $t0, $v0 		#save content of $v0 on $t0
	
	sra $t1, $t1, 1  	#mask = gray >> 1;
	addu $t2, $t2, $t0 	#bin = gray;
	
while: 	beq $t1, 0, endw 	#while(mask != 0)
	
	xor $t2, $t2, $t1 	#bin = bin ^ mask;
	sra $t1, $t1, 1		#mask = mask >> 1;
	
endw:	la $a0, str2
	li $v0, print_string 
	syscall			#print_string(str2)
	
	move $a0, $t0
	li $v0, print_int16
	syscall			#print_int16(gray)
	
	
	la $a0, str3
	li $v0, print_string 
	syscall			#print_string(str3)
	
	move $a0, $t2
	li $v0, print_int16
	syscall			#print_int16(bin)
	
	la $a0, str3
	li $v0, print_string 
	syscall			#print_string(str3)
	
	move $a0, $t2
	li $v0, print_int2
	syscall			#print_int16(bin)
	
	
	jr $ra
	