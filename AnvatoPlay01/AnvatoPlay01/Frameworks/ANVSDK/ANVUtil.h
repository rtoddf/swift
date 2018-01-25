//
//  ANVUtil.h
//  AnvatoApp
//
//  Copyright (c) 2015 Anvato All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ANVUtil : NSObject

+ (NSString *) Dictionary2JSONStr:(NSDictionary *) dic;
+ (NSDictionary *) JSONStr2Dictionary: (NSString *) str;
+ (NSString*) encodeToPercentEscapeString:(NSString *)string;
+ (NSString*) decodeFromPercentEscapeString:(NSString *)string;

@end
