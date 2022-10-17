.data

		.eqv SIZE,10
		.eqv TRUE,1
		.eqv FALSE,0
		
lista:		.space 10
str:		.asciiz "Introduza um numero: "
str2:		.asciiz "; "
.text
.globl main
main: 		li $t0,0
		la $t1,lista 
		
		
		
		
for:		bge $t0,SIZE,do
		
		la $a0,str
		li $v0,4
		syscall 
		
		li $v0,5
		syscall
		
		la $t1,lista
		mul $t2,$t0,4
		addu $t2,$t1,$t2
		sw $v0,0($t2)
		
 		addiu $t0,$t0,1 
 		
 		j for 
 		
do:		li $t3,FALSE
		li $t0,0
		
for1:		bge $t0,9,endf1
		
		la $t1,lista 
		mul $t2,$t0,4
		addu $t2,$t1,$t2
		
		lw $t3,0($t2)
		lw $t4,4($t2)
		
if:		ble $t3,$t4,endif
		
		sw $t3,4($t2)
		sw $t4,0($t2)
		li $t3,TRUE 
		
endif:		addiu $t0,$t0,1
		j for1
		 
		 
endf1:		
endw1:		beq $t3,1,do		
		
		
		li $t0,0
for2:		
		bge $t0,SIZE,endf2
		
		la $t1,lista 
		mul $t3,$t0,4
		addu $t3,$t3,$t1
		
		
		
		lw $a0,0($t3)
		li $v0,1
		syscall
		
		la $a0,str2
		li $v0,4
		syscall 
		
		addiu $t0,$t0,1
		j for2
endf2:	
		jr $ra
