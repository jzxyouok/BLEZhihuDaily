//
//  BZNetworkManager.h
//  BLEZhihuDaily
//
//  Created by yichi.wang on 16/6/29.
//  Copyright © 2016年 blueeee. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "BZNetworkModel.h"
#import <AFNetworking.h>
@interface BZNetworkManager : NSObject

+(nonnull instancetype)manager;

- (nullable NSURLSessionDataTask*)getWithParameters:(BZRequestModel * _Nonnull)requestParameters success:(nullable void(^)(id _Nullable responseParameter))success failure:(nullable void(^)(NSError * _Nonnull error))failure;

- (nullable NSURLSessionDataTask*)postWithParameters:(BZRequestModel * _Nonnull)requestParameters success:(nullable void(^)(id _Nullable responseParameter))success failure:(nullable void(^)(NSError * _Nonnull error))failure;
@end
