//
//  BasicTabBarController.swift
//  安运保Swift
//
//  Created by anzhong on 2019/1/3.
//  Copyright © 2019年 anyunbao. All rights reserved.
//

import UIKit

class BasicTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.tabBar.tintColor = WhiteColor
        self.tabBar.backgroundImage = UIImage.imageWithColor(color:UIColor.red)
        self.tabBar.isTranslucent = false   //避免受默认的半透明色影响，关闭
//        self.tabBar.barTintColor = UIColor.green   //你想要的背景色
//        self.tabBar.shadowImage = UIImage()
        
        let tabBarLine = UITabBar.appearance()
        tabBarLine.shadowImage = UIImage()
//        tabBarLine.backgroundImage = UIImage()
        
        initChildsController(image: "首页-未选中", sImage: "首页-选中", title:"首页", controller: HomeController())
        initChildsController(image: "列表-未选中", sImage: "列表-选中", title:"列表", controller: ListViewController())
        initChildsController(image: "成员未选中", sImage: "成员选中", title:"成员", controller: MemberController())
        initChildsController(image: "消息-未选中", sImage: "消息-选中", title:"消息", controller: MessageController())
        initChildsController(image: "我的-未选中", sImage: "我的-选中", title:"我的", controller: MyViewController())
    }
    
    func initChildsController(image:String, sImage:String, title:String, controller:UIViewController) {
        
        let navVC = BasicNavController.init(rootViewController: controller)
        navVC.tabBarItem.image = UIImageNamed(name: image).withRenderingMode(.alwaysOriginal)
        navVC.tabBarItem.selectedImage = UIImageNamed(name: sImage).withRenderingMode(.alwaysOriginal)
        navVC.tabBarItem.title = title
        navVC.tabBarItem.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.gray
            ], for: .normal)
        navVC.tabBarItem.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: WhiteColor
            ], for: .selected)
        addChild(navVC)
    }
}
