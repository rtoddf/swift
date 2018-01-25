//
//  ANVAbstractMvpdViewController.h
//  ANVIOS6
//
//  Created by Cagdas Direk on 2/2/15.
//  Copyright (c) 2015 Anvato. All rights reserved.
//

#ifndef ANVIOS6_ANVAbstractMvpdViewController_h
#define ANVIOS6_ANVAbstractMvpdViewController_h


#endif

#import <UIKit/UIKit.h>

@interface ANVAbstractMvpdViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIWebViewDelegate>{
    IBOutlet UITableView * tableView;
    NSArray * mvpds;
}

@property (nonatomic, retain) NSArray *mvpds;

- (void) initWithMvpdArray:(NSArray *)theMvpds;
- (IBAction) back:(id)sender;

@end
