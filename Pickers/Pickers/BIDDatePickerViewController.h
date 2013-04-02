//
//  BIDDatePickerViewController.h
//  Pickers
//
//  Created by Chris Kim on 13. 3. 29..
//  Copyright (c) 2013년 Chris Kim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDDatePickerViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
-(IBAction)buttonPressed :(id)sender;

@end
