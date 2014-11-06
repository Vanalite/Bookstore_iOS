//
//  Book.h
//  BookStore
//
//  Created by eastagile on 11/6/14.
//  Copyright (c) 2014 eastagile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Book : NSManagedObject

@property (nonatomic, retain) NSString * authorName;
@property (nonatomic, retain) NSString * describeText;
@property (nonatomic, retain) NSString * photoUrl;
@property (nonatomic, retain) NSNumber * price;
@property (nonatomic, retain) NSDate * publishedDate;
@property (nonatomic, retain) NSString * publisherName;
@property (nonatomic, retain) NSNumber * rateCount;
@property (nonatomic, retain) NSNumber * rating;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * id;

@end
