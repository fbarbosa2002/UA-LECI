
	
	.eqv 	off_id,0
	.eqv 	off_fn,4
	.eqv 	off_ln,22
	.eqv	off_gr,40
	.eqv	print_string,4
	.eqv	read_string,8
	.eqv	read_float,6
	.eqv 	read_int,5
	.data
str1:	.asciiz "\nN. Mec: "
str2:	.asciiz "\nPrimeiro Nome: "
str3:	.asciiz "\nUltimo Nome: "
str4:	.asciiz "\nNota: "

	.text
	
	.globl read_data
	
read_data:
	move	$t1,$a0
	li	$t0,0
	move	$t2,$a1
	
	
for:	
	
	mul	$t3,$t0,44
	addu	$t4,$t1,$t3
	bge	$t0,$t2,endfor
	
	la	$a0,str1
	li	$v0,print_string
	syscall					#print_string("N. Mec: "); 
	
	
	move	$a0,$t4
	li	$v0,read_int
	syscall
	sw	$v0,off_id($a0)			# st[i].id_number = read_int();
	
	la	$a0,str2
	li	$v0,print_string
	syscall					# print_string("Primeiro Nome: ");
	
	
	addiu	$a0,$t4,off_fn
	li	$a1,17
	li	$v0,read_string
	syscall					# read_string(st[i].first_name, 17); 
	
	la	$a0,str3
	li	$v0,print_string
	syscall					# print_string("Ultimo Nome: ");
		
	addiu	$a0,$t4,off_ln
	li	$a1,14
	li	$v0,read_string
	syscall					# read_string(st[i].last_name, 14); 
	
	la	$a0,str4
	li	$v0,print_string
	syscall					# print_string("Nota: ");
	
	
	move	$a0,$t4
	li	$v0,read_float
	syscall
	s.s	$f0,off_gr($a0)			# st[i].grade = read_float(); 
	
	
	addiu	$t0,$t0,1
	j	for
	
endfor:
	jr $ra

	

	
