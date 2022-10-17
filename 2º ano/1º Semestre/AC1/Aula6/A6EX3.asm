#i= $t0	
#j=$t1
#pultimo=$t2
#p =$t3
 .eqv SIZE,3
 .eqv print_int10,1
 .eqv print_string,4
 .eqv print_char, 11
 .data

str1: .asciiz "Array"
str2: .asciiz "de"
str3: .asciiz "Ponteiros"
str4: .asciiz "\n String #"
str5: .asciiz ": "
array:.word str1,str2,str3
 .text
 .globl main
main: 
	li $t0,0 	#i=0
	
for:	bge $t0, SIZE, endfor
	li $t1,0
	
	la $a0, str4
	li $v0, print_string
	syscall
	
	move $a0, $t0 
	li $v0, print_int10
	syscall
	
	la $a0, str5
	li $v0, print_string
	syscall
		#j=0
while:	
	la $t2,array
	sll $t3,$t0,2
	addu $t2,$t2,$t3 #$t2=&array[i]
	lw $t2, 0($t2)	#$t2=array[i]
	addu $t2, $t2, $t1 #$t2= &array[i][j]
	lb $t2,0($t2) #$t2=array[i][j]
	beq $t2,'\0',endw
	
	move $a0, $t2
	li $v0,print_char 
	syscall
	
	li $a0,'-'
	li $v0,print_char 
	syscall	
	addi $t1,$t1,1
	
	j while
	
endw:	addiu $t0, $t0, 1
	j for 

endfor: jr $ra 
