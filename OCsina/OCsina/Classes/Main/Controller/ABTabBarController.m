//
//  ABTabBarController.m
//  OCsina
//
//  Created by 安波 on 15/11/5.
//  Copyright © 2015年 anbo. All rights reserved.
//

#import "ABTabBarController.h"

@interface ABTabBarController ()

@end

@implementation ABTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    首页
    ABHomeViewController *homeVc = [[ABHomeViewController alloc] init];
    [self addChildViewControllerWith:homeVc title:@"首页" normalImageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];
    
//    信息
    ABMessageViewController *messageVc = [[ABMessageViewController alloc] init];
    [self addChildViewControllerWith:messageVc title:@"信息" normalImageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];
    
//    发现
    ABDiscoverViewController *discoverVc = [[ABDiscoverViewController alloc] init];
    [self addChildViewControllerWith:discoverVc title:@"发现" normalImageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected"];
    
//    我
    ABMeViewController *meVc = [[ABMeViewController alloc] init];
    [self addChildViewControllerWith:meVc title:@"我" normalImageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected"];
    
}

- (void)addChildViewControllerWith:(UIViewController *)vc title:(NSString *)title normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName{
    // 创建导航控制器 并添加到子控制器中
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
    // 设置标题 和 图片
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = [UIImage imageNamed:normalImageName];
    
//    UIImage *image = [UIImage imageNamed:selectedImageName];
//    // 默认tabBar会对选中的图片渲染的蓝色
//    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    nav.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
}


@end
