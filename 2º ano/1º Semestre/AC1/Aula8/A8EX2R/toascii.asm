.data
.text
.globl toascii
toascii:	addiu $v0,$a0,'0'

if:		ble $v0,'9',endif
		
		addiu $v0,$v0,7
		
endif:		jr $ra 