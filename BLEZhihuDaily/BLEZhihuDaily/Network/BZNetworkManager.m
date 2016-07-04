//
//  BZNetworkManager.m
//  BLEZhihuDaily
//
//  Created by yichi.wang on 16/6/29.
//  Copyright © 2016年 blueeee. All rights reserved.
//

#import "BZNetworkManager.h"
#import <YYModel.h>
@implementation BZNetworkManager
+(instancetype)manager{
    static BZNetworkManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[BZNetworkManager alloc]init];
    });
    return instance;
}

- (nullable NSURLSessionDataTask*)getWithParameters:(BZRequestModel *)requestParameters success:(nullable void(^)(id _Nullable responseParameter))success failure:(nullable void(^)(NSError * _Nonnull error))failure{
    NSDictionary *const params = [requestParameters yy_modelToJSONObject];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.operationQueue.maxConcurrentOperationCount = 3;
    return [manager GET:requestParameters.URL parameters:params progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"network request \"%@\" success ^_^!!", requestParameters.URL);
        NSLog(@"response:\n%@", responseObject);
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"network request \"%@\" fail -_-!", requestParameters.URL);
        NSLog(@"error:\n%@", error);
        failure(error);
    }];
}

- (nullable NSURLSessionDataTask*)postWithParameters:(BZRequestModel *)requestParameters success:(nullable void(^)(id _Nullable responseParameter))success failure:(nullable void(^)(NSError * _Nonnull error))failure{
    NSDictionary *const params = [requestParameters yy_modelToJSONObject];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.operationQueue.maxConcurrentOperationCount = 3;
    return [manager POST:requestParameters.URL parameters:params progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"network request \"%@\" success ^_^!!", requestParameters.URL);
        NSLog(@"response:\n%@", responseObject);
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"network request \"%@\" fail -_-!", requestParameters.URL);
        failure(error);
    }];
}
@end
