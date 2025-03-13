#include <stdio.h>

void produc(long n , long * input , long * output);

// void produc(long n , long * input , long * output){

//     long left = 1;
//     long right = 1;

//     for(int i = 0;i<n;i++){
//         output[i] = left;
//         left = left*input[i];
//     }
//     for(int i =n-1;i>=0;i--){
//         output[i] = output[i]*right;
//         right = right*input[i];
//     }
//     return;
// }

int main()
{
    long n;
    scanf("%ld",&n);
    long input[n];
    long output[n];
    for(long i = 0;i<n;i++){
        scanf("%ld",&input[i]);
    }
    produc(n,input,output);
    for(long i = 0;i<n;i++){
        printf("%ld ",output[i]);
    }
    return 0;
}