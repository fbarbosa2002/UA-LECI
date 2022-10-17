.data
		.eqv SIZE,20
str:		.space 21
str1:		.asciiz "Introduza uma string: "
.text
.globl main
main:		la $a0,str1
		li $v0,4
		syscall
		
		la $a0,str
		li $a1,SIZE
		li $v0,8
		syscall
		
		la $t0,str
		
		
		
while:		
		lb $t1,0($t0)
		beq $t1,'\0',endw 

		addiu $t1,$t1,-0x20
		
		sb $t1,0($t0)
		
		
		addiu $t0,$t0,1
		
		j while 

endw:		la $a0,str
		li $v0,4
		syscall
		 
		jr $ra