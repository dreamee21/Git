//
//  BIDViewController.h
//  Control Fun
//
//  Created by Chris Kim on 13. 3. 21..
//  Copyright (c) 2013년 Chris Kim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDViewController : UIViewController <UIActionSheetDelegate>
@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) IBOutlet UITextField *numberField;
@property (strong, nonatomic) IBOutlet UILabel *sliderLabel;
@property (strong, nonatomic) IBOutlet UISwitch *leftSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *rightSwitch;
@property (strong, nonatomic) IBOutlet UIButton *doSomethingButton;

- (IBAction)textfieldDondEditing:(id)sender;
- (IBAction)backgroundTap:(id)sender;
- (IBAction)sliderChanged:(id)sender;
- (IBAction)switchChanged:(id)sender;
- (IBAction)toggleControls:(id)sender;
- (IBAction)buttonPressed:(id)sender;
@end
