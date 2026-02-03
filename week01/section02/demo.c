#include <stdio.h>

void printit(int i) {
    printf("i: %d\n", i);
}

int main(int argc, char **argv) {
    for (int i = 0; i < 10; i++) {
        printit(i);
    }
}
