//
//  CKAMainViewController.m
//  AbstractClock2
//
//  Created by Chris Kim on 13. 7. 9..
//  Copyright (c) 2013년 Chris Kim. All rights reserved.
//

#import "CKAMainViewController.h"
#import "CKAAppDelegate.h"

#define RANDOM_INT(MIN, MAX) ((MIN)+arc4random() % ((MAX+1)-(MIN)))

@interface CKAMainViewController ()

@end

@implementation CKAMainViewController

@synthesize arrayCircleImages;
@synthesize arraySquareImages;
@synthesize timer;
@synthesize lblTimeDigit;
@synthesize lblAMPM;
@synthesize lblDateInfo;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor: [UIColor blackColor]];
    
     arrayCircleImages = [[NSMutableArray alloc] initWithCapacity:10];
     arraySquareImages = [[NSMutableArray alloc] initWithCapacity:10];
    for (int i=0; i<10; i++) {
        CGAffineTransform scaleTransform = CGAffineTransformMakeScale(0.1, 0.1);
        UIImage *imageSquare = [UIImage imageNamed:[NSString stringWithFormat:@"PatchSquare%d.png", i]];
        UIImageView *ivSquare = [[UIImageView alloc] initWithImage:imageSquare];
        [self.view addSubview:ivSquare];
        ivSquare.alpha=0;
        ivSquare.center = CGPointMake(RANDOM_INT(0, 320), RANDOM_INT(0, 480));
        ivSquare.transform = scaleTransform;
        [arraySquareImages addObject:ivSquare];
        
        UIImage *imageCircle = [UIImage imageNamed:[NSString stringWithFormat:@"PatchCircle%d.png", i]];
        UIImageView *ivCircle = [[UIImageView alloc] initWithImage:imageCircle];
        [self.view addSubview:ivCircle];
        ivCircle.alpha=0;
        ivCircle.center = CGPointMake(RANDOM_INT(0, 320), RANDOM_INT(0, 480));
        ivCircle.transform = scaleTransform;
        [arrayCircleImages addObject:ivCircle];
    }
    
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    
    lblTimeDigit = [[UILabel alloc] initWithFrame:CGRectMake(screenSize.width-220, 10, 200, 50)];
    [self.view addSubview:lblTimeDigit];
    lblTimeDigit.backgroundColor = [UIColor clearColor];
    lblTimeDigit.textColor = [UIColor whiteColor];
    lblTimeDigit.textAlignment = UITextAlignmentRight;
    lblTimeDigit.shadowColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha:.70];
    lblTimeDigit.shadowOffset = CGSizeMake(0, -1.0);
    [lblTimeDigit setFont:[UIFont fontWithName:@"ArialRoundedMTBold" size:24.0]];

    lblAMPM = [[UILabel alloc] initWithFrame:CGRectMake(screenSize.width-145, 20, 20, 20)];
    [self.view addSubview:lblAMPM];
    lblAMPM.backgroundColor = [UIColor clearColor];
    lblAMPM.textColor = [UIColor whiteColor];
    lblAMPM.textAlignment = UITextAlignmentRight;
    lblAMPM.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:70];
    lblAMPM.shadowOffset=CGSizeMake(0, -1.0);
    [lblAMPM setFont:[UIFont fontWithName:@"ArielRoundedMTBold" size:8.0]];
    
    lblDateInfo = [[UILabel alloc] initWithFrame:CGRectMake(screenSize.width-180, 45, 220, 20)];
    [self.view addSubview:lblDateInfo];
    lblDateInfo.backgroundColor = [UIColor clearColor];
    lblDateInfo.textColor = [UIColor whiteColor];
    lblDateInfo.textAlignment = UITextAlignmentRight;
    lblDateInfo.shadowColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:.70];
    lblDateInfo.shadowOffset=CGSizeMake(0, -1.0);
    [lblDateInfo setFont:[UIFont fontWithName:@"ArielRoundedMTBold" size:9.0]];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:(1.0) target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
}

-(void)updateTime {
    CKAAppDelegate *appDelegate = (CKAAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *comp = [calendar components:unitFlags fromDate:date];
    
    int hourOfDay = [comp hour];
    int minuteOfHour = [comp minute];
    int secondOfMinute = [comp second];
    
    if (hourOfDay<12)
        lblAMPM.text=@"AM";
    else
        lblAMPM.text=@"PM";
    
    if([appDelegate option24Hour] == NO) {
        lblAMPM.alpha=1;
        if(hourOfDay == 0) {
            hourOfDay = 12;
        } else {
            if(hourOfDay>12)
                hourOfDay -=12;
        }
    } else {
        lblAMPM.alpha=0;
    }
    
    if([appDelegate optionDateInfo] == YES) {
        lblDateInfo.alpha=1;
        NSString *tmpString = [[self dateInFormat:@"%Y-%m-%d"] stringByAppendingString:@"\n\n\n\n"];
        tmpString = [tmpString stringByAppendingString:[self dateInFormat:@"%A"]];
    } else {
        lblDateInfo.alpha=0;
    }
    
    self.lblTimeDigit.text=[NSString stringWithFormat:@"%02d:%02d:%02d", hourOfDay, minuteOfHour, secondOfMinute];

    UIImageView *iv;
    
    if([appDelegate optionClockMode] == 0) {
        iv = [arraySquareImages objectAtIndex:secondOfMinute%10];
    } else {
        iv = [arrayCircleImages objectAtIndex:secondOfMinute%10];
    }
    
    iv.alpha=0.3;
    
    CGFloat scale = RANDOM_INT(20, 100);
    
    [UIView beginAnimations:nil context:NULL];
    
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    CGAffineTransform transform = CGAffineTransformMakeScale(scale/100, scale/100);
    iv.transform = transform;
    
    if(secondOfMinute%10 == 0) {
        [self clearScreen];
    }
    
    [UIView commitAnimations];
}

- (NSString *) dateInFormat: (NSString*) stringFormat {
    char buffer[80];
    const char *format = [stringFormat UTF8String];
    time_t rawtime;
    struct tm * timeinfo;
    time(&rawtime);
    timeinfo = localtime(&rawtime);
    strftime(buffer, 80, format, timeinfo);
    return [NSString stringWithCString:buffer encoding:NSUTF8StringEncoding];
}

-(void)clearScreen {
    UIImageView *iv;
    CGAffineTransform scaleTransform = CGAffineTransformMakeScale(0.1, 0.1);
    
    for(int i=0; i<10; i++) {
        iv = [arraySquareImages objectAtIndex:i];
        iv.alpha=0;
        iv.transform=scaleTransform;
        iv.center=CGPointMake(RANDOM_INT(0, 320), RANDOM_INT(0, 480));
    
        iv = [arrayCircleImages objectAtIndex:i];
        iv.alpha = 0;
        iv.transform = scaleTransform;
        iv.center = CGPointMake(RANDOM_INT(0, 320), RANDOM_INT(0, 480));
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [self clearScreen];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(CKAFlipsideViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)showInfo:(id)sender
{    
    CKAFlipsideViewController *controller = [[CKAFlipsideViewController alloc] initWithNibName:@"CKAFlipsideViewController" bundle:nil];
    controller.delegate = self;
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:controller animated:YES completion:nil];
}

@end
