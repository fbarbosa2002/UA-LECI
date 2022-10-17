#Código em C

#char *strcpy(char *dst, char *src)
#{
# int i=0;
# do
# {
# dst[i] = src[i];
# } while(src[i++] != '\0');
# return dst;
#} 
.data
	.eqv print_string,4
	.eqv print_int10,1
	.eqv STR_MAX_SIZE,30
str1:	.asciiz "I serodatupmoC ed arutetiuqrA"
str2:	.space STR_MAX_SIZE	
str3:	.asciiz "\n"
str4:	.asciiz "String too long: "

.text
.globl main

main: 	addi $sp,$sp,-4
	lw $ra,0($sp)
	la $a0,str1
	jal strcopy
	
	
	

	

		
						
strcopy:li $t0,-1 
	move $t2,$a0

do: 	addiu $t0,$t0,1 
	addu $a0,$a0,$t0	#$a0 = &(dst[i]);
	lb $t1,0($a1)		#t1=src[i]
	sb $t1,0($a0)		#dst[i]=src[i]
	
while:	bne $t1,'\0',do
	move $v0,$t2
	jr $ra 
	
