//
//  ANVLog.h
//  AnvatoApp
//
//
//  Copyright (c) 2015 Anvato All rights reserved.
//

#import <Foundation/Foundation.h>

#define ANVLogLevelInfo 0
#define ANVLogLevelDebug 1
#define ANVLogLevelWarning 2
#define ANVLogLevelError 3
#define ANVLogLevelFatal 4
#define ANVLogLevelOff 5

#define anvLogColorRed @"\e[0;31m"
#define anvLogColorGreen @"\e[0;32m"
#define anvLogColorYellow @"\e[0;33m"
#define anvLogColorBlue @"\e[0;34m"
#define anvLogColorPurple @"@\e[0;35m"
#define anvLogColorCyan @"\e[0;36m"
#define anvLogColorWhite @"\e[0;37m"

#define ANVLogc( c,t, f, ... )   [[ANVLog sharedInstance] logWithColor:c level:@"debug" tag:t format:f, ##__VA_ARGS__]

#define ANVLogd( t, f, ... )   [[ANVLog sharedInstance] logWithLevel:ANVLogLevelDebug tag:t format:f, ##__VA_ARGS__]
#define ANVLog( t, f, ... )    [[ANVLog sharedInstance] logWithLevel:ANVLogLevelInfo tag:t format:f, ##__VA_ARGS__]
#define ANVLogw( t, f, ... ) [[ANVLog sharedInstance] logWithLevel:ANVLogLevelWarning tag:t format:f, ##__VA_ARGS__]
#define ANVLoge( t, f, ... )   [[ANVLog sharedInstance] logWithLevel:ANVLogLevelError tag:t format:f, ##__VA_ARGS__]
#define ANVLogf( t, f, ... )   [[ANVLog sharedInstance] logWithLevel:ANVLogLevelFatal tag:t format:f, ##__VA_ARGS__]

@interface ANVLog : NSObject

@property int logLevel;

+ (ANVLog *)sharedInstance;

- (void)logWithLevel:(int) level tag:(NSString *)tag format:(NSString *)format, ...;
- (void)logWithColor:(NSString *)color level:(NSString *)levelString tag:(NSString *)tag format:(NSString *)format, ...;

@end
