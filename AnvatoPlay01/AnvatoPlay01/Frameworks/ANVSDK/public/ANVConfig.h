//
//  ANVPlayerConfig.h
//
//  Copyright (c) 2015 Anvato. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ANVMacroManager;
@class ANVAPIConfig;
@class ANVHeartbeatConfigV4;
@class ANVMobileTestConfig;

@interface ANVOmnitureConfig : NSObject

@property (nonatomic, assign) BOOL isActive;
@property (nonatomic, strong) NSString *report_suite_id;
@property (nonatomic, strong) NSString *tracking_server;
@property (nonatomic, strong) NSString *app_name;
@property (nonatomic, strong) NSString *network;
@property (nonatomic, strong) NSString *pass_network;
@property (nonatomic, strong) NSString *player_name;
@property (nonatomic, strong) NSString *player_type;

@end

@interface ANVComscoreConfig : NSObject

@property (nonatomic, assign) BOOL isActive;
@property (nonatomic, strong) NSString *C2;
@property (nonatomic, strong) NSString *C3;
@property (nonatomic, strong) NSString *C4;
@property (nonatomic, strong) NSString *brandName;
@property (nonatomic, strong) NSString *publisher_secret;
@property (nonatomic, strong) NSDictionary *mapping;
@end

@interface ANVConvivaConfig : NSObject

@property (nonatomic, assign) BOOL isActive;
@property (nonatomic, strong) NSString *customer_key;
@property (nonatomic, strong) NSString *service_url;

@end

@interface ANVHeartbeatConfig : NSObject

@property (nonatomic, assign) BOOL isActive;
@property (nonatomic, assign) BOOL isDebugMode;
@property (nonatomic, strong) NSString *tracking_server;
@property (nonatomic, strong) NSString *channel;
@property (nonatomic, strong) NSString *job_id;
@property (nonatomic, strong) NSString *ovp;
@property (nonatomic, strong) NSString *sdk;
@property (nonatomic, strong) NSString *publisher;
@property (nonatomic, strong) NSString *video_player_name;

@property (nonatomic, strong) ANVHeartbeatConfigV4 *heartbeatV4Mapping;


@end

@interface ANVFreewheelAdConfig : NSObject

@property (nonatomic, assign) BOOL isActive;
@property (nonatomic, strong) NSString *network_id;
@property (nonatomic, strong) NSString *server_url;
@property (nonatomic, strong) NSString *profile_id;
@property (nonatomic, strong) NSString *site_section_id;
@property (nonatomic, strong) NSString *video_asset_id;


@property (nonatomic, strong) NSMutableDictionary *parameters;
@property (nonatomic, strong) NSMutableDictionary *customParams;
@property (nonatomic, strong) NSMutableArray *slotParameters;

- (NSString *) getAdTagURL:(ANVMacroManager *)macroManager;
- (NSDictionary *) getDictionary;


@end

@interface ANVFreewheelConfig : NSObject

@property (nonatomic, strong) ANVFreewheelAdConfig *client;
@property (nonatomic, strong) ANVFreewheelAdConfig *server;

@end

@interface ANVDFPAdConfig : NSObject

@property (nonatomic, assign) BOOL isActive;
@property (nonatomic, strong) NSString *adTagUrl;
@property (nonatomic, strong) NSString *userAgent;
@property (nonatomic, strong) NSString *serverUrl;
@property (nonatomic, strong) NSString *playListUrl;
@property (nonatomic, strong) NSMutableDictionary *customParams;
@property (nonatomic, strong) NSMutableDictionary *parameters;

-(NSDictionary *) getServerJSON:(ANVMacroManager *)macroManager;
-(NSString *) getAdTagURL:(ANVMacroManager *)macroManager;

@end

@interface ANVDFPConfig : NSObject

@property (nonatomic, assign) BOOL isActive;
@property (nonatomic, strong) ANVDFPAdConfig *client;
@property (nonatomic, strong) ANVDFPAdConfig *server;

@end

@interface ANVAkamaiQoSConfig : NSObject

@property (nonatomic, assign) BOOL isActive;
@property (nonatomic, strong) NSString *configUrl;
@property (nonatomic, strong) NSString *viewerId;

@end

@interface ANVAnvatoRealTimeAnalyticsConfig : NSObject

@property (nonatomic, assign) BOOL isActive;
@property (nonatomic, strong) NSString *mcpID;
@property (nonatomic, strong) NSString *ownerID;
@property (nonatomic, strong) NSString *serverUrl;

@end


@interface ANVNielsenTVRConfig : NSObject

@property (nonatomic, assign) BOOL isActive;
@property (nonatomic, assign) BOOL trackPlayhead;
@property (nonatomic, strong) NSString *appID;
@property (nonatomic, strong) NSString *appVersion;
@property (nonatomic, strong) NSString *appName;
@property (nonatomic, strong) NSString *sfCode;
@property (nonatomic, strong) NSDictionary *mapping;

@end


@interface ANVNielsenOCRConfig : NSObject

@property (nonatomic, assign) BOOL isActive;
@property (nonatomic, strong) NSString *deviceGroup;
@property (nonatomic, strong) NSString *didIdfa;
@property (nonatomic, strong) NSString *platform;
@property (nonatomic, strong) NSString *appId;
@property (nonatomic, strong) NSString *c9;

@end

@interface ANVComscoreVCEConfig : NSObject

@property (nonatomic, assign) BOOL isActive;
@property (nonatomic, strong) NSString *didX;
@property (nonatomic, strong) NSString *implType;
@property (nonatomic, strong) NSString *platform;
@property (nonatomic, strong) NSString *device;

@end

// TODO: Make these open parameters
@interface ANVOpenPixelConfig : NSObject

@property (nonatomic, assign) BOOL isActive;
@property (nonatomic, strong) NSString *ximpid;
@property (nonatomic, strong) NSString *dvType;
@property (nonatomic, strong) NSString *dvApp;
@property (nonatomic, strong) NSString *dvSDK;

@end

// TODO: Make these open parameters 
@interface ANVNielsenConfig : NSObject

@property (nonatomic, assign) BOOL isActive;
@property (nonatomic, strong) NSString *app_id;
@property (nonatomic, strong) NSString *sf_code;
@property (nonatomic, strong) NSString *app_version;
@property (nonatomic, strong) NSString *app_name;

@end

@interface ANVAccessControlConfig : NSObject

@property (nonatomic, assign) BOOL geoLocation;
@property (nonatomic, assign) BOOL onStartAuthZ;
@property (nonatomic, assign) BOOL onStartTVE;
@property (nonatomic, assign) BOOL onTuneAuthZ;
@property (nonatomic, assign) BOOL onTuneTVE;
@property (nonatomic, assign) BOOL onStartRating;
@property (nonatomic, assign) BOOL onTuneRating;
@property (nonatomic, strong) NSString *authenticator;
@property (nonatomic, strong) NSString *authorizer;

@end

@interface ANVAdobeConfig : NSObject

@property (nonatomic, assign) BOOL isActive;
@property (nonatomic, strong) NSString *requestor;
@property (nonatomic, strong) NSString *serverUrl;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *credential;

@property (nonatomic, strong) NSString *resourceId;
@property (nonatomic, strong) NSString *resourceRating;

@property (nonatomic, strong) NSString *tempPassShort;
@property (nonatomic, strong) NSString *tempPassLong;
@property (nonatomic, assign) NSTimeInterval tempPassPeriodicCheckDuration;

@end

@interface ANVUserInfoConfig : NSObject

@property (nonatomic, strong) NSString *encryptedHomezip;
@property (nonatomic, strong) NSString *geoZip;
@property (nonatomic, strong) NSString *latitude;
@property (nonatomic, strong) NSString *longitude;
@property (nonatomic, strong) NSString *geoStation;
@property (nonatomic, strong) NSString *homeZip;
@property (nonatomic, strong) NSString *homeStation;
@property (nonatomic, strong) NSString *maxRating;
@property (nonatomic, strong) NSString *mvpdID;
@property (nonatomic, strong) NSString *mvpdToken;

@end

@interface ANVChromeCastConfig : NSObject

@property (nonatomic, assign) BOOL isActive;
@property (nonatomic, assign) BOOL enabledInControlBar;
@property (nonatomic, assign) NSString *applicationID;

@end

@interface ANvControlBarConfig : NSObject

@property (nonatomic, assign) BOOL visible;
@property (nonatomic, assign) NSTimeInterval interval;

@end

@interface ANVExternalSubtitles : NSObject

@property (nonatomic, assign) BOOL isActive;
@property (nonatomic, assign) BOOL isEnabled;
@property (nonatomic, assign) NSString *bottomMargin;
@property (nonatomic, assign) NSString *horizontalMargin;
@property (nonatomic, assign) float extCCDisplayOffset;

@end

@interface ANVUIConfig : NSObject

@property (nonatomic, strong) ANvControlBarConfig *controlbar;
@property (nonatomic, assign) BOOL enableAdWebView;
@property (nonatomic, strong) ANVExternalSubtitles *externalSubtitles;
@end


@interface ANVVideoConfig : NSObject

@property (nonatomic, assign) float gracePeriodLength;
@property (nonatomic, assign) float upidDuration;
@property (nonatomic, assign) double failoverResetTimeout;
@property (nonatomic, assign) double failoverChannelThreshold;
@end

//  Anvato SDK Configuration
@interface ANVConfig : NSObject

@property (nonatomic, strong) ANVAkamaiQoSConfig *akamaiQoS;
@property (nonatomic, strong) ANVAnvatoRealTimeAnalyticsConfig *anvatoAnalytics; // Anvato realtime analytics (the best)
@property (nonatomic, strong) ANVOmnitureConfig *omniture;                 // Adobe Omniture configuration
@property (nonatomic, strong) ANVComscoreConfig *comscore;                 // Comscore configuration
@property (nonatomic, strong) ANVConvivaConfig *conviva;                   // Conviva configuration
@property (nonatomic, strong) ANVHeartbeatConfig *heartbeat;               // Adobe Heartbeat configuration
@property (nonatomic, strong) ANVFreewheelConfig *freewheel;               // Freewheel configuration
//@property (nonatomic, strong) ANVMPXConfig *mpx;                           // thePlatform MPX configuration
@property (nonatomic, strong) ANVDFPConfig *dfp;                           // Google DFP configuration
@property (nonatomic, strong) ANVNielsenConfig *nielsen;                   // Neilsel configuration
@property (nonatomic, strong) ANVNielsenOCRConfig *nielsenOCR;             // Neilsel OCR configuration
@property (nonatomic, strong) ANVComscoreVCEConfig *comscoreVCE;           // Comscore VCE configuration
@property (nonatomic, strong) ANVOpenPixelConfig *openPixel;               // Open Pixel configuration
@property (nonatomic, strong) ANVAdobeConfig *adobepass;                   // AdobePass configuration
@property (nonatomic, strong) ANVChromeCastConfig *chromecast;             // Chromecast configuration
@property (nonatomic, strong) ANVUIConfig *ui;
@property (nonatomic, strong) ANVUserInfoConfig *userinfo;                 // Information about the user that could be overwritten by the app
@property (nonatomic, strong) ANVAccessControlConfig *accessConfig;        // Authorization settings
@property (nonatomic, strong) ANVNielsenTVRConfig *nielsenTVR;              // neilsen TVE settings.
@property (nonatomic, strong) ANVVideoConfig *video;                 
@property (nonatomic, strong, readonly) ANVAPIConfig *API;
@property (nonatomic, strong) ANVMobileTestConfig *mobileTest;


@property (nonatomic, copy, readonly) NSString * appKey; // your application key
@property (nonatomic, copy, readonly) NSString * secKey; // your secret key
@property (nonatomic, copy, readonly) NSString * client; // your client id

+ (instancetype) get;
+ (instancetype) sharedInstance;
- (id) initWithAppKey:(NSString *)appKey secKey:(NSString *)secKey;
- (id) initWithAppKey:(NSString *)appKey secKey:(NSString *)secKey withVersion:(int) version;
- (void) updateAppKey:(NSString *)appKey secKey:(NSString *)secKey;
- (id) init NS_UNAVAILABLE;

@end


