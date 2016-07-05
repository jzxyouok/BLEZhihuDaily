//
//  BZNetworkStoryModel.m
//  BLEZhihuDaily
//
//  Created by yichi.wang on 16/7/5.
//  Copyright © 2016年 blueeee. All rights reserved.
//

#import "BZNetworkStoryModel.h"

@implementation BZRequestStoryModel

-(NSString *)URL{
//    return [NSString stringWithFormat:@"%@%@",kBZRequestRoot_API_7,@"stories/latest"];
    return @"http://daily.zhihu.com/";
}

-(NSString *)beforeURL{
    return [NSString stringWithFormat:@"%@%@%@",kBZRequestRoot_API_7,@"stories/before/",self.beforeDate];
}

+ (NSArray *)modelPropertyBlacklist {
    return @[@"URL",@"beforeDate"];
}
@end

@implementation BZResponseStoryModel

@end

