//
//  ABVisitorView.swift
//  microblog
//
//  Created by 安波 on 15/10/26.
//  Copyright © 2015年 anbo. All rights reserved.
//

import UIKit

/// 点击导航条上Item按钮 的代理方法
protocol ABVisitorViewDelegate: NSObjectProtocol {
    func visitorViewWillRegister()
    func visitorViewWillLogin()
}

class ABVisitorView: UIView {
    
    // 声明代理属性
    weak var visitorViewDelegate: ABVisitorViewDelegate?
    
    // MARK: - 按钮的点击事件
    // 注册
    func willRegister(){
        print(__FUNCTION__)
        visitorViewDelegate?.visitorViewWillRegister()
    }
    // 登陆
    func willLogin(){
        print(__FUNCTION__)
        visitorViewDelegate?.visitorViewWillLogin()
    }
    
    // MARK: - 构造函数
    override init(frame: CGRect) {
        super.init(frame: frame)
        // 准备UI
        prepareUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 准备UI 
    func prepareUI(){
        //设置背景色
        backgroundColor = UIColor(white: 237 / 255, alpha: 1)
        
        // 添加子控件
        addSubview(iconView)
        // 添加遮盖视图
        addSubview(coverView)
        addSubview(homeView)
        addSubview(messageLabel)
        addSubview(registerButton)
        addSubview(loginButton)
        
        // 设置约束
        //取消在懒加载中设置的尺寸约束
        iconView.translatesAutoresizingMaskIntoConstraints = false
        // 取消在懒加载中设置的尺寸约束
        coverView.translatesAutoresizingMaskIntoConstraints = false
        homeView.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        //添加新的约束
        // 转轮
        // X
        self.addConstraint(NSLayoutConstraint(item: iconView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        // Y 
        self.addConstraint(NSLayoutConstraint(item: iconView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: -100))
        
        // 遮盖视图
        // Left
        self.addConstraint(NSLayoutConstraint(item: coverView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 0))
        // Right
        self.addConstraint(NSLayoutConstraint(item: coverView, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: 0))
        // Top
        self.addConstraint(NSLayoutConstraint(item: coverView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0))
        // Bottom
        self.addConstraint(NSLayoutConstraint(item: coverView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: registerButton, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0))
        
        // 小房子
        // X 
        self.addConstraint(NSLayoutConstraint(item: homeView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: iconView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        // Y 
        self.addConstraint(NSLayoutConstraint(item: homeView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: iconView, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))
        
        // 消息文字
        // X 
        self.addConstraint(NSLayoutConstraint(item: messageLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: iconView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        // Y 
        self.addConstraint(NSLayoutConstraint(item: messageLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: iconView, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 16))
        // width 
        self.addConstraint(NSLayoutConstraint(item: messageLabel, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 240))
        
        // 注册按钮
        // X
        self.addConstraint(NSLayoutConstraint(item: registerButton, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: messageLabel, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 0))
        // Y
        self.addConstraint(NSLayoutConstraint(item: registerButton, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: messageLabel, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 16))
        // Width
        self.addConstraint(NSLayoutConstraint(item: registerButton, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 100))
        // Height
        self.addConstraint(NSLayoutConstraint(item: registerButton, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 44))
        
        // 登陆按钮
        // X
        self.addConstraint(NSLayoutConstraint(item: loginButton, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: messageLabel, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: 0))
        // Y 
        self.addConstraint(NSLayoutConstraint(item: loginButton, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: messageLabel, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 16))
        // width 
        self.addConstraint(NSLayoutConstraint(item: loginButton, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: registerButton, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0))
        // Height 
        self.addConstraint(NSLayoutConstraint(item: loginButton, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: registerButton, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0))
        
    }
    
    // MARK: - 懒加载
    /// 转轮
    private lazy var iconView: UIImageView = {
        // 创建imageView
        let imageView = UIImageView()
        // 设置图片
        imageView.image = UIImage(named: "visitordiscover_feed_image_smallicon")
        // 设置图片大小
        imageView.sizeToFit()
        // 返回imageView
        return imageView
    }()
    
    /// 小房子
    private lazy var homeView: UIImageView = {
       // 创建imageView
        let imageView = UIImageView()
        // 设置图片
        imageView.image = UIImage(named: "visitordiscover_feed_image_house")
        // 设置图片大小
        imageView.sizeToFit()
        // 返回imageView
        return imageView
    }()
    
    /// 信息文字
    private lazy var messageLabel: UILabel = {
        // 创建label
        let label = UILabel()
        // 设置文字内容
        label.text = "关注一些人,看看有什么惊喜!"
        // 设置文字的颜色
        label.textColor = UIColor.lightGrayColor()
        // 设置自动换行
        label.numberOfLines = 0
        // 设置label的大小
        label.sizeToFit()
        // 返回label
        return label
    }()
    
    /// 注册
    private lazy var registerButton: UIButton = {
        // 创建注册按钮
        let button = UIButton()
        // 设置按钮上的 文字
        button.setTitle("注册", forState: UIControlState.Normal)
        // 设置文字显示的颜色
        button.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
        // 设置按钮的 背景图片
        button.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
        // 设置按钮的显示大小
        button.sizeToFit()
        // 监听按钮的点击事件
        button.addTarget(self, action: "willRegister", forControlEvents: UIControlEvents.TouchUpInside)
        // 返回
        return button
    }()
    
    /// 登陆
    private lazy var loginButton: UIButton = {
        // 创建登陆按钮
        let button = UIButton()
        // 设置按钮上的  文字
        button.setTitle("登陆", forState: UIControlState.Normal)
        // 设置文字的显示颜色
        button.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
        // 设置按钮图片
        button.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
        // 设置按钮的显示大小
        button.sizeToFit()
        // 监听按钮的点击事件
        button.addTarget(self, action: "willLogin", forControlEvents: UIControlEvents.TouchUpInside)
        // 返回
        return button
    }()
    
    /// 遮盖视图
    private lazy var coverView: UIImageView = {
        //获得Image
        let image = UIImage(named: "visitordiscover_feed_mask_smallicon")
        //返回coverView
        return UIImageView(image: image)
    }()
    
    
    /**
    设置访客视图信息
        不同页面设置不同的信息
    
    - parameter imageName: 图片名称
    - parameter message:   信息内容
    */
    func setupInfo(imageName: String, message: String){
        // 改变iconView的图片
        iconView.image = UIImage(named: imageName)
        // 改变信息的内容
        messageLabel.text = message
        messageLabel.sizeToFit()
        // 隐藏小房子
        homeView.hidden = true
        // 将遮盖视图方在最下面
        sendSubviewToBack(coverView)
    }
    
    /// 旋转动画
    func startRotationAnimation(){
        // 创建动画
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        // 设置动画相关属性
        animation.toValue = 2 * M_PI // 旋转角度
        animation.duration = 10  // 持续时间
        animation.repeatCount = MAXFLOAT  // 循环次数
        
        // 完成动画时，不能立即移除动画，否则在切换tabBar或退出桌面，再切回首页时 动画会停止
        animation.removedOnCompletion = false
        
        // 为转轮添加动画
        iconView.layer.addAnimation(animation, forKey: "HomeRotation")
    }

}
