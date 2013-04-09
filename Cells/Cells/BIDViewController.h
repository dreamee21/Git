//
//  BIDViewController.h
//  Cells
//
//  Created by Chris Kim on 13. 4. 9..
//  Copyright (c) 2013년 Chris Kim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *computers;
@end
