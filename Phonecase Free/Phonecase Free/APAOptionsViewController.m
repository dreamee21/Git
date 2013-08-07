//
//  APAOptionsViewController.m
//  Phonecase Free
//
//  Created by Chris Kim on 13. 4. 8..
//  Copyright (c) 2013년 Chris Kim. All rights reserved.
//

#import "APAOptionsViewController.h"
#import "APANoticeViewController.h"
#import "APAHowToUseViewController.h"

@interface APAOptionsViewController ()

@end

@implementation APAOptionsViewController

@synthesize noticeViewController;
@synthesize howToUseController;

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switchToHowToUse:(id)sender {
    if (self.noticeViewController.view.superview == nil) {
        if (self.noticeViewController == nil) {
            self.noticeViewController =
            [[APANoticeViewController alloc] initWithNibName:@"APANoticeViewController" bundle:nil];
        }
        [howToUseController.view removeFromSuperview];
        [self.view insertSubview:self.noticeViewController.view atIndex:0];
    } else {
        if (self.howToUseController == nil) {
            self.howToUseController =
            [[APAHowToUseViewController alloc] initWithNibName:@"APAHowToUseViewController" bundle:nil];
        }
        [noticeViewController.view removeFromSuperview];
        [self.view insertSubview:self.howToUseController.view atIndex:0];
    }
}
@end
