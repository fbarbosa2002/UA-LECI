
	.text
	
	.globl toascii
	
toascii:
	addiu	$a0,$a0,'0'
	
if:	ble	$a0,'9',endif

	addiu	$a0,$a0,7
	
endif:	move	$v0,$a0

	jr	$ra
	