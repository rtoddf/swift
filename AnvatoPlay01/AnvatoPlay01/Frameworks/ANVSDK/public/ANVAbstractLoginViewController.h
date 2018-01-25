//
//  ANVAbstractLoginView.h
//  ANVIOS6
//
//  Created by Cagdas Direk on 2/2/15.
//  Copyright (c) 2015 Anvato. All rights reserved.
//

#ifndef ANVIOS6_ANVAbstractLoginView_h
#define ANVIOS6_ANVAbstractLoginView_h


#endif

#import <UIKit/UIKit.h>

@interface ANVAbstractLoginViewController : UIViewController <UIWebViewDelegate>{
    IBOutlet UIWebView * loginWebView;
}

@property (nonatomic, retain) NSURL *url;
@property (nonatomic, retain) IBOutlet UIWebView *loginWebView;

- (void) initWithUrl:(NSURL *)urlToGo;
- (IBAction) back:(id)sender;

@end

