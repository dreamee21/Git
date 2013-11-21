//
//  KLBViewController.m
//  Forleaf
//
//  Created by Chris Kim on 2013. 11. 17..
//  Copyright (c) 2013년 krislabs. All rights reserved.
//

#import "KLBViewController.h"

@interface KLBViewController ()

@end

@implementation KLBViewController
@synthesize forleafWebView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSURL *myURL = [NSURL URLWithString:@"http://aurumplanet-vega.iptime.org:50001"];
	NSURLRequest *forleafURLReq = [NSURLRequest requestWithURL:myURL];
    [forleafWebView loadRequest:forleafURLReq];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
