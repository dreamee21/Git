//
//  BIDViewController.m
//  iLoveYou
//
//  Created by Chris Kim on 13. 4. 17..
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"진우야!!"
                                                    message:@"많이 많이 사랑해" delegate:nil cancelButtonTitle:@"세상에서 제일 예쁜 보나님이" otherButtonTitles: nil];
    [alert show];
}
@end
