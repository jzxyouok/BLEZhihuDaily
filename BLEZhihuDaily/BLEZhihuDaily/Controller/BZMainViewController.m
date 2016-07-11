//
//  BLEMainViewController.m
//  BLEZhihuDaily
//
//  Created by yichi.wang on 16/6/27.
//  Copyright © 2016年 blueeee. All rights reserved.
//

#import "BZMainViewController.h"

#import "BZNetworkManager.h"
#import "BZNetworkStoryModel.h"
#import "UIColor+BLEZhihuDaily.h"
@interface BZMainViewController ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation BZMainViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];

    [self initNavigationBar];

    BZRequestLatestStoryModel *lastedModel = [[BZRequestLatestStoryModel alloc]init];
    [[BZNetworkManager manager] getWithParameters:lastedModel success:^(id  _Nullable responseParameter) {
        
    } failure:^(NSError * _Nonnull error) {
        
    }];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

-(void)initNavigationBar {
    UIImageView *backImageView = nil;
    for (UIView *view in self.navigationController.navigationBar.subviews) {
        if ([NSStringFromClass([view class]) isEqualToString:@"_UINavigationBarBackground"]) {
            backImageView = (UIImageView *)view;
        }
    }
    if (backImageView != nil) {
        for (UIView *view in backImageView.subviews) {
            [view removeFromSuperview];
        }
        [backImageView setBackgroundColor:[UIColor colorWithDecRed:19 green:141 white:214 alpha:1]];
        self.navigationController.navigationBar .userInteractionEnabled = NO;
        UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 27, 30, 30)];
        [leftButton setImage:[UIImage imageNamed:@"Home_Icon"] forState:UIControlStateNormal];
        [leftButton setImage:[UIImage imageNamed:@"Home_Icon"] forState:UIControlStateHighlighted];
        [backImageView addSubview:leftButton];
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, 70, 44)];
        titleLabel.center = CGPointMake(backImageView.center.x, titleLabel.center.y);
        titleLabel.text = @"今日热闻";
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont boldSystemFontOfSize:17];
        titleLabel.textColor = [UIColor whiteColor];
        self.titleLabel = titleLabel;
        [backImageView addSubview:titleLabel];
    }
    
}
#pragma mark - Event Response
-(void)clickLeftBarItem:(id)senderc {
    
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

@end
