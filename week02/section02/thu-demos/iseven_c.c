#include <stdbool.h>

bool iseven_c(int n) {
    bool rv = false;
    if ((n & 1) == 0) {
        rv = true;
    }
    return rv;
}
