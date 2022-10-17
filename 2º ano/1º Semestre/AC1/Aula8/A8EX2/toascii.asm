.text

.globl toascii

toascii:	addi $v0,$a0,'0'

if:		ble $v0,'9',endif 
		addi $v0,$v0,7
		
endif:		jr $ra