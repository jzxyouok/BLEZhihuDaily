//
//  BLELaunchViewController.m
//  BLEZhihuDaily
//
//  Created by yichi.wang on 16/6/27.
//  Copyright © 2016年 blueeee. All rights reserved.
//

#import "BZLaunchViewController.h"
#import "AppDelegate.h"
#import "BZLaunchBottomView.h"
#import "UIScreen+BLEZhihuDaily.h"
#import "UIColor+BLEZhihuDaily.h"

static const NSTimeInterval kBZLaunchImageShowAnimationDuration = 0.6;
static const NSTimeInterval kBZLaunchBottomShowAnimationDuration = 0.5;
static const CGFloat kBZLaunchBottomHeight = 100;

NSString  * const BZLaunchImageKey = @"kBZLaunchImageKey";
NSString * const BZLaunchTextKey = @"kBZLaunchTextKey";

@interface BZLaunchViewController ()
@property (strong, nonatomic) UIImageView *backImageView;
@property (strong, nonatomic) BZLaunchBottomView *bottomView;
@end

@implementation BZLaunchViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithDecRed:23 green:24 white:26];
    UIImageView *backImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen screenWidth], [UIScreen screenHeight] - kBZLaunchBottomHeight)];
    backImageView.contentMode = UIViewContentModeScaleAspectFill;
    backImageView.layer.masksToBounds = YES;
    backImageView.alpha = 0;
    self.backImageView = backImageView;
    [self.view addSubview:backImageView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, backImageView.frame.size.height - 30, [UIScreen screenWidth], 20)];
    label.font = [UIFont systemFontOfSize:12.f];
    label.textColor = [UIColor colorWithWhite:0.8 alpha:1];
    label.textAlignment = NSTextAlignmentCenter;
    label.shadowColor = [UIColor blackColor];
    label.shadowOffset = CGSizeMake(0, 1);
    [backImageView addSubview:label];
    
    NSData *imageData = [[NSUserDefaults standardUserDefaults] objectForKey:BZLaunchImageKey];
    if (imageData) {
        backImageView.image = [UIImage imageWithData:imageData];
        [label setText:[[NSUserDefaults standardUserDefaults] objectForKey:BZLaunchTextKey]];
    } else {
        backImageView.image = [UIImage imageNamed:@"Splash_Image"];
    }
    
    BZLaunchBottomView *bottomView = [BZLaunchBottomView viewWithNib];
    bottomView.frame = CGRectMake(0, [UIScreen screenHeight], [UIScreen screenWidth], kBZLaunchBottomHeight);
    self.bottomView = bottomView;
    [self.view addSubview:bottomView];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self startLaunchAnimation];
}

-(void)viewDidDisappear:(BOOL)animated{
    for (UIGestureRecognizer *gestureRecognizer in ((AppDelegate*)(UIApplication.sharedApplication.delegate)).window.rootViewController.view.gestureRecognizers) {
        gestureRecognizer.enabled = YES;
    }
    [super viewDidDisappear:animated];
}

-(void)showSelf {
    UIViewController *rootController = ((AppDelegate*)(UIApplication.sharedApplication.delegate)).window.rootViewController;
    if (nil == self.parentViewController && rootController != nil) {
        [rootController addChildViewController:self];
        [rootController.view addSubview:self.view];
        [self didMoveToParentViewController:rootController];
        [rootController.view bringSubviewToFront:self.view];
    }
}

- (void)removeSelf {
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.8 animations:^{
        weakSelf.view.alpha = 0;
    } completion:^(BOOL finished) {
        [weakSelf willMoveToParentViewController:nil];
        [weakSelf.view removeFromSuperview];
        [weakSelf removeFromParentViewController];
    }];
}

#pragma mark - Animation
- (void)startLaunchAnimation {
    [UIView animateWithDuration:kBZLaunchBottomShowAnimationDuration animations:^{
        self.bottomView.transform = CGAffineTransformMakeTranslation(0, -kBZLaunchBottomHeight);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:kBZLaunchImageShowAnimationDuration animations:^{
            self.backImageView.alpha = 1;
        }];
        [self.bottomView startLogoShowAnimationWithCompletion:^{
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self removeSelf];
            });
        }];
    }];
}

@end
