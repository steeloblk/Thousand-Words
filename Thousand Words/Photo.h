//
//  Photo.h
//  Thousand Words
//
//  Created by Warren Deshazo on 12/4/13.
//  Copyright (c) 2013 Circboxx LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Album;

@interface Photo : NSManagedObject

@property (nonatomic, retain) NSDate *date;
@property (nonatomic, retain) id image;
@property (nonatomic, retain) Album *albumBook;

@end
