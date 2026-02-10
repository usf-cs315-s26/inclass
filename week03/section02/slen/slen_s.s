.global slen_s

/* 
    a0 is the string 
    returns the length of the string
 */
slen_s:
    mv t0, a0       # t0 contains the string
    li a0, 0        # a0 contains the length
loop:
    lb t1, (t0)     # t1 = *str
    beq t1, zero, done
    addi a0, a0, 1  # increment length
    addi t0, t0, 1  # walk str to next char
    j loop          # go again
done:
    ret             # len is in a0
