.global sumarr_s

/*
    a0 is the array of integers
    a1 is the array length
 */
sumarr_s:
    li t0, 0        # t0 is the sum
    li t1, 0        # t1 is the loop index
loop:
    beq t1, a1, done
    lw t2, (a0)     # t2 = *arr
    add t0, t0, t2  # sum += *arr
    addi a0, a0, 4  # walk a0 to next 4-byte int
    addi t1, t1, 1  # increment loop index
    j loop          # go again
done:
    mv a0, t0       # set up t0 as ret val
    ret
