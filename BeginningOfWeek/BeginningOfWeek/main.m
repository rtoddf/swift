#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDate *today = [[NSDate alloc] init];
        
        NSCalendar *gregorian = [NSCalendar calendarWithIdentifier: NSCalendarIdentifierGregorian];
        
        NSDate *beginningOfWeek = nil;

        BOOL ok = [gregorian rangeOfUnit: NSCalendarUnitWeekOfMonth
                               startDate: &beginningOfWeek
                                interval: NULL
                                 forDate: today];
        
        NSLog(@"Is it the beginning of the week: %d", ok);

    }
    return 0;
}
