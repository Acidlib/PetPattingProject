#import "UIColor+Hex.h"

@implementation UIColor (Hex)

+ (UIColor *)colorForHex:(NSString *)hexStringColor
{
    return [self colorForHex:hexStringColor alpha:1.];
}

+ (UIColor *)colorForHex:(NSString *)hexStringColor alpha:(CGFloat)alpha
{
    NSScanner *scanner = [NSScanner scannerWithString:hexStringColor];
    unsigned hex;
    if (![scanner scanHexInt:&hex])
        return nil;
    
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    return COLOR(r, g, b, alpha);
}

@end
