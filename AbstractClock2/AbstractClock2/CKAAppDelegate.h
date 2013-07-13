//
//  CKAAppDelegate.h
//  AbstractClock2
//
//  Created by Chris Kim on 13. 7. 9..
//  Copyright (c) 2013년 Chris Kim. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CKAMainViewController;

@interface CKAAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) CKAMainViewController *mainViewController;

@property (nonatomic, assign) int optionClockMode;
@property (nonatomic, assign) BOOL option24Hour;
@property (nonatomic, assign) BOOL optionDateInfo;

@end
