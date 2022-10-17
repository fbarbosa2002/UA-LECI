#Código em C

#char toascii( char );
#char *strrev( char *);
#char *itoa(unsigned int n, unsigned int b, char *s)
#{
# char *p = s;
# char digit;
# do
# {
# digit = n % b;
# n = n / b;
# *p++ = toascii( digit );
# } while( n > 0 );
# *p = '\0';
# strrev( s );
# return s;
#}
#// Converte o digito "v" para o respetivo código ASCII
#char toascii(char v)
#{
# v += '0';
# if( v > '9' )
# v += 7; // 'A' - '9' - 1
# return v;
#} 



# Mapa de registos
# n: $a0 -> $s0
# b: $a1 -> $s1
# s: $a2 -> $s2
# p: $s3
# digit: $t0
# Sub-rotina intermédia

itoa: 	addiu $sp,$sp,-20 # reserva espaço na stack
 	sw $ra,0($sp)
 	sw $s0,4($sp) # guarda registos $sx e $ra
 	sw $s1,8($sp)
 	sw $s2,12($sp)
 	sw $s3,16($sp)
 	
 	move $s0,$a0
 	move $s1,$a1
 	move $s2,$a2 # copia n, b e s para registos
 	move $s3,$a2 # p = s;

do: 	# do {
 	rem $t0,$s0,$s1#digit = n % b; 
 	div $s0,$s0
 	mflo $s0	#n = n/b
 	move	$a0, $t0
 	jal toascii
 	sb $v0,0($s3) #*p = return toascii(digit)
 	addiu $s3,$s3,1 #p++
 	
 	bgt $s0,0,do # } while(n > 0);
 	sb $0,0($s3) # *p = 0;
 	move $a0,$s2 #
 	jal strrev # strrev( s );
 	move $v0,$s2 # return s;
 	lw $ra,0($sp)
 	lw $s0,4($sp) # guarda registos $sx e $ra
 	lw $s1,8($sp)
 	lw $s2,12($sp)
 	lw $s3,16($sp)
 	
 	addiu $sp,$sp,20 # liberta espaço na stack
 	
 	jr $ra # 
