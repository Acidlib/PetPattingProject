//
//  YLCircle.m
//  PatPet
//
//  Created by Yi-Ling Wu on 7/16/16.
//  Copyright © 2016 Yi-Ling Wu. All rights reserved.
//

#import "YLCircle.h"

@implementation YLCircle

- (void)awakeFromNib
{
    _circleColor = self.backgroundColor;
    self.backgroundColor = [UIColor clearColor];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, rect);

    CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    CGFloat radius = MIN(self.frame.size.width, self.frame.size.height) / 2 - 1;
    if (_borderWidth > 0)
        radius -= _borderWidth / 2;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    if (_dashed) {
        CGFloat pattern[] = {4,2};
        [path setLineDash:pattern count:2 phase:0];
    }
    if (_borderColor && _borderWidth > 0) {
        path.lineWidth = _borderWidth;
        [_borderColor setStroke];
        [path stroke];
    }
    if (_circleColor) {
        [_circleColor setFill];
        [path fill];
    }
}

@end