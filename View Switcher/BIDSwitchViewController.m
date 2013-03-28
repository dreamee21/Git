//
//  BIDSwitchViewController.m
//  View Switcher
//
//  Created by Chris Kim on 13. 3. 28..
//  Copyright (c) 2013년 Chris Kim. All rights reserved.
//

#import "BIDSwitchViewController.h"
#import "BIDYellowViewController.h"
#import "BIDBlueViewController.h"

@interface BIDSwitchViewController ()

@end

@implementation BIDSwitchViewController
@synthesize yellowViewController;
@synthesize blueViewController;

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
    self.blueViewController = [[BIDBlueViewController alloc] initWithNibName:@"BlueView" bundle:nil];
    [self.view insertSubview:self.blueViewController atIndex:0];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    if (self.blueViewController.view.superview == nil) {
        self.blueViewController = nil;
    } else {
        self.yellowViewController = nil;
    }
}

-(IBAction)switchViews:(id)sender{
    if (self.yellowViewController.view.superview == nil) {
        if(self.yellowViewController ==nil) {
           self.yellowViewController = [[BIDYellowViewController alloc] initWithNibName:@"YellowView" bundle:nil];
        }
        [blueViewController.view removeFromSuperview];
        [self.view insertSubview:self.yellowViewController.view atIndex:0];
    } else {
        if (self.blueViewController == nil) {
            self.blueViewController = [[BIDBlueViewController alloc] initWithNibName:@"BlueView" bundle:nil];
        }
        [yellowViewController.view removeFromSuperview];
        [self.view insertSubview:blueViewController.view atIndex:0];
    }
}
@end
