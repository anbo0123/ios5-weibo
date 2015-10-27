//
//  ABMainTabBarController.swift
//  microblog
//
//  Created by 安波 on 15/10/26.
//  Copyright © 2015年 anbo. All rights reserved.
//

import UIKit

class ABMainTabBarController: UITabBarController {
    
    /// 撰写按钮的监听方法
    func composeButtonClick(){
        // 打印该方法
        print(__FUNCTION__)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        // 创建一个自定义的tabBar
//        let newTabBar = ABMainTabBar()
//        // 撰写按钮的监听
//        newTabBar.composeButton.addTarget(self, action: "composeButtonClick", forControlEvents: UIControlEvents.TouchUpInside)
//        // 使用KVC设置值
//        setValue(newTabBar, forKey: "tabBar")
        
        // 设置全局选中颜色
        tabBar.tintColor = UIColor.orangeColor()

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
//        addChildViewController(addVc, title: "中间", imageName: "ff")
        addChildViewController(UINavigationController(rootViewController: addVc))
        
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
    
    - parameter controller: 控制器
    - parameter title:      标题
    - parameter imageName:  图片名称
    */
    private func addChildViewController(controller: UIViewController, title: String, imageName: String) {
        controller.title = title
        controller.tabBarItem.image = UIImage(named: imageName)
        addChildViewController(UINavigationController(rootViewController: controller))
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // 计算宽度
        let width = tabBar.bounds.width / CGFloat(5)
        // 设置撰写按钮的frame
        composeButton.frame = CGRect(x: width * 2, y: 0, width: width, height: tabBar.bounds.height)
        // 添加撰写
        tabBar.addSubview(composeButton)
        
    }
    
    // MARK: - 懒加载
    /// 撰写按钮
    lazy var composeButton: UIButton = {
        // 创建按钮
        let button = UIButton()
        
        // 设置按钮图片
        button.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: UIControlState.Normal)
        button.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: UIControlState.Highlighted)
        
        // 设置按钮背景
        button.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: UIControlState.Normal)
        button.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: UIControlState.Highlighted)
        
        // 监听点击
        button.addTarget(self, action: "composeButtonClick", forControlEvents: UIControlEvents.TouchUpInside)
        
        return button
    }()
    

}
