//
//  OJQLoginViewController.m
//  FirstApp
//
//  Created by ouou on 2017/9/14.
//  Copyright © 2017年 ouou. All rights reserved.
//

#import "OJQLoginViewController.h"

@interface OJQLoginViewController ()
@property(nonatomic, weak) IBOutlet UITextField *usernameTextField;
@property(nonatomic, weak) IBOutlet UITextField *passwordTextField;
@end

@implementation OJQLoginViewController

- (IBAction)userLogin:(id)sender {
    NSString *username = _usernameTextField.text;
    NSString *password = _passwordTextField.text;
    if ([username isEqualToString:@"oujiaqi"] && [password isEqualToString:@"oujiaqi"]) {
        
    }
    else {
        _usernameTextField.text = @"";
        _passwordTextField.text = @"";
        [_usernameTextField becomeFirstResponder];
    }
}

-(IBAction) dismissKeyboard: (id)sender {
    [_usernameTextField resignFirstResponder];
    [_passwordTextField resignFirstResponder];
}

@end

