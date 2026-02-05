.global sum_s

sum_s:
    mv t0, zero        # t0 is the sum    

loop:
    ble a0, zero, done  # stop when n <= 0
    add t0, t0, a0      # sum += n    
    addi a0, a0, -1     # n--
    j loop
done:
    mv a0, t0           # set up ret val in a0
    ret
