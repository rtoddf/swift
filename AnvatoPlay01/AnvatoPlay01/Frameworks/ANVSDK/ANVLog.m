//
//  ANVLog.m
//  AnvatoApp
//
//  Copyright (c) 2015 Anvato All rights reserved.
//

#import "ANVLog.h"

static ANVLog *_sharedInstance = nil;

//@interface ANVLog()
//
//@property int logLevel;
//
//@end

@implementation ANVLog

+ (ANVLog *)sharedInstance
{
    if ( _sharedInstance == nil ) {
        @synchronized(self)
        {
            _sharedInstance = [[ANVLog alloc] init];
            _sharedInstance.logLevel = ANVLogLevelInfo;
        }
    }
    
    return _sharedInstance;
}

- (void)logWithLevel:(int) level tag:(NSString *)tag format:(NSString *)format, ...
{
    if ( self.logLevel > level ) {
        return;
    }
    NSString *levelString;
    NSString *color =anvLogColorWhite;
    switch ( level ) {
        case ANVLogLevelDebug:
            levelString = @"Debug";
            color =anvLogColorGreen;
            break;
        case ANVLogLevelInfo:
            levelString = @"Info";
            break;
        case ANVLogLevelWarning:
            levelString = @"Warning";
            color = anvLogColorYellow;
            break;
        case ANVLogLevelError:
            levelString = @"Error";
            color = anvLogColorRed;
            break;
        case ANVLogLevelFatal:
            levelString = @"Fatal";
            color = anvLogColorRed;
            break;
        default:
            break;
    }
    
    va_list argumentList;
    va_start(argumentList, format);
    
    NSString *loggingPrefix = [[NSString alloc] initWithFormat:@"%@[ANV][%@][%@]: %@%@",color,levelString, tag, format,anvLogColorWhite];
    NSLogv(loggingPrefix, argumentList);
    va_end(argumentList);
}

- (void)logWithColor:(NSString *)color level:(NSString *)levelString tag:(NSString *)tag format:(NSString *)format, ...
{
    va_list argumentList;
    va_start(argumentList, format);
    
    NSString *loggingPrefix = [[NSString alloc] initWithFormat:@"%@[ANV][%@][%@]: %@%@",color,levelString, tag, format,anvLogColorWhite];
    NSLogv(loggingPrefix, argumentList);
    va_end(argumentList);
}


@end
