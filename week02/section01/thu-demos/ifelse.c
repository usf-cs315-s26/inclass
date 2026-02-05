#include <stdio.h>
#include <stdbool.h>

int add_or_sub_c(bool, int, int);
int add_or_sub_s(bool, int, int);

int main(int argc, char **argv) {
    int a = 2;
    int b = 3;
    bool add = true;

    int c_result = add_or_sub_c(add, a, b);
    printf("C: %d\n", c_result);

    int s_result = add_or_sub_s(add, a, b);
    printf("Asm: %d\n", s_result);

    return 0;
}
