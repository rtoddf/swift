#include <stdio.h>

void showCookingTimeForTurkey(int pounds){
    int necessaryMinutes = 15 + 15 * pounds;
    printf("Cook for %d minutes.\n", necessaryMinutes);
}

int main(int argc, const char * argv[]) {
    int totalWeight = 10;
    int gibletWeight = 1;
    int turkeyWeight = totalWeight - gibletWeight;
    
    showCookingTimeForTurkey(turkeyWeight);
    
    return 0;
}
