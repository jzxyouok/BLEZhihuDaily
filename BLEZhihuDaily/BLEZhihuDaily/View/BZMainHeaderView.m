//
//  BZMainHeaderView.m
//  BLEZhihuDaily
//
//  Created by yichi.wang on 16/7/12.
//  Copyright © 2016年 blueeee. All rights reserved.
//

#import "BZMainHeaderView.h"

@interface BZMainHeaderView()

@property (nonatomic, strong) UICollectionView *collectionView;
@end

@implementation BZMainHeaderView
#pragma mark - Life Cycle
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
}

#pragma mark - Setter and Getter
-(UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(self.frame.size.width, self.frame.size.height);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) collectionViewLayout:flowLayout];
    }
    return _collectionView;
}

@end
