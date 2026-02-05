.global iseven_s

iseven_s:
    li t0, 1        # ret val = true (even)
    andi a0, a0, 1  # bitwise AND n & 1
    beq a0, zero, done
    li t0, 0
done:    
    mv a0, t0       # set up a0 = ret val
    ret
