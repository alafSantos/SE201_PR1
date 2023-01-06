addi    a7,a0,0x00
addi    a0,a3,0x00
beq     a7,zero,[0x40 + PC] 0x48
beq     a1,zero,0x50
beq     a2,zero,0x50
bge     a3,zero,0x54
addi    a5,a7,0x00
slli    a4,a3,0x2
add     a7,a7,a4
lw      a4,0(a5)
lw      a6,0(a1)
add     a4,a4,a6
sw      a4,0(a2)
addi    a5,a5,4
addi    a1,a1,4
addi    a2,a2,4
bne     a5,a7,0x24
ret
li      a0,-1
ret
li      a0,-1
ret