//
//  BIDMasterViewController.h
//  NavTemplate
//
//  Created by Chris Kim on 13. 4. 9..
//  Copyright (c) 2013년 Chris Kim. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BIDDetailViewController;

@interface BIDMasterViewController : UITableViewController

@property (strong, nonatomic) BIDDetailViewController *detailViewController;

@end
