//
//  TWPictureDataTransformer.m
//  Thousand Words
//
//  Created by Warren Deshazo on 12/4/13.
//  Copyright (c) 2013 Circboxx LLC. All rights reserved.
//

#import "TWPictureDataTransformer.h"

@implementation TWPictureDataTransformer

+(Class)transformedValueClass
{
    return [NSData class];
}


+(BOOL) allowsReverseTransformation
{
    return YES;
}


-(id)transformedValue:(id)value
{
    return UIImagePNGRepresentation(value);
}


-(id)reverseTransformedValue:(id)value
{
    UIImage *image = [UIImage imageWithData:value];
    return image;
}

@end
