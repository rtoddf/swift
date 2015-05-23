#include <stdio.h>
#include <stdlib.h>

int main(int argc, const char * argv[]) {
    int x = 255;
    
    printf("x is %d\n", x);
    printf("In octal, x is %o.\n", x);
    printf("In hexidecimal, x is %x.\n", x);
    
    // long is for integers with lots of bits
    // long adds an l to the token
    // or long long adds ll
    long y = 255;
    
    printf("y long is %ld.\n", y);
    printf("In octal long, y is %lo.\n", y);
    printf("In hexidecimal, y long is %lx.\n", y);

    // what about unsigned
    unsigned z = 255;
    
    // we use a u
    // octal and hexidecimal assume its unsigned
    printf("z long is %ud.\n", z);
    
    printf("11 / 3 = %d remainder of %d.\n", 11/3, 11%3);
    printf("11 / 3 is %d.\n", 11/3);
    printf("11 / 3.0 = %f.\n", 11/(float)3);

    printf("The absolute value of -5 is %d.\n", abs(-5));
    
    return 0;
}
