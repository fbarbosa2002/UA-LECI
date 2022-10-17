#int i, k;
#for(i=5, k=0; i < 20; i++, k+=5);

.data

#Mapa de registos 

#$t0: i
#t1: k
.text
.globl main

main:	li $t0,5
	li $t1,0
	
for: 	
	bge $t0, 20, endf
	
	addiu $t0, $t0, 1
	addiu $t1, $t1,5
	j for 
	
endf:	jr $ra