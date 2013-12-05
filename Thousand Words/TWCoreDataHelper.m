//
//  TWCoreDataHelper.m
//  Thousand Words
//
//  Created by Warren Deshazo on 12/1/13.
//  Copyright (c) 2013 Circboxx LLC. All rights reserved.
//

#import "TWCoreDataHelper.h"

@implementation TWCoreDataHelper

+(NSManagedObjectContext *)managedObjectContext;
{
    NSManagedObjectContext *context = nil;
    
    id delegate = [[UIApplication sharedApplication]delegate];
    
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}


@end
