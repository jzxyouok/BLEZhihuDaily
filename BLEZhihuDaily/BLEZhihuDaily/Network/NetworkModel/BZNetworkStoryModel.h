//
//  BZNetworkStoryModel.h
//  BLEZhihuDaily
//
//  Created by yichi.wang on 16/7/5.
//  Copyright © 2016年 blueeee. All rights reserved.
//

#import "BZNetworkModel.h"


@interface BZRequestStoryModel : BZRequestModel

@property (nonatomic, strong, nullable) NSString *beforeDate;

@end

@interface BZResponseStoryModel : BZResponseModel

@end
