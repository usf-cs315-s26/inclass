#include <stdio.h>

int add2_c(int, int);
int add2_s(int, int);

int main(int argc, char **argv) {
    int i = 4;
    int j = 5;

    int c_result = add2_c(i, j);
    printf("C: %d\n", c_result);

    int s_result = add2_s(i, j);
    printf("Asm: %d\n", s_result);

    return 0;
}
