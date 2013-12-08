//
//  TWPhotosCollectionViewController.m
//  Thousand Words
//
//  Created by Warren Deshazo on 12/1/13.
//  Copyright (c) 2013 Circboxx LLC. All rights reserved.
//

#import "TWPhotosCollectionViewController.h"
#import "TWPhotoCollectionViewCell.h"
#import "Photo.h"
#import "TWPictureDataTransformer.h"
#import "TWCoreDataHelper.h"
#import "TWPhotoDetailViewController.h"

@interface TWPhotosCollectionViewController () <UIImagePickerControllerDelegate,UINavigationControllerDelegate, UIAlertViewDelegate>
@property (strong, nonatomic) NSMutableArray *photos; // of UIImages

@end

@implementation TWPhotosCollectionViewController

- (NSMutableArray *)photos
{
    if (!_photos) {
        _photos = [[NSMutableArray alloc]init];
    }
    return _photos;
}

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
    /* Call to the super classes implementation of viewWillAppear */
    
    /* Now that the photos are arranged we reload our CollectionView. */
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    /* The Photos are stored in Core Data as an NSSet. */
    NSSet *unorderedPhotos = self.album.photos;
    /* To organize them we use a NSSort descriptor to arrange the photos by date. */
    NSSortDescriptor *dateDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:YES];
    NSArray *sortedPhotos = [unorderedPhotos sortedArrayUsingDescriptors:@[dateDescriptor]];
    self.photos = [sortedPhotos mutableCopy];
    [self.collectionView reloadData];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Detail Segue"]) {
        if ([segue.destinationViewController isKindOfClass:[TWPhotoDetailViewController class]]) {
            TWPhotoDetailViewController *targetViewController = segue.destinationViewController;
            NSIndexPath *indexPath = [[self.collectionView indexPathsForSelectedItems] lastObject];
            
            Photo *selectedPhoto = self.photos[indexPath.row];
            targetViewController.photo = selectedPhoto;
        }
    }
    
    
}


- (IBAction)cameraBarButtonItemPressed:(UIBarButtonItem *)sender {
    
    
    UIAlertView *imagePickerAlertView = [[UIAlertView alloc] initWithTitle:@"Photo Source" message:@"Import from photo album, new photo?" delegate:self cancelButtonTitle:@"I'm done" otherButtonTitles:@"Photos", @"Camera", nil];
    [imagePickerAlertView show];
    
    //    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    //    picker.delegate = self;
    //
    //    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
    //        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    //    }
    //    else if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]){
    //        picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    //    }
    //    [self presentViewController:picker animated:YES completion:nil];
    //
    
}

#pragma mark - UIAlertView delegate

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] && buttonIndex == 2)
    {
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum] && buttonIndex == 1)
    {
        picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    }
    [self presentViewController:picker animated:YES completion:nil];
    
}




#pragma mark - Helper Methods

-(Photo *)photoFromImage:(UIImage *)image
{
    Photo *photo = [NSEntityDescription insertNewObjectForEntityForName:@"Photo" inManagedObjectContext:[TWCoreDataHelper managedObjectContext]];
    photo.image = image;
    photo.date = [NSDate date];
    photo.albumBook = self.album;
    
    NSError *error = nil;
    if (![[photo managedObjectContext] save:&error]) {
        NSLog (@"%@", error);
    }
    return photo;
}


#pragma mark - UICollectionViewDataSource

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath

{
    static NSString *CellIdentifier = @"Photo Cell";
    
    TWPhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Photo *photo = self.photos[indexPath.row];
    
    cell.backgroundColor = [UIColor whiteColor];
    
    cell.imageView.image = photo.image;
    
    return cell;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return [self.photos count];
    
}


#pragma mark - UIImagePickerControllerDelegatae

-(void)imagePickerController: (UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = info[UIImagePickerControllerEditedImage];
    if(!image) image = info[UIImagePickerControllerOriginalImage];
    
    [self.photos addObject:[self photoFromImage:image]];
    
    [self.collectionView reloadData];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
    
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}





@end
