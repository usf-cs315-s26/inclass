.global sra_s

# a0 contains an unsigned int
# return long (double) version of that int

sra_s:
    slli a0, a0, 32
    srai a0, a0, 63
    ret 
