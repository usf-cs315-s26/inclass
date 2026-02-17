#include <stdio.h>
#include <stdlib.h>

int fact_c(int);
int fact_s(int);

int main(int argc, char **argv) {
    if (argc == 1) {
        printf("invalid args\n");
        exit(-1);
    }

    int n = atoi(argv[1]);

    int c_fact = fact_c(n);
    printf("C: %d\n", c_fact);

    int s_fact = fact_s(n);
    printf("Asm: %d\n", s_fact);
    return 0;
}
