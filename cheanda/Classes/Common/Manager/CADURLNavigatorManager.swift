//
//  CADURLNavigatorManager.swift
//  cheanda
//
//  Created by 何泽的mac on 2018/9/2.
//  Copyright © 2018年 何泽的mac. All rights reserved.
//

import Foundation
import UIKit
import URLNavigator

let navigatorShareInstance = CADURLNavigatorManager.shareInstance

class CADURLNavigatorManager {
    let navigator = Navigator()
    static let shareInstance = CADURLNavigatorManager()
    private init(){
        navigator.register("myapp://login") { (_, _, _) -> UIViewController? in
            return CADBaseNavigationController(rootViewController: UIViewController())
        }
    }
    
}
