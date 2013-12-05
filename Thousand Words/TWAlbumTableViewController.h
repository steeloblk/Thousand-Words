//
//  TWAlbumTableViewController.h
//  Thousand Words
//
//  Created by Warren Deshazo on 11/28/13.
//  Copyright (c) 2013 Circboxx LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TWAlbumTableViewController : UITableViewController 

@property (nonatomic, strong)NSMutableArray *albums;

- (IBAction)addAlbumBarButtonItemPressed:(UIBarButtonItem *)sender;

@end
