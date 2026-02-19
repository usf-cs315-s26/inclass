.global fmi_rec_s

/*
    a0 is arr
    a1 is arr len
    a2 is idx
    a3 is max idx
    returns new max
 */
fmi_rec_s:
    addi sp, sp, -8         # prologue
    sd ra, (sp)

    mv t0, a3               # t0 is max_new
    bge a2, a1, done

    slli t1, a2, 2          # t1 is offset of idx elem
    add t1, a0, t1          # t1 is addr of idx elem
    lw t1, (t1)             # t1 arr[idx]

    slli t2, a3, 2          # t2 is offset of max_idx
    add t2, a0, t2          # t2 is addr of max_idx
    lw t2, (t2)             # t2 is arr[max_idx]

    ble t1, t2, not_max
    mv t0, a2               # new max
not_max:
    addi a2, a2, 1          # set up idx+1 arg
    mv a3, t0               # set up max_new arg
    jal fmi_rec_s
    mv t0, a0               # use ret val
done:
    mv a0, t0               # set up ret val
    ld ra, (sp)
    addi sp, sp, 8          # epilogue
    ret
