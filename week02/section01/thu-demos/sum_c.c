int sum_c(int count) {
    int sum = 0;
    while (count > 0) {
        sum += count;
        count--;
    }
    return sum;
}
