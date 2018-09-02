//
//  CADViewModelType.swift
//  cheanda
//
//  Created by 何泽的mac on 2018/9/2.
//  Copyright © 2018年 何泽的mac. All rights reserved.
//

import UIKit

protocol HCViewModelType {
    
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
