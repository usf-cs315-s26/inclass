.global iseven_s

/* 
    a0 is the number
    returns 1 if the number is even, or 0 if the number is odd
 */
iseven_s:
    li t0, 1            # t0 is the ret val, start with false
    andi a0, a0, 1      # use bitwise AND to see if the ones place contains a 1
    beq a0, zero, done
    li t0, 0
    j done
done:
    mv a0, t0           # set up ret val in a0
    ret
