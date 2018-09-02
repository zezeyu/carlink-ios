//
//  CADNavBackable.swift
//  cheanda
//
//  Created by 何泽的mac on 2018/9/2.
//  Copyright © 2018年 何泽的mac. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

protocol CADNavBackable {
    
}

extension CADNavBackable where Self : UIViewController {
    func back(onNext: @escaping ()->Void) {
        
        let item = UIBarButtonItem(image: UIImage(named: "list_return_white"), style: .plain, target: nil, action: nil)
        item.rx.tap.do(onNext: {
            onNext()
        }).subscribe().disposed(by: rx.disposeBag)
        
        if (navigationItem.leftBarButtonItems?.count ?? 0) == 0 {
            navigationItem.leftBarButtonItems = [item]
        } else {
            var items: [UIBarButtonItem] = [] + navigationItem.leftBarButtonItems!
            items.append(item)
            navigationItem.leftBarButtonItems = items
        }
    }
}
