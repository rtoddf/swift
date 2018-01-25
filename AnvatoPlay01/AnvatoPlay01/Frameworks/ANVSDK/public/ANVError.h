//
//  ANVError.h
//
//  Copyright (c) 2015 Anvato. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ANVErr( errCode ) [ANVError getANVError:errCode]

// video errors
#define ANV_ERR_VIDEO_UNABLE_TO_INIT_MP 0x1001
#define ANV_ERR_VIDEO_UNABLE_TO_INIT_MP_ITEM 0x1002
#define ANV_ERR_VIDEO_UNABLE_TO_INIT_MP_NOT_INIT 0x1003
#define ANV_ERR_VIDEO_UNABLE_TO_INIT_MP_STREAM_FAILED 0x1004

// data errors
#define ANV_ERR_DATA_UNLABLE_FETCH_MCP_VIDEO 0x2001
#define ANV_ERR_DATA_NO_APPROPRIATE_SESSION_FOR_GIVEN_CLIENTID 0x2002

@interface ANVError : NSObject
+ (NSError *) getANVError:(int)code;
@end
