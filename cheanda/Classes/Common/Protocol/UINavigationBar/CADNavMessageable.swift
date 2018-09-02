//
//  CADNavMessageable.swift
//  cheanda
//
//  Created by 何泽的mac on 2018/9/2.
//  Copyright © 2018年 何泽的mac. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import NSObject_Rx

protocol CADNavMessageable {
    
}

extension CADNavMessageable where Self : UIViewController {
    func message(onNext: @escaping ()->Void) {
        
        let item = UIBarButtonItem(image: UIImage(named: "home_comments"), style: .plain, target: nil, action: nil)
        item.rx.tap.do(onNext: {
            onNext()
        }).subscribe().disposed(by: rx.disposeBag)
        
        if (navigationItem.rightBarButtonItems?.count ?? 0) == 0 {
            navigationItem.rightBarButtonItems = [item]
        } else {
            var items: [UIBarButtonItem] = [] + navigationItem.rightBarButtonItems!
            items.append(item)
            navigationItem.rightBarButtonItems = items
        }
        
        let fixedSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        fixedSpace.width = -20.0
        navigationItem.rightBarButtonItems = [fixedSpace] + navigationItem.rightBarButtonItems!
    }
}
