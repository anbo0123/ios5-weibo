//
//  ABMainTabBarController.swift
//  microblog
//
//  Created by 安波 on 15/10/26.
//  Copyright © 2015年 anbo. All rights reserved.
//

import UIKit

class ABMainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //首页
        let homeVc = ABHomeViewController()
        addChildViewController(homeVc, title: "首页", imageName: "tabbar_home")
//        homeVc.title = "首页"
//        homeVc.tabBarItem.image = UIImage(named: "tabbar_home")
//        addChildViewController(UINavigationController(rootViewController: homeVc))
        
        //信息
        let messageVc = ABMessageViewController()
        addChildViewController(messageVc, title: "信息", imageName: "tabbar_message_center")
//        messageVc.title = "信息"
//        messageVc.tabBarItem.image = UIImage(named: "tabbar_message_center")
//        addChildViewController(UINavigationController(rootViewController: messageVc))
        
        //中间控制
        let addVc = UIViewController()
        addChildViewController(addVc, title: "中间", imageName: "")
//        addChildViewController(UINavigationController(rootViewController: addVc))
        
        //发现
        let discoverVc = ABDiscoverViewController()
        addChildViewController(discoverVc, title: "发现", imageName: "tabbar_discover")
//        discoverVc.title = "发现"
//        discoverVc.tabBarItem.image = UIImage(named: "tabbar_discover")
//        addChildViewController(UINavigationController(rootViewController: discoverVc))
        
        //我
        let profileVc = ABProfileViewController()
        addChildViewController(profileVc, title: "我", imageName: "tabbar_profile")
//        profileVc.title = "我"
//        profileVc.tabBarItem.image = UIImage(named: "tabbar_profile")
//        addChildViewController(UINavigationController(rootViewController: profileVc))
        
    }
    /**
    添加子控制器，包装成 Nav
    
    - parameter controller: 子控制器
    - parameter title:      标题
    - parameter imageName:  图片名称
    */
    private func addChildViewController(controller: UIViewController, title: String, imageName: String) {
        controller.title = title
        controller.tabBarItem.image = UIImage(named: imageName)
        addChildViewController(UINavigationController(rootViewController: controller))
    }
    

}
