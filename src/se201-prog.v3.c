int func(int* a0, int* a1, int* a2, int a3) {
    int* a7 = a0;

    if (a0 == 0) {
        return -1;
    }
    if (a1 == 0) {
        return -1;
    }
    if (a2 == 0) {
        return -1;
    }

    if (a3 > 0) {
        a7 += a3;

        while (a0 != a7) {
            *a2 = *a0 + *a1;
            a0++;
            a1++;
            a2++;
        }
    }
    return a3;
}