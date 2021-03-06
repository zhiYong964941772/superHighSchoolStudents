//
//  ZYAppDelegate.m
//  超级高考生
//
//  Created by 赖志勇 on 2017/7/29.
//  Copyright © 2017年 赖志勇. All rights reserved.
//

#import "ZYAppDelegate.h"
#import "ZYNavigationController.h"
#import "ZYLoginViewController.h"
#import "ZYLoginServer.h"
#import "ZYTabBarViewController.h"
@implementation ZYAppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    [MBProgressHUD showMessage:@"加载中~" toView:self.window];
    [ZYLoginServer check_loginWithSuccess:^(id obj) {
        NSInteger i = [obj integerValue];
        [MBProgressHUD hideHUDForView:self.window];
        if (i == 1) {
            ZYTabBarViewController *tabVC = [[ZYTabBarViewController alloc]init];
            [self.window setRootViewController:tabVC];

        }else{
            ZYLoginViewController *login = [[ZYLoginViewController alloc]initWithNibName:@"ZYLoginViewController" bundle:nil];
            ZYNavigationController *navi = [[ZYNavigationController alloc]initWithRootViewController:login];
            [self.window setRootViewController:navi];

        }
    } WithFailt:^(id obj) {
        [MBProgressHUD hideHUDForView:self.window];
    }];
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
