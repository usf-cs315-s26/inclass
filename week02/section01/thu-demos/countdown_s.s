.global countdown_s

/*
    a0 = count
 */
countdown_s:
loop:
                            # reversing the condition from C can make
                            # the code more readable

    ble a0, zero, done      # <= 0 breaks the loop
    addi a0, a0, -1         # decrement count
    j loop                  # go again
done:
    ret
