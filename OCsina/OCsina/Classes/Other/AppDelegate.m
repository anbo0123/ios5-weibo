//
//  AppDelegate.m
//  OCsina
//
//  Created by 安波 on 15/11/5.
//  Copyright © 2015年 anbo. All rights reserved.
//

#import "AppDelegate.h"
#import "ABTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 设置全局皮肤
    [self appearance];
    
    [NSThread sleepForTimeInterval:1];
    
    // 创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    // 设置窗口的根控制器
    ABTabBarController *tabBarVc = [[ABTabBarController alloc] init];
    self.window.rootViewController = tabBarVc;
    
    // 设置主窗口 并可见
    [self.window makeKeyAndVisible];
    
    return YES;
}


// 设置全局的样式
- (void)appearance{
    // 设置tabBar的全局皮肤
    UITabBar *tabBar = [UITabBar appearance];
    tabBar.tintColor = [UIColor orangeColor];
    // 设置navigationBar的全局皮肤
    UINavigationBar *navBar = [UINavigationBar appearance];
    navBar.tintColor = [UIColor orangeColor];
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
