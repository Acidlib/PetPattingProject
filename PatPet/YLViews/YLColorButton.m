//
//  YLColorButton.m
//  PatPet
//
//  Created by Yi-Ling Wu on 7/16/16.
//  Copyright © 2016 Yi-Ling Wu. All rights reserved.
//

#import "YLColorButton.h"
#import <QuartzCore/QuartzCore.h>

@interface YLColorButton ()
@property (strong, nonatomic) NSMutableDictionary *colorMap;
@property (strong, nonatomic) NSMutableDictionary *borderColorMap;
@property (strong, nonatomic) NSMutableArray *keyPaths;
@property BOOL prepared;
@end

@implementation YLColorButton

- (void)awakeFromNib
{
    [self prepare];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self prepare];
    }
    return self;
}

- (void)dealloc
{
    for (NSString *keyPath in _keyPaths) {
        [self removeObserver:self forKeyPath:keyPath];
    }
}

- (void)prepare
{
    if (_prepared) return; _prepared = YES;
    _colorMap = [[NSMutableDictionary alloc] init];
    _borderColorMap = [[NSMutableDictionary alloc] init];
    _keyPaths = [[NSMutableArray alloc] init];

    [self setNormalBackgroundColor:self.backgroundColor];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    BOOL on = [[self valueForKeyPath:keyPath] boolValue];
    self.backgroundColor = [_colorMap objectForKey:on ? keyPath : @"normal"];

    UIColor *borderColor = [_borderColorMap objectForKey:on ? keyPath : @"normal"];
    if (borderColor)
        self.layer.borderColor = borderColor.CGColor;
}

- (void)setNormalBackgroundColor:(UIColor *)backgroundColor
{
    [self setNormalBackgroundColor:backgroundColor borderColor:nil];
}

- (void)setNormalBackgroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor
{
    [self setColorForKeyPath:@"normal" backgroundColor:backgroundColor borderColor:borderColor];
    if (!self.selected && !self.highlighted) {
        self.backgroundColor = backgroundColor;
        self.layer.borderColor = borderColor.CGColor;
    }
}

- (void)setHighlightBackgroundColor:(UIColor*)backgroundColor
{
    [self setHighlightBackgroundColor:backgroundColor borderColor:nil];
}

- (void)setHighlightBackgroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor
{
    [self setColorForKeyPath:@"highlighted" backgroundColor:backgroundColor borderColor:borderColor];
    if (self.highlighted) {
        self.backgroundColor = backgroundColor;
        self.layer.borderColor = borderColor.CGColor;
    }
}

- (void)setSelectedBackgroundColor:(UIColor *)backgroundColor
{
    [self setSelectedBackgroundColor:backgroundColor borderColor:nil];
}

- (void)setSelectedBackgroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor
{
    [self setColorForKeyPath:@"selected" backgroundColor:backgroundColor borderColor:borderColor];
}

- (void)setColorForKeyPath:(NSString *)keypath backgroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor
{
    if ([_keyPaths indexOfObject:keypath] == NSNotFound) {
        [_keyPaths addObject:keypath];
        [self addObserver:self forKeyPath:keypath options:NSKeyValueObservingOptionNew context:NULL];
    }
    if (backgroundColor)
        [_colorMap setObject:backgroundColor forKey:keypath];

    if (borderColor)
        [_borderColorMap setObject:borderColor forKey:keypath];
}

@end
