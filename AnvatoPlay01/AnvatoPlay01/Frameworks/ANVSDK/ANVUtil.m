//
//  ANVUtil.m
//  AnvatoApp
//
//  Copyright (c) 2015 Anvato All rights reserved.
//

#import "ANVUtil.h"
#import "ANVLog.h"

#define TAG @"ANVUtilFunc"

@implementation ANVUtil

+ (NSDictionary *) JSONStr2Dictionary: (NSString *) str
{
    NSError *error = nil;
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    id jsonObj = [NSJSONSerialization JSONObjectWithData:data
                                                 options:NSJSONReadingMutableLeaves
                                                   error:&error];
    
    if (error)
    {
        ANVLoge(TAG,@"Unable to parse %@ as JSON.",str);
        return nil;
    }
    return jsonObj;
}
+ (NSString *) Dictionary2JSONStr:(NSDictionary *) dic
{
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic
                                                       options:0
                                                         error:&error];
    if ( error || !jsonData )
    {
        ANVLoge(TAG,@"Unable map dictionary to json str.");
    }
    else
    {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}

+ (NSString*) encodeToPercentEscapeString:(NSString *)string
{
    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL,
                                                                                 (CFStringRef) string,
                                                                                 NULL,
                                                                                 (CFStringRef) @"!*'();:@&=+$,/?%#[]",
                                                                                 kCFStringEncodingUTF8));
}


+ (NSString*) decodeFromPercentEscapeString:(NSString *)string
{
    return (NSString *)CFBridgingRelease(CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
                                                                                                 (CFStringRef) string,
                                                                                                 CFSTR(""),
                                                                                                 kCFStringEncodingUTF8));
}

@end
