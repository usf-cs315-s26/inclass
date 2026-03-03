#include <stdint.h>
#include <stdio.h>

int add2_s(int, int);

int main(int argc, char *argv[]) {
    uint32_t *instructions = (uint32_t*) add2_s;
    uint32_t instr = *instructions;
    printf("first instr: %x\n", instr);
}
