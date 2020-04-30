//
//  BasicViewController.swift
//  安运保Swift
//
//  Created by anzhong on 2019/1/2.
//  Copyright © 2019年 anyunbao. All rights reserved.
//

import UIKit

//,  UIGestureRecognizerDelegate
class BasicViewController: UIViewController {
    
    var isSideslip:Bool!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = WhiteColor
        
//        if isSideslip == true {
//            let target = self.navigationController?.interactivePopGestureRecognizer!.delegate
//            let pan = UIPanGestureRecognizer(target:target,
//                                             action:Selector(("handleNavigationTransition:")))
//            pan.delegate = self
//            self.view.addGestureRecognizer(pan)
//            //同时禁用系统原先的侧滑返回功能
//            self.navigationController?.interactivePopGestureRecognizer!.isEnabled = false
//        }
    }
    
//    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
//                           shouldRecognizeSimultaneouslyWith otherGestureRecognizer:
//        UIGestureRecognizer) -> Bool {
//        if self.children.count == 1 {
//            return false
//        }
//        return true
//    }
    
    
    func pushViewController(viewController: UIViewController) -> Void {
        if (self.navigationController?.viewControllers.count)! > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    func popViewController() -> Void {
        self.navigationController?.popViewController(animated: true)
    }
    func popToRootViewController() -> Void {
        self.navigationController?.popToRootViewController(animated: true)
    }

}
