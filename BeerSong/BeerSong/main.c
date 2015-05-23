#include <stdio.h>

void singSongFor(int numberOfBottles){
    if(numberOfBottles == 0){
        printf("There are simply no more bottles of beer on the wall.\n\n");
    } else {
        printf("%d bottles of beer on the wall. %d bottles of beer.\n", numberOfBottles, numberOfBottles);
        int oneFewer = numberOfBottles - 1;
        printf("Take one down, pass it around. %d bottles of beer on the wall.\n", oneFewer);
        
        // this function calls itself
        singSongFor(oneFewer);
        
        // this line will only be AFTER the sequence above is finished
        printf("Put a bottle in the recycling bin, %d empty bottles in the bin.\n", numberOfBottles);
    }
}

int main(int argc, const char * argv[]) {
    singSongFor(4);
    
    return 0;
}
