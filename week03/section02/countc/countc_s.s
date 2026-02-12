.global countc_s

# a0 is str, a1 is ch
# returns index of ch in arr, else -1

findc_s:
    li t0, 0                # t0 is the index
find_loop:
    lb t1, (a0)             # t1 is is *str
    beq t1, zero, find_done # found '\0'?
    beq t1, a1, find_done   # found ch?
    addi a0, a0, 1          # str++
    addi t0, t0, 1          # index++
    j find_loop             # go again
find_done:
    bne t1, zero, found_one
    li t0, -1               # set up -1 if not found
found_one:
    mv a0, t0               # set up index ret val
    ret

# a0 is str, a1 is ch
# returns count of ch in arr

countc_s:
    addi sp, sp, -8             # alloc space for RA
    sd ra, (sp)                 # preserve RA (*sp = ra)

    li t0, 0                    # t0 is count
count_loop:
    lb t1, (a0)                 # t1 is *str
    beq t1, zero, count_done    # found '\0'?

    addi sp, sp, -16            # space for a0
    sd a0, (sp)                 # preserve a0
    sd t0, 8(sp)                # preserve t0
    jal findc_s                 # overwrite RA
    mv t2, a0                   # t2 is index ret val
    ld a0, (sp)                 # restore a0
    ld t0, 8(sp)                # restore t0
    addi sp, sp, 16             # dealloc

    li t3, -1
    beq t2, t3, count_done      # found one?

    addi t0, t0, 1              # count++
    addi t2, t2, 1              # index++
    add a0, a0, t2              # str += index
    j count_loop                # go again
count_done:
    mv a0, t0                   # set up count ret val
    ld ra, (sp)                 # restore (ra = *sp)
    addi sp, sp, 8              # dealloc 
    
    ret
