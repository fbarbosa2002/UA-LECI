.data
p1:    .space 20
p2:    .space 20
.eqv    N,5
.text
.globl main
main:
    # Mapa de registos
    # n_even: $t0
    # n_odd: $t1
    # p1: $t2
    # p2: $t3
    
    li    $t0,0
    li    $t1,0                    # int n_even, n_odd = 0;
    
    la    $t2,p1                    # p1 = a;
    addiu    $t4,$t2,20                # t4 = a + N
    
for:    bge    $t2,$t4,endfor                # for (p1 < a + N)

    li    $v0,5                    #
    syscall                        #
    
    sw    $v0,0($t2)                # *p1 = read_int();
    
    addi    $t2,$t2,4                # p1++;
    j    for
endfor:
    la    $t2,p1                    # p1 = a;
    la    $t3,p2                    # p2 = b;
    
for1:    bge    $t2,$t4,endfor1                # for (p1 < a + N)
    lw    $t5,0($t2)                # t5 = *p1
    rem    $t6,$t5,2                
if:    beq    $t6,0,else                # if *p1 % 2 != 0
    sw    $t5,0($t3)                # *p2++ = *p1
    addi    $t3,$t3,4                #
    addi    $t1,$t1,1                # n_odd++;
    j    endif
else:
    addi    $t0,$t0,1                # n_even++;
endif:
    addi    $t2,$t2,4                # p1++;
    j    for1
endfor1:
    la    $t3,p2                    # p2 = b;
    sll    $t6,$t1,2
    addu    $t6,$t6,$t3                # t6 = b+n_odd
    
for2:    bge    $t3,$t6,endfor2                # while (p2 < b + n_odd)

    li    $v0,1
    lw    $a0,0($t3)
    syscall                        # print_int10(*p2)
    
    li    $v0,11
    la    $a0,';'
    syscall                        # print_char(';')
    
    addi    $t3,$t3,4                # p2++;
    j    for2    
endfor2:
    jr    $ra                    # terminar programa