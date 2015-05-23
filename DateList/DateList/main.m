#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // create 3 NSDate objects
        
        NSDate *now = [[NSDate date] init];
        
        NSDate *tomorrow = [now dateByAddingTimeInterval:24.0 * 60.0 * 60.0];
    
        NSDate *yesterday = [now dateByAddingTimeInterval:-24.0 * 60.0 * 60.0];
        
        // create an array with all three date objects
        NSArray *dateList = @[now, tomorrow, yesterday];
        
        // print out the first and third items in the array
//        NSLog(@"the first item in the array is %@.\n", dateList[0]);
//        NSLog(@"the third item in the array is %@.\n", dateList[2]);
//        
//        NSLog(@"There are %lu items in the array.\n", [dateList count]);
        
        // regular for loop
//        NSUInteger *dateCount = [dateList count];
//        
//        for (int i = 0; i < dateCount; i++) {
//            NSDate *d = dateList[i];
//            NSLog(@"Here is a date: %@.\n", d);
//        }
        
        for (NSDate *d in dateList){
            NSLog(@"Here is a date: %@.\n", d);
        }
        
        // create in mutable array
        NSMutableArray *dateListTwo = [NSMutableArray array];
        // add two items to the mutable array
        [dateListTwo addObject:now];
        [dateListTwo addObject:tomorrow];
        
        // add yesterday as the first item in the new array
        [dateListTwo insertObject:yesterday atIndex:0];
        
        for (NSDate *d in dateListTwo) {
            NSLog(@"Here is a date: %@.\n", d);
        }
        
        [dateListTwo removeObject:0];
        
        for (NSDate *d in dateListTwo) {
            NSLog(@"Here is a date: %@.\n", d);
        }
    }
    return 0;
}
