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

#import "BZMainHeaderView.h"
#import "BZMainControllerCell.h"

#import "UIColor+BLEZhihuDaily.h"
#import "UIScreen+BLEZhihuDaily.h"
static const CGFloat kBZMainHeaderHeight = 156;

@interface BZMainViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) BZMainHeaderView *headerView;

@property (nonatomic, strong) NSArray *topStories;
@property (nonatomic, strong) NSArray *stories;
@end

@implementation BZMainViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];
    [self startRequest];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

-(void)setupUI{
    [self setupNavigationBar];
    [self setupTableView];
}

-(void)setupNavigationBar {
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
        [backImageView setBackgroundColor:[UIColor colorWithDecRed:19 green:141 white:214 alpha:0]];
        self.navigationController.navigationBar .userInteractionEnabled = YES;
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

-(void)setupTableView {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.contentInset = UIEdgeInsetsMake(kBZMainHeaderHeight, 0, 0, 0);
}

-(void)setupHeader {
    self.headerView = [[BZMainHeaderView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen screenWidth], kBZMainHeaderHeight)];
    [self.view addSubview:self.headerView];
}

#pragma mark - NetWork
-(void)startRequest {
    BZRequestLatestStoryModel *lastedModel = [[BZRequestLatestStoryModel alloc]init];
    [[BZNetworkManager manager] getWithParameters:lastedModel success:^(id  _Nullable responseParameter) {
        
    } failure:^(NSError * _Nonnull error) {
        
    }];
}
#pragma mark - Event Response
-(void)clickLeftBarItem:(id)senderc {
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BZMainControllerCell"];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 88;
}
@end
