#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // log string
        NSLog(@"Todd");
        
        // set string var
        NSString *firstName = @"Todd";
        // log string var
        NSLog(@"My first name is %@", firstName);

        // set string var
        NSString *lastName = @"Fleeman";
        // log string vars
        NSLog(@"My full name is %@ %@", firstName, lastName);
        
        // set number var
        NSNumber *age = @48;
        // log string and number
        NSLog(@"%@ is %@ years old", firstName, age);
        
        // assign items to an array
        NSArray *men = @[@"Todd", @"Larry", @"Dan"];
        // reassign array - doesn't have to be declared again
        men = @[@"Todd", @"Larry", @"Dan", @"Manny"];
        // log item in array by index
        NSLog(@"The first item in the array is %@", men[0]);
        
        // assign a dictionary
        NSDictionary *menAges = @{@"Todd": @48, @"Larry": @51, @"Dan": @55};
        // log item from dictionary by key
        NSLog(@"Age is %@", menAges[@"Todd"]);
        
        return 0;
    }
    return 0;
}