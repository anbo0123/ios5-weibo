//
//  ABBaseTableViewController.swift
//  microblog
//
//  Created by 安波 on 15/10/27.
//  Copyright © 2015年 anbo. All rights reserved.
//

import UIKit

class ABBaseTableViewController: UITableViewController {
    
    //设置用户的登陆的状态
    let userLogin = false
    
    //将自定义的访客视图，为可选类型
    var visitorView: ABVisitorView?
    
    /// 重写loadView方法 设置显示的View
    override func loadView() {
        userLogin ? super.loadView() : setupVisitorView()
    }
    
    /// 创建访客视图
    func setupVisitorView(){
        // 创建自定义的 View
        visitorView = ABVisitorView()
        view = visitorView
        // 设置View的是背景颜色
        view.backgroundColor = UIColor(white: 237 / 255, alpha: 1)
        
        // 判断当前选中的控制器
        if self is ABHomeViewController {
//            print("ABHomeViewController")
            // 设置自动动画
            visitorView?.startRotationAnimation()
        }else if self is ABMessageViewController {
//            print("ABMessageViewController")
            // 设置当前控制View显示的内容
            visitorView?.setupInfo("visitordiscover_image_message", message: "登录后，别人评论你的微博，发给你的消息，都会在这里收到通知")
        }else if self is ABDiscoverViewController {
//            print("ABDiscoverViewController")
            visitorView?.setupInfo("visitordiscover_image_message", message: "登录后，最新、最热微博尽在掌握，不再会与实事潮流擦肩而过")
        }else if self is ABProfileViewController {
//            print("ABProfileViewController")
            visitorView?.setupInfo("visitordiscover_image_profile", message: "登录后，你的微博、相册、个人资料会显示在这里，展示给别人")
            
            
            // 设置导航条上的左右两个Item
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: UIBarButtonItemStyle.Plain, target: self, action: "")
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登陆", style: UIBarButtonItemStyle.Plain, target: self, action: "")
        }
        
    }
    

}
