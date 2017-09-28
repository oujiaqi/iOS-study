//
//  OJQDetialViewController.m
//  FirstApp
//
//  Created by ouou on 2017/9/22.
//  Copyright © 2017年 ouou. All rights reserved.
//

#import "OJQDetialViewController.h"
#import "OJQItem.h"
#import "OJQImageStore.h"

@interface OJQDetialViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *ageField;
@property (weak, nonatomic) IBOutlet UITextField *heightField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;

@end

@implementation OJQDetialViewController
- (IBAction)backgroundTapped:(id)sender {
    [self.view endEditing:YES];
}

- (void) viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:<#animated#>];
    OJQItem *item = self.item;
    self.nameField.text = item.name;
    self.heightField.text = item.height;
    self.ageField.text = item.age;
    self.imageView.image = [[OJQImageStore sharedStore] imageForKey:item.itemKey];
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
    printf("take picture\n");
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    printf("new\n");
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        printf("in if\n");
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
        printf("in else\n");
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    printf("delegate\n");
    imagePicker.delegate = self;
    printf("display\n");
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    // 通过info字典获取选择的照片
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    // 以itemKey为键，将照片存入OJQImageStore对象
    [[OJQImageStore sharedStore] setImage:image forKey:self.item.itemKey];
    
    // 设置图片
    self.imageView.image = image;
    // 关闭UIImagePickerController对象
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
@end
