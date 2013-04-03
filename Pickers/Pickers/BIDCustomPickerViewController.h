//
//  BIDCustomPickerViewController.h
//  Pickers
//
//  Created by Chris Kim on 13. 3. 29..
//  Copyright (c) 2013년 Chris Kim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDCustomPickerViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic) IBOutlet UILabel *winLabel;
@property (strong, nonatomic) NSArray *column1;
@property (strong, nonatomic) NSArray *column2;
@property (strong, nonatomic) NSArray *column3;
@property (strong, nonatomic) NSArray *column4;
@property (strong, nonatomic) NSArray *column5;

- (IBAction)spin;
@end
