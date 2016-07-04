//
//  BZNetworkLaunchModel.h
//  BLEZhihuDaily
//
//  Created by yichi.wang on 16/6/30.
//  Copyright © 2016年 blueeee. All rights reserved.
//

#import "BZNetworkModel.h"
@class BZResponseLaunchModel;
@interface BZRequestLaunchModel : BZRequestModel

@end

@interface BZReponseLaunchOuterModel : BZResponseModel

@property(nonatomic, strong) NSArray<BZResponseLaunchModel*> *creatives;

@end

@interface BZResponseLaunchModel : BZResponseModel

@property(nonatomic, strong) NSString *id;
@property(nonatomic, strong) NSArray<NSString*> *impression_tracks;
@property(nonatomic, strong) NSString *start_time;
@property(nonatomic, strong) NSString *text;
@property(nonatomic, strong) NSString *type;
@property(nonatomic, strong) NSString *url;

@end

