//
//  ANVEventBundle.h
//
//  Copyright (c) 2015 Anvato. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ANVGlobals.h"

#ifndef ANVIOSSDK4_ANVEventBundle_h
#define ANVIOSSDK4_ANVEventBundle_h

@interface ANVEventBundle : NSObject

+(instancetype) createBundleWithEvent:(ANVVideoEvent)event andParams:(id)firstArg, ... NS_REQUIRES_NIL_TERMINATION;

-(id) initWithDictionary:(NSDictionary *)otherDictionary;
-(void) put:(NSString *)key b:(bool) b; // put boolean
-(void) put:(NSString *)key i:(int) i; // put integer
-(void) put:(NSString *)key d:(double) d; // put double
-(void) put:(NSString *)key str:(NSString *) str; // put string
-(void) put:(NSString *)key obj:(NSObject *) obj; // put object
-(BOOL) getB:(NSString *) key; // get boolean
-(long) getI:(NSString *) key; // get integer
-(double) getD:(NSString *) key; // get double
-(NSString *) getS:(NSString *) key; // get string
-(NSObject *) getO:(NSString *) key; // get object
-(void) removeObjectForKey:(id) key;

-(NSDictionary *) getDictionary; // get the corresponding dictionary
@end

#define ANV_VIDEO_EVENT_MSG  @"msg";
#endif

