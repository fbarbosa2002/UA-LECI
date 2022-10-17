#Read and Print an integer
.data

.text

.globl main

main:	ori $v0, $0, 5
	syscall #read_int
	or $t0, $v0, $0 # Save int on address $t0
	
	or $a0, $0, $t0
	ori $v0, $0, 1
	syscall
	jr $ra