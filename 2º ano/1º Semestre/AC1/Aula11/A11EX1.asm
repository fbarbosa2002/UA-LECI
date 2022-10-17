	.data

stg:	.word 72343
	.asciiz "Napoleão"
	.space 9		#Espaço da string é 9, char de 18, 18-9=9
	.asciiz "Bonaparte"
	.space 5		#Espaço da string é 10, char de 15, 15-10=5
	
	.float 5.1
str1:	.asciiz"\n NMEC: "
str2:	.asciiz"\nNome: "
str3:	.asciiz"\n Nota: "
	.text	
	.globl main

main:	la $a0,str1
	li $v0,4
	syscall
	
	la $t0,stg
	lw $a0,0($t0)
	li $v0,36
	syscall	#print(stg_id_number)
	
	
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