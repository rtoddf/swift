#include <stdio.h>
#include <math.h>

int main(int argc, const char * argv[]) {
    // this is on page 143 - come back and read a few times
    
    double pi = 3.14;
    double integerPart;
    double fractionPart;
    
    // pass the address of intergerPart as an arg
    fractionPart = modf(pi, &integerPart);
    
    // find the value stored in integerPart
    printf("intergerPart = %.0f, fractionPart = %.2f.\n", integerPart, fractionPart);
    
    return 0;
}
