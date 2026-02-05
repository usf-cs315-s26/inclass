.global add_or_sub_s

/* 
    a0 = boolean for add (1) or subtract (0)
    a1 = a
    a2 = b
 */
add_or_sub_s:
    li t0, 0            # t0 is the return value
    beq a0, zero, subtract
    add t0, a1, a2      # rv = a + b
    j done              # jump around subtract
subtract:
    sub t0, a1, a2      # rv = a - b
done:
    mv a0, t0           # set up rv in a0
    ret
