#include <stdbool.h>

int add_or_sub_c(bool add, int a, int b) {
    int rv = 0;
    if (add) {
        rv = a + b;
    } else {
        rv = a - b;
    }
    return rv;
}
