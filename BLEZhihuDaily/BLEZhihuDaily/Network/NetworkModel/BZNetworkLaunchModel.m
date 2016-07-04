//
//  BZNetworkLaunchModel.m
//  BLEZhihuDaily
//
//  Created by yichi.wang on 16/6/30.
//  Copyright © 2016年 blueeee. All rights reserved.
//

#import "BZNetworkLaunchModel.h"

@implementation BZRequestLaunchModel

-(NSString *)URL{
    return @"http://news-at.zhihu.com/api/7/prefetch-launch-images/1242*1920";
}
@end

@implementation BZReponseLaunchOuterModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"creatives" : [BZResponseLaunchModel class]};
}

@end

@implementation BZResponseLaunchModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"impression_tracks" : [NSString class]};
}@end

