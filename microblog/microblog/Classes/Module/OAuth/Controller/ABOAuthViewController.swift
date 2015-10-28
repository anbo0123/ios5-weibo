//
//  ABOAuthViewController.swift
//  microblog
//
//  Created by 安波 on 15/10/28.
//  Copyright © 2015年 anbo. All rights reserved.
//

import UIKit

class ABOAuthViewController: UIViewController {
    
    override func loadView() {
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // 设置modal出来的控制器导航条上的“取消”按钮
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "取消", style: UIBarButtonItemStyle.Plain, target: self, action: "cancleButtonClick")
        
    }
    /// 监听取消按钮的点击事件
    func cancleButtonClick(){
        // 退出授权界面
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - 懒加载
    /// 懒加载 webView
    private lazy var webView = UIWebView()
}
