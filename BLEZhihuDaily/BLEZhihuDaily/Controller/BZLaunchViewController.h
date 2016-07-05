//
//  BLELaunchViewController.h
//  BLEZhihuDaily
//
//  Created by yichi.wang on 16/6/27.
//  Copyright © 2016年 blueeee. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BZLaunchViewController;

FOUNDATION_EXTERN  NSString * const BZLaunchImageKey;
FOUNDATION_EXTERN  NSString * const BZLaunchTextKey;

@protocol BZLaunchViewControllerDelegate <NSObject>

@optional
-(void)launchViewControllerDidDismiss;

@end
@interface BZLaunchViewController : UIViewController

@property(nonatomic, weak) id<BZLaunchViewControllerDelegate> delegate;

-(void)showSelf;
- (void)removeSelf;
@end
