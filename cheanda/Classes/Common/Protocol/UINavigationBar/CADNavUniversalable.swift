//
//  CADNavUniversalable.swift
//  cheanda
//
//  Created by 何泽的mac on 2018/9/2.
//  Copyright © 2018年 何泽的mac. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx
import SnapKit
import RxGesture
// MARK:- 常量
fileprivate struct Metric {
    
    static let itemSize: CGFloat = 30.0
}

// MARK:- 导航栏 通用组件
struct CADNavigationBarItemMetric {
    
    // Left
    static let back = CADNavigationBarItemModel(type: .back,
                                               position: .left,
                                               description: "返回",
                                               imageNamed: "list_return_white")
    
    static let downBack = CADNavigationBarItemModel(type: .back,
                                                   position: .left,
                                                   description: "返回",
                                                   imageNamed: "playpage_icon_down_white", highlightedImageNamed: "playpage_icon_down_white_HL")
    
    static let message = CADNavigationBarItemModel(type: .message,
                                                  position: .left,
                                                  description: "消息",
                                                  imageNamed: "top_message_n")
    
    static let meMessage = CADNavigationBarItemModel(type: .message,
                                                    position: .left,
                                                    description: "消息",
                                                    imageNamed: "meMesNor")
    
    static let setting = CADNavigationBarItemModel(type: .setting,
                                                  position: .left,
                                                  description: "设置",
                                                  imageNamed: "meSetNor")
    
    // Right
    
    static let share = CADNavigationBarItemModel(type: .share,
                                                position: .right,
                                                description: "分享",
                                                imageNamed: "playpage_icon_share_white", highlightedImageNamed: "playpage_icon_share_white_HL")
    
    static let more = CADNavigationBarItemModel(type: .more,
                                               position: .right,
                                               description: "工具",
                                               imageNamed: "playpage_icon_more_white", highlightedImageNamed: "playpage_icon_more_white_HL")
    
    static let history = CADNavigationBarItemModel(type: .history,
                                                  position: .right,
                                                  description: "历史记录",
                                                  imageNamed: "top_history_n")
    
    static let download = CADNavigationBarItemModel(type: .download,
                                                   position: .right,
                                                   description: "下载",
                                                   imageNamed: "top_download_n")
    
    static let search = CADNavigationBarItemModel(type: .search,
                                                 position: .right,
                                                 description: "搜索",
                                                 imageNamed: "icon_search_n")
    
    static let homeSearchBar = CADNavigationBarItemModel(type: .homeSearchBar,
                                                        position: .center,
                                                        description: "首页搜索栏",
                                                        imageNamed: "")
    
    static let mineAnchors = CADNavigationBarItemModel(type: .mineAnchors,
                                                      position: .right,
                                                      description: "主播工作台",
                                                      imageNamed: "")
    
    static let searchBar = CADNavigationBarItemModel(type: .searchBar(index: 0, desc: ""),
                                                    position: .center,
                                                    description: "搜索页面",
                                                    imageNamed: "")
    
    // 登录页面-注册
    static let loginRegister = CADNavigationBarItemModel(type: .title(index: 0, title: "注册"),
                                                        position: .right,
                                                        title: "注册",
                                                        description: "登录页面-注册")
}

protocol CADNavUniversalable {
    
}

// MARK:- 添加到视图的组件，需要自己主动设置位置
extension CADNavUniversalable where Self : UIView {
    
    // MARK:- 导航栏 通用组件
    func universal(model: CADNavigationBarItemModel, onNext: @escaping (_ model: CADNavigationBarItemModel)->Void) -> UIView {
        
        // 创建组件
        let view = UIView().then {
            $0.backgroundColor = .clear
        }
        let btn = UIButton().then {
            // 设置属性
            $0.contentMode = .scaleAspectFit
            $0.setTitle(model.title, for: .normal)
            $0.setBackgroundImage(UIImage(named: model.imageNamed), for: .normal)
            // 处理点击事件
            $0.rx.tapGesture().when(.recognized)
                .subscribe({ _ in
                    onNext(model)
                }).disposed(by: rx.disposeBag)
        }
        
        // 添加组件
        view.addSubview(btn)
        
        self.addSubview(view)
        
        // 添加约束
        // 此处必须指定一个大小
        view.snp.makeConstraints { (make) in
            make.width.height.equalTo(Metric.itemSize)
            make.centerY.equalToSuperview()
        }
        
        btn.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
        return view
    }
}

// MARK:- 添加到控制器的组件，指定位置即可
extension CADNavUniversalable where Self : UIViewController {
    
    // MARK:- 导航栏 通用组件
    func universal(model: CADNavigationBarItemModel, onNext: @escaping (_ model: CADNavigationBarItemModel)->Void) {
        
        var item: UIBarButtonItem
        
        if model.title != nil {
            // 标题
            item = UIBarButtonItem(title: model.title, style: .plain, target: nil, action: nil)
            item.rx.tap.do(onNext: {
                onNext(model)
            }).subscribe().disposed(by: rx.disposeBag)
            
        } else {
            // 图标
            let btn = UIButton(type: .custom)
            btn.setBackgroundImage(UIImage(named: model.imageNamed), for: .normal)
            if model.highlightedImageNamed.characters.count > 0 {
                btn.setBackgroundImage(UIImage(named: model.highlightedImageNamed), for: .highlighted)
            }
            item = UIBarButtonItem(customView: btn)
            btn.rx.tap.do(onNext: {
                onNext(model)
            }).subscribe().disposed(by: rx.disposeBag)        }
        
        switch model.position {
            
        case .left:
            
            if (navigationItem.leftBarButtonItems?.count ?? 0) == 0 {
                navigationItem.leftBarButtonItems = [item]
            } else {
                var items: [UIBarButtonItem] = [] + navigationItem.leftBarButtonItems!
                items.append(item)
                navigationItem.leftBarButtonItems = items
            }
            break
            
        case .right:
            
            if (navigationItem.rightBarButtonItems?.count ?? 0) == 0 {
                navigationItem.rightBarButtonItems = [item]
            } else {
                var items: [UIBarButtonItem] = [] + navigationItem.rightBarButtonItems!
                items.append(item)
                navigationItem.rightBarButtonItems = items
            }
            break
            
        default :
            break
        }
    }
    
    // MARK:- 导航栏 通用组件
    func universals(modelArr: [CADNavigationBarItemModel], onNext: @escaping (_ model: CADNavigationBarItemModel)->Void) {
        
        modelArr.enumerated().forEach { (index, element) in
            
            let temp = element
            
            self.universal(model: temp) { model in
                
                onNext(model)
            }
        }
    }
}

// MARK:- 导航栏 通用组件 数据模型
struct CADNavigationBarItemModel {
    
    enum CADNavigationBarItemPosition {
        case left
        case center
        case right
    }
    
    enum CADNavigationBarItemType {
        case back
        case share
        case more
        case title(index: Int, title: String)
        case message
        case history
        case download
        case search
        case setting
        case homeSearchBar              // 首页搜索栏
        case searchBar(index: Int, desc: String)      // 搜索页面 (1、2、3 分别表示 搜索栏、语音按钮、取消)
        case mineAnchors                // 主播工作台
    }
    
    var type: CADNavigationBarItemType
    var position: CADNavigationBarItemPosition
    var title: String?
    var description: String
    var imageNamed: String
    var highlightedImageNamed: String
    
    init(type: CADNavigationBarItemType, position: CADNavigationBarItemPosition, title: String, description: String) {
        
        self.type = type
        self.position = position
        self.title = title
        self.description = description
        self.imageNamed = ""
        self.highlightedImageNamed = ""
    }
    
    init(type: CADNavigationBarItemType, position: CADNavigationBarItemPosition, description: String, imageNamed: String) {
        
        self.type = type
        self.position = position
        self.title = nil
        self.description = description
        self.imageNamed = imageNamed
        self.highlightedImageNamed = ""
    }
    
    init(type: CADNavigationBarItemType, position: CADNavigationBarItemPosition, description: String, imageNamed: String, highlightedImageNamed: String) {
        
        self.type = type
        self.position = position
        self.title = nil
        self.description = description
        self.imageNamed = imageNamed
        self.highlightedImageNamed = highlightedImageNamed
    }
}
