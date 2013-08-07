//
//  ViewController.m
//  CollectionView1

#import "ViewController.h"
#import "JSONKit.h"

#define HomeCellID @"IMG_CELL_ID"

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) //1
#define kLatestKivaLoansURL [NSURL URLWithString:@"http://aurumplanet.com/~1artist1week/phonecasefree/get_productlistsByPhonetype.php"] //2

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation ViewController
@synthesize myWebView;
@synthesize dataList;
@synthesize scrollView1;
@synthesize pageControl;

int phoneType = 0;

const CGFloat kScrollObjHeight	= 20.0;
const CGFloat kScrollObjWidth	= 100.0;
const NSUInteger kNumImages		= 5;


- (void)layoutScrollImages
{
	UIImageView *view = nil;
	NSArray *subviews = [scrollView1 subviews];
    
	// reposition all image subviews in a horizontal serial fashion
	CGFloat curXLoc = 0;
	for (view in subviews)
	{
		if ([view isKindOfClass:[UIImageView class]] && view.tag > 0)
		{
			CGRect frame = view.frame;
			frame.origin = CGPointMake(curXLoc, 0);
			view.frame = frame;
			
			curXLoc += (kScrollObjWidth);
		}
	}
	
	// set the content size so it can be scrollable
	[scrollView1 setContentSize:CGSizeMake((kNumImages * kScrollObjWidth), [scrollView1 bounds].size.height)];
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    //Home Banner Web View
    NSURL *myURL = [NSURL URLWithString:@"http://aurumplanet.com/~1artist1week/phonecasefree/topslider/index.html"];
	NSURLRequest *myURLReq = [NSURLRequest requestWithURL:myURL];
    [myWebView loadRequest:myURLReq];
    
    //CollectionView Cell data load
	dataList = [[NSMutableArray alloc] init];
	
	UINib* nib = [UINib nibWithNibName:@"Cell" bundle:nil];
	[self.collectionView registerNib:nib forCellWithReuseIdentifier:HomeCellID];
	
    //Update products to selected phonetype
	[self updateData];
    
	self.view.backgroundColor = [UIColor viewFlipsideBackgroundColor];
    
	// 1. setup the scrollview for multiple images and add it to the view controller
	//
	// note: the following can be done in Interface Builder, but we show this in code for clarity
	[scrollView1 setBackgroundColor:[UIColor blackColor]];
	[scrollView1 setCanCancelContentTouches:NO];
	scrollView1.indicatorStyle = UIScrollViewIndicatorStyleWhite;
	scrollView1.clipsToBounds = YES;		// default is NO, we want to restrict drawing within our scrollview
	scrollView1.scrollEnabled = YES;
	
	// pagingEnabled property default is NO, if set the scroller will stop or snap at each photo
	// if you want free-flowing scroll, don't set this property.
	scrollView1.pagingEnabled = YES;
	
	// load all the images from our bundle and add them to the scroll view
	NSUInteger i;
	for (i = 1; i <= kNumImages; i++)
	{
		NSString *imageName = [NSString stringWithFormat:@"image%d.jpg", i];
		UIImage *image = [UIImage imageNamed:imageName];
		UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
		
		// setup each frame to a default height and width, it will be properly placed when we call "updateScrollList"
		CGRect rect = imageView.frame;
		rect.size.height = kScrollObjHeight;
		rect.size.width = kScrollObjWidth;
		imageView.frame = rect;
		imageView.tag = i;	// tag our images for later use when we place them in serial fashion
		[scrollView1 addSubview:imageView];
	}
	[self layoutScrollImages];	// now place the photos in serial layout within the scrollview
    
}

//Home Tab Change
- (void)updateData
{
	[self.dataList removeAllObjects];
    
    NSMutableArray *iPhone5List = [[NSMutableArray alloc] init];

    NSURL *jsonURL = [NSURL URLWithString: @"http://aurumplanet.com/~1artist1week/phonecasefree/get_productlistsByPhonetype.php"];
    NSData *jsonData = [NSData dataWithContentsOfURL: jsonURL];
    JSONDecoder *jsonKitDecoder = [JSONDecoder decoder];
    NSDictionary *items = [jsonKitDecoder parseJSONData:jsonData];
    
    NSLog(@"Total items: %@", items);

	// CellImage
    switch (phoneType) {
        case 0:
            for (int i = 0; i < 59; i++) {
                NSURL *imageURL  = [NSURL URLWithString:@"http://dm01-ut1950.ktics.co.kr/khj_whaledream_thumb_iphone5.jpg"];
                NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
                UIImage *iPhone5Img = [UIImage imageWithData:imageData];
                [iPhone5List addObject:iPhone5Img];
            }
            [self.dataList addObject:iPhone5List];
            break;
    }

	[self.collectionView reloadData];    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
	return [self.dataList count];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
	return [self.dataList[section] count];
}


- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
	// 재사용 큐에 셀을 가져온다
	UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:HomeCellID forIndexPath:indexPath];
	
	// 표시할 이미지 설정
	UIImageView* imgView = (UIImageView*)[cell.contentView viewWithTag:100];
	if (imgView) imgView.image = self.dataList[indexPath.section][indexPath.row];
	
	return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize returnValue = CGSizeMake(120, 160);
    return returnValue;
}

- (UIEdgeInsets) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 30, 10, 30);
}

@end
