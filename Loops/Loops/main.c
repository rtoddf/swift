#include <stdio.h>

int main(int argc, const char * argv[]) {
    int i;
    
    for (i=0; i<12; i++) {
        // what if you were pretty sure that no multiples
        // of 3 satisfied the euqation
        if(i % 3 == 0){
            continue;
        }
        
        printf("Checking i = %d\n", i);
        
        if(i + 90 == i * i){
            // once it finds the answer, it breaks out of the loop
            break;
        }
        
        printf("The answer is %d.\n", i);
    }
    
    return 0;
}
