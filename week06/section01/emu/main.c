#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int add2_s(int, int);

// Map ABI reg names to HW reg names
#define A0 10
#define A1 11

struct rv_state {
    uint64_t regs[32];
    uint64_t pc;
};

void rv_rtype(struct rv_state *state, uint32_t iw) {
    uint32_t funct3 = (iw >> 12) & 0b111;
    uint32_t funct7 = (iw >> 25) & 0x7F;
    uint32_t rd = (iw >> 7) & 0b11111;
    uint32_t rs1 = (iw >> 15) & 0x1F;
    uint32_t rs2 = (iw >> 20) & 0x1F;
    switch (funct3) {
        case 0b000:
            switch (funct7) {
                case 0:
                    // it's an ADD instruction
                    state->regs[rd] = state->regs[rs1] + state->regs[rs2];
                    break;
                case 0b0100000:
                    // it's a SUB instruction
                    break;
                default:
                    printf("unrecognized r-type instruction: %x\n", iw);
                    exit(-1);
            }
            break;
        default:
            printf("unrecognized r-type instruction: %x\n", iw);
    }
}

void rv_one(struct rv_state *state, uint32_t iw) {
    // 7-bit mask extracts the opcode
    uint32_t opcode = iw & 0b1111111;
    switch (opcode) {
        case 0b0110011:
            rv_rtype(state, iw);
            break;
        default:
            printf("unknown opcode\n");
            exit(-1);
    }
}

int main(int argc, char *argv[]) {
    struct rv_state state;
    memset(&state, 0, sizeof(struct rv_state));
    state.regs[A0] = 1;
    state.regs[A1] = 2;
    // uint32_t *instructions = (uint32_t*) add2_s;
    // uint32_t add_instr = *instructions;

    uint32_t iw = *(uint32_t*) add2_s;

    rv_one(&state, iw);
    printf("Emu: %lu\n", state.regs[A0]);
}
