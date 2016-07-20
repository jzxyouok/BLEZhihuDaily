//
//  UIImageView+BLEZhihuDaily.h
//  BLEZhihuDaily
//
//  Created by yichi.wang on 16/7/13.
//  Copyright © 2016年 blueeee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIImageView+WebCache.h>
@interface UIImageView (BLEZhihuDaily)

- (void)bz_setImageWithURL:(NSURL *)url;
- (void)bz_setMainImageWithURL:(NSURL *)url;
- (void)bz_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder;
- (void)bz_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options;
- (void)bz_setImageWithURL:(NSURL *)url completed:(SDWebImageCompletionBlock)completedBlock;
- (void)bz_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(SDWebImageCompletionBlock)completedBlock;
- (void)bz_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options completed:(SDWebImageCompletionBlock)completedBlock;

@end
