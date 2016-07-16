//
//  PetColor.m
//  PatPet
//
//  Created by Yi-Ling Wu on 7/16/16.
//  Copyright © 2016 Yi-Ling Wu. All rights reserved.
//

#import "PetColor.h"

@implementation PetColor

/* sRGB IEC61966-2.1 : 28aeb1 */
+ (UIColor *)appColor
{
    return [UIColor colorForHex:@"25a0a1"];
}

/* sRGB IEC61966-2.1 : 595767 */
+ (UIColor *)darkColor
{
    return [UIColor colorForHex:@"474454"];
}

/* sRGB IEC61966-2.1 : eeeeee */
+ (UIColor *)lightColor
{
    return [UIColor colorForHex:@"eaeaea"];
}

/* sRGB IEC61966-2.1 : cc4a44 */
+ (UIColor *)destructiveColor
{
    return [UIColor colorForHex:@"BE3435"];
}

+ (UIColor *)lightTitleColor
{
    return [UIColor colorForHex:@"888888"];
}

+ (UIColor *)subtitleColor
{
    return [UIColor colorForHex:@"6c6c6c"];
}

+ (UIColor *)softBlueColor
{
    return [UIColor colorForHex:@"74A7D1"];
}

+ (UIColor *)redColor
{
    return [UIColor colorForHex:@"cc4A44"];
}

+ (UIColor *)lightRedColor
{
    return [UIColor colorForHex:@"db807c"];
}

+ (UIColor *)lemonDarkColor
{
    return [UIColor colorForHex:@"d8bf55"];
}

@end
