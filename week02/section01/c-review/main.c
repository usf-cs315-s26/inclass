#include <stdint.h> // uint32_t
#include <stdio.h>  // printf etc
#include <string.h> // strcpy

void print_arg(int *which, char *a) {
    printf("a: %d %s\n", *which, a);
}

int main(int argc, char **argv) {
    for (int i = 0; i < argc; i++) {
        char buf[32];
        strcpy(buf, argv[i]);
        print_arg(&i, buf);
    }
}
