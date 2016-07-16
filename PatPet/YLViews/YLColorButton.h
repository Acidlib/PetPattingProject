//
//  YLColorButton.h
//  PatPet
//
//  Created by Yi-Ling Wu on 7/16/16.
//  Copyright © 2016 Yi-Ling Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YLColorButton : UIButton

- (void)prepare;

- (void)setNormalBackgroundColor:(UIColor *)backgroundColor;
- (void)setHighlightBackgroundColor:(UIColor *)backgroundColor;
- (void)setSelectedBackgroundColor:(UIColor *)backgroundColor;

- (void)setNormalBackgroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor;
- (void)setHighlightBackgroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor;
- (void)setSelectedBackgroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor;

@end
