//
//  ABOAuthViewController.swift
//  microblog
//
//  Created by 安波 on 15/10/28.
//  Copyright © 2015年 anbo. All rights reserved.
//

import UIKit
import SVProgressHUD

class ABOAuthViewController: UIViewController {
    
    override func loadView() {
        // 重新设置View为WebView
        view = webView
        
        // 指定代理
        webView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // 在还没有重新设置View时，也没有设置View背景颜色时，modal出来的时候的动画很奇怪
//        view.backgroundColor = UIColor.blueColor()
        
        // 设置modal出来的控制器导航条上的“取消”按钮
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "取消", style: UIBarButtonItemStyle.Plain, target: self, action: "cancleButtonClick")
        
        // 加载网页:   URL是通过网络单例工具类获得
        let request = NSURLRequest(URL: ABNetworkTools.sharedInstance.oauthURl())
        webView.loadRequest(request)
        
    }
    /// 监听取消按钮的点击事件
    func cancleButtonClick(){
        // 退出授权界面
        dismissViewControllerAnimated(true, completion: nil)
        
        // 关闭加载提示框
//        SVProgressHUD.dismiss()
    }
    
    // MARK: - 懒加载
    /// 懒加载 webView
    private lazy var webView = UIWebView()
}


// MARK: - 扩展ABOAuthViewController  实现UIWebViewDelegate协议
extension ABOAuthViewController: UIWebViewDelegate {
    
    /// 开始加载请求
    func webViewDidStartLoad(webView: UIWebView) {
        // 显示正在加载
        /* 
            showWithStatus方法，若不主动关闭，会一直显示
            <#T##status: String!##String!#>参数是：提示信息
            <#T##SVProgressHUDMaskType#>参数是：加载时的模式
         */
        SVProgressHUD.showWithStatus("正在加载...", maskType: SVProgressHUDMaskType.Black)
        
    }
    
    /// 加载请求完毕
    func webViewDidFinishLoad(webView: UIWebView) {
        // 关闭加载
        SVProgressHUD.dismiss()
    }
    
    /// 询问是否加载request
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        return true
    }
    
}
