.text
    sez t1,a0 
    bnz t1, arg_0
    sez t1,a1 
    bnz t1, arg_0
    sez t1,a2 
    bnz t1, arg_0
    slez t1,a3
    bnz t1, bad_a3

    push s0 //expands to:
            //sw s0, -4(sp)
            //addi sp, -4

    mv s0, a3 // add s0, a3, zero
for_loop: // count to 0
    
    lw t0,0(a0)
    lw t1,0(a1)
    add t0, t1
    sw t0, 0(a2)

    addi s0, -1
    addi a0, 4
    addi a1, 4
    //addi a2, 4
    bnz s0, for_loop
    addi a2, 4

    pop s0  //expands to:
            //lw s0, 0(sp)
            //addi sp, 4
    mv a0, a3
    ret //jr lr
    
arg_0:
    //li a0, -1 //swapped with ret to exploit delay slot
    ret
    li a0, -1

bad_a3:
    ret
    mv a0,a3