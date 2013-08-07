//
//  DisclosureDetailController.h
//  Navtest
//
//  Created by Chris Kim on 13. 7. 2..
//  Copyright (c) 2013년 Chris Kim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DisclosureDetailController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *label;
@property (copy, nonatomic) NSString *message;
@end