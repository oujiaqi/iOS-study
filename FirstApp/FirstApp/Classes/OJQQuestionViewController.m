//
//  OJQQuestionViewController.m
//  FirstApp
//
//  Created by colinou on 2017/9/14.
//  Copyright © 2017年 ouou. All rights reserved.
//

#import "OJQQuestionViewController.h"

@interface OJQQuestionViewController ()

@end

@implementation OJQQuestionViewController

- (void) loadView {
    UIView *testView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 300)];
    UILabel *testLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, 50, 50)];
    testLabel.text = @"test";
    [testView addSubview:testLabel];
    self.view = testView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
