#include <stdio.h>
#include <stdbool.h>

int ifelse_c(bool, int, int);
int ifelse_s(bool, int, int);

int main(int argc, char **argv) {
    bool add = false;
    int i = 5;
    int j = 6;

    int c_result = ifelse_c(add, i, j);
    printf("C: %d\n", c_result);

    int s_result = ifelse_s(add, i, j);
    printf("Asm: %d\n", s_result);

    return 0;
}
