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
#import "UIImageView+BLEZhihuDaily.h"

static const CGFloat kBZMainHeaderHeight = 156;

@interface BZMainViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) BZMainHeaderView *headerView;

@property (nonatomic, strong) NSArray<BZResponseTopStoryModel *> *topStories;
@property (nonatomic, strong) NSMutableDictionary<NSString *, NSArray<BZResponseStoryModel*> *> *stories;
@property (nonatomic, strong) NSMutableArray<NSString *> *dates;
@end

@implementation BZMainViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];
    [self startRequestLastedStories];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

#pragma mark - UI

-(void)setupUI{
    [self setupNavigationBar];
    [self setupTableView];
    [self setupHeader];
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
        
        UIImageView *topmask = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, backImageView.frame.size.width, backImageView.frame.size.height)];
        topmask.image = [UIImage imageNamed:@"Top_Mask"];
        [backImageView addSubview:topmask];
        
        UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 27, 30, 30)];
        [leftButton setImage:[UIImage imageNamed:@"Home_Icon"] forState:UIControlStateNormal];
        [leftButton setImage:[UIImage imageNamed:@"Home_Icon"] forState:UIControlStateHighlighted];
        [leftButton addTarget:self action:@selector(clickLeftBarItem:) forControlEvents:UIControlEventTouchUpInside];
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
    self.tableView.tableHeaderView = nil;
    self.tableView.contentInset = UIEdgeInsetsMake(kBZMainHeaderHeight, 0, 0, 0);
}

-(void)setupHeader {
    self.headerView = [[BZMainHeaderView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen screenWidth], kBZMainHeaderHeight+64)];
    [self.view addSubview:self.headerView];
}

#pragma mark - NetWork
-(void)startRequestLastedStories {
    BZRequestLatestStoryModel *lastedModel = [[BZRequestLatestStoryModel alloc]init];
    [[BZNetworkManager manager] getWithParameters:lastedModel success:^(id  _Nullable responseParameter) {
        BZResponseLatestModel *latestResModel =[BZResponseLatestModel yy_modelWithJSON:responseParameter];
        self.topStories = latestResModel.top_stories;
        self.headerView.dataSource = self.topStories;
        [self.headerView startAutoScroll];
        
        [self.dates addObject:latestResModel.date];
        [self.stories setObject:latestResModel.stories forKey:latestResModel.date];
        [self.tableView reloadData];
        
    } failure:^(NSError * _Nonnull error) {
        
    }];
}
#pragma mark - Event Response
-(void)clickLeftBarItem:(id)senderc {
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dates.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray<BZResponseStoryModel *> *stories = [self.stories objectForKey:self.dates[section]];
    return [stories count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray<BZResponseStoryModel *> *stories = [self.stories objectForKey:self.dates[indexPath.section]];
    BZResponseStoryModel *storyModel = stories[indexPath.row];
    BZMainControllerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BZMainControllerCell"];
    [cell.cellImageView bz_setMainImageWithURL:[NSURL URLWithString:storyModel.images[0]]];
    cell.titleLabel.text = storyModel.title;
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 88;
}

#pragma mark - Setter And Getter
-(NSMutableDictionary<NSString *,NSArray<BZResponseStoryModel *> *> *)stories {
    if (!_stories) {
        _stories = [NSMutableDictionary dictionary];
    }
    return _stories;
}

-(NSMutableArray<NSString *> *)dates{
    if (!_dates) {
        _dates = [NSMutableArray array];
    }
    return _dates;
}
@end
