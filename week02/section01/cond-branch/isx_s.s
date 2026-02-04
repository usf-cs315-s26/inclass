.global isx_s

/* 
    a0 contains a character
    Returns 1 if char is 'x' else 0
*/
isx_s:
    li t0, 'x'
    beq a0, t0, is_x
    li a0, 0        # false
    j done
is_x:
    li a0, 1        # true
done:
    ret
