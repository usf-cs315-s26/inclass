#include <stdbool.h>

bool iseven_c(int n) {
    if ((n & 1) == 0) {
        return true;
    } else {
        return false;
    }
}
