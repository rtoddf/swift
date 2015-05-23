#import <Foundation/Foundation.h>
#import "BNRPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // create n ainstance of the BNRPerson
        BNRPerson *mikey = [[BNRPerson alloc] init];
        
        // give the instance variables interesting values using setters
        [mikey setWeightInKilos: 96];
        [mikey setHeightInMeters: 1.8];
        
        // log the instance variables using getters
        float height = [mikey heightInMeters];
        int weight = [mikey weightInKilos];
        NSLog(@"Mikey is %.2f meters in height and %d kilos in weight.\n", height, weight);
        
        // log some values using custom methods
        float bmi = [mikey bodyMassIndex];
        NSLog(@"Mikey's BMI value is %f.\n", bmi);
        
    }
    return 0;
}
