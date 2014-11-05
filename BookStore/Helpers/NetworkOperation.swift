//
//  NetworkOperation.swift
//  BookStore
//
//  Created by eastagile on 11/4/14.
//  Copyright (c) 2014 eastagile. All rights reserved.
//

import Foundation

class NetworkOperation: NSObject {
    class func executeRequest(method: NSString, params: NSDictionary?, path: NSString, completion:((success: Bool, error: AnyObject?, json: AnyObject?)->Void?)) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        let operationManager: AFHTTPRequestOperationManager = self.createOperation(method, params: params);
        let fullPath = serverAddress + path;
        switch (method) {
            case "GET":
                self.requestGet(operationManager, path: fullPath, completion: completion)
                break
            default:
                break
        }
    }
    
    class func createOperation(method: NSString, params: NSDictionary?) -> AFHTTPRequestOperationManager {
        let manager = AFHTTPRequestOperationManager()
        var requestSerializer: AFHTTPRequestSerializer = AFHTTPRequestSerializer()

        requestSerializer.setValue("application/json", forHTTPHeaderField: "Accept")
        requestSerializer.setValue("gzip,deflate", forHTTPHeaderField: "Accept-Encoding")
        manager.requestSerializer = requestSerializer

        return manager
    }
    
    class func requestGet(operationManager: AFHTTPRequestOperationManager, path: NSString, completion:((success: Bool, error: AnyObject?, json: AnyObject?)->Void?))->Void {
        operationManager.GET(path, parameters: nil,
            success: { (operation: AFHTTPRequestOperation!,responseObject: AnyObject!) in
                var response: String? = responseObject.description
                NSJSONSerialization.JSONObjectWithData(response!.dataUsingEncoding(NSUTF8StringEncoding)!, options: NSJSONReadingOptions.MutableContainers, error: nil)
                completion(success: true, error: nil, json: response)
            }, failure: { (operation: AFHTTPRequestOperation!,error: NSError!) in
                var a = 3
            }
        )
    }
}