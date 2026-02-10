.global sumarr_s

/*
    a0 contains the pointer to the integers (words)
    a1 contains the length of the array
 */
sumarr_s:
    li t0, 0        # t0 is the sum
    li t1, 0        # t1 is the loop index 
loop:
    beq t1, a1, done
    lw t2, (a0)     # t1 = *a0, but word-size (4 bytes)
    add t0, t0, t2  # accumulate the sum 
    addi a0, a0, 4  # walk a0 to the next 4-byte word
    addi t1, t1, 1  # increment loop index
    j loop
done:
    mv a0, t0       # set up sum in a0
    ret
