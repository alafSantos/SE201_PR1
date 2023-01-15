int func(int a0, int a1, int a2, int a3) {
    int a7 = a0;

    a0 = a3;

    int a4, a5;

    if (a7 != 0) {
        if (a1 != 0 && a2 != 0) {
            if (a3 > 0) {
                a5 = a7;
                a4 = a3 << 2;
                a7 += a4;

                while (a5 != a7) {
                    a4 = *((int*)a5);
                    int a6 = *((int*)a1);
                    a4 += a6;
                    *((int*)a2) = a4;
                    a5 += 4;
                    a1 += 4;
                    a2 += 4;
                }

                return a0;

            }

            else
                return a0;
        }

        else
            return -1;
    }

    else
        return -1;
}
