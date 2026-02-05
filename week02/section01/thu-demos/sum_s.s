.global sum_s

/*
    a0 == count
    returns sum of loop indices
 */
sum_s:
    li t0, 0                # t0 is the sum
loop:
    ble a0, zero, done      # stop when count reaches zero
    add t0, t0, a0          # sum = sum + count OR sum += count
    addi a0, a0, -1         # decrement count
    j loop
done:
    mv a0, t0               # set up sum in a0
    ret
