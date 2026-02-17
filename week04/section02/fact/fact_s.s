.global fact_s

fact_s:
    bne a0, zero, not_zero
    li a0, 1
    j base
not_zero:
    li t0, 1
    ble a0, t0, base

    addi sp, sp, -16    # prologue
    sd ra, (sp)         # *sp = ra

    sd a0, 8(sp)        # *(sp + 8) = n
    addi a0, a0, -1     # set up n-1 arg
    jal fact_s

    mv t1, a0           # t1 = ret val
    ld a0, 8(sp)        # a0 = *(sp + 8) (n)
    mul a0, a0, t1      # set up n * ret val in a0
    ld ra, (sp)         # epilogue
    addi sp, sp, 16
base:
    ret
