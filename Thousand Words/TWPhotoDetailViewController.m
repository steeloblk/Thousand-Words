//
//  TWPhotoDetailViewController.m
//  Thousand Words
//
//  Created by Warren Deshazo on 12/5/13.
//  Copyright (c) 2013 Circboxx LLC. All rights reserved.
//

#import "TWPhotoDetailViewController.h"
#import "Photo.h"
#import "TWFiltersCollectionViewController.h"

@interface TWPhotoDetailViewController ()

@end

@implementation TWPhotoDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.imageView.contentMode = UIViewContentModeCenter;
    if (self.imageView.bounds.size.width > self.imageView.image.size.width && self.imageView.bounds.size.height > self.imageView.image.size.height) {
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    
    self.imageView.image = self.photo.image;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Filter Segue"]) {
        if ([segue.destinationViewController isKindOfClass:[TWFiltersCollectionViewController class]]) {
            TWFiltersCollectionViewController *targetViewController = segue.destinationViewController;
            targetViewController.photo = self.photo;
        }
    }
    
    
    
}




- (IBAction)addFilterButtonPressed:(id)sender {
}

- (IBAction)deleteButtonPressed:(UIButton *)sender {
    
    [[self.photo managedObjectContext] deleteObject:self.photo];
    
    NSError *error = nil;
    
    [[self.photo managedObjectContext] save:&error];
    
    if (error){
        NSLog(@"error");
    }

    [self.navigationController popViewControllerAnimated:YES];
    
    
    
}
@end
