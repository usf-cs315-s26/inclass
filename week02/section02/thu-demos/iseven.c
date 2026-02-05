#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

bool iseven_c(int);
bool iseven_s(int);

int main(int argc, char **argv) {
    if (argc == 1) {
        printf("invalid args\n");
        return -1;
    }
    int n = atoi(argv[1]);
    bool c_result = iseven_c(n);
    printf("C: %d\n", c_result);

    bool s_result = iseven_s(n);
    printf("Asm: %d\n", s_result);
    return 0;
}
