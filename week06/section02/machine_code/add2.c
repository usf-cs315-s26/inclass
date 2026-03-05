#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

// Map ABI register names to HW names
#define A0 10
#define A1 11

// Emulation state for regs, PC, ...
struct rv_state {
    uint64_t regs[32];
    uint64_t pc;
};

// Declare our assembly function
int add2_s(int, int);

void rv_rtype(struct rv_state *state, uint32_t iw) {
    uint32_t funct3 = (iw >> 12) & 0b111;
    uint32_t funct7 = (iw >> 25) & 0b1111111;  // or 0x7F
    uint32_t rd = (iw >> 7) & 0b11111;
    uint32_t rs1 = (iw >> 15) & 0x1F;  // or 0b11111
    uint32_t rs2 = (iw >> 20) & 0x1F;
    switch (funct3) {
        case 0: // 0b000 => add or sub
            switch (funct7) {
                case 0: // 0b0000000 means ADD
                    state->regs[rd] = state->regs[rs1] + state->regs[rs2];
                    break;
                case 0b01000000:
                    // emulate SUB
                default:
                    printf("unknown add/sub instruction: %x\n", iw);
            }
            break;
        default: 
            printf("unknown r-type instruction: %x\n", iw);
    }

}

void rv_one(struct rv_state *state, uint32_t iw) {
    uint32_t opcode = iw & 0x7F; // or  0b1111111
    switch (opcode) {
        case 0b110011:  // R-type
            rv_rtype(state, iw);
            break;
        default:
            printf("unknown opcode for instruction: %x\n", iw);
            exit(-1);
    }
}

int main(int argc, char **argv) {
    // uint32_t *instructions = (uint32_t*) add2_s;
    // uint32_t instr = *instructions;

    struct rv_state state;
    memset(&state, 0, sizeof(struct rv_state));
    state.regs[A0] = 3;
    state.regs[A1] = 4;

    // Get the first instruction word (iw) from add2_s
    // This works because we're on a RISC-V machine, emulating
    // the machine code which was produced by the assembler
    uint32_t iw = *(uint32_t*) add2_s;

    rv_one(&state, iw);
    printf("Emu: %lu\n", state.regs[A0]);      
}
