#Código em C
	
#int strlen(char *s)
#{
# int len=0;
# while(*s++ != '\0')
# len++;
# return len;
#}
	
	
	
	.data
	
str:	.asciiz "Ola Mundooo"
	.eqv print_int10,1
	
	.text
	.globl main
	
main:	addiu $sp, $sp, -4
	sw $ra,0($sp)
	
	la $a0, str
	jal strlen	#strlen(str)
	move $a0, $v0
	li $v0, print_int10
	syscall	#print_int10(strlen(str))
	
	
	li $v0, 0
	lw $ra,0($sp)
	addiu $sp, $sp, 4
	jr $ra


strlen:	li $t0,0 #len=0
	
while:	lb $t1,0($a0)#t1=*s
	addiu $a0, $a0, 1
	beq $t1,'\0', endw
	addi $t0, $t0, 1 #len++
	j while
	
endw:	move $v0, $t0
	jr $ra
