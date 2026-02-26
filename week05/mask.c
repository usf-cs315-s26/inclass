int main(int argc, char*argv[]) {
    int i = 0b10101101;
    int j = i >> 2;
    int k = j & 0b1111;
    return k;
}
