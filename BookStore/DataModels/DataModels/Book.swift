//
//  Book.swift
//  BookStore
//
//  Created by eastagile on 11/5/14.
//  Copyright (c) 2014 eastagile. All rights reserved.
//

import Foundation
import CoreData

class Book: NSManagedObject {

    @NSManaged var authorName: String
    @NSManaged var describeText: String
    @NSManaged var photoUrl: String
    @NSManaged var price: NSNumber
    @NSManaged var publishedDate: NSDate
    @NSManaged var publisherName: String
    @NSManaged var rateCount: NSNumber
    @NSManaged var rating: NSNumber
    @NSManaged var title: String

}
