//
//  BIDSwitchViewController.h
//  View Switcher
//
//  Created by Chris Kim on 13. 3. 28..
//  Copyright (c) 2013년 Chris Kim. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BIDYellowViewController;
@class BIDBlueViewController;

@interface BIDSwitchViewController : UIViewController

@property (strong, nonatomic) BIDYellowViewController *yellowViewController;
@property (strong, nonatomic) BIDBlueViewController *blueViewController;

-(IBAction)switchViews:(id)sender;

@end
