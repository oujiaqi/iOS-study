//
//  OJQDetialViewController.m
//  FirstApp
//
//  Created by ouou on 2017/9/22.
//  Copyright © 2017年 ouou. All rights reserved.
//

#import "OJQDetialViewController.h"
#import "OJQItem.h"

@interface OJQDetialViewController () <UINavigationBarDelegate, UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *ageField;
@property (weak, nonatomic) IBOutlet UITextField *heightField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;

@end

@implementation OJQDetialViewController

- (void) viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:<#animated#>];
    OJQItem *item = self.item;
    self.nameField.text = item.name;
    self.heightField.text = item.height;
    self.ageField.text = item.age;
}

- (void) viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:<#animated#>];
    [self.view endEditing:YES];
    OJQItem *item = self.item;
    item.name = self.nameField.text;
    item.age = self.ageField.text;
    item.height = self.heightField.text;
}

- (void) setItem: (OJQItem *) item {
    _item = item;
    self.navigationItem.title = _item.name;
}

- (IBAction)takePicture:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
}

@end
