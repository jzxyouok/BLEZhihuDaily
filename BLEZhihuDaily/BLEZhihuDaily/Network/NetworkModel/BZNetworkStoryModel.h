//
//  BZNetworkStoryModel.h
//  BLEZhihuDaily
//
//  Created by yichi.wang on 16/7/5.
//  Copyright © 2016年 blueeee. All rights reserved.
//

#import "BZNetworkModel.h"

@class BZResponseStoryModel;
@class BZResponseTopStoryModel;

@interface BZRequestLatestStoryModel : BZRequestModel


@end

@interface BZResponseLatestModel : BZResponseModel

@property(nonatomic, strong) NSString *date;
@property(nonatomic, strong) NSArray<BZResponseStoryModel *> *stories;
@property(nonatomic, strong) NSArray<BZResponseTopStoryModel *> *top_stories;
@end

@interface BZResponseStoryModel : BZResponseModel

@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *ga_prefix;
@property(nonatomic, strong) NSArray<NSString *> *images;
@property(nonatomic, strong) NSString *type;
@property(nonatomic, strong) NSString *id;
@end

@interface BZResponseTopStoryModel : BZResponseModel

@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *ga_prefix;
@property(nonatomic, strong) NSString *image;
@property(nonatomic, strong) NSString *type;
@property(nonatomic, strong) NSString *id;
@end

