#include <stdio.h>

void foo(int i) {
    printf("i: %d\n", i);
}

int main(int argc, char **argv) {
    for (int i = 0; i < 10; i++) {
        foo(i);
    }
    return 0;
}
