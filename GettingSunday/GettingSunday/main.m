// apple example - https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/DatesAndTimes/Articles/dtCalendricalCalculations.html

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // get today
        NSDate *today = [[NSDate alloc] init];
        
        NSLog(@"Today is: %@.\n", today);
        
        // the the calendart
        NSCalendar* gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        
        NSLog(@"Gregorian is: %@.\n", gregorian);
        
        // get the weekday component of the current date
        NSDateComponents *weekdayComponents = [gregorian components: NSCalendarUnitWeekOfMonth
                                                           fromDate: today];
        
        NSLog(@"weekdayComponents is: %@.\n", weekdayComponents);
        
        /*
         Create a date components to represent the number of days to subtract from the current date.
         The weekday value for Sunday in the Gregorian calendar is 1, so subtract 1 from the number of days to subtract from the date in question.  (If today is Sunday, subtract 0 days.)
         */
        
        NSDateComponents *componentsToSubtract = [[NSDateComponents alloc] init];
        [componentsToSubtract setDay: 0 - [weekdayComponents weekday] - 1];
        
        NSLog(@"componentsToSubtract is: %@.\n", componentsToSubtract);
        
        NSDate *beginningOfWeek = [gregorian dateByAddingComponents:componentsToSubtract toDate: today options:0];
        
        NSLog(@"Beginning of the week: %@.\n", beginningOfWeek);
        
        /*
         Optional step:
         beginningOfWeek now has the same hour, minute, and second as the original date (today).
         To normalize to midnight, extract the year, month, and day components and create a new date from those components.
         */
        NSDateComponents *components = [gregorian components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay)
                                                    fromDate: beginningOfWeek];
        
        beginningOfWeek = [gregorian dateFromComponents:components];
                                                                                                                                           
        NSLog(@"Beginning of the week: %@.\n", beginningOfWeek);
    }
    return 0;
}
