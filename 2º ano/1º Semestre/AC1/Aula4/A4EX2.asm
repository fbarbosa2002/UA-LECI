    .eqv SIZE,20
    .eqv read_string,8
    .eqv print_int10,1
    .data

str:    .space 21
        
    .text
    .globl main
# num = $t0
# i = $t1
main:    la    $a0, str    # $a0 = &str[0]
    li    $a1, SIZE
    li    $v0, read_string
    syscall            # read_string(str, SIZE)
    
    li    $t0, 0        # num = 0
    li    $t1, 0        # i = 0

while:    la    $t2, str    # $t2 = &str[0]
    addu    $t2, $t2, $t1    # $t2 = &str[i]
    lb    $t3, 0($t2)    # $t3 = str[i]
    beq    $t3, '\0', endw    #
    
if:    blt    $t3, '0', endif    #
    bgt    $t3, '9', endif    #
    addi    $t0, $t0, 1    #

endif:    addi    $t1, $t1, 1    #
    j    while

endw:    move    $a0, $t0
    li     $v0, print_int10
    syscall
    
    jr $ra