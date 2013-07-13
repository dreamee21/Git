//
//  CKAFlipsideViewController.h
//  AbstractClock2
//
//  Created by Chris Kim on 13. 7. 9..
//  Copyright (c) 2013년 Chris Kim. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CKAFlipsideViewController;

@protocol CKAFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(CKAFlipsideViewController *)controller;
@end

@interface CKAFlipsideViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) id <CKAFlipsideViewControllerDelegate> delegate;
@property (strong, nonatomic) UITableView *tableView;

- (IBAction)done:(id)sender;

@end
