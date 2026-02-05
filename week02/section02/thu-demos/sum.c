#include <stdio.h>
#include <stdlib.h>

int sum_c(int);
int sum_s(int);

int main(int argc, char **argv) {
    if (argc == 1) {
        printf("invalid args\n");
        return -1;
    }
    int n = atoi(argv[1]);

    int c_result = sum_c(n);
    printf("C: %d\n", c_result);

    int s_result = sum_s(n);
    printf("Asm: %d\n", s_result);

    return 0;
}
