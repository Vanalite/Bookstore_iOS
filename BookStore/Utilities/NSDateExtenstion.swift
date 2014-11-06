//
//  NSDateExtenstion.swift
//  BookStore
//
//  Created by eastagile on 11/6/14.
//  Copyright (c) 2014 eastagile. All rights reserved.
//

import Foundation

extension NSDate {
    class func parse(dateString: NSString?) -> NSDate?{
        if (dateString == nil || dateString!.isEqual("")) {
            return nil;
        }
        let formatter: ISO8601DateFormatter = ISO8601DateFormatter()
            return formatter.dateFromString(dateString)
    }
}