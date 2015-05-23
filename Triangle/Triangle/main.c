#include <stdio.h>

float thirdAngle(float angleA, float angleB){
    float angleC = 180 - (angleA + angleB);
    return angleC;
    
}

int main(int argc, const char * argv[]) {
    float angleA = 30.0;
    float angleB = 60.0;
    float angleC = thirdAngle(angleA, angleB);
    
    printf("The third angle is %.2f.\n", angleC);
    
    return 0;
}
