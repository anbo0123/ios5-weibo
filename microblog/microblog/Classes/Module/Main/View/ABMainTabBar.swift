//
//  ABMainTabBar.swift
//  microblog
//
//  Created by 安波 on 15/10/27.
//  Copyright © 2015年 anbo. All rights reserved.
//

import UIKit

class ABMainTabBar: UITabBar {

    // 确定tabBar的个数
    private let count = 5
    
    /// tabBar的布局
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 计算width
        let width = bounds.width / CGFloat(count)
        // 设置frame
        let frame = CGRect(x: 0, y: 0, width: width, height: bounds.height)
        
        // 记录点击的索引下标
        var index = 0
        // 遍历tabBar,并判断设置frame
        for view in subviews {
            // 判断是否为某个类型
            if view is UIControl && !(view is UIButton){
                print("view: \(view)")
                // 设置对应位置的frame值
                view.frame = CGRectOffset(frame, width * CGFloat(index), 0)
                // 改变索引下标的值
//                index++
//                if index == 2 {
//                    index++
//                }
                index += index == 1 ? 2 : 1
            }
        }
        print("----------------")
        // 设置撰写按钮的frame
        composeButton.frame = CGRectOffset(frame, width * 2, 0)
    }
    
    // MARK: - 懒加载
    lazy var composeButton: UIButton = {
        //创建按钮
        let button = UIButton()
        //设置按钮图片
        button.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: UIControlState.Normal)
        button.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: UIControlState.Highlighted)
        //设置按钮背景
        button.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: UIControlState.Normal)
        button.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: UIControlState.Highlighted)
        //添加到父控件
        self.addSubview(button)
        //返回
        return button
    }()
    

}
