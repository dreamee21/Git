//
//  BIDViewController.h
//  Simple Table
//
//  Created by Chris Kim on 13. 4. 3..
//  Copyright (c) 2013년 Chris Kim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray *listData;

@end
