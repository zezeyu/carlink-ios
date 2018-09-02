//
//  CADQRCodeable.swift
//  cheanda
//
//  Created by 何泽的mac on 2018/9/2.
//  Copyright © 2018年 何泽的mac. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

protocol CADQRCodeable {
    
}

extension CADQRCodeable where Self : UIViewController {
    
    func setting(onNext: @escaping ()->Void) {
        
        let item = UIBarButtonItem(image: UIImage(named: "qrcode_scan_light_green"), style: .plain, target: nil, action: nil)
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


