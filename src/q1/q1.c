#include <stdio.h>

// void swap(long *a, long *b);

// void swap(long *a, long *b)
// {
//     long t0 = *a;
//     long t1 = *b;
//     *a = t1;
//     *b = t0;
// }

long one(long n, long* input);

// long one(long n, long* input){
//     long once = 0;
//     long twice = 0;
//     for(long i =0;i<n;i++){
//         once = (once^input[i])&~twice;
//         twice = (twice^input[i])&~once;
//     }
//     return once;
// }

int main()
{
    long n;
    scanf("%ld",&n);
    n = 3*n+1;
    long input[n];
    for(long i =0;i<n;i++){
        scanf("%ld",&input[i]);
    }
    printf("%ld",one(n,input));
    return 0;
}
