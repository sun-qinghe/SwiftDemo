//
//  ViewController.swift
//  安运保Swift
//
//  Created by anzhong on 2018/12/24.
//  Copyright © 2018年 anyunbao. All rights reserved.
//

import UIKit
import SDWebImage

typealias completionHandlerBlock = () -> Void
var completionHandlers: [completionHandlerBlock] = []


class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWith_Escaping_Closure { self.x = 200 }  //将一个闭包标记为 @escaping 意味着你必须在闭包中显式地引用 self。
        someFunctionWith_Non_Escaping_Closure { x = 100 }   //不带self
    }
    //逃逸闭包
    func someFunctionWith_Escaping_Closure(completionHandler: @escaping completionHandlerBlock) {
        //函数接受一个闭包作为参数，该闭包被添加到一个函数外定义的数组中。如果你不将这个参数标记为 @escaping，就会得到一个编译错误。
        completionHandlers.append(completionHandler)
    }
    //非逃逸闭包
    func someFunctionWith_Non_Escaping_Closure(closure: () -> Void) {
        //该闭包是一个非逃逸闭包，这意味着它可以隐式引用 self。同时无法保存在外部
//        completionHandlers.append(closure)  //报错 : Passing non-escaping parameter 'closure' to function expecting an @escaping closure
        closure()
    }
}

class HomeController: BasicViewController, CustomDelegate {
    // 遵守协议 代理 实现方法
    func tapDeleteAction(content: String) {
        print("实现了代理:" + content)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let instance = SomeClass()
        
        instance.doSomething()
        print(instance.x) // 打印出 "200"
        
        completionHandlers.first?()
        print(instance.x) // 打印出 "100"
    
        self.navigationItem.title = "第一个导航栏"
        
        let customView:CustomView = CustomView.init()
        customView.backgroundColor = UIColor.red
        customView.frame = CGRect.init(x: 0, y: 80, width: ScreenWidth, height: 40)
        self.view.addSubview(customView)
        customView.delegate = self
        
        
        let button = UIButton.createButton(title: "haha")
        button.frame = CGRect(x: 20, y: 200, width: 100, height: 20)
//        let button = UIButton(frame: CGRect(x: 20, y: 20, width: 100, height: 20))
//        button.setTitle("试试", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
//        button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        button.addTarget(self, action: #selector(buttonClick(button:)), for: .touchUpInside)
        self.view.addSubview(button)
        
        let imageView:UIImageView = UIImageView(frame: CGRect(x: 30, y: 300, width: 100, height: 100))
        imageView.isUserInteractionEnabled = true
//        imageView.image = UIImage.imageWithColor(color: UIColor.red)
//        imageView.backgroundColor = UIColor.red
        imageView.sd_setImage(with: URL(string: "https://luanbbapi.cqluanbaobao.com/Uploads/VipPictrue/detailRidingCard.png"), completed: nil)
        self.view.addSubview(imageView)
        imageView.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(tapAction(gesture:))))
        
        
        
        
        //        let array = [1, 2, 3, 4, 5, 6, 7]
//        map：转换，可以对数组中的元素格式进行转换
//        let result = array.map{
//            String($0)
//        }
//        print(result)
        
//        filter：过滤，可以对数组中的元素按照某种规则进行过滤
//        let result2 = array.filter{
//            $0 % 2 == 0
//        }
//        print(result2)
        
//        reduce：计算 ，可以对数组中的元素进行计算
//        let result3 = array.reduce(10){
//            $0 + $1
//        }
//        print(result3)
        
        
        // 字符
        //testCharacter();
        // 数组 和for循环
        //testArray()
    
        
        
        
    }
    func testArray() {
        var array1 = [Int]()
        var array2 = [Int](repeating: 0, count: 3)
        var array3:[Int] = [10, 11, 12]
        print("array3的第一个数据是:\(array3[0])")
        for item in array3 {
            print(item)
        }
        for (index, item) in array3.enumerated() {
            print("\(index): \(item)")
            print(item)
        }
        print("array1是不是空的：\(array1.isEmpty)")
        
    }
    func testCharacter() -> Void {
        let char1: Character = "A"
        let char2: Character = "B"
        print("char1的值是\(char1)")
        print("char2值是\(char2)对吗")
        
        let chars: String = "wanglin"
        for ch in chars {
            print(ch)
        }
        
        var str1 = "wlyq"
        var str2 = "1314"
        print(str1 + str2)
        
    }
    
    @objc func tapAction(gesture: UITapGestureRecognizer) -> Void {
        let firstVC = FirstController.init(style: .plain)
        firstVC.content = "看看结果什么意思"
        
        self.pushViewController(viewController: firstVC)
    }
    
    @objc func buttonClick() -> Void {
        print("试试看看")
        print("看看情况怎么着吧")
    }
    @objc func buttonClick(button:UIButton) -> Void {
        button.top = 100
        let aa: String = "15731322517"
        print(aa.isPhoneNumber())
        
        button.setTitleColor(UIColor.init(r: 100, g: 20, b: 30), for: .normal)
        if button.isSelected {
            print("11111111")
        } else {
            print("2222222")
        }
    }
}

