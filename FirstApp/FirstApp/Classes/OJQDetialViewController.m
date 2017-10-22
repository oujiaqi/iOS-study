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

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *iv = [[UIImageView alloc] initWithImage:nil];
    
    iv.contentMode = UIViewContentModeScaleAspectFit;
    iv.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:iv];
    self.imageView = iv;
    
    [self.imageView setContentHuggingPriority:200 forAxis:UILayoutConstraintAxisVertical];
    [self.imageView setContentCompressionResistancePriority:700 forAxis:UILayoutConstraintAxisVertical];
    
    // 增加约束
    NSDictionary *nameMap = @{@"imageView":self.imageView,
                              @"heightField":self.heightField,
                              @"toolbar":self.toolbar};
    NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[imageView]-0-|" options:0 metrics:nil views:nameMap];
    NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[heightField]-8-[imageView]-8-[toolbar]" options:0 metrics:nil views:nameMap];
    
    [self.view addConstraints:horizontalConstraints];
    [self.view addConstraints:verticalConstraints];
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
    printf("testing1");
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    // 以itemKey为键，将照片存入OJQImageStore对象
    printf("testing2");
    [[OJQImageStore sharedStore] setImage:image forKey:self.item.itemKey];
    
    // 设置图片
    printf("testing3");
    self.imageView.image = image;
    // 关闭UIImagePickerController对象
    printf("testing4");
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
@end
