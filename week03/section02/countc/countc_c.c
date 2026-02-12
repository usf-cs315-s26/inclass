/* findc_c walks str
   if ch occurs in str, return the index
   if not, return -1;
*/
int findc_c(char *str, char ch) {
    int index = 0;
    while (*str) {
        if (*str != ch) {
            // Not found - keep looping
            str++;
            index++;
        } else {
            // Found ch
            break;
        }
    }
    if (*str == '\0') {
        index = -1;
    }
    return index;
}

/* countc_c counts occurrences of ch in str
   by calling findc_c in a loop
*/
int countc_c(char *str, char ch) {
    int count = 0;
    while (*str) {
        int index = findc_c(str, ch);
        if (index != -1) {
            // Found one
            count++;            // increment count
            index++;            // increment index
            str += index;       // start looking after the found ch
        } else {
            break;
        }
    }
    return count;
}
