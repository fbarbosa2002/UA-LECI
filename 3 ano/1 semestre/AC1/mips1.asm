
.data
L1: .asciiz "Aulas5&6T"
L2: .byte 5,8,23
L3: .word 5,8,23
L4: .space 5


.text

.globl main

# i -> $2
main: 	blt $3,0x123456,main

	jr $ra

	
	
