//
//  BIDSingleComponentPickerViewController.m
//  Pickers
//
//  Created by Chris Kim on 13. 3. 29..
//  Copyright (c) 2013년 Chris Kim. All rights reserved.
//

#import "BIDSingleComponentPickerViewController.h"

@interface BIDSingleComponentPickerViewController ()

@end

@implementation BIDSingleComponentPickerViewController
@synthesize singlePicker;
@synthesize pickerData;

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
    [super viewDidLoad];
    NSArray *array = [[NSArray alloc] initWithObjects:@"Luke", @"Leia", @"Han", @"Chebacca", @"Artoo", @"Threepio", @"Lando", nil];
    self.pickerData = array;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed {
    NSInteger row = [singlePicker selectedRowInComponent:0];
    NSString *selected = [pickerData objectAtIndex:row];
    NSString *title = [[NSString alloc] initWithFormat:@"You selected %@!", selected];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:@"Thank you for choosing." delegate:nil cancelButtonTitle:@"You're Welcome" otherButtonTitles:nil];
    [alert show];
}

#pragma mark -
#pragma mark Picker Data Source Methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [pickerData count];
}

#pragma mark Picker Delegate Methods
- (NSString *)pickerView: (UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [pickerData objectAtIndex:row];
}
@end
