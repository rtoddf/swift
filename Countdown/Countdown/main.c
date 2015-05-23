#include <stdio.h>

int main(int argc, const char * argv[]) {
    int i;
    
    for (i = 100; i >= 0; i--) {
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
