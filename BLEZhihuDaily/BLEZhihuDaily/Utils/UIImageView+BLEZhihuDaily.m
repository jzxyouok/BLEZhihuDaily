//
//  UIImageView+BLEZhihuDaily.m
//  BLEZhihuDaily
//
//  Created by yichi.wang on 16/7/13.
//  Copyright © 2016年 blueeee. All rights reserved.
//

#import "UIImageView+BLEZhihuDaily.h"

@implementation UIImageView (BLEZhihuDaily)

- (void)bz_setImageWithURL:(NSURL *)url {
    [self sd_setImageWithURL:url];
}

- (void)bz_setMainImageWithURL:(NSURL *)url{
    [self sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"Main_Placeholder"]];
}

- (void)bz_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder {
    [self sd_setImageWithURL:url placeholderImage:placeholder];
}
- (void)bz_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options {
    [self sd_setImageWithURL:url placeholderImage:placeholder options:options];
}
- (void)bz_setImageWithURL:(NSURL *)url completed:(SDWebImageCompletionBlock)completedBlock {
    [self sd_setImageWithURL:url completed:completedBlock];
}
- (void)bz_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(SDWebImageCompletionBlock)completedBlock {
    [self sd_setImageWithURL:url placeholderImage:placeholder completed:completedBlock];
}
- (void)bz_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options completed:(SDWebImageCompletionBlock)completedBlock {
    [self sd_setImageWithURL:url placeholderImage:placeholder options:options completed:completedBlock];
}
@end
