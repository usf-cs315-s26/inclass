#include <stdio.h>

int countdown_c(int);
int countdown_s(int);

int main(int argc, char **argv) {
    int count = 10;

    int c_result = countdown_c(count);
    printf("C: %d\n", c_result);

    int s_result = countdown_s(count);
    printf("Asm: %d\n", s_result);
}
