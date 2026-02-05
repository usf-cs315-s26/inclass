#include <stdio.h>
#include <stdlib.h>

int countdown_c(int);
int countdown_s(int);

int main(int argc, char **argv) {
    if (argc == 1) {
        printf("invalid args\n");
        return -1;
    }

    int n = atoi(argv[1]);
    int c_result = countdown_c(n);
    printf("C: %d\n", c_result);

    int s_result = countdown_s(n);
    printf("Asm: %d\n", s_result);

    return 0;
}
