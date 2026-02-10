#include <stdio.h>

int sumarr_c(int*, int);
int sumarr_s(int*, int);

int main(int argc, char **argv) {
    int arr[3] = {10, 20, 30};

    int c_sum = sumarr_c(arr, 3);
    printf("C: %d\n", c_sum);

    int s_sum = sumarr_s(arr, 3);
    printf("Asm: %d\n", s_sum);

    return 0;
}
