//
//  TWPhotoCollectionViewCell.m
//  Thousand Words
//
//  Created by Warren Deshazo on 12/1/13.
//  Copyright (c) 2013 Circboxx LLC. All rights reserved.
//

#import "TWPhotoCollectionViewCell.h"
#define IMAGEVIEW_BORDER_LENGTH 5

@implementation TWPhotoCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setup];
    }
    return self;
}

// init with Coder is called by storyboard. Init with frame is good to setup now in case in the future we want to initialize TWphotocollection in code, the setup code will still be setup properly
-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup
{
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectInset(self.bounds, IMAGEVIEW_BORDER_LENGTH, IMAGEVIEW_BORDER_LENGTH)];
    
    self.imageView.contentMode = UIViewContentModeCenter;
    if (self.imageView.bounds.size.width > self.imageView.image.size.width && self.imageView.bounds.size.height > self.imageView.image.size.height) {
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    
    
    
    [self.contentView addSubview:self.imageView];
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
