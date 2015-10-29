//
//  ABNetworkTools.swift
//  microblog
//
//  Created by 安波 on 15/10/28.
//  Copyright © 2015年 anbo. All rights reserved.
//

import UIKit
import AFNetworking

class ABNetworkTools: AFHTTPSessionManager {
    
    /// 1.创建网络单例工具（继承AFN）
    static let sharedInstance: ABNetworkTools = {
        // 拼接接口路径
        let baseURL = NSURL(string: "https://api.weibo.com/")
        // 根据baseURL创建单例工具
        let tools = ABNetworkTools(baseURL: baseURL)
        // 返回创建的工具
        return tools
    }()
    
    
    // MARK: - OAuth授权
    // 2.OAuth授权
    /// 2.0申请应用时，分配的APPKey
    private let client_id = "296455517"
    
    /// 申请应用时，分配的AppSecret
    private let client_secret = "d017505f61aa32f4a727c0bbb15bb2bb"
    
    /// 请求的类型，填写authorization_code
    private let grant_type = "authorization_code"
    
    /// 2.1回调地址
    private let redirect_uri = "http://www.baidu.com/"
    
    /// OAuthURL 地址
    func oauthURl() -> NSURL {
        // 拼接测试地址: 2.0 + 2.1
        let urlString = "https://api.weibo.com/oauth2/authorize?client_id=\(client_id)&redirect_uri=\(redirect_uri)"
        // 返回拼接好的地址(注意：以上地址是字符型，需要转换为NSURL，且需要强制拆包处理)
        return NSURL(string: urlString)!
    }
    

}
