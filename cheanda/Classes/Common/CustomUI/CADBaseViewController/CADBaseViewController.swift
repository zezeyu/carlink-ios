//
//  CADBaseViewController.swift
//  cheanda
//
//  Created by 何泽的mac on 2018/9/2.
//  Copyright © 2018年 何泽的mac. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

class CADBaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CADLog("init: \(type(of: self))")
        
        view.backgroundColor = UIColor.white
    }
    
    deinit {
        CADLog("deinit: \(type(of: self))")
    }
}

// MARK:- 事件 (部分页面失效)
extension CADBaseNavigationController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        // 注销 键盘
        view.endEditing(true)
    }
}
