#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        NSDate *now = [NSDate date];
        // convenience method
        NSDate *now = [[NSDate alloc] init];
        
        // use %p to get the adddress
        NSLog(@"This NSDate object lives at %p.\n", now);
        
        // use the var name to get the data at that address - %@
        NSLog(@"The date is %@.\n", now);
        
        double seconds = [now timeIntervalSince1970];
        NSLog(@"It has been %f seconds since the start of 1970.\n", seconds);
        
        NSDate *later = [now dateByAddingTimeInterval:100000];
        NSLog(@"Time later: %@.\n", later);
        
        NSCalendar *cal = [NSCalendar currentCalendar];
        NSLog(@"My calendar: %@", cal);
        
//        unsigned long day = [cal ordinalityOfUnit:NSDayCalendarUnitDay
//                                           inUnit:NSMonthCalendarUnit
//                                           forDate:now];
//        
//        NSLog(@"The month for today is %lu.\n", day);
    }
    return 0;
}
