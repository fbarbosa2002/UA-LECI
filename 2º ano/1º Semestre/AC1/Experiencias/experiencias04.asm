

#p=$t1
#pultimo=$t2
 .eqv SIZE,3
 .eqv print_string, 4
 .eqv print_char, 11
 .data

str1: .asciiz "Array"
str2: .asciiz "de"
str3: .asciiz "Ponteiros"
array:.word str1,str2,str3
 .text
 .globl main
main: 	la $t1,array # $t1 = p = &array[0] = array
 	li $t0,SIZE #
 	sll $t0,$t0,2 #
 	addu $t2,$t1, $t0 # $t2 = pultimo = array + SIZE

for:	bge $t1,$t2,endfor
 	
 	lw $t3,4($t1)
 	move $a0,$t3
	li $v0,print_string
	syscall
	
	li $a0,'\n'
	li $v0,print_char 
	syscall
	
	addiu $t1,$t1,4
	
	j for 

endfor: jr $ra 
