//
//  ANVGlobals.h
//
//  Copyright (c) 2015 Anvato. All rights reserved.
//

//#import "ANVEventBundle.h"

#ifndef ANVIOSSDK4_ANVGlobals_h
#define ANVIOSSDK4_ANVGlobals_h


@class ANVEventBundle;

typedef enum
{
    ANV_VIDEO_TYPE_UNKNOWN,
    ANV_VIDEO_TYPE_MCP,
    ANV_VIDEO_TYPE_MCP_DIRECT,
    ANV_VIDEO_TYPE_MPX,
    ANV_VIDEO_TYPE_URL,
    ANV_VIDEO_TYPE_VPAID,
} ANVVideoType;

typedef enum
{
    // video playback feedback
    ANV_VIDEO_EVENT_PREPARED,
    ANV_VIDEO_EVENT_PLAYBACK_STARTED,
    ANV_VIDEO_EVENT_CONTENT_STARTED,
    ANV_VIDEO_EVENT_SLATE_STARTED,
    ANV_VIDEO_EVENT_AD_STARTED,
    ANV_VIDEO_EVENT_AD_POD_STARTED,
    ANV_VIDEO_EVENT_ENDED,
    ANV_VIDEO_EVENT_PLAYBACK_ERROR,
    
    ANV_VIDEO_EVENT_PLAYHEAD,
    ANV_VIDEO_EVENT_BUFFERING_COMPLETED,
    ANV_VIDEO_EVENT_BUFFERING_STARTED,
    ANV_VIDEO_EVENT_PLAYLIST_COMPLETED,
    ANV_VIDEO_EVENT_PAUSED,
    ANV_VIDEO_EVENT_RESUMED,
    ANV_VIDEO_EVENT_MUTE,
    ANV_VIDEO_EVENT_UNMUTE,
    
    // stream info
    ANV_VIDEO_EVENT_CC_AVAILABLE,
    ANV_VIDEO_EVENT_AD_POINTS_AVAILABLE,

    // user requests
    ANV_VIDEO_EVENT_SEEK_REQUESTED,
    ANV_VIDEO_EVENT_PAUSE_REQUESTED,
    ANV_VIDEO_EVENT_RESUME_REQUESTED,

    // user interractions
    ANV_VIDEO_EVENT_VIDEOVIEW_CLICKED,
    ANV_VIDEO_EVENT_VIDEOVIEW_CLICKED_OK,
    ANV_VIDEO_EVENT_FULLSCREEN_ON_REQUESTED,
    ANV_VIDEO_EVENT_FULLSCREEN_OFF_REQUESTED,
    ANV_VIDEO_EVENT_CONTROLBAR_SHOWN,
    ANV_VIDEO_EVENT_CONTROLBAR_HIDDEN,
    ANV_VIDEO_EVENT_AD_WEBVIEW_DISMISSED,
    
    // chromecast events
    ANV_VIDEO_EVENT_CAST_MEDIA_STATUS,
    ANV_VIDEO_EVENT_CAST_DEVICE_LIST,
    ANV_VIDEO_EVENT_CAST_DEVICE_CONNECTING,
    ANV_VIDEO_EVENT_CAST_DEVICE_CONNECTED_DEVICE,
    ANV_VIDEO_EVENT_CAST_DEVICE_CONNECTED_APP,
    ANV_VIDEO_EVENT_CAST_DEVICE_DISCONNECTED,
    ANV_VIDEO_EVENT_CAST_DEVICE_CONNECT_REQUEST,
    ANV_VIDEO_EVENT_CAST_DEVICE_DISCONNECT_REQUEST,
    ANV_VIDEO_EVENT_CAST_DEVICE_ERROR_CONNECT_APP,
    ANV_VIDEO_EVENT_CAST_DEVICE_ERROR_CONNECT_DEVICE,
    ANV_VIDEO_EVENT_CAST_DEVICE_SESSION_ESTABLISHED,
    ANV_VIDEO_EVENT_CAST_DEVICE_SESSION_FAILED,
    ANV_VIDEO_EVENT_CAST_DEVICE_CUSTOM_MESSAGE_RECEIVED,
    
    //Airplay events
    ANV_VIDEO_EVENT_AIRPLAY_START,
    ANV_VIDEO_EVENT_AIRPLAY_END,

    //Picture In Picture events
    ANV_VIDEO_EVENT_PICTURE_IN_PICTURE_START,
    ANV_VIDEO_EVENT_PICTURE_IN_PICTURE_END,
    ANV_VIDEO_EVENT_PLAYLIST_STARTED,
} ANVVideoEvent;

typedef NS_ENUM(NSInteger, ANVVideoLoadFailType)
{
    ANV_VIDEO_LOAD_FAIL_TYPE_ADOBEPASS_AUTHN = -101, // F1 
    ANV_VIDEO_LOAD_FAIL_TYPE_ADOBEPASS_AUTHZ = -102, // F1
    ANV_VIDEO_LOAD_FAIL_TYPE_ADOBEPASS_PARENTAL = -103, // F2 // comcast only
    ANV_VIDEO_LOAD_FAIL_TYPE_ANVATO_HOMEZIP_RESTRICTION = -201, // F3
    ANV_VIDEO_LOAD_FAIL_TYPE_ANVATO_GEOZIP_RESTRICTION = -202,  // F4
    ANV_VIDEO_LOAD_FAIL_TYPE_ANVATO_MVPD_RESTRICTION = -203, // F6
    ANV_VIDEO_LOAD_FAIL_TYPE_ANVATO_CHANNEL_RESTRICTION = -204, // F7
    ANV_VIDEO_LOAD_FAIL_TYPE_ANVATO_DEVICE_RESTRICTION = -205, // F5
    ANV_VIDEO_LOAD_FAIL_TYPE_DEVELOPER = -301, // F8  // invalid anvack key, invalid mcp id, invalid token, etc.
    ANV_VIDEO_LOAD_FAIL_TYPE_NETWORK_FAILURE = -999, // F9 // application may retry
};

typedef enum
{
    ANV_DATA_EVENT_SESSION_READY,               // Gets fired when SDK has been initialized for the customer and ready to process requests.
    ANV_DATA_EVENT_SDK_CLOSED,
    ANV_DATA_EVENT_VIDEO_LOAD_SUCCESS,          // Gets fired when SDK has loaded video successfully
    ANV_DATA_EVENT_VIDEO_LOAD_FAIL,             // Gets fired when SDK has failed to load video
    ANV_DATA_EVENT_TVE_CHECK_SUCCESS,           // Gets fired when tve check succeeds
    ANV_DATA_EVENT_TVE_CHECK_FAILURE,              // Gets fired when TVE check fails
    ANV_DATA_EVENT_NEW_PROGRAM,                 // Gets fired when the SDK starts playing live video and/or when the program changes
    
    // adobe pass 
    ANV_DATA_EVENT_ADOBEPASS_INIT_SUCCESS,      // Gets fired when the SDK is initiated with AdobePass enabled if the access enabler is created successfully.
    ANV_DATA_EVENT_ADOBEPASS_INIT_FAILED,       // Gets fired when the SDK is initiated with AdobePass enabled if the access enabler cannot be created successfully.
    ANV_DATA_EVENT_ADOBEPASS_USER_AUTHENTICATED,     // Gets fired when checkAuthN or getAuthN is invoked and the user is already logged in
    ANV_DATA_EVENT_ADOBEPASS_USER_NOT_AUTHENTICATED,        // Gets fired when checkAuthN is invoked by the user is not logged in
    ANV_DATA_EVENT_ADOBEPASS_USER_LOGGED_OUT,   // Gets fired when logout method is invoked when the user is logged in
    ANV_DATA_EVENT_ADOBEPASS_MVPD_PICKER_NEEDED,// Gets fired when getAuthN is invoked and the user is not logged in
    ANV_DATA_EVENT_ADOBEPASS_LOGIN_VIEW_NEEDED, // Gets fired when the user picks an MVPD from  MVPD PICKER view
    ANV_DATA_EVENT_ADOBEPASS_AUTHN_MVPDID,      // Gets fired when getMvpdID is invoked and the user is logged in
    ANV_DATA_EVENT_ADOBEPASS_TRACKING_DATA,     // Gets fired on almost all AdobePass methods. This is for advanced users.
    ANV_DATA_EVENT_ADOBEPASS_AUTHZ_SUCCESS,     // Gets fired when getAuthZ method is invoked and the user is entitled to watch the given resource in anvato config
    ANV_DATA_EVENT_ADOBEPASS_AUTHZ_FAILURE,     // Gets fired when getAuthZ method is invoked but the user is NOT entitled to watch the given resource in anvato config
    ANV_DATA_EVENT_ADOBEPASS_USER_INFO,         // Gets fired when user information is requested
    ANV_DATA_EVENT_ADOBEPASS_ERROR,             // Gets fired in case of an error
    ANV_DATA_EVENT_ADOBEPASS_AUTHENTICATION_TTL,
} ANVDataEvent;

typedef enum
{
    ANV_PLAYER_TYPE_IOSSDK,
    ANV_PLAYER_TYPE_AIRPLAY,
    ANV_PLAYER_TYPE_CCAST,
    ANV_PLAYER_TYPE_VPAID
} ANVPlayerType;

@protocol ANVVideoEventListener
- (void) onVideoEvent:(ANVVideoEvent)event bundle:(ANVEventBundle *)bundle;
@end

@protocol ANVDataEventListener
- (void) onDataEvent:(ANVDataEvent)event bundle:(ANVEventBundle *)bundle;
@end


@interface ANVGlobals : NSObject

+(NSString *) dataEventToStr:(ANVDataEvent)event;
+(NSString *) videoEventToStr:(ANVVideoEvent)event;
typedef void (^ANVCallback)(ANVEventBundle *bundle);
@end
#endif
