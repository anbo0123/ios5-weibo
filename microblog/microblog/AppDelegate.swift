//
//  AppDelegate.swift
//  microblog
//
//  Created by 安波 on 15/10/26.
//  Copyright © 2015年 anbo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // 创建窗口
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        // 添加窗口跟控制
        let tabBar = ABMainTabBarController()
        window?.rootViewController = tabBar
        tabBar.view.backgroundColor = UIColor.redColor()
        
        
//        //首页
//        let homeVc = ABHomeViewController()
//        homeVc.title = "首页"
//        homeVc.tabBarItem.image = UIImage(named: "tabbar_home")
//        tabBar.addChildViewController(UINavigationController(rootViewController: homeVc))
//        
//        //信息
//        let messageVc = ABMessageViewController()
//        messageVc.title = "信息"
//        messageVc.tabBarItem.image = UIImage(named: "tabbar_message_center")
//        tabBar.addChildViewController(UINavigationController(rootViewController: messageVc))
//        
//        //中间控制
//        let addVc = UIViewController()
//        tabBar.addChildViewController(UINavigationController(rootViewController: addVc))
//        
//        //发现
//        let discoverVc = ABDiscoverViewController()
//        discoverVc.title = "发现"
//        discoverVc.tabBarItem.image = UIImage(named: "tabbar_discover")
//        tabBar.addChildViewController(UINavigationController(rootViewController: discoverVc))
//        
//        //我
//        let profileVc = ABProfileViewController()
//        profileVc.title = "我"
//        profileVc.tabBarItem.image = UIImage(named: "tabbar_profile")
//        tabBar.addChildViewController(UINavigationController(rootViewController: profileVc))
        
        
        //设置窗口为主窗口 并显示
        window?.makeKeyAndVisible()
        
        return true
    }

}

