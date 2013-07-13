//
//  CKAAppDelegate.m
//  AbstractClock2
//
//  Created by Chris Kim on 13. 7. 9..
//  Copyright (c) 2013년 Chris Kim. All rights reserved.
//

#import "CKAAppDelegate.h"

#import "CKAMainViewController.h"

@implementation CKAAppDelegate

@synthesize window;
@synthesize mainViewController;
@synthesize option24Hour;
@synthesize optionClockMode;
@synthesize optionDateInfo;

- (void)initialize {
    if([self class] == [CKAAppDelegate class]) {
        NSNumber *defaultClockMode = [NSNumber numberWithInt:0];
        NSNumber *defaultOpacity = [NSNumber numberWithFloat:0.3];
        NSDictionary *dicOptionDefaults = [NSDictionary dictionaryWithObjectsAndKeys:defaultClockMode, @"keyClockMode", defaultOpacity, @"keyOpacity", NO, @"key24Hour", NO, @"keyDateInfo", NO, @"keyAllowAutoLock", nil];
        [[NSUserDefaults standardUserDefaults] registerDefaults:dicOptionDefaults];
    }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.optionClockMode = [[NSUserDefaults standardUserDefaults]integerForKey:@"keyClockMode"];
    self.option24Hour = [[NSUserDefaults standardUserDefaults]boolForKey:@"key24Hour"];
    self.optionDateInfo = [[NSUserDefaults standardUserDefaults]boolForKey:@"keyDateInfo"];
    
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"keyAllowAutoLock"]) {
        [UIApplication sharedApplication].idleTimerDisabled=NO;
    } else {
        [UIApplication sharedApplication].idleTimerDisabled=YES;
    }
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.mainViewController = [[CKAMainViewController alloc] initWithNibName:@"CKAMainViewController" bundle:nil];
    self.window.rootViewController = self.mainViewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)optionSwitch24Hour:(UISwitch *)sender {
    [[NSUserDefaults standardUserDefaults] setBool:sender.on forKey:@"key24Hour"];
    self.option24Hour = sender.on;
}

- (void)optionSwitchDateInfo:(UISwitch *)sender {
    [[NSUserDefaults standardUserDefaults] setBool:sender.on forKey:@"keyDateInfo"];
}

- (void)optionSwitchAllowAutolock:(UISwitch *)sender {
    [[NSUserDefaults standardUserDefaults] setBool:sender.on forKey:@"keyAllowAutolock"];
    [UIApplication sharedApplication].idleTimerDisabled = !sender.on;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [[NSUserDefaults standardUserDefaults] setInteger:self.optionClockMode forKey:@"keyClockMode"];
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
