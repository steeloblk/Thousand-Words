//
//  TWPhotoDetailViewController.h
//  Thousand Words
//
//  Created by Warren Deshazo on 12/5/13.
//  Copyright (c) 2013 Circboxx LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Photo;

@interface TWPhotoDetailViewController : UIViewController

@property (strong, nonatomic) Photo *photo;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)addFilterButtonPressed:(UIButton *)sender;

- (IBAction)deleteButtonPressed:(UIButton *)sender;


@end
