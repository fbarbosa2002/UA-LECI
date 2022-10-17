#Código em C


#define SIZE 8
#void main(void)
#{
#static int val[SIZE]={8,4,15,-1987,327,-9,27,16};
#int i,v;
#i=0;
#do {

#v=val[i];
#val[i]=val[i+SIZE/2];
#val[i+SIZE/2]=v;
#} while (++i < (SIZE/2));

#print_string("Result is: ");
#i=0;

#do{

#print_int10(val[i++]);
#print_char(',');

#} while (i < SIZE); 

#}

.data

	.eqv SIZE,8
	.eqv print_string,4
	.eqv print_int10,1
	.eqv print_char,11
	
	
str1:	.asciiz "Result is: "
val:	.word 8,4,15,-1987,327,-9,27,16

#Mapa de registos 
#i: $t0
#v: $t1
#&(val[0]): $t2
.text
.globl main

main:	li $t0,0
	la $t2,val		#&(val[0]): $t2
	
do:	sll $t3,$t0,2		#obter i
	addu $t4,$t3,$t2
	lw $t1,0($t4)		#v=val[i];
	lw $t5,16($t4)		#val[i]=val[i+SIZE/2];
	sw $t5,0($t4)		
	sw $t1,16($t4)		#val[i+SIZE/2]=v;
	
	addiu $t0,$t0,1		#i++
	bge $t0,4, enddo
	j do

enddo:	la $a0,str1
	li $v0,print_string
	syscall
	
	li $t0,0
	
do1:	sll $t6,$t0,2		#obter i
	addu $t6,$t6,$t2	#endereço de val[i]
	
	lw $a0,4($t6)		#val[i++]
	li $v0, print_int10
	syscall 
	

	 li    $v0,11
   	 la    $a0,','
    	syscall     
	
	
	addiu $t0,$t0,1
	bge $t0,8,enddo1
	
	j do1
	
enddo1:	jr $ra