.text

main:
    mv a0, zero //clean a0 register, expand to add a0,zero,zero
    li a0, 134 //since 134 is bigger than 127 we must use the unsigned version
    
    mv a1, zero // add a1,zero,zero
    //expansion of li a1, 65408 // 0x0000ff80
    li a1, 0xff 
    slli a1,8
    //li a1, 0x80 // using the delay slot
    
    call sum
    li a1, 0x80 

sum:
   //add a0,a0,a1 using the delay slot
   jr lr  
   add a0,a0,a1