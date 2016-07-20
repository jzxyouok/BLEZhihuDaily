//
//  BZMainHeaderView.h
//  BLEZhihuDaily
//
//  Created by yichi.wang on 16/7/12.
//  Copyright © 2016年 blueeee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BZNetworkStoryModel.h"

@interface BZMainHeaderView : UIView

@property (nonatomic, strong) NSArray<BZResponseTopStoryModel *> *dataSource;

- (void)startAutoScroll;
- (void)stopAutoScroll;
@end

@interface BZMainHeaderCell : UIView

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;
@end
