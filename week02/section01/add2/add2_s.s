# Use .global to declare a name which is callable from other modules
.global add2_s

# Use a label to name the location where your function starts
# A label is not a function - it's just a location in the code

/*
    a0 contains i
    a1 contains j

    C function arguments are placed by the C compiler into 
    registers a0, ... in left-to-right order

    a0 is the return value by ISA convention
*/
add2_s:
    add a0, a0, a1      # return i + j 
    ret
