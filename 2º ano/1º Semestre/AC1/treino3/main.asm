.data
			.eqv SIZE,10

array:		.space 40
aux_array:	.space 40
str1:		.asciiz "array["
str2:		.asciiz "]="
str3:		.asciiz "*, "
str4:		.asciiz ", "
str5:		.asciiz "\n# repetidos: "

			.text
			.globl main
			
# $t0->i; $s0->dup_counter; 
main :		addiu 	$sp,$sp,-8			# int main(void) {
			sw 		$ra,0($sp)			# prólogo
			sw 		$s0,4($sp)
		
			li 		$s0,0				#	dup_counter = 0; 	
			li 		$t0,0				#	i = 0;		
for:			bge 		$t0,SIZE,endf			#	while (i < SIZE){
			la 		$a0,str1
			li 		$v0,4
			syscall						#		print_str(str1);
			move 	$a0,$t0
			li 		$v0,1
			syscall						#		print_int10(i);
			la 		$a0,str2
			li 		$v0,4
			syscall						#		print_str(str2);
			li 		$v0,5
			syscall						#		tt = read_int();
			la   	$t1,array
			sll  	$t2,$t0,2
			addu 	$t2,$t2,$t1
			sw   	$v0,0($t2)			#		array[i]=read_int();
			addiu 	$t0,$t0,1			#		i++;
			j for 						#	}
endf:
			la 		$a0,array
			la 		$a1,aux_array
			li 		$a2,SIZE
			jal 		find_duplicates		#	find_duplicates(array, aux_array, SIZE);
		
			li  		$t0,0				#	i = 0;		
for1:		bge 		$t0,SIZE,endf1		#	while (i < SIZE){
				
			la		$t1,aux_array
			sll		$t2, $t0, 2
			addu	 	$t2, $t2, $t1
			lw		$t2, 0($t2)			#		v = aux_array[i];	
if:			blt 		$t2,2,else 			#		if (aux_array[i] >= 2) {
		
			la 		$a0,str3
			li 		$v0,4
			syscall						#			print_str(str3);
			addi 	$s0,$s0,1			#			dup_counter++;
			j		endif
else:									#		} else {
			la		$t1,array
			sll		$t2, $t0, 2
			addu	 	$t2, $t2, $t1
			lw		$a0, 0($t2)			#			v1 = array[i];	
			li 		$v0,1
			syscall						#			print_int10(array[i]); 		
			la 		$a0,str4
			li 		$v0,4
			syscall						#			print_string(", ");
endif:									#		}
			addi 	$t0,$t0,1			#		i++;
			j for1						#	}
endf1:		
			la 		$a0,str5
			li 		$v0,4
			syscall						#	print_string(str5);
			move 	$a0,$s0
			li 		$v0,1
			syscall						#	print_int10(dup_counter);
			li 		$v0,0				#	return 0;
		
			lw 		$ra,0($sp)			# prólogo
			lw 		$s0,4($sp)
			addiu 	$sp,$sp,8
			jr 		$ra					# }
