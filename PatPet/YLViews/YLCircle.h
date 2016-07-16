//
//  YLCircle.h
//  PatPet
//
//  Created by Yi-Ling Wu on 7/16/16.
//  Copyright © 2016 Yi-Ling Wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface YLCircle : UIView

@property (strong, nonatomic) UIColor *circleColor;
@property (strong, nonatomic) UIColor *borderColor;
@property (nonatomic) CGFloat borderWidth;

@property BOOL dashed;

@end