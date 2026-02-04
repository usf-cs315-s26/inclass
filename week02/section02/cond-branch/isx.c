#include <stdio.h>
#include <stdbool.h>

bool isx_c(char);
bool isx_s(char);

int main(int argc, char **argv) {
    if (argc == 1) {
        printf("invalid argument\n");
        return -1;
    }

    char c = argv[1][0];
    bool c_result = isx_c(c);
    printf("C: %d\n", c_result);  

    bool s_result = isx_s(c);
    printf("Asm: %d\n", s_result);
    return 0;  
}
