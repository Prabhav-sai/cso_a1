#include <stdio.h>

long difference(long n , long * input);

// long difference(long n , long * input){
//     long min = input[0];
//     long max = input[0];

//     for(long i = 1 ; i<n; i++){
//         if(input[i]<min){
//             min = input[i];
//         }
//         if(input[i]>max){
//             max = input[i];
//         }
//     }
//     return max - min;
// }

int main()
{
    long n;
    scanf("%ld",&n);
    long input[n];
    for(long i =0; i<n; i++){
        scanf("%ld",&input[i]);
    }
    printf("%ld",difference(n,input));
    return 0;
}
