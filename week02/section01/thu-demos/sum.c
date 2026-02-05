#include <stdio.h>

int sum_c(int);
int sum_s(int);

int main(int argc, char **argv) {
    int count = 10;

    int c_result = sum_c(count);
    printf("C: %d\n", c_result);

    int s_result = sum_s(count);
    printf("Asm: %d\n", s_result);
}
