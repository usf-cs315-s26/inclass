# .global is an assembler "directive" which says that the named
# function will be implemented in this source code module
.global add2_s

# A "label" tells the assembler where the code for that function
# begins. A label is NOT a function but can be used to mark the 
# beginning of a function

/*
    By convention, function arguments are stored in registers
    a0, a1, a2, ... from left to right.

    Also, the return value is stored in a0
*/
add2_s:
    add a0, a0, a1      # sum = i + j
    ret
