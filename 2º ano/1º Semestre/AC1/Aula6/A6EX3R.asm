.data
		.eqv SIZE,3
		
str1:		.asciiz "Array"
str2:		.asciiz "de"
str3:		.asciiz "Ponteiros"
		.align 2
array:		.word str1,str2,str3
str4:		.asciiz "\nString #"
str5:		.asciiz ": "

.text
.globl main
main:		li $t0,0

for:		bge $t0,SIZE,endf
		
		la $a0,str4
		li $v0,4
		syscall
		
		move $a0,$t0
		li $v0,1
		syscall
		
		la $a0,str5
		li $v0,4
		syscall
		
		li $t1,0
		
		
while:		la $t2,array
		
		mul $t3,$t0,4
		addu $t4,$t2,$t3
		
		lw $t4,0($t4)
		addu $t4,$t4, $t1
		
		lb $t4,0($t4)
		
		
		beq $t4,'\0',endw
		
		move $a0,$t4
		li $v0,11
		syscall
		
		li $a0,'-'
		li $v0,11
		syscall 
		
		addiu $t1,$t1,1
		
		j while 
		
endw:
		
		
		
		
		addiu $t0,$t0,1
		j for 
		
endf:		jr $ra