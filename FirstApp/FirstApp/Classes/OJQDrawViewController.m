//
//  OJQDrawViewController.m
//  FirstApp
//
//  Created by colinou on 2017/9/30.
//  Copyright © 2017年 ouou. All rights reserved.
//

#import "OJQDrawViewController.h"
#import "OJQDrawView.h"

@implementation OJQDrawViewController
- (void) loadView {
    self.tabBarItem.title = @"More";
    UIImage *i = [UIImage imageNamed: @"flickr.png"];
    self.tabBarItem.image = i;
    self.view = [[OJQDrawView alloc] initWithFrame:CGRectZero];
}

@end
