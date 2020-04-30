//
//  NetworkRequest.swift
//  安运保Swift
//
//  Created by anzhong on 2019/2/28.
//  Copyright © 2019年 anyunbao. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

// 单利 保证全局都能请求到
private let NetworkRequestShareInstance = NetworkRequest()

class NetworkRequest {
    // 单利：全局的常量
    class var sharedInstance: NetworkRequest {
        return NetworkRequestShareInstance
    }
    
    //单利：一句话搞定，静态常理。所有地方用到的都是同一个
    static let shareSingleOne = NetworkRequest()
}

extension NetworkRequest {
//    func getRequest(urlString:String, success: @escaping(_ response: [String: AnyObject])->(), failture: @escaping(_ error: Error)->()) {
//        Alamofire.request(urlString, method: HTTPMethod.get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
//
//            switch response.result {
//            case .success(let value):
//                success(value as! [String: AnyObject])
//            case .failure(let error):
//                failture(error)
//
//            }
//        }
//    }
    
    func getRequest(urlString:String, success: @escaping(JSON)->(), failture: @escaping(JSON)->()) {
        Alamofire.request(urlString, method: HTTPMethod.get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            
            switch response.result {
            case .success(let value):
                success(JSON(value))
            case .failure(let error):
                failture(JSON(error))
                
            }
        }
    }
    func postRequest(urlString:String, params:[String: AnyObject], success: @escaping(JSON)->(), failture:@escaping(JSON)->()) {
        Alamofire.request(urlString, method: HTTPMethod.post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                success(JSON(value))
            case .failure(let error):
                failture(JSON(error))
                
            }
        }
    }
}
