#código em C

#void main(void)
#{
# unsigned int res=0, i=0, mdor, mdo;

# print_string("Introduza dois numeros: ");
# mdor = read_int() & 0x0F;
# mdo = read_int() & 0x0F;
# while( (mdor != 0) && (i++ < 4) )
# {
# if( (mdor & 0x00000001) != 0 )
# res = res + mdo;
# mdo = mdo << 1;
# mdor = mdor >> 1;
# }
# print_string("Resultado: ");
# print_int10(res);
#}

#Mapa de registos
#mdor: $t0
#mdo: $t1
#i: $t2
#res: $t3

.data

	.eqv print_string,4
	.eqv read_int,5
	.eqv print_int10,1
	
str1:	.asciiz "Introduza dois números: "
str2:	.asciiz "Resultado: "

.text
.globl main

main:	li $t2,0
	li $t3,0
	li $t7,4
	la $a0, str1 
	li $v0, print_string
	syscall
	
	li $v0, read_int
	syscall			#mdor = read_int() 
	
	move $t0, $v0
	
	li $v0, read_int 
	syscall
	
	move $t1, $v0
	
	andi $t0, $t0, 0x0F	#mdor = mdor & 0x0F;
	andi $t1, $t1, 0x0F	#mdo = mdo & 0x0F;
	addiu $t2,$t2,1	
	ori $t2,$0,0
	
while:	sne $t4, $t0, 0		# while( (mdor != 0)	
	slt $t5, $t2, $t7	#(i++ < 4)	
	and $t6, $t5, $t4
	
	bne $t6,1, endw
	addiu $t2,$t2,1	
	
	
if:	andi  $t8,$t0, 0x00000001
	beq $t8,0,endif
	
	addu $t3, $t3, $t1	# res = res + mdo;

endif:	
	sll $t1,$t1,1		# mdo = mdo << 1;
	srl $t0, $t0, 1		# mdor = mdor >> 1;
	
	j while

endw:	la $a0, str2
	li $v0, print_string
	syscall
	
	move $a0, $t3
	li $v0, print_int10
	syscall
	
	
	
	
	jr $ra
	
