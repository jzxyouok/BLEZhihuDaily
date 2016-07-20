//
//  BZMainHeaderView.m
//  BLEZhihuDaily
//
//  Created by yichi.wang on 16/7/12.
//  Copyright © 2016年 blueeee. All rights reserved.
//

#import "BZMainHeaderView.h"
#import "UIImageView+BLEZhihuDaily.h"
#import <Masonry.h>

@interface BZMainHeaderView()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSArray<BZMainHeaderCell *> *headCellArray;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) NSTimer *timer;
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

#pragma mark - UI
- (void)setupUI {
    [self addSubview:self.scrollView];
}
#pragma mark - loadData
- (void)loadData {
    NSInteger arrayCount = self.dataSource.count;
    self.scrollView.contentSize = CGSizeMake(self.frame.size.width * (arrayCount + 2), self.frame.size.height);
    self.scrollView.contentOffset = CGPointMake(self.frame.size.width, 0);
    NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:arrayCount + 2];
    for (NSInteger i = 0; i < arrayCount + 2; i++) {
        BZResponseTopStoryModel *model = nil;
        BZMainHeaderCell *headerCell = [[BZMainHeaderCell alloc] initWithFrame:CGRectMake(i * self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
        if (i == 0) {
            model = self.dataSource[arrayCount - 1];
        } else if (i == arrayCount + 1) {
            model = self.dataSource[0];
        } else {
            model = self.dataSource[i - 1];
        }
        [headerCell.imageView bz_setMainImageWithURL:[NSURL URLWithString:model.image]];
        headerCell.titleLabel.text = model.title;
        [self.scrollView addSubview:headerCell];
        [mutableArray addObject:headerCell];
    }
    self.headCellArray = [NSArray arrayWithArray:mutableArray];
    [self addSubview:self.pageControl];
}

#pragma mark - Timer
- (void)startAutoScroll {
    self.timer = [NSTimer timerWithTimeInterval:5.5f target:self selector:@selector(autoScroll:) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)stopAutoScroll {
    [self.timer invalidate];
    self.timer = nil;
}

#pragma mark - Event Response
- (void)autoScroll:(id)sender {
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x + self.frame.size.width, 0) animated:YES];
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self stopAutoScroll];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    self.pageControl.currentPage = scrollView.contentOffset.x/self.frame.size.width - 1;
    [self startAutoScroll];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    self.pageControl.currentPage = scrollView.contentOffset.x/self.frame.size.width - 1;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.x == 0) {
        scrollView.contentOffset = CGPointMake(self.frame.size.width * self.dataSource.count, 0);
    } else if (scrollView.contentOffset.x == self.frame.size.width * (self.dataSource.count + 1)) {
        scrollView.contentOffset = CGPointMake(self.frame.size.width, 0);
    }
}
#pragma mark - Setter and Getter
-(UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        
        _scrollView.backgroundColor = [UIColor colorWithWhite:1 alpha:1];
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.bounces = NO;
        
    }
    return _scrollView;
}

-(void)setDataSource:(NSArray<BZResponseTopStoryModel *> *)dataSource {
    _dataSource = dataSource;
    [self loadData];
}

-(UIPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 25, 100, 25)];
        _pageControl.center = CGPointMake(self.frame.size.width/2, _pageControl.center.y);
        _pageControl.numberOfPages = self.dataSource.count;
        _pageControl.currentPage = 0;
        _pageControl.userInteractionEnabled = NO;
    }
    return _pageControl;
}
@end

@interface BZMainHeaderCell()

@end

@implementation BZMainHeaderCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] init];
        [self addSubview:self.imageView];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        
        UIImageView *maskView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, self.layer.bounds.size.width, self.layer.bounds.size.height - 64)];
        maskView.image = [UIImage imageNamed:@"Home_Image_Mask"];
        maskView.contentMode = UIViewContentModeScaleToFill;
        [self.imageView addSubview:maskView];
        
        self.titleLabel = [[UILabel alloc] init];
        [self addSubview:self.titleLabel];
        __weak typeof(self) weakSelf = self;
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(weakSelf.mas_leading).mas_equalTo(15);
            make.trailing.equalTo(weakSelf.mas_trailing).mas_equalTo(-15);
            make.bottom.equalTo(weakSelf.mas_bottom).mas_equalTo(-25);
            make.height.mas_greaterThanOrEqualTo(20);
        }];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:21.0f];
        self.titleLabel.textColor = [UIColor colorWithWhite:1.0f alpha:1];
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.shadowColor = [UIColor blackColor];
        self.titleLabel.shadowOffset = CGSizeMake(0, 1);
    }
    return self;
}


@end
