#import <UIKit/UIKit.h>

#define COLOR(r, g, b, a)               [UIColor colorWithRed:r/255. green:g/255. blue:b/255. alpha:a]
#define COLOR_16(RGB)                   [UIColor colorWithRed:((float)((RGB & 0xFF0000) >> 16))/255.   green:((float)((RGB & 0xFF00) >> 8))/255.    blue:((float)(RGB & 0xFF))/255. alpha:1.]
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface UIColor (Hex)

+ (UIColor *)colorForHex:(NSString *)hexStringColor;
+ (UIColor *)colorForHex:(NSString *)hexStringColor alpha:(CGFloat)alpha;

@end
