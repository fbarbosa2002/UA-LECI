.data

stg:	.space 22 #18+4		#Espaço da string é 18, espaço da word é 4
	.asciiz "Bonaparte"
	.space 5		#Espaço da string é 10, char de 15, 15-10=5
	
	.float 5.1
str1:	.asciiz"\n NMEC: "
str2:	.asciiz"\n Nome: "
str3:	.asciiz"\n Nota: "
str4:	.asciiz"\n Primeiro nome: "
	.text	
	.globl main

main:	la $t0,stg
	la $a0,str1
	li $v0,4
	syscall
	li $v0,5
	syscall
	
	sw $a0,0($t0)
	la $a0,str4
	li $v0,4
	syscall
	addiu $t1,$t0,4
	move $a0,$t1
	li $a1,18
	li $v0,8
	syscall 
	
	la $a0,str1
	li $v0,4
	syscall
	lw $a0,0($t0)
	li $v0,36
	syscall
	
	la $a0,str2
	li $v0,4
	syscall
	
	
	addiu $a0,$t0,22
	li $v0,4
	syscall	
	
	li $a0,','
	li $v0,11
	syscall
	
	addiu $a0,$t0,4
	li $v0,4
	syscall
	
	la $a0,str3
	li $v0,4
	syscall
	
	l.s $f12, 40($t0)
	li $v0,2
	syscall
	
	li $v0,0 #return 0
	
	jr $ra
