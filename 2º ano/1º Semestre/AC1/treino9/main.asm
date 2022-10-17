#typedef struct
#{
#char a1[14];		1	14	0
#int i;			4	4	16
#char a2[17];		1	17	20
#double g;		8	8	40
#} xyz;			8	48

.data

xyz:		.asciiz "Napoleão"	#9
		.space 5
		.word 3
		.asciiz "Bonaparte"	#10
		.space 7
		.double 3.0
str1:		.asciiz "Nome: "
str2:		.asciiz "\nApelido: "
str3:		.asciiz "\nNumero do aluno: "
str4: 		.asciiz "\nNota final: "		
.text
.globl main
main:		la $a0,str1
		li $v0,4
		syscall
		
		la $t0,xyz
		addiu $a0,$t0,0
		
		li $v0,4
		syscall
		
		la $a0,str2
		li $v0,4
		syscall 
		
		addiu $a0,$t0,20
		li $v0,4
		syscall
		
		la $a0,str3
		li $v0,4
		syscall
		
		lw $a0,16($t0)
		li $v0,1
		syscall 
		
		la $a0,str4
		li $v0,4
		syscall
		
		l.d $f12,40($t0)
		li $v0,3
		syscall
		
		jr $ra 