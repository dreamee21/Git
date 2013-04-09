//
//  APAOptionsViewController.h
//  Phonecase Free
//
//  Created by Chris Kim on 13. 4. 8..
//  Copyright (c) 2013년 Chris Kim. All rights reserved.
//

#import <UIKit/UIKit.h>

@class APANoticeViewController;
@class APAHowToUseViewController;

@interface APAOptionsViewController : UIViewController

@property (strong, nonatomic) APANoticeViewController *noticeViewController;
@property (strong, nonatomic) APAHowToUseViewController *howToUseController;

- (IBAction)switchToNotice:(id)sender;
- (IBAction)switchToHowToUse:(id)sender;

@end
