//
//  BIDNameAndColorCell.m
//  Cells
//
//  Created by Chris Kim on 13. 4. 9..
//  Copyright (c) 2013년 Chris Kim. All rights reserved.
//

#import "BIDNameAndColorCell.h"

@implementation BIDNameAndColorCell

@synthesize name;
@synthesize color;

@synthesize nameLabel;
@synthesize colorLabel;

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setName:(NSString *)name {
    if (![name isEqualToString:name]) {
        name = [name copy];
        nameLabel.text = name;
    }
}

- (void)setColor:(NSString *)color {
    if (![color isEqualToString:color]){
        color = [color copy];
        colorLabel.text = color;
    }
}

@end