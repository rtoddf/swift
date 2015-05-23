#include <stdio.h>

float farenheitFromCelsius(float cel){
    float fahr = cel * 1.8 + 32.0;
    printf("%f Celsius is %f Fahrenheit.\n", cel, fahr);
    return fahr;
}

int main(int argc, const char * argv[]) {
    float freezeInC = 0;
    float freezeInF = farenheitFromCelsius(freezeInC);
    printf("Water freezes at %f degrees Celsius and %f degrees Fahrenheit.\n", freezeInC, freezeInF);
    
    return 0;
}
