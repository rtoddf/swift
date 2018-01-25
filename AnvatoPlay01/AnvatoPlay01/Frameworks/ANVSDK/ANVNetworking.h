//
//  ANVNetworking.h
//  AnvatoApp
//
//  Copyright (c) 2015 Anvato All rights reserved.
//

#import <Foundation/Foundation.h>

#define ANV_NW_RESPONSE @"response"
#define ANV_NW_STATUS_CODE @"code"
#define ANV_NW_HEADERS @"headers"

typedef void(^blockGETReady)(id responseObject, int statusCode);
typedef void(^blockGETError)(NSDictionary *error);
typedef void (^blockDownloadProgress)(id responseObject, NSInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead);

@interface ANVNetworking : NSObject <NSURLConnectionDelegate, NSURLConnectionDataDelegate>

+(void) setUserAgent:(NSString *) customUserAgent;
+(NSString *) userAgent;

//Async GET
+ (void) asynGetTextByAddress:(NSString *)address
                    numMaxTry:(int)numMaxTry
                   completion:(blockGETReady)completion
                        error:(blockGETError)error;

+ (void) asynGetTextByAddress:(NSString *)address
                    numMaxTry:(int)numMaxTry
              timeoutInterval:(int)timeoutInterval
                    userAgent:(NSString *)userAgent
                  saveCookies:(BOOL)saveCookies
                    getString:(BOOL)getString
                   completion:(blockGETReady)completion
                        error:(blockGETError)error;

- (id) initAsyncConnectionWithAddress:(NSString *)address
                downloadProgressBlock:(blockDownloadProgress)progress
                      completionBlock:(blockGETReady)completion
                           errorBlock:(blockGETError)error;

//Sync GET
+ (NSDictionary *) syncGetTextByAddress:(NSString *)address
                              numMaxTry:(int)numMaxTry;

+ (NSDictionary *) syncGetTextByAddress:(NSString *)address
                              numMaxTry:(int)numMaxTry
                        timeoutInterval:(int)timeoutInterval
                              userAgent:(NSString *)userAgent
                            saveCookies:(BOOL)saveCookies;

//Async POST
+ (void) asynPostStringByAddress:(NSString *)address
                            data:(NSString *)dataString
                      completion:(blockGETReady)completion
                           error:(blockGETError)error;

+ (void) asynPostStringByAddress:(NSString *)address
                            data:(NSString *)dataString
                 timeoutInterval:(int)timeoutInterval
                     contentType:(NSString *)contentType
                      completion:(blockGETReady)completion
                           error:(blockGETError)error;

//Sync POST
+ (NSDictionary *) syncPostStringByAddress:(NSString *)address
                                      data:(NSString *)dataString;

+ (NSDictionary *) syncPostStringByAddress:(NSString *)address
                                      data:(NSString *)dataString
                           timeoutInterval:(int)timeoutInterval
                               contentType:(NSString *)contentType;

+ (NSDictionary *)syncDoHead:(NSString *)address
                   numMaxTry:(int)numMaxTry
             timeoutInterval:(int)timeoutInterval
                   userAgent:(NSString *)userAgent
                 saveCookies:(BOOL)saveCookies;

+ (NSString *)getIPAddress;

@end
