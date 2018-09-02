//
//  CADNavTitleable.swift
//  cheanda
//
//  Created by 何泽的mac on 2018/9/2.
//  Copyright © 2018年 何泽的mac. All rights reserved.
//

import UIKit

protocol CADNavTitleable {
    
}

extension CADNavTitleable where Self : UIViewController {
    // MARK:- 导航栏 自定义标题 通用组件
    func titleView(titleView : UIView) -> UIView {
        navigationItem.titleView = titleView
        return titleView
    }
}
