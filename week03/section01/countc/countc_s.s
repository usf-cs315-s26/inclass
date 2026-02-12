.global countc_s

# a0 is str, a1 is ch
# returns index of ch in arr, else -1

findc_s:
    li t0, 0                    # t0 holds index
find_loop:
    lb t1, (a0)                 # t1 holds *str
    beq t1, zero, find_done     # found '\0'; break
    beq t1, a1, find_done       # found ch (a1); break
    addi a0, a0, 1              # str++
    addi t0, t0, 1              # index++
    j find_loop                 # go again
find_done:
    bne t1, zero, find_found    # if *str == 0, not found
    li t0, -1                   # not found; index = -1
find_found:
    mv a0, t0                   # set up index as ret val
    ret

# a0 is str, a1 is ch
# returns count of ch in arr

countc_s:
    addi sp, sp, -8             # alloc space for 1 reg
    sd ra, (sp)                 # preserve ra

    li t0, 0                    # t0 holds count
count_loop:
    lb t1, (a0)                 # t1 holds *str
    beq t1, zero, count_done    # found the '\0'

                                # stack caller-pres regs
    addi sp, sp, -16
    sd a0, (sp)                 # preserve str
    sd t0, 8(sp)                # preserve count

    jal findc_s
    mv t2, a0                   # t2 holds index ret val

    ld a0, (sp)                 # restore str
    ld t0, 8(sp)                # restore count
    addi sp, sp, 16

    li t3, -1
    beq t2, t3, count_done
    addi t0, t0, 1              # count++
    addi t2, t2, 1              # index++
    add a0, a0, t2              # str += index
    j count_loop
count_done:
    mv a0, t0                   # set up count as ret val
    ld ra, (sp)                 # restore ra
    addi sp, sp, 8              # dealloc space for ra
    ret
