.global ifelse_s

/*
    a0 - add
    a1 - i
    a2 - j
    returns sum of i and j if add == 1 
    returns difference of i and j if add == 0
 */
ifelse_s:
    mv t0, zero             # t0 is ret val
    beq a0, zero, subtract
    add t0, a1, a2          # rv = i + j
    j done
subtract:
    sub t0, a1, a2          # ret val = i - j
done:
    mv a0, t0               # set up ret val in a0
    ret
