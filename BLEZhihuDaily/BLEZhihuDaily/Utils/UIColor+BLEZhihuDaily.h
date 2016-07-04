//
//  UIColor+BLEZhihuDaily.h
//  BLEZhihuDaily
//
//  Created by yichi.wang on 16/6/30.
//  Copyright © 2016年 blueeee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (BLEZhihuDaily)

+ (UIColor * _Nonnull)colorWithHex:(NSUInteger)col;

+ (UIColor * _Nonnull)colorWithHex:(NSUInteger)col alpha:(CGFloat)alpha;

+ (UIColor * _Nonnull)colorWithDecRed:(NSUInteger)red green:(NSUInteger)green white:(NSUInteger)white;

+ (UIColor * _Nonnull)colorWithDecRed:(NSUInteger)red green:(NSUInteger)green white:(NSUInteger)white alpha:(CGFloat)alpha;
@end
