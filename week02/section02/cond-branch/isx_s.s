.global isx_s

/*
    a0 contains a one-byte char
    return 1 if a0 is 'x' or 0 if not
*/
isx_s:
    li t0, 'x'          # t0 = 'x'
    beq a0, t0, equal
    li a0, 0            # a0 = false
    j done
equal:
    li a0, 1            # a0 = true
done: ret  
