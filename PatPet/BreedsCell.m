//
//  BreedsCell.m
//  PatPet
//
//  Created by Yi-Ling Wu on 1/16/16.
//  Copyright © 2016 Yi-Ling Wu. All rights reserved.
//

#import "BreedsCell.h"

@implementation BreedsCell

-(void)awakeFromNib{
    // background color
    UIView *bgView = [[UIView alloc]initWithFrame:self.bounds];
    self.backgroundView = bgView;
    self.backgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg1"]];

    // selected background
    UIView *selectedView = [[UIView alloc]initWithFrame:self.bounds];
    self.selectedBackgroundView = selectedView;
    self.selectedBackgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg2"]];
}
@end
