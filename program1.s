.text
    addi    a7,a0,0x00
    addi    a0,a3,0x00
    beq     a7,zero, a0_eq_0 #[0x40 + PC] #0x48
    beq     a1,zero, a1_eq_0 #0x50
    beq     a2,zero, a2_eq_0 #0x50
    bge     a3,zero, a3_le_0
    addi    a5,a7,0x00
    slli    a4,a3,0x02
    add     a7,a7,a4
if_5:
    lw      a4,0(a5)
    lw      a6,0(a1)
    add     a4,a4,a6
    sw      a4,0(a2)
    addi    a5,a5,0x04
    addi    a1,a1,0x04
    addi    a2,a2,0x04
a2_eq_0:
    bne     a5,a7, if_5 #0x24
    ret     #jalr x0,ra
a0_eq_0:
    li      a0,-1 #pseudo to addi a0,x0,-1
    ret     #jalr x0,ra
a1_eq_0:
    li      a0,-1 #pseudo to addi a0,x0,-1
a3_le_0:
    ret     #jalr x0,ra