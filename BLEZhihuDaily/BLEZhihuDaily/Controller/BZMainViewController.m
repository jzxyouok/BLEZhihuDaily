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
@interface BZMainViewController ()

@end

@implementation BZMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    BZRequestStoryModel *lastedModel = [[BZRequestStoryModel alloc]init];
    [[BZNetworkManager manager] getWithParameters:lastedModel success:^(id  _Nullable responseParameter) {
        
    } failure:^(NSError * _Nonnull error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
