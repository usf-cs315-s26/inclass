.global countc_s

/* a0 is string, a1 is the char we're looking for
 */

countc_s:
    li t1, 0                # t1 is new_count
    lb t0, (a0)
    beq t0, zero, done

    addi sp, sp, -24
    sd ra, (sp)             # preserve ra
    sd a0, 8(sp)            # preserve s
    sd a1, 16(sp)           # preserve c
    addi a0, a0, 1
    jal countc_s
    mv t2, a0               # t2 is new_count

    ld a0, 8(sp)            # restore s
    ld a1, 16(sp)           # restore c
    lb t3, (a0)             # t3 is *s
    bne t3, a1, not_c       # if *s == c
    addi t2, t2, 1          # new_count++
not_c:
    mv t1, t2               # set up new_count
done:
    mv a0, t1               # set up ret val
    ret
