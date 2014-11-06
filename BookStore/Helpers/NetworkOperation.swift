//
//  NetworkOperation.swift
//  BookStore
//
//  Created by eastagile on 11/4/14.
//  Copyright (c) 2014 eastagile. All rights reserved.
//

import Foundation
import Alamofire

class NetworkOperation: NSObject {
    class func executeRequest(method: NSString, params: NSDictionary?, path: NSString, completion:((success: Bool, error: AnyObject?, json: AnyObject?)->Void?)) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        let fullPath = serverAddress + path;
        switch (method) {
            case "GET":
                self.requestGet(fullPath, params: params, completion: completion)
                break
            default:
                break
        }
    }
  
    class func requestGet(path: String, params: NSDictionary?,completion:((success: Bool, error: AnyObject?, json: AnyObject?)->Void?))->Void {
        
        Alamofire.request(.GET, path)
            .responseJSON { (_, _, JSON, _) in
                println(JSON)
                completion(success: true, error: nil, json: JSON)
        }
    }
}