//
//  firstViewController.swift
//  安运保Swift
//
//  Created by anzhong on 2019/1/2.
//  Copyright © 2019年 anyunbao. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

// 枚举l数据类型
enum CountType: Int {
    case num1 = 0
    case num2
    case num3
}

//swift 属性的几种初始化方式
//Swift中的属性可以用可选项(?)和感叹号(!)来标识，
//在Swift中的初始化方法中(init中)，必须对属性赋初值，但是有以下几种避免的方法。
//
//1、将属性标识为可选项(?)，这样，属性有一个默认的nil初始值。
//2、将属性标识为肯定有值，用感叹号(!)标识，需要注意的是,感叹号表示的是必须有值，一旦你使用一个属性是感叹号标识，但是该属性又为空的话，会发生运行时错误。
//3、设置初始值，例如 var name = “jim”,这种，
//3、使用懒加载属性，其实是一个闭包形式的写法，只有用到时才会进行初始化
//要标明返回值，并加lazy修饰
//lazy var name:String = {
//    var str = "jim hello"
//    return str
//}()
//或者闭包写法
//lazy var name = { () -> String in
//    var str = "jim hello"
//    return str
//    }()
   
class FirstController: BasicTabViewController {
    
    var array = ["AAA","BBB","CCC","DDD", "EEE", "FFF"]
    var content: String?
    
    
    lazy var aaa:[String] = {
        return ["AAA","BBB","CCC","DDD", "EEE"]
    }()
    
//  在swift4.0中 fileprivate修饰的属性，能在当前文件内访问到，不管是否在本类的作用域;
//  private 只能在本类的作用域且在当前文件内能访问
    fileprivate let aa:[String] = {
        return ["AAA","BBB","CCC","DDD"]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "第一个"
        self.tableView.backgroundColor = UIColor.red
        self.tableView.snp.makeConstraints { (make) in
            make.bottom.equalTo((-40))
        }
        
//        aaInt(str: "111", str1: "222")
        aaInt("333", str1: "444")
//        不定参数   swift也支持 默认形参   函数类型用箭头指向表示
//        函数返回值，也可以返回函数类型
//        swift中 可以函数嵌套
//        print(incrementMul(numbers: 1, 2, 3, 4))
//        print(incrementMul(numbers: CountType.num1.rawValue, CountType.num2.rawValue))
        
        array.insert("EEE", at: array.count)
        
        self.addRefMore(header: true, footer: true)
        
        // get请求 参数跟在网址后面
//        Alamofire.request("http://adsharingbike.andayunbao.com/api/GpsInfo/GetGpsInfo?Longitude=117.31428&Latitude=39.08652", method: HTTPMethod.get, parameters:nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
//
//            if let error = response.result.error {
//                print(error)
//            } else if let value = response.result.value {
//                let json = JSON(value)
//                print(json)
//                print(json["Message"])
//            }
//        }
        
        // post请求
//        Alamofire.request("http://adsharingbike.andayunbao.com/api/accounts/WxAppLogin", method: HTTPMethod.post, parameters: ["Openid" : "11111"], encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
//            if let error = response.result.error {
//                print(error)
//            } else if let value = response.result.value {
//                print(JSON(value))
//            }
//
//        }
        // 封装的网络请求方法
        NetworkRequest.sharedInstance.postRequest(urlString: "http://adsharingbike.andayunbao.com/api/accounts/WxAppLogin", params: ["Openid": "11111" as AnyObject], success: { (json) in
            print(json)
        }) { (fail) in
            print(fail)
        }
        
        
//        NetworkRequest.sharedInstance.getRequest(urlString: "http://adsharingbike.andayunbao.com/api/GpsInfo/GetGpsInfo?Longitude=117.31428&Latitude=39.08652", success: { (json) in
//            print(json)
//        }) { (error) in
//            print(error)
//        }
        
        
        // get请求
        NetworkRequest.sharedInstance.getRequest(urlString: "http://adsharingbike.andayunbao.com/api/GpsInfo/GetGpsInfo?Longitude=117.31428&Latitude=39.08652", success: { (json) in
            print(json)
            print(json["Message"])
            
        }) { (aaa) in
            print(aaa)
        }
    }
    
    override func loadNewData() {
        super.loadNewData()
        print("下拉刷新---")
        tableView.mj_header.endRefreshing()
    }
    override func loadMoreData() {
        super.loadMoreData()
        print("加载更多---")
        tableView.mj_footer.endRefreshing()
        
    }
    
    // 参数前边加下划线，调用时，参数不显示参数名。
    func aaInt(_ str: String, str1: String) -> Void {
//        print("00000000:" + str + str1)
    }
    
    func incrementMul(numbers:Int ...) -> Int {
        var sum = 0
        for number in numbers {
            sum += number
        }
        return sum
    }
}

extension FirstController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aaa.count;
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? FirstTableCell
        if cell == nil {
            cell = FirstTableCell.init(style: .default, reuseIdentifier: "cell")
        }
        cell?.stringAction = "00000"
        return cell!
    }
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 1313
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.pushViewController(viewController: SecondViewController())
    }
}
