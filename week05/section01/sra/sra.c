#include <stdio.h>

unsigned long sra_s(unsigned int);

int main(int argc, char **argv) {
    unsigned int i = 0xFFFFFFFF;
    unsigned long l = sra_s(i);
    printf("l: %lu\n", l);
}
