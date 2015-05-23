#import <readline/readline.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, const char * argv[]) {
    // question
    printf("Where should I start counting down?\n");
    
    // ask the user
    // atoi function takes a string and converts
    // it to an integer
    // the i stands for integer, a stands for ASCII
    // the following example code would cause an error
    // without atoi because it attempts to store a string
    // in a variable of type int
    int num = atoi(readline(NULL));
    int i;

    printf("The number you chose was %d.\n", num);

    for (i = num; i >= 0; i--) {
        if(i % 3 != 0){
            continue;
        }
        
        if(i % 5 == 0){
            printf("Found one! - ");
        }
        
        printf("%d\n", i);
    }

    return 0;
}
