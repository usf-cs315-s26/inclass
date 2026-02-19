.global fmi_rec_s

/*
    a0 is arr
    a1 is len
    a2 is idx
    a3 is max_idx
 */

fmi_rec_s:
    addi sp, sp, -8
    sd ra, (sp)

    mv t0, a3               # t0 is max_new

    bge a2, a1, end_arr     # exhausted the arr?

    slli t1, a2, 2          # t1 is offset of idx
    add t1, a0, t1          # t1 is the addr of idx 
    lw t1, (t1)             # t1 is arr[idx]

    slli t2, a3, 2          # t2 is the offset of max_idx
    add t2, a0, t2          # t2 is the addr of max_idx
    lw t2, (t2)             # t2 is arr[max_idx]
    jal fmi_rec_s           # recurse

    ble t1, t2, done
    mv t0, a2               # max_new = idx
    mv a0, t0
    j done
end_arr:
    mv a0, a3               # return max_idx
done:
    ld ra, (sp)
    addi sp, sp, 8
    ret
