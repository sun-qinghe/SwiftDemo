//
//  FirstTableCell.swift
//  安运保Swift
//
//  Created by anzhong on 2019/3/4.
//  Copyright © 2019年 anyunbao. All rights reserved.
//

import UIKit

class FirstTableCell: UITableViewCell {
    
    var label: UILabel?
    
    var stringAction:String {
        set {
            self.label?.text = newValue
        } get {
            return self.stringAction
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.initCell()
    }
    
    func initCell() -> Void {
        self.label = UILabel.init()
//        self.label = UILabel.init(frame: <#T##CGRect#>)
//        label.text = "看看喽"
        self.contentView.addSubview(self.label!)
        self.label?.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.height.equalTo(100)
        }
    }
    
    var string: String {
        set{
            label?.text = string
        } get {
            return self.string
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
