.global slen_s

/* 
    a0 points to a null-terminated C string
    returns length of the string not including the null
*/
slen_s:
    li t0, 0            # t0 is the length
loop:
    lb t1, (a0)         # t1 = *a0
    beq t1, zero, done  # if we encountered the null, break the loop
    addi t0, t0, 1      # increment length
    addi a0, a0, 1      # walk ptr to next char
    j loop              # go again
done:
    mv a0, t0           # set up ret val in a0
    ret
