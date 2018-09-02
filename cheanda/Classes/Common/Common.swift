//
//  Common.swift
//  cheanda
//
//  Created by 何泽的mac on 2018/9/2.
//  Copyright © 2018年 何泽的mac. All rights reserved.
//

import Foundation
import UIKit
import Then
///全屏宽
let kScreenWidth = UIScreen.main.bounds.width
///全屏高
let kScreenHeight = UIScreen.main.bounds.height
///获取idfa字符串
//let kIDFAStr:String = UUIDUtil.randomNumberByUUID()
///获取状态栏的高度
let kStatusBarHeight = UIApplication.shared.statusBarFrame.size.height
///获取导航栏的高度
let kNavBarHeight:CGFloat = 44.0
///获取整个导航栏的高度 （状态栏加导航栏）
let kTopHeight = (kStatusBarHeight + kNavBarHeight)
///获取底部tabber高度
let hasHeader = kStatusBarHeight > 20
let kTabBarHeight = hasHeader ? 83 : 49
///4s和5s 宽
let kiOS4S_5S = 320.0
///6s和7宽
let kiOS6S = 375.0
///iOS6plus宽
let kiOS6Plus = 414
///系统当前系统版本
func IS_IOS() -> Double {
    
    return Double(UIDevice.current.systemVersion as String)!
}
///RGB颜色转换
func RGB(r:CGFloat,g:CGFloat,b:CGFloat) -> UIColor {
    
    return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
}

///判断是不是iphone x
let is_iPhoneX = hasHeader ? true : false
///获取 keyWindow
let kWindow = UIApplication.shared.keyWindow
///正在加载的菊花
//let loading = MBProgressHUD.showMessage("正在加载")
//func loading(view:UIView!) {
//    if  view == nil {
//        _ = MBProgressHUD.showMessage("正在加载")
//    }else{
//        _ = MBProgressHUD.showMessage("正在加载", to: view)
//    }
//}
///让菊花消失
//let hideing = MBProgressHUD.showMessage("正在加载")
//func hideing(view:UIView!) {
//    if view == nil {
//        _ = MBProgressHUD.hide()
//    }else{
//        _ = MBProgressHUD.hide(for: view)
//    }
//}
//app当前版本号
let kAppCurrentVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
///打电话
func kCallPhone(phone:String) {
    UIApplication.shared.openURL(NSURL(string: "tel://"+"\(phone)")! as URL)
}
///校验手机号
func KIsPhoneNumber(phoneNumber:String) -> Bool {
    if phoneNumber.isEmpty {
        return false
    }
    if phoneNumber.count != 11 {
        return false
    }
    let reg = "^1(3|4|5|6|7|8|9)\\d{9}$";
    let regexMobile = NSPredicate(format: "SELF MATCHES %@", reg)
    if regexMobile.evaluate(with: phoneNumber) {
        return true
    }
    return false
}
///时间转换---秒转成时分秒
func KToChangeMinuteToHMS(secondStr:String) -> String {
    var result = ""
    if secondStr.isEmpty {
        result = "0秒"
    } else {
        let totalSecond:Int = Int(secondStr)!
        let hour = totalSecond / (60 * 60)
        let minute = totalSecond % (60 * 60) / 60
        let second = totalSecond % (60 * 60) % 60
        if hour > 0 {
            result = String(hour)+"时"+String(minute)+"分"+String(second)+"秒"
        } else if hour == 0 && minute > 0 {
            result = String(minute)+"分"+String(second)+"秒"
        } else {
            result = String(second)+"秒"
        }
    }
    return result
}

let kThemeLightGreyColor = UIColor.hexColor(0xD3D3D3)
let kThemeWhiteColor = UIColor.hexColor(0xFFFFFF)
let kThemeTomatoColor = UIColor.hexColor(0xF7583B)
let kThemeBlackColor = UIColor.hexColor(0x000000)
let kThemeBackgroundColor = UIColor.hexColor(0xF4F4F4)

///通知命名
///年审
///司机的年审列表刷新
let isRefreshDriverListData = "isRefreshDriverListData"
///企业年审单列表刷新
///未自检列表
let isRefreshEnterpriseDataNoSubmit = "isRefreshEnterpriseDataNoSubmit"
///待提交列表
let isRefreshEnterpriseDataWaitSubmit = "isRefreshEnterpriseDataWaitSubmit"
///已提交列表
let isRefreshEnterpriseDataAlreadySubmit = "isRefreshEnterpriseDataAlreadySubmit"
///监管年审单列表刷新
///待审核列表
let isRefreshSupervisionDataWaitAudit = "isRefreshSupervisionDataWaitAudit"
///已审核列表
let isRefreshSupervisionDataAlreadyAudit = "isRefreshSupervisionDataAlreadyAudit"
///身份证识别结果通知
let iDCardNotification = "iDCardNotification"
///个人中心用户信息刷新通知
let isRefreshUserInfoNotification = "isRefreshUserInfoNotification"
///我的资料用户信息刷新通知
let isRefreshUserInfoNotification2 = "isRefreshUserInfoNotification2"
///度数转换圆周率
func degreesToRadians(x:Double) -> Double {
    return (M_PI * (x) / 180.00)
}
///天气Api的key
let weatherKey = "ca1a296dfe9548ec8d766456b7498710"
///des加密解密密钥
let KDESKEY = "8CHEanDa"

///获取当前时间戳
let kCurrentTimeInterval = Date().timeIntervalSince1970

///md5加密
//func kMD5String(str:String) -> String{
//    let cStr = str.cString(using: String.Encoding.utf8);
//    let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
//    CC_MD5(cStr!,(CC_LONG)(strlen(cStr!)), buffer)
//    let md5String = NSMutableString();
//    for i in 0 ..< 16{
//        md5String.appendFormat("%02x", buffer[i])
//    }
//    free(buffer)
//    return md5String as String
//}
//
//let disposeBag = DisposeBag()

// MARK:- 自定义打印方法
func CADLog<T>(_ message : T, file : String = #file, funcName : String = #function, lineNum : Int = #line) {
    
    #if DEBUG
    
    let fileName = (file as NSString).lastPathComponent
    
    print("\(fileName):(\(lineNum))-\(message)")
    
    #endif
}


