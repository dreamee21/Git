//
//  BIDViewController.h
//  Button Fun
//
//  Created by Chris Kim on 13. 3. 13..
//  Copyright (c) 2013년 Chris Kim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *statusText;
- (IBAction)buttonPressed:(UIButton *)sender;

@end
