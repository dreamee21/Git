//
//  ViewController.m
//  Home
//
//  Created by Chris Kim on 13. 7. 28..
//  Copyright (c) 2013년 Chris Kim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property(nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray* dataList;

@end

@implementation ViewController
@synthesize myWebView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"HomeCell"];
    
    NSURL *myURL = [NSURL URLWithString:@"http://aurumplanet.com/~1artist1week/phonecasefree/topslider/index.html"];
	NSURLRequest *myURLReq = [NSURLRequest requestWithURL:myURL];
    [myWebView loadRequest:myURLReq];

	_dataList = [[NSMutableArray alloc] init];
	
	UINib *nib = [UINib nibWithNibName:@"Cell" bundle:nil];
	[self.collectionView registerNib:nib forCellWithReuseIdentifier:@"HomeCell"];
    
    [self updateData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)iPhone4Pressed:(UIButton *)sender {
}

- (IBAction)iPhone5Pressed:(UIButton *)sender {
}

#pragma mark - UICollectionsView Datasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 59;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];

    UIImageView* imgView = (UIImageView*)[cell.contentView viewWithTag:100];
	if (imgView) imgView.image = self.dataList[indexPath.section][indexPath.row];
    
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //TO DO
}

- (void) collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    // TO DO
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize returnValue = CGSizeMake(120, 160);
    return returnValue;
}

- (UIEdgeInsets) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 30, 10, 30);
}

#pragma mark -

- (void)updateData
{
	[self.dataList removeAllObjects];
	
	// girl
	NSMutableArray* girlList = [[NSMutableArray alloc] init];
	for (int i = 0; i <= 11; i++) {
		NSString* imgName = [[NSString alloc] initWithFormat:@"girl%02i.jpeg", i];
		UIImage* girlImg = [UIImage imageNamed:imgName];
		[girlList addObject:girlImg];
	}
	[self.dataList addObject:girlList];
		
	[self.collectionView reloadData];
}


@end