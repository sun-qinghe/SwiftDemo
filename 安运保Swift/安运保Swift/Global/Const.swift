//
//  Const.swift
//  安运保Swift
//
//  Created by anzhong on 2018/12/24.
//  Copyright © 2018年 anyunbao. All rights reserved.
//

/**
 swift当中没有宏定义，没有.pch文件。并且文件都是全局的
 */

import Foundation
import UIKit

let ScreenWidth = UIScreen.main.bounds.size.width
let ScreenHeight = UIScreen.main.bounds.size.height

let WhiteColor = UIColor.white

public func WidthOfRate(_ width:CGFloat) -> CGFloat {
    return ScreenWidth/375.0 * width
}
public func HeightOfRate(_ height:CGFloat) -> CGFloat {
    return ScreenHeight/667.0 * height
}
public func RGBColor(r:CGFloat, g:CGFloat, b:CGFloat) -> UIColor {
    return UIColor(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: 1.0)
}
public func UIFontSystem(_ size: CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: size)
}
public func UIImageNamed(name: String) -> UIImage {
    return UIImage.init(named: name)!
}
