.global fact_s

# a0 contains the number whose factorial we want
# returns the factorial

fact_s:
    li t0, 1                # base case
    ble a0, t0, base

    addi sp, sp, -16        # prologue
    sd ra, (sp)
    sd a0, 8(sp)            # preserve n to sp+8

    addi a0, a0, -1         # set up n-1 
    jal fact_s
    mv t1, a0               # set aside ret val
    ld a0, 8(sp)            # restore n from sp+8
    mul a0, a0, t1          # a0 = n * ret val

    ld ra, (sp)             # epilogue
    addi sp, sp, 16

base:
    ret
