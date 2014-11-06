//
//  BookDataExtension.swift
//  BookStore
//
//  Created by eastagile on 11/5/14.
//  Copyright (c) 2014 eastagile. All rights reserved.
//

import Foundation

extension Book {
    class func findByID(bookID: NSNumber) -> Book? {
        return Book.findFirstByAttribute("id", withValue: bookID) as? Book
    }
    
    class func insertOrUpdateWithJsonArray(jsonArray: NSArray?) -> NSArray? {
        var array = NSMutableArray()
        for var index = 0; index < jsonArray?.count; ++index {
            if var json: NSDictionary? = (jsonArray?[index]) as? NSDictionary {
                let book = Book.insertWithJson(json!.objectForKey("book") as? NSDictionary)
                array.addObject(book)
            }
        }
        return array
    }
    
    class func insertOrUpdateWithJson(json: NSDictionary?) -> Book? {
        var book = Book.findByID(json?.valueForKey("id") as NSNumber)
        if book != nil {
            book!.updateAttributesWithJson(json)
        } else {
            book = Book.insertWithJson(json!)
        }
        return book
    }
    
    class func insertWithJson(json: NSDictionary?) -> Book {
        var book: Book = Book.createEntity() as Book
        book.updateAttributesWithJson(json)
        return book
    }
    
    func updateAttributesWithJson(json: NSDictionary?) {
        let params:NSDictionary = [  "id" : "id", "authorName" : "author_name", "describeText" : "description", "photoUrl" : "photo_url", "publisdedDate" : "publisded_date", "publisherName" : "publisher_name", "rateCount" : "rate_count", "rating" : "rating", "title" : "title", "price" : "unit_price" ]
        for key in params.allKeys as [NSString] {
            if var value:NSString = params.objectForKey(key) as? NSString {
                UtilityFuncs.parseJsonAttribute(self, json: json!, key: value, propertyName: key)
            }
        }
    }
}