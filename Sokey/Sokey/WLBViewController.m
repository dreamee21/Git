//
//  WLBViewController.m
//  Sokey
//
//  Created by Chris Kim on 13. 9. 22..
//  Copyright (c) 2013년 Wakelabs. All rights reserved.
//

#import "WLBViewController.h"

@interface WLBViewController ()

@end

@implementation WLBViewController
@synthesize myWebView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSURL *myURL = [NSURL URLWithString:@"http://naver.com"];
    NSURLRequest *myURLReq = [NSURLRequest requestWithURL:myURL];
    [myWebView loadRequest:myURLReq];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
