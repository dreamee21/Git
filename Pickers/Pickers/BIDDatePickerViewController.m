//
//  BIDDatePickerViewController.m
//  Pickers
//
//  Created by Chris Kim on 13. 3. 29..
//  Copyright (c) 2013년 Chris Kim. All rights reserved.
//

#import "BIDDatePickerViewController.h"

@interface BIDDatePickerViewController ()

@end

@implementation BIDDatePickerViewController
@synthesize  datePicker;

- (IBAction)buttonPressed {
    NSData *selected = [datePicker date];
    NSString *message = [[NSString alloc] initWithFormat:@"The date and time you selected is: %@", selected];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Date and Time Selected" message:message delegate:nil cancelButtonTitle:@"Yes, I did." otherButtonTitles:nil];
    [alert show];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    NSDate *now = [NSDate date];
    [datePicker setDate:now animated:NO];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
