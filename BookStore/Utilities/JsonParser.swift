//
//  JsonParser.swift
//  BookStore
//
//  Created by eastagile on 11/6/14.
//  Copyright (c) 2014 eastagile. All rights reserved.
//

import Foundation

extension UtilityFuncs {
    class func parseJsonAttribute(object: AnyObject, json:NSDictionary, key:NSString, propertyName:NSString) {
        if json.objectForKey(key) != nil {
            if let nullObject = json.objectForKey(key) as? NSNull {
                return
            }
            let propertyType: NSString = UtilityFuncs.getStringTypeOfObject(object, propertyName: propertyName)
            if (propertyType.isEqualToString(NSStringFromClass(object_getClass(NSDate)))) {
                let value: NSDate? = NSDate.parse(json.objectForKey(key) as? NSString)
                (object as NSObject).setValue(value, forKey: propertyName)
            } else {
                let value: AnyObject? = json.objectForKey(key)
                (object as NSObject).setValue(value, forKey: propertyName)
            }
        }
    }
    
    class func getStringTypeOfObject(object: AnyObject, propertyName: NSString) -> NSString {
        let property: objc_property_t = class_getProperty(object_getClass(object), propertyName.UTF8String)
        
        var propTypes:NSArray = NSString(UTF8String: property_getAttributes(property)).componentsSeparatedByString(",") as [String]
        var propTypeName = propTypes.objectAtIndex(0) as NSString
        propTypeName = propTypeName.substringWithRange(NSMakeRange(3, propTypeName.length - 4))
        return propTypeName;
    }
}