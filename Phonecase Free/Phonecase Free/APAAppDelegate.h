//
//  APAAppDelegate.h
//  Phonecase Free
//
//  Created by Chris Kim on 13. 4. 8..
//  Copyright (c) 2013년 Chris Kim. All rights reserved.
//

#import <UIKit/UIKit.h>

@class APASwitchViewController;

@interface APAAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) APASwitchViewController *switchViewController;
@property (strong, nonatomic) IBOutlet UITabBarController *rootController;

@end
