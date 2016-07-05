//
//  BZNetworkParameter.h
//  BLEZhihuDaily
//
//  Created by yichi.wang on 16/6/30.
//  Copyright © 2016年 blueeee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel.h>
@interface BZNetworkModel : NSObject

@end

@interface BZRequestModel : BZNetworkModel

@property (nonnull, nonatomic, strong) NSString *URL;
@end

@interface BZResponseModel : BZNetworkModel

@end
