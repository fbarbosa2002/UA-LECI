	.data
			.text
			.globl find_duplicates
# $a0->array; $a1->dup_array; $a2->size; $t0->i; $t1->j; $t2->toke 
find_duplicates:							# void find_duplicates(int *array, int *dup_array, int size) {		
			li 		$t0,0				# 	i=0;
				
find_for:	bge 		$t0,$a2,find_endf	#	while (i < size){	
	
			sll  	$t3,$t0, 2
			addu 	$t3,$t3,$a1		
			sw	 	$0, 0($t3)			#		dup_array[i] = 0
			li 	 	$t1,0				#		j = 0;
			li   	$t2,1				#		token = 1;
			
find_for1:	bge  	$t1,$a2,endf2		#		while (j < size){
			
			sll  	$t3,$t0, 2
			addu 	$t3,$t3,$a0			#			p1 = &(array[i]);		
			sll  	$t4,$t1, 2
			addu 	$t4,$t4,$a0			#			p2 = &(array[j]);		

			lw	 	$t3, 0($t3)			#			v1 = array[i];
			lw	 	$t4, 0($t4)			#			v1 = array[j];
			
find_if:		bne 	 	$t3,$t4,find_endif	#			if (v1 == v2) {
			sll  	$t3,$t1, 2
			addu 	$t3,$t3,$a1			#				p1 = &(dup_array[j]);		
			sw   	$t2,0($t3)			#				dup_array[j] = token;
			addi 	$t2,$t2,1			#				token++;
find_endif:								#			}
			addi	 	$t1, $t1, 1			#			j++;
			j 		find_for1			#		}
endf2:
			addi 	$t0,$t0	,1			#		i++;
			j 		find_for				#	}
find_endf:			
			jr 		$ra					# }
			

