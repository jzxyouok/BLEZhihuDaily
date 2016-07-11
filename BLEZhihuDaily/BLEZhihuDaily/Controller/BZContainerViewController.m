//
//  BLEContainerVeiwController.m
//  BLEZhihuDaily
//
//  Created by yichi.wang on 16/6/27.
//  Copyright © 2016年 blueeee. All rights reserved.
//

#import "BZContainerViewController.h"
#import "BZLaunchViewController.h"
#import "UIScreen+BLEZhihuDaily.h"
static const NSTimeInterval kBZContainerFullSlideTime = 0.3;
static const CGFloat kBZContainerCriticalVelocity = 400;
static const CGFloat kBZContainerLorRHoldvalue = 30;

@interface BZContainerViewController ()<UIGestureRecognizerDelegate, BZLaunchViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIView *menuView;
@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (nonatomic) BOOL launchViewControllerIsDismiss;
@end

@implementation BZContainerViewController
#pragma mark - LifeStyle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    BZLaunchViewController *launchViewController = [[BZLaunchViewController alloc]init];
    launchViewController.delegate = self;
    self.launchViewControllerIsDismiss = NO;
    [launchViewController showSelf];
    
    [self childViewsTransformMakeWithX:[UIScreen screenWidth] * -0.5];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] init];
    [pan addTarget:self action:@selector(onGesturePan:)];
    pan.delegate = self;
    pan.enabled = NO;
    [self.view addGestureRecognizer:pan];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

#pragma mark - Event Response

- (void)onGesturePan:(UIPanGestureRecognizer *)sender {
    CGFloat menuWidth = [UIScreen screenWidth] * 0.5;

    //初始偏移
    static CGFloat originalOffset = 0;
    if (sender.state == UIGestureRecognizerStateBegan) {
        originalOffset = self.menuView.transform.tx;
    }
    //视图偏移量
    CGFloat moveOffset = [sender translationInView:self.view].x + originalOffset;
    moveOffset = moveOffset > 0 ? 0 : moveOffset;
    moveOffset = moveOffset < -menuWidth ? -menuWidth : moveOffset;
    //视图跟随移动
    [self childViewsTransformMakeWithX:moveOffset];
    
    if (sender.state == UIGestureRecognizerStateEnded || sender.state == UIGestureRecognizerStateCancelled) {
        CGFloat velocity = [sender velocityInView:self.view].x;
        CGFloat menuX = CGRectGetMinX(self.menuView.frame);
        CGFloat rightOffset = ABS(menuX);
        CGFloat leftOffset = menuWidth - rightOffset;

        //快速滑动结束后
        if (ABS(velocity) >= kBZContainerCriticalVelocity) {
            if (velocity > 0) {
                //向右
                [self animateWithChildViewsTransformWithX:0 withDuration:kBZContainerFullSlideTime];
            } else if (velocity < 0) {
                //向左
                [self animateWithChildViewsTransformWithX:-menuWidth withDuration:kBZContainerFullSlideTime];
            }
        } else {
            //正常滑动结束后
            if (leftOffset >= kBZContainerLorRHoldvalue) {
                //向右
                [self animateWithChildViewsTransformWithX:0 withDuration:kBZContainerFullSlideTime];
            } else if (leftOffset < kBZContainerLorRHoldvalue) {
                //向左
                [self animateWithChildViewsTransformWithX:-menuWidth withDuration:kBZContainerFullSlideTime];
            }
        }
    }
}

- (void)childViewsTransformMakeWithX:(CGFloat)X{
    self.menuView.transform = CGAffineTransformMakeTranslation(X ,0);
    self.mainView.transform = CGAffineTransformMakeTranslation(X ,0);
}

- (void)animateWithChildViewsTransformWithX:(CGFloat)X withDuration:(NSTimeInterval)duration{
    [UIView animateWithDuration:duration animations:^{
        [self childViewsTransformMakeWithX:X];
    }];
}

#pragma mark - UIViewController Delegate 
-(BOOL)prefersStatusBarHidden {
    if (!self.launchViewControllerIsDismiss) {
        return YES;
    }
    return NO;
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - BZLaunchViewControllerDelegate
-(void)launchViewControllerDidDismiss {
    self.launchViewControllerIsDismiss = YES;
    [self setNeedsStatusBarAppearanceUpdate];
}
@end
