//
//  CKAMainViewController.h
//  AbstractClock2
//
//  Created by Chris Kim on 13. 7. 9..
//  Copyright (c) 2013년 Chris Kim. All rights reserved.
//

#import "CKAFlipsideViewController.h"

@interface CKAMainViewController : UIViewController <CKAFlipsideViewControllerDelegate> 

@property (strong, nonatomic) NSMutableArray *arraySquareImages;
@property (strong, nonatomic) NSMutableArray *arrayCircleImages;
@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) UILabel *lblTimeDigit;
@property (strong, nonatomic) UILabel *lblAMPM;
@property (strong, nonatomic) UILabel *lblDateInfo;

- (IBAction)showInfo:(id)sender;
- (void)clearScreen;
- (NSString *) dateInFormat: (NSString *) stringFormat;

@end
