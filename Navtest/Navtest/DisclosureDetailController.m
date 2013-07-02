//
//  DisclosureDetailController.m
//  Navtest
//
//  Created by Chris Kim on 13. 7. 2..
//  Copyright (c) 2013년 Chris Kim. All rights reserved.
//

#import "DisclosureDetailController.h"

@interface DisclosureDetailController ()

@end

@implementation DisclosureDetailController
@synthesize label;
@synthesize message;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    label.text = message;
    [super viewWillAppear:animated];
}

- (void)viewDidLoad
{
    self.label = nil;
    self.message = nil;
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
