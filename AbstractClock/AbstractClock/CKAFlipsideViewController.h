//
//  CKAFlipsideViewController.h
//  AbstractClock
//
//  Created by Chris Kim on 13. 7. 9..
//  Copyright (c) 2013년 Chris Kim. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CKAFlipsideViewController;

@protocol CKAFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(CKAFlipsideViewController *)controller;
@end

@interface CKAFlipsideViewController : UIViewController

@property (weak, nonatomic) id <CKAFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
