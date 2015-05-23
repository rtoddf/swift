#include <stdio.h>

int main(int argc, const char * argv[]) {
    float floatOne;
    float floatTwo;
    
    floatOne = 3.14;
    floatTwo = 42.0;
    
    double floatSum;
    
    floatSum = floatOne + floatTwo;
    
    printf("The sum of the two floats is %f.\n", floatSum);
    
    return 0;
}
