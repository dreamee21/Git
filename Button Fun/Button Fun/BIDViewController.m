//
//  BIDViewController.m
//  Button Fun
//
//  Created by Chris Kim on 13. 3. 13..
//  Copyright (c) 2013년 Chris Kim. All rights reserved.
//

#import "BIDViewController.h"

@interface BIDViewController ()

@end

@implementation BIDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)buttonPressed:(UIButton *)sender {
    NSString *title = [sender titleForState:UIControlStateNormal];
    _statusText.text = [NSString stringWithFormat:@"%@ button pressed.", title];
}
@end
