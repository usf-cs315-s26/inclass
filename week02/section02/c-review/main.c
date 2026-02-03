#include <stdio.h>

void print_arg(char *a) {
    printf("arg: %s\n", a);
}

int main(int argc, char **argv) {
    for (int i = 0; i < argc; i++) {
        print_arg(argv[i]);
    }
}
