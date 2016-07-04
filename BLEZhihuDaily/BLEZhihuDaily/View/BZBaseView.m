//
//  BZBaseView.m
//  BLEZhihuDaily
//
//  Created by yichi.wang on 16/6/30.
//  Copyright © 2016年 blueeee. All rights reserved.
//

#import "BZBaseView.h"

@implementation BZBaseView

+(instancetype)viewWithNib{
    BZBaseView *view = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] lastObject];
    return view;
}

@end
