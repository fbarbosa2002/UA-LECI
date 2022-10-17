.data
lista:		.byte 0x20, 0x02, 0x22, 0x45, 0x34, 0x66, 0x0A, 0x33, 0x11, 0x44
str1:		.asciiz "Conteudo do array: "
str2:		.asciiz "; "
		.eqv SIZE,10
		
.text
.globl main

main:		la $a0,str1
		li $v0,4
		syscall
		
		la $t1,lista 
		li $t0,0
		
for:		bge $t0,SIZE,endf
		
		addu $t2,$t1,$t0
		lb $a0,0($t2)
		li $v0,1
		syscall

		la $a0,str2
		li $v0,4
		syscall
		
		addi $t0,$t0,1
		j for
		
endf:		
		jr $ra