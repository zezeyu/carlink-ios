//
//  CADMainViewController.swift
//  cheanda
//
//  Created by 何泽的mac on 2018/9/2.
//  Copyright © 2018年 何泽的mac. All rights reserved.
//

import UIKit
import Then

// MARK:- 全局变量
var mainViewController: CADMainViewController?

class CADMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        mainViewController = self
        
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor.white
        UITabBar.appearance().tintColor = kThemeTomatoColor
        UITabBar.appearance().backgroundImage = UIImage.init()
        UITabBar.appearance().shadowImage = UIImage.init()
        
        // 没有效果
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor : kThemeBlackColor], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor : kThemeTomatoColor], for: .selected)
        
    }
}

// MARK:- 初始化
extension CADMainViewController {
    
    // MARK:- 初始化控制器
    private func initSubViewControllers() {
        let classNameArr = ["Home", "Hear", "Find", "Mine"]
        let moduleNameArr = ["首页", "我听", "发现", "我的"]
        var tabArr: [UIViewController] = []
        let projectName = self.getProjectName()
        
        for i in 0..<classNameArr.count {
            
            let clsName = classNameArr[i]
            let lowStr = clsName.lowercased()
            
            let clsType = NSClassFromString(projectName+"HC"+clsName+"ViewController") as! UIViewController.Type
            let vc = clsType.init()
            vc.title = moduleNameArr[i]
            
            let image = UIImage(named: "tabbar_icon_" + lowStr + "_normal")
            let selectedImage = UIImage(named: "tabbar_icon_" + lowStr + "_pressed")
            
            let item: UITabBarItem = UITabBarItem(title: nil, image: image, selectedImage: selectedImage)
            item.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -8, right: 0)
            
            vc.tabBarItem = item
            let navVc = CADBaseNavigationController(rootViewController: vc)
            tabArr.append(navVc)
        }
        let placeVC = UIViewController()
        placeVC.view.backgroundColor = kThemeWhiteColor
        
        tabArr.insert(placeVC, at: 2)
        
        self.viewControllers = tabArr
    }
    
    private func getProjectName() -> String {
        guard let infoDict = Bundle.main.infoDictionary else {
            return "."
        }
        let key = kCFBundleExecutableKey as String
        guard let value = infoDict[key] as? String else {
            return "."
        }
        return value + "."
    }
}

// MARK:- 代理
extension CADMainViewController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        if viewController == tabBarController.viewControllers![2] {
            return false
        }
        return true
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    }
}
// MARK:- 控制器跳转
extension CADMainViewController {
    

}



