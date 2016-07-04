//
//  UIColor+BLEZhihuDaily.m
//  BLEZhihuDaily
//
//  Created by yichi.wang on 16/6/30.
//  Copyright © 2016年 blueeee. All rights reserved.
//

#import "UIColor+BLEZhihuDaily.h"

@implementation UIColor (BLEZhihuDaily)

+ (UIColor *)colorWithHex:(NSUInteger)col{
    unsigned char r, g, b;
    b = col & 0xFF;
    g = (col >> 8) & 0xFF;
    r = (col >> 16) & 0xFF;
    return [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:1];
}

+ (UIColor *)colorWithHex:(NSUInteger)col alpha:(CGFloat)alpha{
    unsigned char r, g, b;
    b = col & 0xFF;
    g = (col >> 8) & 0xFF;
    r = (col >> 16) & 0xFF;
    return [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:alpha];
}

+ (UIColor *)colorWithDecRed:(NSUInteger)red green:(NSUInteger)green white:(NSUInteger)white {
    return [UIColor colorWithRed:(float)red/255.0f green:(float)green/255.0f blue:(float)white/255.0f alpha:1];
}

+ (UIColor *)colorWithDecRed:(NSUInteger)red green:(NSUInteger)green white:(NSUInteger)white alpha:(CGFloat)alpha{
    return [UIColor colorWithRed:(float)red/255.0f green:(float)green/255.0f blue:(float)white/255.0f alpha:alpha];
}
@end
