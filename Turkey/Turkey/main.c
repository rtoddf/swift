#include <stdio.h>

int main(int argc, const char * argv[]) {
    // declare a variable called weight of type float
    float weight;
    
    // store a number in that variable
    weight = 14.2;
    
    // log it to the user
    printf("The turkey weights %f.\n", weight);
    
    // declare another variable of type float
    float cookingTime;
    
    // calculate the cooking time and store it in the variable
    cookingTime = 15.0 + 15.0 * weight;
    
    // log that to the user
    printf("The proper cooking time is %f minutes.\n", cookingTime);
    
    // end this function
    return 0;
}
