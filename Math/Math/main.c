#include <stdio.h>
#include <math.h>

// this is the sin function
double sin(double x);

int main(int argc, const char * argv[]) {
    int integer = 1;
    
    double x = sin(integer);
    
    printf("the sin of %d is %.3f.\n", integer, x);
    
    return 0;
}
