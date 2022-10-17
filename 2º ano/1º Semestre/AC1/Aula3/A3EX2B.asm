#Cóodigo em C

#void main(void)
#{
# unsigned int value, bit, i;

# print_string("Introduza um numero: ");
# value = read_int();
# print_string("\nO valor em binário e': ");
# for(i=0; i < 32; i++)
# {
#if((i % 4) == 0) // resto da divisão inteira
 #print_char(' ');

# bit = value & 0x80000000; // isola bit 31
# if(bit != 0)
# print_char('1');
# else
# print_char('0');
# value = value << 1; // shift left de 1 bit
# }
#}


# Mapa de registos:
# $t0 – value
# $t1 – bit
# $t2 - i
 .data
str1: .asciiz "Introduza um numero: "
str2: .asciiz "Valor em binário"
 .eqv print_string,4
 .eqv read_int,5
 .eqv print_char,11

 .text
 
 .globl main
 
main:	la $a0,str1
 	li $v0,print_string 	# (instrução virtual)
	syscall 		# print_string(str1);
 	
 	ori $v0, $0, read_int
 	syscall
 	or $t0, $0, $v0 	# value=read_int();
 	
 
 	ori $v0,$0, print_string 
 	la $a0, str2	# print_string("...");
 	syscall
 	

for: 	bge $t2,32,endfor 	# while(i < 32) {
 	rem $t3,$t2,4

if1:	bne $t3, $0, endif1	# if $t3 != 0 endif
	ori $a0, $0, ' ' 
 	ori $v0, $0, print_char	
 	syscall 
	j endif1
	
endif1: andi  $t1,$t0,0x80000000 # (instrução virtual)
 	

if:	beq $t1,$0,else 	# if(bit != 0)
 	
 	ori $a0, $0, '1' 
 	ori $v0, $0, print_char	
 	syscall 		# print_char('1');
 	
 	j endif

else: 				# else
 	ori $a0,$0,'0'
 	ori $v0, $0, print_char 
 	syscall			# print_char('0');
 	
 	j endif
 	
endif:	sll $t0, $t0,1		# value = value << 1;
 	addi $t2, $t2,1		# i++;
 	j for # }
 	
endfor: #
 	jr $ra 			# fim do programa 
