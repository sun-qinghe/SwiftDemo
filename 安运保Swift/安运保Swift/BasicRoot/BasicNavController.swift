//
//  BasicNavController.swift
//  安运保Swift
//
//  Created by anzhong on 2019/1/2.
//  Copyright © 2019年 anyunbao. All rights reserved.
//

import UIKit

class BasicNavController: UINavigationController, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.barStyle = .blackOpaque
        self.delegate = self
        configNaviBar()
    }
    private func configNaviBar() {
        let appearance = UINavigationBar.appearance()
        appearance.setBackgroundImage(UIImage.imageWithColor(color: UIColor.red), for: .default)
        appearance.shadowImage = UIImage()
        appearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: WhiteColor,
            NSAttributedString.Key.font: UIFontSystem(14)
        ]
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if viewController.navigationItem.leftBarButtonItem == nil && self.viewControllers.count > 1 {
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImageNamed(name: "whiteBack").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(backAction))
        }
    }
    
    @objc func backAction() {
        self.popViewController(animated: true)
    }
}
