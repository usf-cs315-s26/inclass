.global countdown_s

/*
    a0 is the number of times to count
    return the number of times we looped
 */
countdown_s:
loop:
    ble a0, zero, done      # break loop when n <= 0
    addi a0, a0, -1         # n = n - 1 OR n--
    j loop
done:
    ret
