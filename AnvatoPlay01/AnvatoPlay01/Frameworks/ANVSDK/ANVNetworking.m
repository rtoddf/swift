//
//  ANVNetworking.m
//  AnvatoApp
//
//  Copyright (c) 2015 Anvato All rights reserved.
//

#import "ANVNetworking.h"
#import "ANVLog.h"

#define TAG @"ANVNetwork"
#define CONTENT_TYPE @"application/x-www-form-urlencoded"
#define DEFAULT_USER_AGENT @"ANVSDK ios.3.15.1.u (iPhone; IOS 7.0 like Mac OS X)"
#import <ifaddrs.h>
#import <arpa/inet.h>

static NSString *userAgent;

@interface ANVNetworking ()

@property (readwrite, nonatomic, copy) blockDownloadProgress downloadProgess;
@property (readwrite, nonatomic, copy) blockGETReady completionBlock;
@property (readwrite, nonatomic, copy) blockGETError errorBlock;
@property (readwrite, nonatomic, assign) long long totalBytesRead;
@property (readwrite, nonatomic, strong) NSURLResponse *response;
@property (nonatomic, strong) NSOutputStream *outputStream;


@end

@implementation ANVNetworking

#pragma mark - Sync-Get
+ (NSDictionary *)syncGetTextByAddress:(NSString *)address
                             numMaxTry:(int)numMaxTry
{
    return [ANVNetworking syncGetTextByAddress:address numMaxTry:numMaxTry timeoutInterval:10 userAgent:[ANVNetworking userAgent] saveCookies:YES];
}

+ (NSDictionary *)syncGetTextByAddress:(NSString *)address
                             numMaxTry:(int)numMaxTry
                       timeoutInterval:(int)timeoutInterval
                             userAgent:(NSString *)userAgent
                           saveCookies:(BOOL)saveCookies
{
    
    NSMutableURLRequest *urlRequest = [self prepareRequest:address withMethod:@"GET" withUserAgent:userAgent withTimeoutInterval:timeoutInterval];
    return [self handleURLRequest:urlRequest withNumMaxTry:numMaxTry withSaveCookies:saveCookies];
}

#pragma mark - Sync-Head
+ (NSDictionary *)syncDoHead:(NSString *)address
                   numMaxTry:(int)numMaxTry
             timeoutInterval:(int)timeoutInterval
                   userAgent:(NSString *)userAgent
                 saveCookies:(BOOL)saveCookies
{
    if ( numMaxTry < 1 )
    {
        ANVLoge(TAG,@"Zero or less numMaxTry? %d", numMaxTry);
        return nil;
    }
    
    NSMutableURLRequest *urlRequest = [self prepareRequest:address withMethod:@"HEAD" withUserAgent:userAgent withTimeoutInterval:timeoutInterval];
    return [self handleURLRequest:urlRequest withNumMaxTry:numMaxTry withSaveCookies:saveCookies];
}

#pragma mark - Sync-Post
+ (NSDictionary *)syncPostStringByAddress:(NSString *)address
                                     data:(NSString *)dataString
{
    return [ANVNetworking syncPostStringByAddress:address
                                          data:dataString
                               timeoutInterval:10.0
                                   contentType:CONTENT_TYPE];
}


+ (NSDictionary *)syncPostStringByAddress:(NSString *)address
                                     data:(NSString *)dataString
                          timeoutInterval:(int)timeoutInterval
                              contentType:(NSString *)contentType
{
    NSData *postedData = [dataString dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    NSMutableURLRequest *urlRequest = [self prepareRequest:address withMethod:@"POST" withUserAgent:nil withTimeoutInterval:timeoutInterval];
    [urlRequest addValue:contentType forHTTPHeaderField:@"Content-Type"];
    [urlRequest setHTTPBody:postedData];
    [urlRequest setHTTPMethod:@"POST"];
    return [self handleURLRequest:urlRequest withNumMaxTry:3 withSaveCookies:YES];
}


#pragma mark - Utility-Request
+ (NSMutableURLRequest *) prepareRequest:(NSString *) address withMethod:(NSString *)method withUserAgent:(NSString *)userAgent withTimeoutInterval:(int) timeoutInterval
{
    // TODO: Make case insensitive comparison caseInsensitiveCompare == NSOrderedSame
    if ( ![[address substringToIndex:7] isEqualToString:@"http://"] &&  ![[address substringToIndex:8] isEqualToString:@"https://"])
    {
        ANVLoge(TAG,@"%@:Bad URL: no http:%@", address);
        return nil;
    }
    
    NSURL *url = [NSURL URLWithString:address];
    NSMutableURLRequest *urlRequest;
    urlRequest = [NSMutableURLRequest requestWithURL:url cachePolicy:0 timeoutInterval:timeoutInterval];
    [urlRequest setHTTPMethod:method];
    if ( userAgent )
        [urlRequest setValue:userAgent forHTTPHeaderField:@"User-Agent"];
    else
        [urlRequest setValue:[ANVNetworking userAgent] forHTTPHeaderField:@"User-Agent"];
    [urlRequest setValue:[ANVNetworking userAgent] forHTTPHeaderField:@"X-Anvato-User-Agent"];
    NSArray *currentCookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:url];
    NSDictionary *headers = [NSHTTPCookie requestHeaderFieldsWithCookies:currentCookies];
    [urlRequest setAllHTTPHeaderFields:headers];
    return urlRequest;
}

+ (NSDictionary *) handleURLRequest:(NSURLRequest *) urlRequest withNumMaxTry:(int)numMaxTry withSaveCookies:(BOOL)saveCookies
{
    
    for ( int i = 0; i < numMaxTry; i++ )
    {
        NSURLResponse *urlResponse = nil;
        NSError *error = nil;
        NSData *data = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&urlResponse error:&error];
        
        if ( !data )
        {
            [NSThread sleepForTimeInterval:0.5];
            ANVLoge(TAG,@"Network error: %@",[error localizedDescription]);
            continue;
        }
        
        NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)urlResponse;
        int statuscode = (int)[httpResponse statusCode];
        
        if ( saveCookies )
        {
            NSArray *cookiesFromResponse = [NSHTTPCookie cookiesWithResponseHeaderFields:[httpResponse allHeaderFields] forURL:    [urlRequest URL]];
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookies:cookiesFromResponse forURL:[urlRequest URL] mainDocumentURL:nil];
        }
        
        return @{ ANV_NW_RESPONSE : responseString, ANV_NW_STATUS_CODE : @(statuscode) , ANV_NW_HEADERS : [httpResponse allHeaderFields]};
    }
    return nil;
}

#pragma mark - Async-Get
+ (void)asynGetTextByAddress:(NSString *)address
                   numMaxTry:(int)numMaxTry
                  completion:(blockGETReady)completion
                       error:(blockGETError)error
{
    [ANVNetworking asynGetTextByAddress:address numMaxTry:numMaxTry timeoutInterval:10 userAgent:[ANVNetworking userAgent] saveCookies:YES getString:NO completion:completion error:error];
}

+ (void)asynGetTextByAddress:(NSString *)address
                   numMaxTry:(int)numMaxTry
             timeoutInterval:(int)timeoutInterval
                   userAgent:(NSString *)userAgent
                 saveCookies:(BOOL)saveCookies
                   getString:(BOOL)getString
                  completion:(blockGETReady)completion
                       error:(blockGETError)error
{
    if ( numMaxTry < 1 )
    {
        error(@{@"userInfo" : [NSString stringWithFormat:@"%@: Zero or less numMaxTry? %d", TAG, numMaxTry]});
        return;
    }
    
    if ( ![[address substringToIndex:4] isEqualToString:@"http"] )
    {
        error(@{@"userInfo" : [NSString stringWithFormat:@"%@: Bad URL: no http: %@", TAG, address]});
        return;
    }
    
    NSURL *url;
    NSMutableURLRequest *urlRequest;
    
    for ( int i = 0; i < numMaxTry; i++ )
    {
        url = [NSURL URLWithString:address];
        urlRequest = [NSMutableURLRequest requestWithURL:url cachePolicy:0 timeoutInterval:timeoutInterval];
        [urlRequest setHTTPMethod:@"GET"];
        [urlRequest setValue:userAgent forHTTPHeaderField:@"User-Agent"];
        [urlRequest setValue:userAgent forHTTPHeaderField:@"X-Anvato-User-Agent"];
        
        NSArray *currentCookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:url];
        NSDictionary *headers = [NSHTTPCookie requestHeaderFieldsWithCookies:currentCookies];
        [urlRequest setAllHTTPHeaderFields:headers];
        
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
            int statuscode = (int)[httpResponse statusCode];
            if ( connectionError )
            {
                if ( i == numMaxTry - 1 )
                {
                    ANVLoge(TAG, @"connection error");
                    error(connectionError.userInfo);
                    return;
                }
                [ANVNetworking asynGetTextByAddress:address numMaxTry:numMaxTry - 1 timeoutInterval:timeoutInterval userAgent:userAgent saveCookies:saveCookies getString:getString completion:completion error:error];
            }
            else
            {
                if ( saveCookies )
                {
                    NSArray *cookiesFromResponse = [NSHTTPCookie cookiesWithResponseHeaderFields:[httpResponse allHeaderFields] forURL:url];
                    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookies:cookiesFromResponse forURL:url mainDocumentURL:nil];
                }
                
                if ( getString )
                {
                    NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                    completion(responseString, statuscode);
                }
                else
                {
                    completion(data, statuscode);
                }
                
            }
        }];
    }
}

//Asyn POST
+ (void)asynPostStringByAddress:(NSString *)address
                           data:(NSString *)dataString
                     completion:(blockGETReady)completion
                          error:(blockGETError)error
{
    [ANVNetworking asynPostStringByAddress:address
                                   data:dataString
                        timeoutInterval:10.0
                            contentType:CONTENT_TYPE
                             completion:completion
                                  error:error];
}

+ (void)asynPostStringByAddress:(NSString *)address
                           data:(NSString *)dataString
                timeoutInterval:(int)timeoutInterval
                    contentType:(NSString *)contentType
                     completion:(blockGETReady)completion
                          error:(blockGETError)error
{
    NSData *postedData = [dataString dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    
    NSURL *url = [NSURL URLWithString:address];
    
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url cachePolicy:0 timeoutInterval:timeoutInterval];
    [urlRequest addValue:contentType forHTTPHeaderField:@"Content-Type"];
    [urlRequest setHTTPMethod:@"POST"];
    [urlRequest setValue:[ANVNetworking userAgent] forHTTPHeaderField:@"User-Agent"];
    [urlRequest setValue:[ANVNetworking userAgent] forHTTPHeaderField:@"X-Anvato-User-Agent"];
    [urlRequest setHTTPBody:postedData];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if ( !data )
        {
            ANVLoge(TAG,@"connection error - 342");
            error(connectionError.userInfo);
        }
        else
        {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
            int statuscode = (int)[httpResponse statusCode];
            NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            completion(responseString, statuscode);
        }
    }];
    
}

- (id) initAsyncConnectionWithAddress:(NSString *)address
                downloadProgressBlock:(blockDownloadProgress)progress
                      completionBlock:(blockGETReady)completion
                           errorBlock:(blockGETError)error
{
    self = [super init];
    if ( !self )
    {
        return nil;
    }
    
    if ( ![[address substringToIndex:4] isEqualToString:@"http"] )
    {
        ANVLoge(TAG,@"Bad URL: no http: %@",address);
        return nil;
    }
    
    _downloadProgess = progress;
    _completionBlock = completion;
    _errorBlock = error;
    _outputStream = [NSOutputStream outputStreamToMemory];
    [_outputStream scheduleInRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
    NSURL *url = [NSURL URLWithString:address];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url cachePolicy:0 timeoutInterval:10];
    [urlRequest setHTTPMethod:@"GET"];
    [urlRequest setValue:[ANVNetworking userAgent] forHTTPHeaderField:@"User-Agent"];
    [urlRequest setValue:[ANVNetworking userAgent] forHTTPHeaderField:@"X-Anvato-User-Agent"];
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self startImmediately:NO];
    //[conn setDelegateQueue:[[NSOperationQueue alloc] init]];
    [conn scheduleInRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    [conn start];
    
    return self;
}

#pragma mark - NSURLConnection Delegate Methods

- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    self.response = response;
    [self.outputStream open];
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if ([self.outputStream hasSpaceAvailable]) {
        const uint8_t *dataBuffer = (uint8_t *) [data bytes];
        [self.outputStream write:&dataBuffer[0] maxLength:[data length]];
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self.totalBytesRead += [data length];
        if ( self.downloadProgess )
        {
            self.downloadProgess(data, [data length], self.totalBytesRead, self.response.expectedContentLength);
        }
    });
    
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSData *responseData = [self.outputStream propertyForKey:NSStreamDataWrittenToMemoryStreamKey];
    [self.outputStream close];
    self.outputStream = nil;
    connection = nil;
    
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)self.response;
    int statuscode = (int)[httpResponse statusCode];
    dispatch_async(dispatch_get_main_queue(), ^{
        if ( self.completionBlock )
        {
            self.completionBlock(responseData, statuscode);
        }
    });
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    connection = nil;
    dispatch_async(dispatch_get_main_queue(), ^{
        if ( self.errorBlock )
        {
            self.errorBlock(@{ @"userInfo" : error.localizedDescription });
        }
    });
}


#pragma mark - Utility-User-Agent
+(void) setUserAgent:(NSString *) customUserAgent
{
    userAgent = customUserAgent;
}

+(NSString *) userAgent
{
    return userAgent ? userAgent : DEFAULT_USER_AGENT;
}

#pragma mark - Utility-LocalIPAddress
+ (NSString *)getIPAddress
{
    static NSString *address = nil;
    
    // if we have address assigned, use that one.
    if (address)
        return address;
    
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while(temp_addr != NULL) {
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    // Free memory
    freeifaddrs(interfaces);
    
    // if we cannot get a wifi address, use localhost
    if (!address)
        address = @"127.0.0.1";
    return address;
    
}


@end
