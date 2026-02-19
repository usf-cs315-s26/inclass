.global countc_s

# a0 is the string, a1 is the char we're looking for

countc_s:
    lb t0, (a0)             # t0 is *s
    beq t0, zero, base  

    addi sp, sp, -16        # alloc stack space
    sd ra, (sp)             # preserve ra
    sd t0, 8(sp)            # preserve *s
    addi a0, a0, 1          # set up s+1
    jal countc_s

    ld t0, 8(sp)            # restore *s from sp+8
    ld ra, (sp)             # restore ra from sp
    addi sp, sp, 16         # dealloc

    bne t0, a1, not_found   # if *s == c
    addi a0, a0, 1          # new_count++
not_found:
    j done
base:
    li a0, 0                # set up base case rv
done:
    ret
