//
//  ANVSDK.h
//
//  Copyright (c) 2015 Anvato. All rights reserved.
//

#ifndef ANVIOS4_ANVSDK_h
#define ANVIOS4_ANVSDK_h

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreMedia/CoreMedia.h>
#import "ANVGlobals.h"
#import "ANVPlaybackOptions.h"

@interface VideoAPI : NSObject
- (BOOL) load:(NSString *)videoInfo     // Starts to prepare the video
     withType:(ANVVideoType)videoType;

- (BOOL) load:(NSString *)videoInfo     // Starts to prepare the video with given options
     withType:(ANVVideoType)videoType
  withOptions:(ANVPlaybackOptions *) options;

- (BOOL) pause;                         // Pauses the video
- (BOOL) resume;                        // Resumes the video
- (BOOL) seek:(CMTime) time;            // Seeks to specific time
- (BOOL) stop;                          // Stops the video playback, playback cannot be resumed.
- (BOOL) mute;
- (BOOL) unmute;
- (float) getVolume;
- (BOOL) setVolume:(float) volume;
- (NSDictionary*) getStateUpdate;
@end

@interface CCastAPI : NSObject
-(void) connect:(NSString *)deviceName; // Connects to a given deviceName
-(void) disconnect;                     // Disconnects from currently connected device
-(BOOL) isConnected;                    // Returns the current status of the Chromecast
-(void) setVolume:(float) vol;          // Sets the volume to currently connected Chromecast device
-(float) getVolume;                     // Returns the volume for currently connected Chromecast device
-(BOOL) anvConnect:(NSString *)anvack
        withAnvSec:(NSString *)seckey;
+(NSString *) getChromecastVerificationPayloadWithAppKey:(NSString *)anvack withSeckey:(NSString *)seckey;
+(NSMutableDictionary *) getChromecastVideoPayload:(NSString *)appKey withMcpId:(NSString *)mcpID;
@end

@interface AdobeAPI : NSObject
-(BOOL) setSelectedProvider:(NSString *)mvpdID;
-(BOOL) getAuthNTTL;                    // Initiates the login process, fires ANV_DATA_EVENT_ADOBE_AUTHN_MVPDID if user is authenticated and ANV_DATA_EVENT_ADOBE_MVPD_PICKER_NEEDED otherwise
-(BOOL) login;                          // Initiates the login process, fires ANV_DATA_EVENT_ADOBE_AUTHN_MVPDID if user is authenticated and ANV_DATA_EVENT_ADOBE_MVPD_PICKER_NEEDED otherwise
-(BOOL) logout;                         // Tries to log the user out. Fires ANV_DATA_EVENT_ADOBEPASS_USER_LOGGED_OUT with mvpdID set the nil when complete
-(BOOL) checkAuthN;                     // Checks if user is authenticated. fires ANV_DATA_EVENT_ADOBE_AUTHN_SUCCESS if user is authenticated, ANV_DATA_EVENT_ADOBE_AUTHN_FAIL otherwise.
-(BOOL) checkAuthNWithCallback:(ANVCallback) callback; // Checks if user is authenticated. fires ANV_DATA_EVENT_ADOBE_AUTHN_SUCCESS if user is authenticated, ANV_DATA_EVENT_ADOBE_AUTHN_FAIL otherwise.
-(BOOL) getMvpdID;                      // Returns the mvpd id of an authenticated user. Fires ANV_DATA_EVENT_ADOBEPASS_AUTHN_MVPDID
-(BOOL) getMvpdIDWithCallback:(ANVCallback) callback; // Returns the mvpd id of an authenticated user. Fires ANV_DATA_EVENT_ADOBEPASS_AUTHN_MVPDID
-(BOOL) getHomeZip;
-(BOOL) getHomeZipWithCallback:(ANVCallback) callback;
-(BOOL) getAuthZ;                       // Performs authZ check, uses ANVConfig.adobepass.resource_id as the resource.
-(BOOL) getAuthZWithResource:(NSString *) resource; // Performs authZ check, uses the argument as the resource.
-(BOOL) getAuthZWithResource:(NSString *) resource withCallback:(ANVCallback)callback; // Performs authZ check, uses the argument as the resource and returns with callback
-(BOOL) getMaxRating;

@end

@interface ControlBarAPI : NSObject
- (void) setVisible:(BOOL)visible;
- (void) setAutoHideInterval:(NSTimeInterval)interval;
@end

@interface UIAPI : NSObject
@property (nonatomic, strong) ControlBarAPI *controlbar;
- (void) hideFullScreen:(BOOL)hide;
- (void) expandVideoAspect:(BOOL)expand;
- (void) setCaptions:(BOOL)isEnabled;
- (BOOL) updatePlayerView:(UIView *)view;  // Updates the player for the new resolution.
- (BOOL) updatePlayerView:(UIView *)view isFullScreen:(BOOL)isFull;
- (void) setPiPMode:(BOOL) enable;
@end

@interface NielsenTVRAPI : NSObject
-(NSString *) nielsenOptOutUrl;
-(void) setNielsenOptOut:(NSString *)command;
@end

@interface ANVSDK : NSObject
@property(nonatomic, strong) VideoAPI *video;       // Video api
@property(nonatomic, strong) AdobeAPI *adobepass;   // AdobePass api
@property(nonatomic, strong) CCastAPI *ccast;       // Chromecast api
@property(nonatomic, strong) UIAPI *ui;
@property(nonatomic, strong) NielsenTVRAPI *nielsenTVR;


// constructors
-(instancetype) initWithDataEventListener:(id<ANVDataEventListener> )ANVDataEventListener withVideoEventListener:(id<ANVVideoEventListener>)ANVVideoEventListener;
-(instancetype) initWithDataEventListener:(id<ANVDataEventListener> )ANVDataEventListener withVideoEventListener:(id<ANVVideoEventListener>)ANVVideoEventListener withData:(NSDictionary *)customData;

-(void) initPlayerUI:(UIView *) view;                      // initializes the player UI
-(NSDictionary *) handleCustomRequest:(NSString *)key
                             withData:(NSDictionary *) data; // custom communication channel to pass data to SDK
-(NSString *) getVersion;                                  //return version of the SDK
-(void) close;                                             // closes the SDK, a new instance needs to be initiated if needed.
-(void) setLogLevel:(int) logLevel;

@end
#endif
