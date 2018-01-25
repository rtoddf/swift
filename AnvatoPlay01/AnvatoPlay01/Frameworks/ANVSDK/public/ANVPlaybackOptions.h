//
//  ANVPlaybackOptions.h
//
//  Copyright © 2015 Anvato. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ANVEventBundle.h"

@interface ANVPlaybackOptionsVideoInfo : NSObject
    @property (nonatomic, assign ) float startFromInSec;    // starting position for VOD content
    @property (nonatomic, assign ) float volume;   // audio level
    @property (nonatomic, assign ) BOOL startPlaying;
@end

@interface ANVPlaybackOptionsContentInfo : NSObject
    @property (nonatomic, strong) NSString *mTitle;
    @property (nonatomic, strong ) NSString *mDescription;
    @property (nonatomic, strong ) NSString *mThumbnail;
@end

@interface ANVPlaybackOptionsUserData : NSObject
    @property (nonatomic, strong) NSDictionary* mUserDataBundle;
@end

@interface ANVPlaybackOptions : ANVEventBundle
    @property (nonatomic, strong ) ANVPlaybackOptionsVideoInfo *video;    // starting position for VOD content
    @property (nonatomic, strong ) ANVPlaybackOptionsContentInfo *contentInfo;
    @property (nonatomic, strong ) ANVPlaybackOptionsUserData *userData;
@end
