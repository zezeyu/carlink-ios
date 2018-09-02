//
//  CADBaseNavigationController.swift
//  cheanda
//
//  Created by 何泽的mac on 2018/9/2.
//  Copyright © 2018年 何泽的mac. All rights reserved.
//

import UIKit

class CADBaseNavigationController: UINavigationController, CADNavBackable {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        CADLog("init: \(type(of: self))")
        
        // 设置导航栏样式
        navigationBar.setBackgroundImage(UIImage.color(kThemeWhiteColor), for: UIBarPosition.any, barMetrics: .default)
        navigationBar.shadowImage = UIImage()
        
        // 标题样式
        let bar = UINavigationBar.appearance()
        bar.titleTextAttributes = [
            NSAttributedStringKey.foregroundColor : UIColor.black,
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 18)
        ]
        
        // 设置返回按钮的样式
        navigationBar.tintColor = UIColor.white     // 设置返回标识器的颜色
        let barItem = UIBarButtonItem.appearance()
        barItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.white], for: .normal)  // 返回按钮文字样式
    }

    deinit {
        CADLog("deinit: \(type(of: self))")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK:- 事件 （部分页面失效）
extension CADBaseViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        // 注销 键盘
        view.endEditing(true)
    }
}



