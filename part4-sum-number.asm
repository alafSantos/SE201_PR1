.text

main:
    mv a0, 0 //clean a0 register, expand to addi a0,zero,0

    lib a0, 134 //since 134 is bigger than 127 we must use the unsigned version
    mv a1, 0 // addi a1,zero,0
    //expansion of mv a1, 65408 // 0xff80
    lib a1, 0xff
    slli a1,8
    lib a1, 0x80
    //
    call sum
    lib a1, 0x80 // using the delay slot

sum:
   add a1,a1,a2
   jr lr  