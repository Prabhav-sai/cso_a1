#include <stdio.h>
#include <stdlib.h>

long pallindrome(long length, char* array);

// long pallindrome(long length, char* array){
//     for(long i =0,j= length-1; i<j ; i++,j--){
//         if(array[i]!=array[j]){
//             return 0;
//         }
//     }
//     return 1;
// }

int main()
{
    long length = 0;
    char* array = (char*)malloc(1*sizeof(char));
    char temp;
    while(1){
        scanf("%c", &temp);
        if(temp == '\n'){
            break;
        }
        length++;
        array = (char*)realloc(array, length*sizeof(char));
        array[length-1] = temp;
    }
    printf("%ld\n", pallindrome(length, array));
    free(array);

    return 0;
}
