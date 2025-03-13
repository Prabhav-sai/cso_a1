#include <stdio.h>

void rotate(long n, long* array);

// void rotate(long n,long* array){
//     if(n<3) return
//     long zero = array[n-2];
//     long one = array[n-1];
//     for(int i =n-3;i>=0;i--){
//         array[i+2]=array[i];
//     }
//     array[1] = one;
//     array[0] = zero;
// }


int main()
{
    long n;
    scanf("%ld",&n);
    long array[n];
    for(long i =0;i<n;i++){
        scanf("%ld",&array[i]);
    }
    rotate(n,array);
    for(long i =0;i<n;i++){
        printf("%ld ",array[i]);
    }
    return 0;
}
