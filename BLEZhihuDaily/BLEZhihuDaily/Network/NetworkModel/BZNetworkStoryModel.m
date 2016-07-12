//
//  BZNetworkStoryModel.m
//  BLEZhihuDaily
//
//  Created by yichi.wang on 16/7/5.
//  Copyright © 2016年 blueeee. All rights reserved.
//

#import "BZNetworkStoryModel.h"

@implementation BZRequestLatestStoryModel

-(NSString *)URL{
    return [NSString stringWithFormat:@"%@%@",kBZRequestRoot_API_4,@"news/latest"];
}
@end

@implementation BZResponseLatestModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"stories" : [BZResponseLatestStoryModel class], @"top_stories" : [BZResponseTopStoryModel class]};
}
@end

@implementation BZResponseLatestStoryModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"images" : [NSString class]};
}
@end

@implementation BZResponseTopStoryModel

@end

