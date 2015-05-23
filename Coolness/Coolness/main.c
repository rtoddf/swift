#import <readline/readline.h>
#include <stdio.h>

int main(int argc, const char * argv[]) {
    // question
    printf("Who is cool?");
    
    // call the readline function
    // pass null - it will get what the user types
    const char *name = readline(NULL);
    
    printf("%s is cool!/n/n", name);

    return 0;
}
