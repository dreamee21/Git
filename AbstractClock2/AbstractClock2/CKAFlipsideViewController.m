//
//  CKAFlipsideViewController.m
//  AbstractClock2
//
//  Created by Chris Kim on 13. 7. 9..
//  Copyright (c) 2013년 Chris Kim. All rights reserved.
//

#import "CKAFlipsideViewController.h"
#import "CKAAppDelegate.h"

@interface CKAFlipsideViewController ()

@end

@implementation CKAFlipsideViewController
@synthesize tableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    CGRect tableViewFrame = CGRectMake(0.0, 44.0, self.view.bounds.size.width, self.view.bounds.size.height);
    tableView = [[UITableView alloc] initWithFrame:tableViewFrame style:UITableViewStyleGrouped];
    tableView.autoresizingMask = (UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight);
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
    [tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 2;
        case 1:
            return 3;
    }
    return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch(section) {
        case 0:
            return @"Geometry type";
        case 1:
            return @"Clock Options";
    }
    return @"";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    if(section ==1)
        return @"Abstract Clock Ver 1.0 \nDEsigned by Chris Kim \nwww.aurumplanet.com \n\n";
    else
        return nil;
}

- (UITableViewCell *)tableView:(UITableView *)table cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [table dequeueReusableCellWithIdentifier:@"PrefCell"];
    
    if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"PrefCell"]autorelease];
    }
    
    CKAAppDelegate *appDelegate = (CKAAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if(indexPath.section == 0) {
        if(indexPath.row == 0) {
            cell.textLabel.text = @"Squares";
        } else {
            cell.textLabel.text = @"Circles";
        }
        
        NSIndexPath *selectedPath = [NSIndexPath indexPathForRow:[appDelegate optionClockMode] inSection:0];
        if([selectedPath compare:indexPath] == NSOrderedSame) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        } else {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
    } else {
        UISwitch *switch24HourMode;
        UISwitch *switchDateInfo;
        UISwitch *switchAllowAutoClock;
        
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"24 Hours Mode";
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                switch24HourMode.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"key24Hour"];
                [switch24HourMode addTarget:appDelegate action:@selector(optionSwitch24Hour:) forControlEvents:UIControlEventValueChanged];
                cell.accessoryView=switch24HourMode;
                break;
            case 1:
                cell.textLabel.text = @"Date Information";
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                switchDateInfo.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"keyDateInfo"];
                [switchDateInfo addTarget:appDelegate action:@selector(optionSwitchDateInfo) forControlEvents:UIControlEventValueChanged];
                cell.accessoryView=switchDateInfo;
                break;
            case 2:
                cell.textLabel.text = @"Allow Auto-Lock";
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                switchAllowAutoClock.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"keyAllowAutoLock"];
                [switchAllowAutoClock addTarget:appDelegate action:@selector(optionSwitchAllowAutoLock) forControlEvents:UIControlEventValueChanged];
                cell.accessoryView = switchAllowAutoClock;
                break;
        }
    }
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CKAAppDelegate *appDelegate = (CKAAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if (indexPath.section == 1) {
        return;
    }
    
    NSIndexPath *oldIndexPath = [NSIndexPath indexPathForRow:[appDelegate optionClockMode] inSection:0];
    
    [[tableView cellForRowAtIndexPath:oldIndexPath] setAccessoryType:UITableViewCellAccessoryNone];
    [[tableView cellForRowAtIndexPath:indexPath] setAccessoryType:UITableViewCellAccessoryCheckmark];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
            [appDelegate setOptionClockMode:0];
            break;
        case 1:
            [appDelegate setOptionClockMode:1];
            break;
        default:
            [appDelegate setOptionClockMode:0];
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

@end
