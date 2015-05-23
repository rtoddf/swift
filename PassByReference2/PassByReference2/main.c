#include <stdio.h>
#include <math.h>

void metersToFeetAndInches(double meters, unsigned int *ftPtr, double *inPtr){
    // this function assumes meters is non-negative
    
    // convert the number of meters into a floating point number of feet
    double rawFeet = meters * 3.281;
    
    // how many complete feet as an unsigned int?
    unsigned int feet = (unsigned int)floor(rawFeet);
    
    // avoid dereferencing NULL
    if(ftPtr){
        // store the number of feet at the supplied address
        *ftPtr = feet;
    }
    
    printf("Storing %u.\n", feet);
    printf("Storing %p.\n", ftPtr);
    
    // calculate inches
    double fractionFoot = rawFeet - feet;
    double inches = fractionFoot * 12.0;
    
    printf("Storing %f.\n", fractionFoot);
    printf("Storing %f.\n", inches);
    
    // avoid dereferencing NULL
    if(inPtr){
        // store the number of inches in the pointer provided
        *inPtr = inches;
    }
}

int main(int argc, const char * argv[]) {
    double meters = 3.0;
    unsigned int feet;
    double inches;
    
    metersToFeetAndInches(meters, &feet, &inches);
    printf("%.1f meters is equal to %d feet and %.1f inches.\n", meters, feet, inches);
    
    return 0;
}
