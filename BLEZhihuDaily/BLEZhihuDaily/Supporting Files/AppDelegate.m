//
//  AppDelegate.m
//  BLEZhihuDaily
//
//  Created by yichi.wang on 16/6/27.
//  Copyright © 2016年 blueeee. All rights reserved.
//

#import "AppDelegate.h"

#import "BZNetworkManager.h"

#import "BZLaunchViewController.h"
#import "BZNetworkLaunchModel.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    BZLaunchViewController *launchViewController = [[BZLaunchViewController alloc]init];
    [launchViewController showSelf];
    
    [[BZNetworkManager manager] getWithParameters:[[BZRequestLaunchModel alloc] init] success:^(id  _Nullable responseParameter) {
        BZReponseLaunchOuterModel *outerModel = [BZReponseLaunchOuterModel yy_modelWithJSON:responseParameter];
        BZResponseLaunchModel *model = outerModel.creatives[0];
        [[NSUserDefaults standardUserDefaults] setObject:model.text forKey:BZLaunchTextKey];
        [[NSUserDefaults standardUserDefaults] setObject:[NSData dataWithContentsOfURL:[NSURL URLWithString:model.url]] forKey:BZLaunchImageKey];
    } failure:^(NSError * _Nonnull error) {
        
    }];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
