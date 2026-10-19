extern qsort()
extern fprintf()
extern stderr;
extern malloc()

global main

cmp(a, b) {
    if *a < *b return -1;
    if *a > *b return 1;
    0;
}

add(x, y) x + y;

fact(n)
    if n <= 0 1;
    else n*fact(n-1);

check(name, got, want) {
    if got == want fprintf(stderr, "PASS %s\n", name);
    else fprintf(stderr, "FAIL %s: got %ld want %ld\n", name, got, want);
}

main() {
    auto arr;
    auto fp;
    auto r;

    arr = malloc(32);

    *arr = 5; *(arr+8) = 3; *(arr+16) = 9; *(arr+24) = 1;
    qsort(arr, 4, 8, cmp);
    check("decay qsort(cmp)", *arr + *(arr+8)*10 + *(arr+16)*100 + *(arr+24)*1000, 9531);

    *arr = 5; *(arr+8) = 3; *(arr+16) = 9; *(arr+24) = 1;
    qsort(arr, 4, 8, &cmp);
    check("address-of qsort(&cmp)", *arr + *(arr+8)*10 + *(arr+16)*100 + *(arr+24)*1000, 9531);

    *arr = 9; *(arr+8) = 1; *(arr+16) = 5; *(arr+24) = 3;
    fp = &cmp;
    qsort(arr, 4, 8, fp);
    check("pointer variable qsort(fp)", *arr + *(arr+8)*10 + *(arr+16)*100 + *(arr+24)*1000, 9531);

    fp = &add;
    r = fp(2, 3);
    check("indirect call fp(2,3)", r, 5);

    r = fact(5);
    check("recursion fact(5)", r, 120);

    0;
}
