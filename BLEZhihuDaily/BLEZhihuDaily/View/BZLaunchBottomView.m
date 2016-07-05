//
//  BZLaunchBottomView.m
//  BLEZhihuDaily
//
//  Created by yichi.wang on 16/6/30.
//  Copyright © 2016年 blueeee. All rights reserved.
//

#import "BZLaunchBottomView.h"
#import "UIColor+BLEZhihuDaily.h"

static NSString * const BZLaunchLogoShowAnimationkey = @"LogoShowAnimation";
static const NSTimeInterval kBZLaunchLogoShowAnimationDuration = 1.5f;

typedef void(^CompletionBlock)(void);

@interface BZLaunchBottomView()

@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;

@property (strong, nonatomic) CAShapeLayer *sharpLayer;
@property (copy, nonatomic) CompletionBlock completionBlock;
@end
@implementation BZLaunchBottomView


-(void)layoutSubviews{
    [super layoutSubviews];
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, 20, 20)];
    CAShapeLayer *sharpLayer = [CAShapeLayer layer];
    sharpLayer.bounds = CGRectMake(0, 0, 40, 40);
    sharpLayer.position = CGPointMake(24, 24);
    sharpLayer.lineWidth = 20;
    sharpLayer.strokeColor = [UIColor colorWithDecRed:23.0 green:24.0 white:26.0].CGColor;
    sharpLayer.fillColor = nil;
    sharpLayer.path = path.CGPath;
    sharpLayer.strokeStart = 0.18;
    sharpLayer.strokeEnd = 1;
    sharpLayer.masksToBounds = YES;
    sharpLayer.transform = CATransform3DMakeRotation(M_PI * 0.06, 0, 0, 1);
    self.sharpLayer = sharpLayer;
    [self.logoImageView.layer addSublayer:sharpLayer];
}

- (void)startLogoShowAnimationWithCompletion:(void(^)(void))completion{
    [self startLogoShowAnimation];
    self.completionBlock = completion;
}

- (void)startLogoShowAnimation {
    CABasicAnimation *animation =[CABasicAnimation animationWithKeyPath:@"strokeStart"];
    animation.fromValue = @0.19;
    animation.toValue = @1;
    animation.duration = kBZLaunchLogoShowAnimationDuration;
    animation.delegate = self;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [self.sharpLayer addAnimation:animation forKey:BZLaunchLogoShowAnimationkey];
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [self.sharpLayer removeFromSuperlayer];
    if (nil != self.completionBlock) {
        self.completionBlock();
    }
}
@end
