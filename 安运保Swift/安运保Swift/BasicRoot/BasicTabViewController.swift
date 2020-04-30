//
//  BasicTabViewController.swift
//  安运保Swift
//
//  Created by anzhong on 2019/1/4.
//  Copyright © 2019年 anyunbao. All rights reserved.
//

import UIKit
import SnapKit
import MJRefresh


class BasicTabViewController: BasicViewController {
    
    var tableView: UITableView!
    private var style: UITableView.Style
    
    init(style:UITableView.Style) {
        self.style = style
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: CGRect.zero, style: style)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
    }
    
    func addRefMore(header:Bool, footer:Bool) {
        if header {
            tableView.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
                self.loadNewData()
            })
        }
        if footer {
            tableView.mj_footer = MJRefreshBackNormalFooter.init(refreshingBlock: {
                self.loadMoreData()
            })
        }
    }
    
    func loadNewData() {}
    func loadMoreData() {}
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BasicTabViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 1000;
    }
}
