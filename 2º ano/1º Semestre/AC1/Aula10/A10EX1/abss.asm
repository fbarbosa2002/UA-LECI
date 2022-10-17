.data
.text
.globl abss
abss:		move $v0,$a0

if:		bge $v0,0,endif 
		
		mul $v0,$v0,-1

endif:		jr $ra 	