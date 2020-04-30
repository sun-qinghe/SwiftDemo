//
//  CustomView.swift
//  安运保Swift
//
//  Created by anzhong on 2019/3/4.
//  Copyright © 2019年 anyunbao. All rights reserved.
//

import UIKit

//代理的使用
protocol CustomDelegate {
    func tapDeleteAction(content:String);
}

class CustomView: UIView {
    
    var delegate: CustomDelegate?
    
    init() {
        super.init(frame: .zero)
        
        let label = UILabel.init()
        label.text = "友哥、丰哥、秀哥"
        label.textAlignment = .center
        self.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(tapAction)))
    }
    
    @objc func tapAction() -> Void {
        self.delegate?.tapDeleteAction(content: "看我丰个多帅气...")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
