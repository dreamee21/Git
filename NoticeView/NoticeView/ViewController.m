//
//  ViewController.m
//  NoticeView
//
//  Created by Chris Kim on 13. 8. 5..
//  Copyright (c) 2013년 Chris Kim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize noticeWebView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSURL *myURL = [NSURL URLWithString:@"http://210.122.2.49/~phonecasefree/notice/"];
	NSURLRequest *myURLReq = [NSURLRequest requestWithURL:myURL];
    [noticeWebView loadRequest:myURLReq];
    noticeWebView.opaque = NO;
    noticeWebView.backgroundColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
