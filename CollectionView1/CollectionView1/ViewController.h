//
//  ViewController.h
//  CollectionView1
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray* dataList;
@property (nonatomic, weak) IBOutlet UIWebView *myWebView;

@end
