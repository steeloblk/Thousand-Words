//
//  TWPhotosCollectionViewController.h
//  Thousand Words
//
//  Created by Warren Deshazo on 12/1/13.
//  Copyright (c) 2013 Circboxx LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Album.h"

@interface TWPhotosCollectionViewController : UICollectionViewController

@property (strong, nonatomic) Album *album;

- (IBAction)cameraBarButtonItemPressed:(UIBarButtonItem *)sender;


@end
