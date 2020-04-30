//
//  Extensions.swift
//  安运保Swift
//
//  Created by anzhong on 2018/12/24.
//  Copyright © 2018年 anyunbao. All rights reserved.
//

/**
 swift没有分类，只有扩展extension。但是功能相当于分类
 */

import Foundation
import UIKit

extension UIView {
    var top: CGFloat {
        set {
            var tmp = self.frame
            tmp.origin.y = newValue
            self.frame = tmp
        }
        get {
            return self.frame.origin.y
        }
    }
    
    var left: CGFloat {
        set {
            var tmp = self.frame
            tmp.origin.x = newValue
            self.frame = tmp
        }
        get {
            return self.frame.origin.x
        }
    }
    
    var bottom: CGFloat {
        set {
            var tmp = self.frame
            tmp.origin.y = newValue - self.frame.height
            self.frame = tmp
        }
        get {
            return self.frame.maxY
        }
    }
    
    var right: CGFloat {
        set {
            var tmp = self.frame
            tmp.origin.x = newValue - self.frame.width
            self.frame = tmp
        }
        get {
            return self.frame.maxX
        }
    }
    
    var width: CGFloat {
        set {
            var tmp = self.frame
            tmp.size.width = newValue
            self.frame = tmp
        }
        get {
            return self.frame.width
        }
    }
    
    var height: CGFloat {
        set {
            var tmp = self.frame
            tmp.size.height = newValue
            self.frame = tmp
        }
        get {
            return self.frame.height
        }
    }
    var size: CGSize {
        set {
            self.frame.size = newValue
        }
        get {
            return self.frame.size
        }
    }
    var centerX: CGFloat {
        set {
            let tmpCenter = self.center
            self.center = CGPoint(x: newValue, y: tmpCenter.y)
        }
        get {
            return self.frame.midX
        }
    }
    var centerY: CGFloat {
        set {
            let tmpCenter = self.center
            self.center = CGPoint(x: tmpCenter.x, y: newValue)
        }
        get {
            return self.frame.midX
        }
    }
    func removeAllSubViews() {
        for subView in self.subviews {
            subView.removeFromSuperview()
        }
    }
}

extension String {
    func isPhoneNumber() -> Bool {
        let pattern = "^1[345789]\\d{9}$"
        return NSPredicate.init(format:"SELF MATCHES %@",pattern).evaluate(with: self)
    }
}

extension UIColor {
    convenience init(r:CGFloat,g:CGFloat,b:CGFloat){
        self.init(red:r/255.0,green: g/255.0,blue: b/255.0,alpha: 1.0)
    }
}

extension UIImage {
    class func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}

extension UIButton {
    //swit中类方法是以class开头的方法，类似于oc中+开头的方法
    class func createButton(title:String) -> UIButton {
        let btn = UIButton()
        btn.setTitle(title, for: .normal)
        return btn
    }
    
    /*
     convenience:便利，使用convenience修饰的构造函数叫做便利构造函数
     便利构造函数通常用在对系统的类进行构造函数的扩充时使用。
     便利构造函数的特点：
     1、便利构造函数通常都是写在extension里面
     2、便利函数init前面需要加载convenience
     3、在便利构造函数中需要明确的调用self.init()
     */
    convenience init(title:String){
        self.init()
        setTitle(title, for: .normal)
    }
}
