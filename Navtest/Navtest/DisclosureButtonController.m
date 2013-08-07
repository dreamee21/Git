//
//  DisclosureButtonController.m
//  Navtest
//
//  Created by Chris Kim on 13. 7. 2..
//  Copyright (c) 2013년 Chris Kim. All rights reserved.
//

#import "DisclosureButtonController.h"
#import "AppDelegate.h"
#import "DisclosureDetailController.h"

@interface DisclosureButtonController ()
@property (strong, nonatomic) DisclosureDetailController *childController;
@end

@implementation DisclosureButtonController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
