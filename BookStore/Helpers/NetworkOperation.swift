//
//  NetworkOperation.swift
//  BookStore
//
//  Created by eastagile on 11/4/14.
//  Copyright (c) 2014 eastagile. All rights reserved.
//

import Foundation

class NetworkOperation: NSObject {
    class func executeRequest(method: NSString, params: NSDictionary, path: NSString, completion:((success: Bool, error: AnyObject, json: AnyObject)->Void)) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        let operation: AFHTTPRequestOperation = self.createOperation(method, params: params, path: path);
    }
    
    class func createOperation(method: NSString, params: NSDictionary, path: NSString) -> AFHTTPRequestOperation {
        var requestSerializer: AFHTTPRequestSerializer = AFHTTPRequestSerializer()

        requestSerializer.setValue("application/json", forHTTPHeaderField: "Accept")
        requestSerializer.setValue("gzip,deflate", forHTTPHeaderField: "Accept-Encoding")

        let request: NSMutableURLRequest = requestSerializer.requestWithMethod(method, URLString: "\(serverAddress)/\(path)", parameters: params, error: nil)
        lazy var operation:AFHTTPRequestOperation = AFHTTPRequestOperation.init;
        
//        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
        return operation;
    }
}