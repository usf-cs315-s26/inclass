#include <stdio.h>

int sumarr_c(int*, int);
int sumarr_s(int*, int);

int main(int argc, char **argv) {
    int arr[4] = {2, 4, 6, 8};

    int c_sum = sumarr_c(arr, 4);
    printf("C: %d\n", c_sum);

    int s_sum = sumarr_s(arr, 4);
    printf("Asm: %d\n", s_sum);

    return 0;
}
