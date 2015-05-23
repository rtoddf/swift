#include <stdio.h>

int getSquare(int number){
    int theSquare = number * number;
    return theSquare;
}

int main(int argc, const char * argv[]) {
    int integer = 3;
    int integerSquared = getSquare(integer);
    
    printf("\"%d\" squared is \"%d\".\n", integer, integerSquared);
    
    return 0;
}
