#include <stdbool.h>

int ifelse_c(bool add, int i, int j) {
    int rv = 0;
    if (add) {
        rv = i + j;
    } else {
        rv = i - j;
    }
    return rv;
}
